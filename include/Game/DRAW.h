#ifndef _DRAW_H_
#define _DRAW_H_

#include "common.h"
#include "Game/VRAM.h"

// size: 0x1770C
typedef struct _PrimPool {
    // offset: 0000
    long numPrims;
    // offset: 0004
    unsigned long *nextPrim;
    // offset: 0008
    unsigned long *lastPrim;
    // offset: 000C (96000 bytes)
    unsigned long prim[24000];
} PrimPool;

// size: 0x4
typedef struct _ColorType {
    // offset: 0000
    unsigned char r;
    // offset: 0001
    unsigned char g;
    // offset: 0002
    unsigned char b;
    // offset: 0003
    unsigned char code;
} ColorType;

// size: 0x10
typedef struct _ButtonTexture {
    // offset: 0000
    short tpage;
    // offset: 0002
    short clut;
    // offset: 0004
    short textureW;
    // offset: 0006
    short textureH;
    // offset: 0008
    struct _BlockVramEntry *vramBlock;
    // offset: 000C
    long xshift;
} ButtonTexture;

void DRAW_CreateAGlowingCircle(Vector *f1, long z, PrimPool *primPool, unsigned long **ot, long otz, long color, long w, long h, long angle);
void DRAW_TranslucentQuad(short x0, short y0, short x1, short y1, int x2, int y2, int x3, int y3, int r, int g, int b, int abr, PrimPool *primPool, unsigned long **ot);
//unsigned long *DRAW_DrawRingPoints(Model *model, VertexPool *vertexPool, MATRIX *pcTransform, PrimPool *primPool, unsigned long **ot, long color, int ring_type);

#endif
