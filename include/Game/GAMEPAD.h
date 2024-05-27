#ifndef _GAMEPAD_H_
#define _GAMEPAD_H_

#include "common.h"
#include "Game/GAMELOOP.h"

void GAMEPAD_Shock1(int motor1_speed, int motor1_time);
void GAMEPAD_Process(GameTracker *gameTracker);

#endif
