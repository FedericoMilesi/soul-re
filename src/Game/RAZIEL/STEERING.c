#include "common.h"
#include "Game/G2/ANMCTRLR.h"

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

void razDeinitWallCrawlSteering(Instance *instance)
{
    G2Anim_DisableController(&instance->anim, 1, 38);

    instance->position.z -= 318;
    instance->oldPos.z -= 318;

    instance->matrix->t[2] -= 318;
    instance->oldMatrix->t[2] -= 318;

    G2Anim_InterpDisableController(&instance->anim, 0, 14, 300);
    G2Anim_InterpDisableController(&instance->anim, 0, 8, 300);
    G2Anim_InterpDisableController(&instance->anim, 14, 14, 300);
    G2Anim_InterpDisableController(&instance->anim, 50, 76, 300);
    G2Anim_InterpDisableController(&instance->anim, 58, 76, 300);
}
