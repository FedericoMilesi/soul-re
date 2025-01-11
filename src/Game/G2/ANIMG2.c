#include "Game/G2/ANIMG2.h"
#include "Game/G2/POOLMMG2.h"
#include "Game/HASM.h"
#include "Game/PSX/PSX_G2/QUATVM.h"
#include "Game/G2/TIMERG2.h"
#include "Game/MATH3D.h"
#include "Game/G2/QUATG2.h"
#include "Game/G2/ANMINTRP.h"
#include "Game/G2/ANMCTRLR.h"
#include "Game/G2/ANMG2ILF.h"

// TODO: this file needs migrating its .data to C

static G2AnimChanStatusBlockPool _chanStatusBlockPool;

static G2AnimSegValue _segValues[80];

static G2AnimControllerPool _controllerPool;

static G2AnimInterpStateBlockPool _interpStateBlockPool;

#include "Game/G2/ANMG2ILF.c"
#include "Game/G2/ANMDECMP.c"
#include "Game/G2/ANMCTRLR.c"
#include "Game/G2/ANMINTRP.c"

G2Bool G2Anim_Install()
{
    G2AnimController *dummyController;

    G2PoolMem_InitPool(&_chanStatusBlockPool, 180, sizeof(G2AnimChanStatusBlock));
    G2PoolMem_InitPool(&_interpStateBlockPool, 96, sizeof(G2AnimInterpStateBlock));
    G2PoolMem_InitPool(&_controllerPool, 122, sizeof(G2AnimController));

    dummyController = (G2AnimController *)G2PoolMem_Allocate(&_controllerPool);

    dummyController->next = 0;

    dummyController->segNumber = 255;

    dummyController->type = 0;

    return !G2FALSE;
}

void G2Anim_ResetInternalState()
{
    G2AnimController *dummyController;

    G2PoolMem_ResetPool(&_chanStatusBlockPool);
    G2PoolMem_ResetPool(&_interpStateBlockPool);
    G2PoolMem_ResetPool(&_controllerPool);

    dummyController = (G2AnimController *)G2PoolMem_Allocate(&_controllerPool);

    dummyController->next = 0;

    dummyController->segNumber = 255;

    dummyController->type = 0;
}

void G2Anim_Init(G2Anim *anim, Model *modelData)
{
    G2AnimSection *section;
    int sectionID;

    anim->sectionCount = 1;

    anim->masterSection = 0;

    anim->controllerList = 0;

    anim->disabledControllerList = 0;

    anim->segMatrices = NULL;

    anim->modelData = modelData;

    memset(&anim->disabledBits, 0, sizeof(anim->disabledBits) + sizeof(anim->section));

    for (sectionID = 0; sectionID < 3; sectionID++)
    {
        section = &anim->section[sectionID];

        section->storedTime = -1;

        section->swAlarmTable = NULL;

        section->speedAdjustment = 4096;

        section++;
    }

    anim->section[0].segCount = (unsigned char)modelData->numSegments;
}

G2AnimSection *G2Anim_AddSection(G2Anim *anim, int firstSegID, int segCount)
{
    G2AnimSection *section;

    section = &anim->section[anim->sectionCount];

    memset(section, 0, sizeof(G2AnimSection));

    section->sectionID = anim->sectionCount;

    section->storedTime = -1;

    section->firstSeg = firstSegID;

    section->segCount = segCount;

    section->swAlarmTable = NULL;

    section->speedAdjustment = 4096;

    anim->sectionCount++;

    return section;
}

void G2Anim_Free(G2Anim *anim)
{
    G2AnimSection *animSection;
    int sectionID;
    G2AnimInterpInfo *interpInfo;

    for (sectionID = 0; sectionID < anim->sectionCount; sectionID++)
    {
        animSection = &anim->section[sectionID];

        if (G2AnimSection_IsInInterpolation(animSection) != G2FALSE)
        {
            animSection->elapsedTime = animSection->interpInfo->targetTime;
        }

        _G2Anim_FreeChanStatusBlockList(animSection->chanStatusBlockList);

        interpInfo = animSection->interpInfo;

        animSection->chanStatusBlockList = NULL;

        if (interpInfo != NULL)
        {
            _G2Anim_FreeInterpStateBlockList(interpInfo->stateBlockList);

            interpInfo->stateBlockList = NULL;
        }
    }
}

