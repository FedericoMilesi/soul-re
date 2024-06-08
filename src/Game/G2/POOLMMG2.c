#include "common.h"
#include "Game/G2/POOLMMG2.h"

INCLUDE_ASM("asm/nonmatchings/Game/G2/POOLMMG2", G2PoolMem_InitPool);

void G2PoolMem_ResetPool(void *voidPool)
{
    G2PoolMemPool *pool;
    int blockIndex;

    pool = (G2PoolMemPool *)voidPool;

    blockIndex = 0;

    pool->stackTop = 0;

    if (pool->stackSize != 0)
    {
        do
        {
            pool->stack[blockIndex] = blockIndex;

            blockIndex++;
        } while (blockIndex < pool->stackSize);
    }
}

void *G2PoolMem_Allocate(void *voidPool)
{
    int blockIndex;

    if (((G2PoolMemPool *)voidPool)->stackTop >= ((G2PoolMemPool *)voidPool)->stackSize)
    {
        return NULL;
    }

    blockIndex = ((G2PoolMemPool *)voidPool)->stack[((G2PoolMemPool *)voidPool)->stackTop];

    ((G2PoolMemPool *)voidPool)->stackTop++;

    return (char *)((G2PoolMemPool *)voidPool)->blockPool + (((G2PoolMemPool *)voidPool)->blockSize * blockIndex);
}

void G2PoolMem_Free(void *voidPool, void *block)
{
    int blockIndex;

    blockIndex = (((char *)block) - ((char *)((G2PoolMemPool *)voidPool)->blockPool)) / ((G2PoolMemPool *)voidPool)->blockSize;

    ((G2PoolMemPool *)voidPool)->stack[--((G2PoolMemPool *)voidPool)->stackTop] = blockIndex;
}
