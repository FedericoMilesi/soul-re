#include "common.h"
#include "Game/G2/ANMINTRP.h"
#include "Game/G2/POOLMMG2.h"

//static G2AnimInterpStateBlockPool _interpStateBlockPool;
G2AnimInterpStateBlockPool _interpStateBlockPool;

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", G2AnimSection_InterpToKeylistAtTime);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_UpdateStoredFrameFromQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_InterpStateToQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_SegValueToQuat);

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