void G2Anim_Restore(G2Anim *anim)
{
    G2AnimSection *section;
    int sectionID;

    for (sectionID = 0; sectionID < anim->sectionCount; sectionID++)
    {
        section = &anim->section[sectionID];

        if (section->keylist != NULL)
        {
            section->storedTime = -section->keylist->timePerKey;

            G2AnimSection_JumpToTime(section, section->elapsedTime);
        }
    }
}

void G2Anim_BuildTransforms(G2Anim *anim)
{
    unsigned short z;
    unsigned long xy;

    G2Anim_UpdateStoredFrame(anim);

    if ((anim->section[0].flags & 0x88) != 0x80)
    {
        ((int *)&anim->rootTrans.x)[0] = 0;
        anim->rootTrans.z = 0;
    }

    if ((anim->section[0].flags & 0x4))
    {
        anim->rootTrans.x = -anim->rootTrans.x;
        anim->rootTrans.y = -anim->rootTrans.y;
        anim->rootTrans.z = -anim->rootTrans.z;
    }

    z = anim->rootTrans.z;
    xy = ((unsigned long *)&anim->rootTrans.x)[0];

    _segValues[0].trans.z = z;
    ((unsigned long *)&_segValues[0].trans.x)[0] = xy;

    if (anim->controllerList != 0)
    {
        _G2Anim_BuildTransformsWithControllers(anim);
    }
    else
    {
        _G2Anim_BuildTransformsNoControllers(anim);
    }

    ((int *)&anim->rootTrans.x)[0] = 0;
    anim->rootTrans.z = 0;

    anim->section[0].flags &= 0x7F;
    anim->flags &= ~0x1;
}

void G2Anim_UpdateStoredFrame(G2Anim *anim)
{
    G2AnimSection *section;
    short storedTime;
    short elapsedTime;
    G2SVector3 motionVector;
    int sectionCount;
    G2AnimInterpInfo *interpInfo;
    G2SVector3 *vector;

    section = &anim->section[0];

    sectionCount = anim->sectionCount;

    storedTime = section->storedTime;

    elapsedTime = section->elapsedTime;

    for (; sectionCount > 0; sectionCount--)
    {
        interpInfo = section->interpInfo;

        if ((interpInfo != NULL) && (interpInfo->stateBlockList != NULL))
        {
            _G2AnimSection_UpdateStoredFrameFromQuat(section);
        }
        else
        {
            _G2AnimSection_UpdateStoredFrameFromData(section, anim);
        }

        section++;
    }

    vector = &motionVector;

    if (storedTime < 0)
    {
        storedTime = 0;
    }

    ((int *)&vector->x)[0] = 0;
    vector->z = 0;

    if (elapsedTime > storedTime)
    {
        G2Anim_GetRootMotionOverInterval(anim, storedTime, elapsedTime, vector);
    }
    else if (elapsedTime < storedTime)
    {
        G2Anim_GetRootMotionOverInterval(anim, elapsedTime, storedTime, vector);
    }

    if ((anim->section[0].flags & 0x4))
    {
        anim->rootTrans.x -= motionVector.x;
        anim->rootTrans.y -= motionVector.y;
        anim->rootTrans.z -= motionVector.z;
    }
    else
    {
        anim->rootTrans.x += motionVector.x;
        anim->rootTrans.y += motionVector.y;
        anim->rootTrans.z += motionVector.z;
    }
}

G2AnimSection *G2Anim_GetSectionWithSeg(G2Anim *anim, int segNumber)
{
    G2AnimSection *section;
    G2AnimSection *tempSection;
    G2AnimSection *endSection;
    int firstSeg;
    int lastSeg;

    section = NULL;

    endSection = &anim->section[anim->sectionCount];

    for (tempSection = &anim->section[0]; tempSection < endSection; tempSection++)
    {
        firstSeg = tempSection->firstSeg;

        lastSeg = firstSeg + tempSection->segCount;

        if ((segNumber >= firstSeg) && (segNumber < lastSeg))
        {
            section = tempSection;
            break;
        }
    }

    return section;
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_SegmentHasActiveChannels);

