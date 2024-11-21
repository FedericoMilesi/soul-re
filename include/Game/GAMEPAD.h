#ifndef _GAMEPAD_H_
#define _GAMEPAD_H_

#include "common.h"

extern ControllerPacket readGPBuffer1;

extern ControllerPacket readGPBuffer2;

void GAMEPAD_Shock0(int motor0_speed, int motor0_time);
void GAMEPAD_Shock1(int motor1_speed, int motor1_time);
void GAMEPAD_Process(GameTracker *gameTracker);
void GAMEPAD_GetData(long (*data)[5]);
void GAMEPAD_Commands(long (*command)[5], long (*data)[5], long pad);
void GAMEPAD_DisplayControllerStatus(int msgY);
void GAMEPAD_EnableDualShock();
void GAMEPAD_DisableDualShock();
int GAMEPAD_DualShockEnabled();
void GAMEPAD_Detect();

#endif
