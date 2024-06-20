#include "common.h"
#include "Game/G2/ANMINTRP.h"
#include "Game/G2/POOLMMG2.h"

//static G2AnimInterpStateBlockPool _interpStateBlockPool;
G2AnimInterpStateBlockPool _interpStateBlockPool;

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", G2AnimSection_InterpToKeylistAtTime);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_UpdateStoredFrameFromQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_InterpStateToQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2AnimSection_SegValueToQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMINTRP", _G2Anim_AllocateInterpStateBlockList);

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
