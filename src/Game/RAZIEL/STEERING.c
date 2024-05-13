#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", UpdateZoneDelta);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", GetControllerInput);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", DecodeDirection);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", ProcessMovement);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerTurn);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerAutoFace);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerSwim);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerWallcrawling);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerDisableAutoFace);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerSwitchMode);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", razInitWallCrawlSteering);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", razDeinitWallCrawlSteering);
