#include "common.h"

EXTERN STATIC int ZoneDelta;

int UpdateZoneDelta(int rc, int LastRC)
{
    if (LastRC != 0)
    {
        if (LastRC == rc)
        {
            ZoneDelta -= 4;

            if (ZoneDelta < 16)
            {
                ZoneDelta = 16;
            }
        }
        else
        {
            ZoneDelta = 256;
        }
    }

    return ZoneDelta;
}

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
