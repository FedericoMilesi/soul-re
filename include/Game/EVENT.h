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

#endif
