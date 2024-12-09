#ifndef _DEBUG_H_
#define _DEBUG_H_

#include "common.h"

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
void DEBUG_ExitMenus();
void DEBUG_EndViewVram(GameTracker *gameTracker);

#endif
