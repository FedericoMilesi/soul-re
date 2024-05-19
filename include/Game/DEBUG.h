#ifndef _DEBUG_H_
#define _DEBUG_H_

enum DEBUG_LINE_TYPE {
    DEBUG_LINE_TYPE_BIT = 0,
    DEBUG_LINE_TYPE_LONG = 1,
    DEBUG_LINE_TYPE_ACTION = 2,
    DEBUG_LINE_TYPE_ACTION_WITH_LINE = 3,
    DEBUG_LINE_TYPE_MENU = 4,
    DEBUG_LINE_TYPE_ENDLIST = 5,
    DEBUG_LINE_TYPE_FORMAT = 6,
    DEBUG_LINE_TYPE_INFO = 7,
};

// size: 0x18
typedef struct DebugMenuLine {
    // offset: 0000 (4 bytes)
    enum DEBUG_LINE_TYPE type;
    // offset: 0004
    long lower;
    // offset: 0008
    long upper;
    // offset: 000C
    char *text;
    // offset: 0010
    long *var_address;
    // offset: 0014
    long bit_mask;
} DebugMenuLine;

// size: 0x8
typedef struct debug_dispatch_t {
    // offset: 0000 (4 bytes)
    enum DEBUG_LINE_TYPE type;
    // offset: 0004
    void (*fn)();
} debug_dispatch_t;

// size: 0x10
typedef struct GameCheat {
    // offset: 0000 (12 bytes)
    unsigned char cheatKeys[12];
    // offset: 000C
    short cheatLen;
    // offset: 000E
    short cheatStage;
} GameCheat;

#endif
