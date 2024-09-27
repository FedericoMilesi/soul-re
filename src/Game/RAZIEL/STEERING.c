#include "common.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/G2/ANMCTRLR.h"

EXTERN STATIC int ZoneDelta;

EXTERN STATIC G2SVector3 ExtraRotData;

EXTERN STATIC G2SVector3 *ExtraRot;

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

void SteerDisableAutoFace(Instance *instance)
{
    if (G2Anim_IsControllerActive(&instance->anim, 1, 10) != G2FALSE)
    {
        G2Anim_DisableController(&instance->anim, 1, 10);
    }

    if (G2Anim_IsControllerActive(&instance->anim, 14, 14) != G2FALSE)
    {
        G2Anim_DisableController(&instance->anim, 14, 14);
    }

    instance->rotation.z += Raziel.autoFaceRootAngle;

    Raziel.autoFaceRootAngle = 0;
    Raziel.autoFaceAnim = -1;
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerSwitchMode);

void razInitWallCrawlSteering(Instance *instance)
{
    G2SVector3 vec;

    G2Anim_EnableController(&instance->anim, 1, 38);

    vec.x = 0;
    vec.y = 0;
    vec.z = -318;

    instance->position.z += 318;
    instance->oldPos.z += 318;

    instance->matrix->t[2] += 318;
    instance->oldMatrix->t[2] += 318;

    G2Anim_SetController_Vector(&instance->anim, 1, 38, &vec);

    G2Anim_EnableController(&instance->anim, 0, 14);

    vec.x = instance->rotation.x;
    vec.y = instance->rotation.y;
    vec.z = instance->rotation.z;

    G2Anim_EnableController(&instance->anim, 0, 8);

    G2Anim_SetControllerAngleOrder(&instance->anim, 0, 8, 1);
    G2Anim_SetController_Vector(&instance->anim, 0, 8, &vec);

    G2Anim_EnableController(&instance->anim, 14, 14);
    G2Anim_EnableController(&instance->anim, 50, 76);
    G2Anim_EnableController(&instance->anim, 58, 76);

    ExtraRot = &ExtraRotData;

    ExtraRot->z = 0;
    ExtraRot->y = 0;
    ExtraRot->x = 0;
}

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
