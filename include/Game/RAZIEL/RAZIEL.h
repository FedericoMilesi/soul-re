#ifndef RAZIEL_H_
#define RAZIEL_H_

#include "common.h"

void RAZIEL_DebugHurtRaziel();
void RAZIEL_DebugHealthSetScale(long healthScale);
void RAZIEL_DebugManaSetMax(long manaScale);
void RAZIEL_DebugHealthFillUp();
void RAZIEL_DebugManaFillUp();
void RAZIEL_ResetLookAround(Instance *instance);
void RAZIEL_SetLookAround(Instance *instance);
void RAZIEL_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker);
long RAZIEL_OkToLookAround(Instance *playerInstance);
Instance *RAZIEL_QueryEngagedInstance(int index);
void StateInitIdle(CharacterState *In, int CurrentSection, intptr_t Ptr);
void StateHandlerDeCompression(CharacterState *In, int CurrentSection, intptr_t Data);

#endif
