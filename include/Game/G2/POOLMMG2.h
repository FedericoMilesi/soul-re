#ifndef _POOLMMG2_H_
#define _POOLMMG2_H_

// size: 0x10
typedef struct _G2PoolMemPool_Type {
	// offset: 0000
	unsigned short blockSize;
	// offset: 0002
	unsigned short stackTop;
	// offset: 0004
	unsigned short stackSize;
	// offset: 0008
	unsigned short *stack;
	// offset: 000C
	struct _G2PoolMem_Type *blockPool;
} G2PoolMemPool;

#endif
