#ifndef RAZIEL_H_
#define RAZIEL_H_

#include "common.h"
#include "Game/GAMELOOP.h"

void RAZIEL_DebugHurtRaziel();
void RAZIEL_DebugHealthSetScale(long healthScale);
void RAZIEL_DebugManaSetMax(long manaScale);
void RAZIEL_DebugHealthFillUp();
void RAZIEL_DebugManaFillUp();
void RAZIEL_ResetLookAround(Instance *instance);
void RAZIEL_SetLookAround(Instance *instance);
void RAZIEL_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker);
long RAZIEL_OkToLookAround(Instance *playerInstance);

extern unsigned long debugRazielFlags1;
extern unsigned long debugRazielFlags2;
extern unsigned long debugRazielFlags3;

#endif
