#ifndef _GAMELOOP_H_
#define _GAMELOOP_H_

#include "common.h"

void GAMELOOP_SetGameTime(long timeOfDay);
int GAMELOOP_GetTimeOfDay();
MATRIX *GAMELOOP_GetMatrices(int numMatrices);
void GAMELOOP_Set_Pause_Redraw();
void GAMELOOP_StreamLevelLoadAndInit(char *baseAreaName, GameTracker *gameTracker, int toSignalNum, int fromSignalNum);
void GAMELOOP_RequestLevelChange(char *name, short number, GameTracker *gameTracker);
void ResetPrimPool();
void GAMELOOP_Process(GameTracker *gameTracker);
void ResetDrawPage();
void GAMELOOP_AllocStaticMemory();
void GAMELOOP_InitGameTracker();
void GAMELOOP_AddClearPrim(unsigned long **drawot, int override);
void SaveOT();
void GAMELOOP_Reset24FPS();
void GAMELOOP_Set24FPS();
void GAMELOOP_DisplayFrame(GameTracker *gameTracker);
void GAMELOOP_ChangeMode();

GameTracker gameTrackerX;
GameTracker *gameTracker;
FXTracker *gFXT;
extern long playerCameraMode;
extern long cameraMode;
DRAWENV draw[2];

#endif
