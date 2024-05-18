#ifndef _DRAW_H_
#define _DRAW_H_

// size: 0x4
struct _ColorType {
    // offset: 0000
    unsigned char r;
    // offset: 0001
    unsigned char g;
    // offset: 0002
    unsigned char b;
    // offset: 0003
    unsigned char code;
};

// size: 0x10
struct _ButtonTexture {
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
};

typedef struct _ButtonTexture ButtonTexture;

#endif
