#ifndef _VRAM_H_
#define _VRAM_H_

#include "Game/OBTABLE.h"

// size: 0x1C
typedef struct _BlockVramEntry {
    // offset: 0000 (28 bytes)
    struct _BlockVramEntry *next;
    // offset: 0004
    unsigned char type;
    // offset: 0005
    unsigned char flags;
    // offset: 0006
    short time;
    // offset: 0008
    long ID;
    // offset: 000C
    short x;
    // offset: 000E
    short y;
    // offset: 0010
    short w;
    // offset: 0012
    short h;
    // offset: 0014
    long area;
    // offset: 0018 (4 bytes)
    // size: 0x4
    union {
        struct _StreamUnit *streamUnit;
        // offset: 0000 (36 bytes)
        struct _ObjectTracker *streamObject;
        // offset: 0000 (16 bytes)
        struct _ButtonTexture *button;
    } udata;
} BlockVramEntry;

// size: 0x14
typedef struct VramBuffer {
    // offset: 0000
    long flags;
    // offset: 0004
    short x;
    // offset: 0006
    short y;
    // offset: 0008
    short w;
    // offset: 000A
    short h;
    // offset: 000C
    short yOffset;
    // offset: 000E
    short lengthOfLeftOverData;
    // offset: 0010
    short *lineOverFlow;
} VramBuffer;

void VRAM_LoadReturn(void *dataPtr, void *data1, void *data2);
void VRAM_ClearVramBlock(BlockVramEntry *block);
BlockVramEntry *VRAM_CheckVramSlot(short *x, short *y, short w, short h, int type, int startY);
void VRAM_RearrangeVramsLayer(long whichLayer);
void VRAM_InitMorphPalettes();
void AdjustVramCoordsObject(int oldx, int oldy, int newx, int newy, Object *object);
void VRAM_TransferBufferToVram(void *dataPtr, long dataSize, short status, void *data1, void *data2);

#endif
