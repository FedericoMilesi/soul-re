#ifndef _OBTABLE_H_
#define _OBTABLE_H_

// size: 0x8
typedef struct VramSize {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short w;
    // offset: 0006
    short h;
} VramSize;

// size: 0x4C
typedef struct Object {
    // offset: 0000
    long oflags;
    // offset: 0004
    short id;
    // offset: 0006
    short sfxFileHandle;
    // offset: 0008
    short numModels;
    // offset: 000A
    short numAnims;
    // offset: 000C (56 bytes)
    struct _Model **modelList;
    // offset: 0010 (20 bytes)
    struct _G2AnimKeylist_Type **animList;
    // offset: 0014
    short introDist;
    // offset: 0016
    short vvIntroDist;
    // offset: 0018
    short removeDist;
    // offset: 001A
    short vvRemoveDist;
    // offset: 001C
    void *data;
    // offset: 0020
    char *script;
    // offset: 0024
    char *name;
    // offset: 0028
    unsigned char *soundData;
    // offset: 002C
    long oflags2;
    // offset: 0030
    short sectionA;
    // offset: 0032
    short sectionB;
    // offset: 0034
    short sectionC;
    // offset: 0036
    short numberOfEffects;
    // offset: 0038 (4 bytes)
    struct ObjectEffect *effectList;
    // offset: 003C
    unsigned long *relocList;
    // offset: 0040
    void *relocModule;
    // offset: 0044 (8 bytes)
    struct VramSize vramSize;
} Object;

#endif