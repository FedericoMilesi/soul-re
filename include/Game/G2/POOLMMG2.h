#ifndef _POOLMMG2_H_
#define _POOLMMG2_H_

void G2PoolMem_ResetPool(void *voidPool);
void G2PoolMem_Free(void *voidPool, void *block);
void *G2PoolMem_Allocate(void *voidPool);
void G2PoolMem_InitPool(void *voidPool, int blockCount, int blockSize);

#endif
