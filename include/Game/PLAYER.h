#ifndef _PLAYER_H_
#define _PLAYER_H_

#include "common.h"
#include "Game/GAMELOOP.h"

void PLAYER_ReSetLookAround(Instance *instance);
void PLAYER_SetLookAround(Instance *instance);
long PLAYER_OkToLookAround(Instance *instance);
void PLAYER_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker);

#endif
