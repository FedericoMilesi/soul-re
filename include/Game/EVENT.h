#ifndef _EVENT_H_
#define _EVENT_H_

// size: 0xC
struct EventAliasCommandStruct {
    // offset: 0000
    struct _Instance *hostInstance;
    // offset: 0004
    short newanim;
    // offset: 0006
    short newframe;
    // offset: 0008
    short interpframes;
    // offset: 000A
    short speed;
};

// size: 0x10
struct HintSystemStruct {
    // offset: 0000
    short flags;
    // offset: 0002
    short hintNumber;
    // offset: 0004
    short stringNumber;
    // offset: 0006
    short pad;
    // offset: 0008
    long fadeTimer;
    // offset: 000C
    long spawningUnitID;
};

#endif
