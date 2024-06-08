#include "common.h"
#include "Game/G2/POOLMMG2.h"

INCLUDE_ASM("asm/nonmatchings/Game/G2/POOLMMG2", G2PoolMem_InitPool);

INCLUDE_ASM("asm/nonmatchings/Game/G2/POOLMMG2", G2PoolMem_ResetPool);

INCLUDE_ASM("asm/nonmatchings/Game/G2/POOLMMG2", G2PoolMem_Allocate);

void G2PoolMem_Free(void *voidPool, void *block)
{
    int blockIndex;

    blockIndex = (((char *)block) - ((char *)((G2PoolMemPool *)voidPool)->blockPool)) / ((G2PoolMemPool *)voidPool)->blockSize;

    ((G2PoolMemPool *)voidPool)->stack[--((G2PoolMemPool *)voidPool)->stackTop] = blockIndex;
}
