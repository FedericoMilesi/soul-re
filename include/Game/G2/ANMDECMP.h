#ifndef _ANMDECMP_H_
#define _ANMDECMP_H_

// size: 0x4
typedef struct _G2AnimChanStatus_Type {
    // offset: 0000
    short keyData;
    // offset: 0002
    short index;
} G2AnimChanStatus;

// size: 0x24
typedef struct _G2AnimChanStatusBlock_Type {
    // offset: 0000 (36 bytes)
    struct _G2AnimChanStatusBlock_Type *next;
    // offset: 0004 (32 bytes)
    struct _G2AnimChanStatus_Type chunks[8];
} G2AnimChanStatusBlock;

// size: 0x10
typedef struct _G2AnimChanStatusBlockPool_Type {
    // offset: 0000
    unsigned short blockSize;
    // offset: 0002
    unsigned short stackTop;
    // offset: 0004
    unsigned short stackSize;
    // offset: 0008
    unsigned short *stack;
    // offset: 000C (36 bytes)
    struct _G2AnimChanStatusBlock_Type *blockPool;
} G2AnimChanStatusBlockPool;

// size: 0x10
typedef struct _G2AnimDecompressChannelInfo_Type {
    // offset: 0000 (20 bytes)
    struct _G2AnimKeylist_Type *keylist;
    // offset: 0004
    unsigned short *chanData;
    // offset: 0008
    int storedKey;
    // offset: 000C
    int targetKey;
} G2AnimDecompressChannelInfo;

#endif
