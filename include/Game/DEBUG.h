#ifndef _DEBUG_H_
#define _DEBUG_H_

#include "Game/GAMELOOP.h"

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
    intptr_t bit_mask;
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

typedef enum option_ctrl_t {
    option_ctrl_bogus = 0,
    option_ctrl_none = 1,
    option_ctrl_select = 2,
    option_ctrl_left = 3,
    option_ctrl_right = 4,
    option_ctrl_num_states = 5,
} option_ctrl_t;

// size: 0xC
typedef struct debug_format_t {
    // offset: 0000
    int xpos;
    // offset: 0004
    int ypos;
    // offset: 0008
    int is_centered;
} debug_format_t;

extern unsigned long debugRazielFlags1;
extern unsigned long debugRazielFlags2;
extern unsigned long debugRazielFlags3;

void DEBUG_FatalError(const char *fmt, ...);
void DEBUG_DisplayStatus(GameTracker *gameTracker);
void DEBUG_ProcessSecondController(GameTracker *gameTracker);
void DEBUG_ProcessCheat(GameTracker *gameTracker);
void DEBUG_Menu(GameTracker *gt);
void process_cheat_codes(GameTracker *gt, long *ctrl);
void DEBUG_ViewVram(GameTracker *gameTracker);
void DEBUG_CaptureScreen(GameTracker *gameTracker);
void DEBUG_FillUpHealth(long *var);
void DEBUG_FogLoad();
void DEBUG_SetViewVram();
void DEBUG_KeepGameTime(long *var);
void DEBUG_SetGameTime(long *var);
void DEBUG_UpdateFog(long *var);
void DEBUG_FogRestore();
void DEBUG_UpdateHealth(long *var);
void DEBUG_UpdateMana(long *var);
void DEBUG_SendCinematicSwitch();
void DEBUG_LevelSelectNew();
void DEBUG_SendMoveTo();
void DEBUG_ReloadCurrentLevel();
void handle_line_type_bit(GameTracker *gt, DebugMenuLine *line);
void handle_line_type_long(GameTracker *gt, DebugMenuLine *line);
void handle_line_type_action(GameTracker *gt, DebugMenuLine *line);
void handle_line_type_action_with_line(GameTracker *gt, DebugMenuLine *line);
void handle_line_type_menu(GameTracker *gt, DebugMenuLine *line);

#endif
