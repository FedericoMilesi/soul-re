#include "common.h"
#include "Game/G2/ANMINTRP.h"
#include "Game/G2/POOLMMG2.h"
#include "Game/HASM.h"

//static G2AnimInterpStateBlockPool _interpStateBlockPool;
G2AnimInterpStateBlockPool _interpStateBlockPool;

//static G2AnimSegValue _segValues[80];
G2AnimSegValue _segValues[80];

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", G2AnimSection_InterpToKeylistAtTime);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_UpdateStoredFrameFromQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_InterpStateToQuat);

void _G2AnimSection_SegValueToQuat(G2AnimSection *section, int zeroOne)
{
    G2AnimSegValue *segValue;
    G2AnimInterpInfo *interpInfo;
    G2AnimInterpStateBlock *stateBlockList;
    G2AnimQuatInfo *quatInfo;
    G2EulerAngles preQuat;
    int quatInfoChunkCount;
    int segCount;

    quatInfoChunkCount = 4;

    segCount = section->segCount;

    interpInfo = section->interpInfo;

    stateBlockList = interpInfo->stateBlockList;

    segValue = &_segValues[section->firstSeg];

    quatInfo = stateBlockList->quatInfo;

    while (segCount > 0)
    {
        preQuat.x = segValue->rotQuat.quat.x & 0xFFF;
        preQuat.y = segValue->rotQuat.quat.y & 0xFFF;
        preQuat.z = segValue->rotQuat.quat.z & 0xFFF;

        preQuat.order = 0;

        if (zeroOne == 0)
        {
            G2Quat_FromEuler_S(&quatInfo->srcQuat, &preQuat);

            quatInfo->srcScale.x = segValue->scale.x;
            quatInfo->srcScale.y = segValue->scale.y;
            quatInfo->srcScale.z = segValue->scale.z;

            quatInfo->srcTrans.x = segValue->trans.x;
            quatInfo->srcTrans.y = segValue->trans.y;
            quatInfo->srcTrans.z = segValue->trans.z;
        }
        else
        {
            G2Quat_FromEuler_S(&quatInfo->destQuat, &preQuat);

            quatInfo->destScale.x = segValue->scale.x;
            quatInfo->destScale.y = segValue->scale.y;
            quatInfo->destScale.z = segValue->scale.z;

            quatInfo->destTrans.x = segValue->trans.x;
            quatInfo->destTrans.y = segValue->trans.y;
            quatInfo->destTrans.z = segValue->trans.z;
        }

        segValue++;
        segCount--;

        quatInfo++;

        if (--quatInfoChunkCount == 0)
        {
            stateBlockList = stateBlockList->next;

            quatInfoChunkCount = 4;

            quatInfo = stateBlockList->quatInfo;
        }
    }
}

G2AnimInterpStateBlock *_G2Anim_AllocateInterpStateBlockList(G2AnimSection *section)
{
    G2AnimInterpInfo *interpInfo;
    G2AnimInterpStateBlock *newBlock;
    int segCount;

    segCount = section->segCount;

    interpInfo = section->interpInfo;

    interpInfo->stateBlockList = (G2AnimInterpStateBlock *)G2PoolMem_Allocate(&_interpStateBlockPool);

    if (interpInfo->stateBlockList != NULL)
    {
        newBlock = interpInfo->stateBlockList;

        while ((segCount -= 4) > 0)
        {
            newBlock->next = (G2AnimInterpStateBlock *)G2PoolMem_Allocate(&_interpStateBlockPool);

            if (newBlock->next == NULL)
            {
                _G2Anim_FreeInterpStateBlockList(interpInfo->stateBlockList);

                interpInfo->stateBlockList = NULL;

                return NULL;
            }

            newBlock = newBlock->next;
        }

        newBlock->next = NULL;
    }

    return interpInfo->stateBlockList;
}

void _G2Anim_FreeInterpStateBlockList(G2AnimInterpStateBlock *block)
{
    G2AnimInterpStateBlock *nextBlock;

    while (block != NULL)
    {
        nextBlock = block->next;

        G2PoolMem_Free(&_interpStateBlockPool, block);

        block = nextBlock;
    }
}
