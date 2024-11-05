#ifndef _UNDRWRLD_H_
#define _UNDRWRLD_H_

#include "common.h"

void UNDERWORLD_InitDisplayProcess();
StreamUnit *UNDERWORLD_LoadLevel(char *baseAreaName, GameTracker *gameTracker);
long UNDERWORLD_RotateScreenStep(long time);
void UNDERWORLD_UpdatePlayer(Intro *playerIntro, Instance *instance);
void UNDERWORLD_DisplayFrame(long *primStart, long drawY);
POLY_GT3 *UNDERWORLD_Poly(POLY_GT3 *last, UW_ScreenXY *p0, UW_ScreenXY *p1, UW_ScreenXY *p2, int drawY);

#endif
