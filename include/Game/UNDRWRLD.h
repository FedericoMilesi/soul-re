#ifndef _UNDRWRLD_H_
#define _UNDRWRLD_H_

#include "common.h"
#include "Game/GAMELOOP.h"

// size: 0x8
typedef struct UW_ScreenXY {
    // offset: 0000
    short sx;
    // offset: 0002
    short sy;
    // offset: 0004
    short dx;
    // offset: 0006
    short dy;
} UW_ScreenXY;

void UNDERWORLD_InitDisplayProcess();
StreamUnit *UNDERWORLD_LoadLevel(char *baseAreaName, GameTracker *gameTracker);
long UNDERWORLD_RotateScreenStep(long time);
void UNDERWORLD_UpdatePlayer(Intro *playerIntro, Instance *instance);
void UNDERWORLD_DisplayFrame(long *primStart, long drawY);

#endif
