#include "common.h"
#include "Game/CAMERA.h"
#include "Game/MATH3D.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/G2/ANMCTRLR.h"

EXTERN STATIC int ZoneDelta;

EXTERN STATIC G2SVector3 ExtraRotData;

EXTERN STATIC G2SVector3 *ExtraRot;

EXTERN STATIC int LastRC;

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

int GetControllerInput(int *ZDirection, long *controlCommand)
{
    int rc;

    if ((gameTrackerX.playerInstance->flags & 0x100))
    {
        return 0;
    }

    if ((*controlCommand & 0x5) == 0x5)
    {
        rc = 0x10000010;

        *ZDirection = 2560;

        UpdateZoneDelta(0x10000010, LastRC);
    }
    else if ((*controlCommand & 0x9) == 0x9)
    {
        rc = 0x10000020;

        *ZDirection = 1536;

        UpdateZoneDelta(0x10000020, LastRC);
    }
    else if ((*controlCommand & 0x6) == 0x6)
    {
        rc = 0x10000040;

        *ZDirection = 3584;

        UpdateZoneDelta(0x10000040, LastRC);
    }
    else if ((*controlCommand & 0xA) == 0xA)
    {
        rc = 0x10000030;

        *ZDirection = 512;

        UpdateZoneDelta(0x10000030, LastRC);
    }
    else if ((*controlCommand & 0x1))
    {
        rc = 0x10000001;

        *ZDirection = 2048;

        UpdateZoneDelta(0x10000001, LastRC);
    }
    else if ((*controlCommand & 0x2))
    {
        rc = 0x10000003;

        *ZDirection = 4096;

        UpdateZoneDelta(0x10000003, LastRC);
    }
    else if ((*controlCommand & 0x8))
    {
        rc = 0x10000002;

        *ZDirection = 1024;

        UpdateZoneDelta(0x10000002, LastRC);
    }
    else if ((*controlCommand & 0x4))
    {
        rc = 0x10000004;

        *ZDirection = 3072;

        UpdateZoneDelta(0x10000004, LastRC);
    }
    else
    {
        rc = 0;

        ZoneDelta = 16;

        *ZDirection = 0;
    }

    LastRC = rc;

    return rc;
}

int DecodeDirection(int Source, int Destination, short *Difference, short *Zone)
{
    int rc;

    rc = 0;

    *Difference = AngleDiff((short)Destination, (short)Source);

    if ((unsigned short)(*Difference + 511) < 1023)
    {
        *Zone = 0;

        rc = 0x10000001;
    }
    else if ((unsigned short)(*Difference - 512) < 1024)
    {
        *Zone = 1024;

        rc = 0x10000004;
    }
    else if ((unsigned short)(*Difference + 1535) < 1024)
    {
        *Zone = -1024;

        rc = 0x10000002;
    }
    else if ((short)*Difference > 1535)
    {
        *Zone = 2048;

        rc = 0x10000003;
    }
    else if (*Difference < -1535)
    {
        *Zone = -2048;

        rc = 0x10000003;
    }

    return rc;
}

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

void SteerMove(Instance *instance, int rc)
{
    if ((rc != 0) || (Raziel.Bearing != 0))
    {
        if (Raziel.Bearing < 0)
        {
            Raziel.steeringVelocity = -Raziel.Bearing;
        }
        else
        {
            Raziel.steeringVelocity = Raziel.Bearing;
        }

        Raziel.steeringVelocity = (Raziel.steeringVelocity > 768) ? (Raziel.steeringVelocity / 4) + 112 : 112;

        AngleMoveToward(&instance->rotation.z, Raziel.LastBearing, (short)((Raziel.steeringVelocity * gameTrackerX.timeMult) / 4096));
    }
    else
    {
        Raziel.steeringVelocity = 0;
    }
}

int SteerAutoFace(Instance *instance, long *controlCommand)
{
    short angle;
    int rc;
    //Instance *target; unused
    G2SVector3 autoFaceRot;
    int diff;
    int predict;

    (void)controlCommand;

    predict = 0;

    angle = MATH3D_AngleFromPosToPos(&instance->position, &Raziel.Senses.EngagedList[6].instance->position);

    Raziel.autoFaceTrueAngle = angle;
    Raziel.autoFaceLastAnim = Raziel.autoFaceAnim;

    diff = AngleDiff(angle, Raziel.LastBearing);

    if (((unsigned int)diff + 383) < 767)
    {
        predict = 1;

        Raziel.autoFaceAnim = 0;
        Raziel.autoFaceRootAngle = 0;
    }

    if (((unsigned int)diff + 1535) < 1152)
    {
        predict = 2;

        Raziel.autoFaceAnim = 1;
        Raziel.autoFaceRootAngle = 1024;
    }

    if (((unsigned int)diff - 384) < 1152)
    {
        predict = 4;

        Raziel.autoFaceAnim = 3;
        Raziel.autoFaceRootAngle = -1024;
    }

    if (((unsigned int)diff + 1535) > 3070)
    {
        predict = 3;

        Raziel.autoFaceAnim = 2;
        Raziel.autoFaceRootAngle = 2048;
    }

    angle = Raziel.LastBearing;

    Raziel.steeringVelocity = 64;

    AngleMoveToward(&instance->rotation.z, angle, (short)(gameTrackerX.timeMult / 64));

    Raziel.autoFaceAnim = predict - 1;
    Raziel.autoFaceAngle = angle;

    rc = predict | 0x10001000;

    if (Raziel.autoFaceAnim != Raziel.autoFaceLastAnim)
    {
        instance->rotation.z = Raziel.LastBearing;

        autoFaceRot.x = 0;
        autoFaceRot.y = 0;
        autoFaceRot.z = Raziel.autoFaceRootAngle;

        if (G2Anim_IsControllerActive(&instance->anim, 1, 10) == G2FALSE)
        {
            G2Anim_EnableController(&instance->anim, 1, 10);
        }

        if (Raziel.input == Raziel.lastInput)
        {
            G2EmulationSetInterpController_Vector(instance, 1, 10, &autoFaceRot, 4, 3);
        }
        else
        {
            G2Anim_SetController_Vector(&instance->anim, 1, 10, &autoFaceRot);
        }
    }

    diff = AngleDiff(instance->rotation.z, Raziel.autoFaceTrueAngle);

    if (G2Anim_IsControllerInterpolating(&instance->anim, 1, 10) != G2FALSE)
    {
        if (G2Anim_IsControllerInterpolating(&instance->anim, 14, 14) == G2FALSE)
        {
            autoFaceRot.x = 0;
            autoFaceRot.y = 0;
            autoFaceRot.z = diff - Raziel.autoFaceRootAngle;

            G2EmulationSetInterpController_Vector(instance, 14, 14, &autoFaceRot, 4, 3);
        }
    }
    else
    {
        autoFaceRot.x = 0;
        autoFaceRot.y = 0;
        autoFaceRot.z = diff - Raziel.autoFaceRootAngle;

        if (G2Anim_IsControllerActive(&instance->anim, 14, 14) == G2FALSE)
        {
            G2Anim_EnableController(&instance->anim, 14, 14);
        }

        G2Anim_SetController_Vector(&instance->anim, 14, 14, &autoFaceRot);
    }

    return rc;
}

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
