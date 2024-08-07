#ifndef _ANMINTRP_H_
#define _ANMINTRP_H_

#include "Game/G2/ANIMG2.h"

#define GET_XY(a) *(long*)(&a.x);
#define SET_XY(a, c) *(long*)(&a.x) = c;
#define GET_ZW(b) *(long*)(&b.z);
#define SET_ZW(b, c) *(long*)(&b.z) = c;

#define GETP_XY(a) *(long*)(&a->x);
#define SETP_XY(a, c) *(long*)(&a->x) = c;
#define GETP_ZW(b) *(long*)(&b->z);
#define SETP_ZW(b, c) *(long*)(&b->z) = c;

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

void _G2Anim_FreeInterpStateBlockList(G2AnimInterpStateBlock *block);
void _G2AnimSection_SegValueToQuat(G2AnimSection *section, int zeroOne);
G2AnimInterpStateBlock *_G2Anim_AllocateInterpStateBlockList(G2AnimSection *section);
void _G2AnimSection_InterpStateToQuat(G2AnimSection *section);
void G2AnimSection_InterpToKeylistAtTime(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, short targetTime, short duration);
void _G2AnimSection_UpdateStoredFrameFromQuat(G2AnimSection *section);

#endif
