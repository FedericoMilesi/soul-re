#ifndef _ANMINTRP_H_
#define _ANMINTRP_H_

#include "Game/G2/ANIMG2.h"

// size: 0x28
typedef struct _G2AnimQuatInfo_Type {
	// offset: 0000 (8 bytes)
	struct _G2Quat_Type srcQuat;
	// offset: 0008 (8 bytes)
	struct _G2Quat_Type destQuat;
	// offset: 0010 (6 bytes)
	struct _G2SVector3_Type srcScale;
	// offset: 0016 (6 bytes)
	struct _G2SVector3_Type destScale;
	// offset: 001C (6 bytes)
	struct _G2SVector3_Type srcTrans;
	// offset: 0022 (6 bytes)
	struct _G2SVector3_Type destTrans;
} G2AnimQuatInfo;

// size: 0xA4
typedef struct _G2AnimInterpStateBlock_Type {
	// offset: 0000 (164 bytes)
	struct _G2AnimInterpStateBlock_Type *next;
	// offset: 0004 (160 bytes)
	struct _G2AnimQuatInfo_Type quatInfo[4];
} G2AnimInterpStateBlock;

// size: 0x10
typedef struct _G2AnimInterpStateBlockPool_Type {
	// offset: 0000
	unsigned short blockSize;
	// offset: 0002
	unsigned short stackTop;
	// offset: 0004
	unsigned short stackSize;
	// offset: 0008
	unsigned short *stack;
	// offset: 000C (164 bytes)
	struct _G2AnimInterpStateBlock_Type *blockPool;
} G2AnimInterpStateBlockPool;

#endif
