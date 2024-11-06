#ifndef RAZIEL_H_
#define RAZIEL_H_

#include "common.h"

STATIC Player Raziel;

STATIC RazielData *PlayerData;

int ControlFlag;

STATIC int PhysicsMode;

long RazielCommands[10];

STATIC long *PadData;

STATIC int AutoFaceAngle;

void RAZIEL_DebugHurtRaziel();
void RAZIEL_DebugHealthSetScale(long healthScale);
void RAZIEL_DebugManaSetMax(long manaScale);
void RAZIEL_DebugHealthFillUp();
void RAZIEL_DebugManaFillUp();
void RAZIEL_ResetLookAround(Instance *instance);
void RAZIEL_SetLookAround(Instance *instance);
void RAZIEL_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker);
long RAZIEL_OkToLookAround(Instance *playerInstance);
void StateHandlerIdle(CharacterState *In, int CurrentSection, intptr_t Data);
void DefaultStateHandler(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerLookAround(CharacterState *In, int CurrentSection, intptr_t Data);
void SetTimer(int ticks);
void StateHandlerFall(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerMove(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerStopMove(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerAutoFace(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerCompression(CharacterState *In, int CurrentSection, intptr_t Data);
void DisableWristCollision(Instance *instance, int Side);

#endif
