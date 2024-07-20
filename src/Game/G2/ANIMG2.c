#include "common.h"
#include "Game/G2/ANMCTRLR.h"
#include "Game/G2/ANMDECMP.h"
#include "Game/G2/POOLMMG2.h"
#include "Game/G2/ANMG2ILF.h"

//static G2AnimChanStatusBlockPool _chanStatusBlockPool;
G2AnimChanStatusBlockPool _chanStatusBlockPool;

//static G2AnimInterpStateBlockPool _interpStateBlockPool;
G2AnimInterpStateBlockPool _interpStateBlockPool;

//static G2AnimControllerPool _controllerPool;
G2AnimControllerPool _controllerPool;

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

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_Restore);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_BuildTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_UpdateStoredFrame);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetSectionWithSeg);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_SegmentHasActiveChannels);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetSegChannelValue);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetRootMotionFromTimeForDuration);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_SwitchToKeylistAtTime);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_JumpToTime);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_UpdateOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_AdvanceOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_RewindOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildTransformsNoControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildSegTransformNoControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildSegLocalRotMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", wombat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", kangaroo);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_InitializeSegValue);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_InitStatus);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", FooBar);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_UpdateStoredFrameFromData);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_GetAnim);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_TriggerEffects);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_FreeChanStatusBlockList);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimAlphaTable_GetValue);
