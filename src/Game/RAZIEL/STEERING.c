#include "common.h"
#include "Game/CAMERA.h"
#include "Game/MATH3D.h"
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

void SteerTurn(Instance *instance, int rc)
{
    int rot;

    if ((rc != 0) || (Raziel.Bearing != 0))
    {
        if (Raziel.Bearing == 2048)
        {
            rot = instance->rotation.z - Raziel.LastBearing;

            if (rot > 0)
            {
                Raziel.LastBearing++;
            }
            else
            {
                Raziel.LastBearing--;
            }
        }

        AngleMoveToward(&instance->rotation.z, Raziel.LastBearing, (short)((Raziel.steeringVelocity * gameTrackerX.timeMult) / 4096));
    }
    else
    {
        Raziel.steeringVelocity = 0;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerAutoFace);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerSwim);

void SteerWallcrawling(Instance *instance)
{
    (void)instance;

    Raziel.Bearing = AngleDiff(ExtraRot->y - 2048, Raziel.ZDirection);
}

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

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/STEERING", SteerSwitchMode);
#else
void SteerSwitchMode(Instance *instance, int mode)
{
    switch (Raziel.steeringMode)
    {
    case 0:
    case 1:
    case 2:
    case 4:
    case 8:
    case 18:
        if (G2Anim_IsControllerActive(&instance->anim, 1, 14) != G2FALSE)
        {
            G2Anim_DisableController(&instance->anim, 1, 14);

            instance->rotation.z = Raziel.steeringLockRotation;

            Raziel.LastBearing = Raziel.steeringLockRotation;
        }

        break;
    case 5:
    case 9:
    case 15:
        SteerDisableAutoFace(instance);
        break;
    case 6:
    case 17:
        if ((mode != 6) && (mode != 11) && (mode != 16) && (mode != 17))
        {
            if (G2Anim_IsControllerActive(&instance->anim, 1, 14) != G2FALSE)
            {
                G2Anim_InterpDisableController(&instance->anim, 1, 14, 600);
            }

            Raziel.extraRot.x = 0;
        }

        break;
    case 7:
        if (mode != Raziel.steeringMode)
        {
            razDeinitWallCrawlSteering(instance);
        }

        break;
    case 10:
        Raziel.attackedBy = NULL;
        break;
    case 11:
        CAMERA_EndSwimThrowMode(&theCamera);

        CAMERA_SetLookRot(&theCamera, 0, 0);

        Raziel.extraRot.x = Raziel.throwReturnRot;
        break;
    }

    Raziel.RotationSegment = 0;

    switch (mode)
    {
    case 0:
        Raziel.extraRot.z = 0;
        Raziel.extraRot.x = 0;

        Raziel.RotationSegment = 0;
        break;
    case 1:
    case 2:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 15:
    case 18:
        Raziel.RotationSegment = 0;
        break;
    case 11:
    {
        int rotx;

        Raziel.throwReturnRot = Raziel.extraRot.x;

        rotx = 4096 - theCamera.core.rotation.x;
        rotx &= 0xFFF;

        if ((rotx > 1024) && (rotx < 2048))
        {
            rotx = 1024;
        }
        else if ((rotx > 2048) && (rotx < 3072))
        {
            rotx = 3072;
        }

        Raziel.extraRot.x = rotx;

        CAMERA_StartSwimThrowMode(&theCamera);

        CAMERA_SetLookRot(&theCamera, 4096 - Raziel.extraRot.x, 0);
    }
    case 6:
    case 17:
        Raziel.RotationSegment = 1;
        break;
    case 7:
        if (mode != Raziel.steeringMode)
        {
            razInitWallCrawlSteering(instance);
        }

        break;
    case 14:
        instance->rotation.z = MATH3D_AngleFromPosToPos(&instance->position, &Raziel.Senses.EngagedList[6].instance->position);
        break;
    }

    Raziel.steeringMode = mode;
}
#endif

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