void G2Anim_GetSegChannelValue(G2Anim *anim, int segIndex, unsigned short *valueTable, unsigned short channelMask)
{
    unsigned short *chanFinalValue;
    unsigned short z;
    unsigned long xy;

    G2Anim_UpdateStoredFrame(anim);

    xy = ((unsigned long *)&anim->rootTrans.x)[0];
    z = anim->rootTrans.z;

    ((unsigned long *)&_segValues[0].trans.x)[0] = xy;
    _segValues[0].trans.z = z;

    _G2Anim_ApplyControllersToStoredFrame(anim);

    chanFinalValue = (unsigned short *)&_segValues[segIndex];

    while (channelMask != 0)
    {
        if ((channelMask & 0x1))
        {
            *valueTable++ = *chanFinalValue;
        }

        channelMask >>= 1;

        chanFinalValue++;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetRootMotionFromTimeForDuration);

void G2AnimSection_SwitchToKeylistAtTime(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, short targetTime)
{
    G2Anim *anim;
    G2SVector3 rootMotion;
    G2AnimInterpInfo *interpInfo;
    unsigned short z;
    unsigned long xy;

    anim = _G2AnimSection_GetAnim(section);

    if (section->firstSeg == 0)
    {
        anim->flags |= 0x1;

        if ((section->keylist != NULL) && (section->storedTime >= 0))
        {
            G2Anim_GetRootMotionOverInterval(anim, section->storedTime, section->elapsedTime, &rootMotion);
        }
        else
        {
            *(unsigned long *)&rootMotion.x = 0;
            rootMotion.z = 0;
        }

        rootMotion.x += anim->rootTrans.x;
        rootMotion.y += anim->rootTrans.y;
        rootMotion.z += anim->rootTrans.z;
    }

    interpInfo = section->interpInfo;

    if ((interpInfo != NULL) && (interpInfo->stateBlockList != NULL))
    {
        _G2Anim_FreeInterpStateBlockList(interpInfo->stateBlockList);

        interpInfo->stateBlockList = NULL;
    }

    G2AnimSection_ClearAlarm(section, 0x3);

    if (keylist != section->keylist)
    {
        section->keylist = keylist;
        section->keylistID = keylistID;

        section->storedTime = -section->keylist->timePerKey;
    }

    G2AnimSection_JumpToTime(section, targetTime);

    if (section->firstSeg == 0)
    {
        section->flags |= 0x80;

        xy = *(unsigned long *)&rootMotion.x;
        z = rootMotion.z;

        *(unsigned long *)&anim->rootTrans.x = xy;
        anim->rootTrans.z = z;
    }

    if ((section->flags & 0x2))
    {
        G2AnimSection_SetLoopRangeAll(section);
    }

    G2AnimSection_SetUnpaused(section);

    section->swAlarmTable = NULL;
}

void G2AnimSection_JumpToTime(G2AnimSection *section, short targetTime)
{
    G2Anim *anim;

    anim = _G2AnimSection_GetAnim(section);

    if (targetTime < section->elapsedTime)
    {
        section->storedTime = -section->keylist->timePerKey;
    }

    section->elapsedTime = targetTime;

    _G2AnimSection_UpdateStoredFrameFromData(section, anim);

    G2AnimSection_ClearAlarm(section, 0x3);

    section->flags &= 0x7F;

    if (section->firstSeg == 0)
    {
        *(unsigned int *)&anim->rootTrans.x = 0;
        anim->rootTrans.z = 0;
    }
}

short G2AnimSection_UpdateOverInterval(G2AnimSection *section, short interval)
{
    G2Anim *anim;
    G2SVector3 motionVector;
    G2AnimInterpInfo *interpInfo;
    short elapsedTime;
    unsigned short z;
    unsigned long xy;
    short temp; // not from decls.h

    if ((section->flags & 0x1))
    {
        return 0;
    }

    interpInfo = section->interpInfo;

    if ((interpInfo != NULL) && (interpInfo->stateBlockList != NULL))
    {
        anim = _G2AnimSection_GetAnim(section);

        anim->flags |= 0x1;

        elapsedTime = section->elapsedTime;

        temp = (elapsedTime + (short)((interval * section->speedAdjustment) >> 12)) - interpInfo->duration;

        if (temp >= 0)
        {
            section->storedTime = -section->keylist->timePerKey;

            G2AnimSection_JumpToTime(section, interpInfo->targetTime);

            if (section->firstSeg == 0)
            {
                G2Anim_GetRootMotionOverInterval(anim, elapsedTime, interpInfo->duration, &motionVector);

                xy = *(unsigned long *)&motionVector.x;
                z = motionVector.z;

                *(unsigned long *)&anim->rootTrans.x = xy;
                anim->rootTrans.z = z;

                section->flags |= 0x80;
            }

            _G2Anim_FreeInterpStateBlockList(interpInfo->stateBlockList);

            interpInfo->stateBlockList = NULL;

            if ((section->flags & 0x2))
            {
                G2AnimSection_SetLoopRangeAll(section);
            }

            section->alarmFlags |= 0x10;

            if (section->callback != NULL)
            {
                section->callback(anim, section->sectionID, G2ANIM_MSG_SECTION_INTERPDONE, 0, 0, (Instance *)section->callbackData);
            }

            return temp;
        }
        else
        {
            section->elapsedTime = elapsedTime + (short)((interval * section->speedAdjustment) >> 12);
            return 0;
        }
    }

    if (!(section->flags & 0x4))
    {
        return G2AnimSection_AdvanceOverInterval(section, interval);
    }
    else
    {
        return G2AnimSection_RewindOverInterval(section, interval);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_AdvanceOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_RewindOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildTransformsNoControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildSegTransformNoControllers);

void _G2Anim_BuildSegLocalRotMatrix(G2AnimSegValue *segValue, G2Matrix *segMatrix)
{
    G2SVector3 rot;
    G2SVector3 *source;
    G2SVector3 *dest;
    unsigned long mask;
    unsigned short z;
    unsigned long xy;

    source = &segValue->rotQuat.rot;

    if (segValue->bIsQuat != 0)
    {
        G2Quat_ToMatrix_S(&segValue->rotQuat.quat, segMatrix);
    }
    else
    {
        mask = 0xFFF0FFF;

        dest = &rot;

        z = source->z & 0xFFF;
        xy = *(unsigned long *)&source->x & mask;

        dest->z = z;
        *(unsigned long *)&rot.x = xy;

        RotMatrixZYX((SVECTOR *)dest, (MATRIX *)segMatrix);
    }
}

void wombat(unsigned char *segKeyList, int flagBitOffset, G2AnimSegKeyflagInfo *kfInfo)
{
    int flagDWordOffset;
    int flagBitShift;

    flagDWordOffset = flagBitOffset >> 5;

    segKeyList = &segKeyList[flagDWordOffset << 2];

    flagBitShift = flagBitOffset - (flagDWordOffset << 5);

    kfInfo->stream = (unsigned long *)segKeyList;

    kfInfo->flags = *kfInfo->stream >> flagBitShift;

    kfInfo->bitCount = 32 - (flagBitOffset & 0x1F);
}

unsigned long kangaroo(G2AnimSegKeyflagInfo *kfInfo)
{
    unsigned long keyflags;
    unsigned long tempFlags;

    keyflags = 0;

    if (kfInfo->stream != NULL)
    {
        keyflags = kfInfo->flags & 0x7;

        kfInfo->flags >>= 3;

        kfInfo->bitCount -= 3;

        if (kfInfo->bitCount <= 0)
        {
            kfInfo->stream = &kfInfo->stream[1];

            kfInfo->flags = kfInfo->stream[0];

            if (kfInfo->bitCount < 0)
            {
                tempFlags = (kfInfo->flags << (kfInfo->bitCount + 3)) & 0x7;

                keyflags |= tempFlags;

                kfInfo->flags >>= -kfInfo->bitCount;
            }

            kfInfo->bitCount += 32;
        }
    }

    return keyflags;
}

void _G2Anim_InitializeSegValue(G2Anim *anim, G2AnimSegValue *segValue, int segIndex)
{
    Segment *segment;
    // G2Quat *quat; // unused
    // unsigned long zpad; // unused
    // unsigned long xy; // unused

    SET_QUAT_FAST(&segValue->rotQuat.quat, 0, 0, 0, 4096);
    SET_SVEC3_FAST(&segValue->scale, 4096, 4096, 4096);

    segment = &anim->modelData->segmentList[segIndex];

    COPY_SVEC3_FAST((G2SVector3 *)&segValue->trans, (G2SVector3 *)&segment->px);
}

void _G2AnimSection_InitStatus(G2AnimSection *section, G2Anim *anim)
{
    G2AnimDecompressChannelInfo dcInfo;
    G2AnimSegValue *segValue;
    G2AnimChanStatusBlock **chanStatusNextBlockPtr;
    G2AnimChanStatusBlock *chanStatusBlock;
    G2AnimChanStatus *chanStatus;
    G2AnimSegKeyflagInfo rotKfInfo;
    G2AnimSegKeyflagInfo scaleKfInfo;
    G2AnimSegKeyflagInfo transKfInfo;
    int type;
    unsigned long segChanFlags;
    int segIndex;
    int lastSeg;
    int flagBitOffset;
    unsigned long activeChanBits;
    unsigned char *segKeyList;
    int bitsPerFlagType;
    // int chanStatusChunkCount; // unused

    flagBitOffset = ((section->firstSeg << 1) + section->firstSeg) + 8;

    bitsPerFlagType = ((anim->modelData->numSegments << 1) + anim->modelData->numSegments) + 7;

    segKeyList = (unsigned char *)&section->keylist->sectionData[section->keylist->sectionCount];

    activeChanBits = *segKeyList;

    bitsPerFlagType &= ~0x7;

    rotKfInfo.stream = NULL;
    scaleKfInfo.stream = NULL;
    transKfInfo.stream = NULL;

    if ((activeChanBits & 0x1))
    {
        wombat(segKeyList, flagBitOffset, &rotKfInfo);

        flagBitOffset += bitsPerFlagType;
    }

    if ((activeChanBits & 0x2))
    {
        wombat(segKeyList, flagBitOffset, &scaleKfInfo);

        flagBitOffset += bitsPerFlagType;
    }

    if ((activeChanBits & 0x4))
    {
        wombat(segKeyList, flagBitOffset, &transKfInfo);
    }

    chanStatus = NULL;

    _G2Anim_FreeChanStatusBlockList(section->chanStatusBlockList);

    section->chanStatusBlockList = NULL;

    activeChanBits = 0;

    dcInfo.keylist = section->keylist;

    dcInfo.chanData = section->keylist->sectionData[section->sectionID];

    segIndex = section->firstSeg;

    lastSeg = segIndex + section->segCount;

    segValue = &_segValues[segIndex];

    chanStatusNextBlockPtr = &section->chanStatusBlockList;

    for (; segIndex < lastSeg; segIndex++, segValue++)
    {
        segChanFlags = kangaroo(&rotKfInfo);

        segChanFlags |= kangaroo(&scaleKfInfo) << 4;
        segChanFlags |= kangaroo(&transKfInfo) << 8;

        _G2Anim_InitializeSegValue(anim, segValue, segIndex);

        while (segChanFlags != 0)
        {
            if ((segChanFlags & 0x1))
            {
                type = ((unsigned char *)dcInfo.chanData)[1] & 0xE0; // TODO: ensure that this cast doesn't cause issues

                if (type == 0xE0)
                {
                    type = 0;
                }

                switch (type)
                {
                case 0:
                    dcInfo.chanData = &dcInfo.chanData[dcInfo.keylist->keyCount];
                    break;
                case 0x20:
                    dcInfo.chanData = &dcInfo.chanData[2];
                    break;
                default:
                    if (activeChanBits == 0)
                    {
                        activeChanBits = 8;

                        chanStatusBlock = (G2AnimChanStatusBlock *)G2PoolMem_Allocate(&_chanStatusBlockPool);

                        chanStatusBlock->next = NULL;

                        *chanStatusNextBlockPtr = chanStatusBlock;

                        chanStatusNextBlockPtr = (G2AnimChanStatusBlock **)chanStatusBlock;

                        chanStatus = ((G2AnimChanStatusBlock *)chanStatusNextBlockPtr)->chunks;
                    }

                    switch (type)
                    {
                    case 0x40:
                        _G2Anim_InitializeChannel_AdaptiveDelta(&dcInfo, chanStatus);
                        break;
                    case 0x60:
                        _G2Anim_InitializeChannel_Linear(&dcInfo, chanStatus);
                        break;
                    }

                    chanStatus++;

                    activeChanBits--;
                    break;
                }
            }

            segChanFlags >>= 1;
        }
    }

    section->storedTime = -section->keylist->timePerKey;
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", FooBar);

void _G2AnimSection_UpdateStoredFrameFromData(G2AnimSection *section, G2Anim *anim)
{
    short timePerKey;
    long storedKey;
    long targetKey;
    long timeOffset;

    storedKey = section->storedTime / section->keylist->timePerKey;

    timePerKey = section->keylist->timePerKey;

    targetKey = section->elapsedTime / timePerKey;

    if ((storedKey < 0) || (targetKey < storedKey))
    {
        _G2AnimSection_InitStatus(section, anim);

        storedKey = -1;
    }

    timeOffset = ((section->elapsedTime - (targetKey * timePerKey)) << 12) / timePerKey;

    FooBar(section, anim, storedKey, targetKey, timeOffset);

    section->storedTime = section->elapsedTime;

    section->flags |= 0x80;
}

G2Anim *_G2AnimSection_GetAnim(G2AnimSection *section)
{
    return (G2Anim *)((char *)section - ((section->sectionID * sizeof(G2AnimSection)) + 36));
}

void _G2AnimSection_TriggerEffects(G2AnimSection *section, short startTime, short endTime)
{
    G2AnimKeylist *keylist;
    G2AnimFxHeader *fxHeader;
    int fxSectionID;
    unsigned long fxSize;
    G2Anim *Anim;

    keylist = section->keylist;

    if (keylist->fxList != NULL)
    {
        fxHeader = keylist->fxList;

        while (fxHeader->type != -1)
        {
            fxSectionID = fxHeader->sizeAndSection & 0xF;
            fxSize = (fxHeader->sizeAndSection & 0xF0) >> 2;

            if (fxSectionID == section->sectionID)
            {
                short time;

                time = fxHeader->keyframeID * keylist->s0TailTime;

                if (((startTime < time) || ((time == 0) && (time >= startTime))) && (endTime >= time) && (section->callback != NULL))
                {
                    Anim = _G2AnimSection_GetAnim(section);

                    section->callback(Anim, section->sectionID, G2ANIM_MSG_PLAYEFFECT, fxHeader->type, &fxHeader[1], (Instance *)section->callbackData);
                }
            }

            fxHeader = (G2AnimFxHeader *)((unsigned char *)fxHeader + fxSize);
        }
    }
}

void _G2Anim_FreeChanStatusBlockList(G2AnimChanStatusBlock *block)
{
    G2AnimChanStatusBlock *nextBlock;

    while (block != NULL)
    {
        nextBlock = block->next;

        G2PoolMem_Free(&_chanStatusBlockPool, block);

        block = nextBlock;
    }
}

long _G2AnimAlphaTable_GetValue(G2AnimAlphaTable *table, long trueAlpha)
{
    long position;
    long positionInt;
    long positionFrac;
    long value;

    if (table == NULL)
    {
        return trueAlpha;
    }

    value = trueAlpha;

    position = (table->size - 1) * value;

    positionInt = position >> 12;

    value = table->data[positionInt];

    positionFrac = position & 0xFFF;

    value += ((table->data[positionInt + 1] - value) * positionFrac) >> 12;

    return value;
}
