#include "common.h"
#include "Game/TYPES.h"
#include "Game/CAMERA.h"
#include "Game/INSTANCE.h"

EXTERN STATIC short panic_count;

EXTERN STATIC short CameraLookStickyFlag;

EXTERN STATIC short Camera_lookHeight;

EXTERN STATIC short Camera_lookDist;

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalculateViewVolumeNormals);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcVVClipInfo);

void CAMERA_SetViewVolume(Camera *camera)
{
    CAMERA_CalculateViewVolumeNormals(camera);

    CAMERA_CalcVVClipInfo(camera);
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetProjDistance);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CreateNewFocuspoint);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SaveMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_RestoreMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Save);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Restore);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", SplineGetNextPointDC);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Initialize);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetInstanceFocus);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetZRotation);

long CAMERA_LengthSVector(SVector *sv)
{
    return MATH3D_FastSqrt0((sv->x * sv->x) + (sv->y * sv->y) + (sv->z * sv->z));
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetValue);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_AngleDifference);

short CAMERA_SignedAngleDifference(short angle0, short angle1)
{
    return AngleDiff(angle1, angle0);
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_QueryMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetMaxVel);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetTarget);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcPosition);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetFocus);

void CAMERA_Lock(Camera *camera, long lock)
{
    camera->lock |= lock;
}

void CAMERA_Unlock(Camera *camera, long unlock)
{
    camera->lock &= ~unlock;
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetSmoothValue);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetTimer);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Adjust_tilt);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Adjust_distance);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Adjust_rotation);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Adjust_roll);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Adjust);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ChangeTo);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetShake);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", Decouple_AngleMoveToward);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CriticalDampValue);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CriticalDampPosition);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CriticalDampAngle);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcZRotation);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcRotation);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcFSRotation);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Relocate);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SphereToSphereWithLines);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcTilt);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetLookFocusAndBase);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetLookFocusAndDistance);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_LookProcess);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Normalize);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_HandleTransitions);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcFocusOffset);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcFocusOffsetForSwim);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcIntersectAngle);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_GetLineAngle);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ACForcedMovement);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_update_dist_debounced);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_dampgetline);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ACNoForcedMovement);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_AbsoluteCollision);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_update_z_damped);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CombatCamDist);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_GenericCameraProcess);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CinematicProcess);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_GetDistSq);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_NearestPointOnLineVec);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CheckPoint);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CheckIfPointOnLine);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FindLinePoint);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SplineGetNearestPoint2);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SplineGetNearestPoint);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SplineHelpMove);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SplineProcess);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ShakeCamera);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Process);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CenterCamera);

void CAMERA_SetLookRot(Camera *camera, int x_rotation, int z_rotation)
{
    camera->lookRot.x = x_rotation;
    camera->lookRot.z = z_rotation;
}

void CAMERA_StartLookaroundMode(Camera *camera)
{
    Camera_lookHeight = 512;
    Camera_lookDist = 650;

    CAMERA_SaveMode(camera, camera->mode);

    camera->mode = 6;

    camera->savedFocusDistance = camera->targetFocusDistance;
    camera->savedFocusRotation = camera->targetFocusRotation;

    camera->targetFocusDistance = 650;

    camera->lookRot.x = 0;
    camera->lookRot.y = 0;
    camera->lookRot.z = 0;

    CAMERA_SetLookFocusAndBase(camera->focusInstance, &camera->targetFocusPoint);
}

void CAMERA_StartSwimThrowMode(Camera *camera)
{
    CameraLookStickyFlag = 0x1;

    CAMERA_StartLookaroundMode(camera);

    PLAYER_SetLookAround(camera->focusInstance);

    camera->lookTimer = 2;
}

void CAMERA_EndSwimThrowMode(Camera *camera)
{
    CameraLookStickyFlag = 0;

    CAMERA_EndLook(camera);
}

void CAMERA_ForceEndLookaroundMode(Camera *camera)
{
    CameraLookStickyFlag = 0;

    CAMERA_EndLook(camera);

    camera->flags &= ~0x20000;
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Control);

void CAMERA_EndLook(Camera *camera)
{
    Instance *focusInstance;

    focusInstance = camera->focusInstance;

    if ((camera->lookTimer >= 2) && (camera->mode == 6))
    {
        CAMERA_RestoreMode(camera);

        camera->forced_movement = 0;

        camera->smooth = 8;

        camera->targetFocusDistance = camera->savedFocusDistance;

        camera->targetFocusRotation = camera->savedFocusRotation;

        if ((camera->mode != 4) && (camera->mode != 2))
        {
            camera->targetFocusRotation.z = (focusInstance->rotation.z + 2048) & 0xFFF;

            CAMERA_CenterCamera(camera);
        }

        camera->always_rotate_flag = 1;

        camera->collisionTargetFocusRotation.z = camera->targetFocusRotation.z;

        if (!(camera->flags & 0x10000))
        {
            camera->actual_x_rot = camera->core.rotation.x;
        }

        PLAYER_ReSetLookAround(focusInstance);
    }

    camera->lookTimer = 0;
}

void CAMERA_ChangeToUnderWater(Camera *camera, Instance *instance)
{
    if (instance == camera->focusInstance)
    {
        if (camera->mode != 4)
        {
            if (camera->mode != 5)
            {
                if (camera->mode != 13)
                {
                    CAMERA_SetMode(camera, 13);
                }
                else
                {
                    CAMERA_CreateNewFocuspoint(camera);
                }

                camera->smooth = 8;

                camera->targetFocusDistance = 1600;

                camera->collisionTargetFocusDistance = 1600;

                camera->signalFocusDistance = 1600;

                camera->rotationVel.z = 32;

                camera->always_rotate_flag = 0;
            }
            else
            {
                CAMERA_SaveMode(camera, 13);
            }
        }

        camera->flags |= 0x10000;
    }
}

void CAMERA_ChangeToOutOfWater(Camera *camera, Instance *instance)
{
    if (instance == camera->focusInstance)
    {
        if (camera->mode != 5)
        {
            CAMERA_SetMode(camera, 13);

            camera->rotationVel.z = 0;

            camera->targetTilt = 0;
        }
        else
        {
            CAMERA_SaveMode(camera, 13);
        }

        camera->flags &= ~0x10000;
    }
}

void CAMERA_UpdateFocusDistance(Camera *camera)
{
    int smooth;
    long dampMode;

    if ((camera->forced_movement != 2) && (!(camera->lock & 0x1)))
    {
        if ((camera->targetFocusDistance < camera->collisionTargetFocusDistance) && (!(camera->instance_mode & 0x82000000)))
        {
            camera->collisionTargetFocusDistance = camera->targetFocusDistance;
        }

        dampMode = 6;

        if (camera->collisionTargetFocusDistance < camera->focusDistance)
        {
            if (camera->collisionTargetFocusDistance < camera->targetFocusDistance)
            {
                smooth = 512;

                dampMode = 5;
            }
            else
            {
                smooth = 128;

                dampMode = 1;
            }
        }
        else
        {
            smooth = 64;
        }

        CriticalDampValue(dampMode, &camera->focusDistance, camera->collisionTargetFocusDistance, &camera->focusDistanceVel, &camera->focusDistanceAccl, smooth);
    }
}

void CAMERA_UpdateFocusTilt(Camera *camera)
{
    if ((camera->flags & 0x1800))
    {
        camera->x_rot_change = 0;

        camera->focusRotation.x = camera->tfaceTilt;
    }
    else
    {
        camera->x_rot_change = camera->focusRotation.x;

        if ((camera->forced_movement != 3) && (!(camera->lock & 0x2)) || ((camera->flags & 0x10000)))
        {
            CriticalDampAngle(1, &camera->focusRotation.x, camera->tfaceTilt, &camera->focusRotVel.x, &camera->focusRotAccl.x, 32);
        }
        else
        {
            camera->focusRotation.x = camera->targetFocusRotation.x;
        }

        camera->x_rot_change = CAMERA_SignedAngleDifference(camera->x_rot_change, camera->focusRotation.x);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_UpdateFocusRoll);

void CAMERA_UpdateFocusRotate(Camera *camera)
{
    int dampspeed;
    long dampmode;

    if (camera->forced_movement != 1)
    {
        if (!(camera->lock & 0x4))
        {
            dampmode = 1;

            if (camera->always_rotate_flag != 0)
            {
                dampspeed = -camera->smooth;
            }
            else if (!(camera->flags & 0x10000))
            {
                dampmode = 5;
                dampspeed = 160;
            }
            else
            {
                dampspeed = 128;
            }

            CriticalDampAngle(dampmode, &camera->focusRotation.z, camera->collisionTargetFocusRotation.z, &camera->focusRotVel.z, &camera->focusRotAccl.z, (short)dampspeed);

            if (CAMERA_AngleDifference(camera->targetFocusRotation.z, camera->focusRotation.z) < 4)
            {
                camera->always_rotate_flag = 0;
            }
        }
        else
        {
            camera->focusRotation.z = camera->targetFocusRotation.z;
        }
    }
    else if ((camera->lock & 0x4))
    {
        camera->focusRotation.z = camera->targetFocusRotation.z;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_UpdateFocusRotationX);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FollowPlayerTilt);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FollowGoBehindPlayerWithTimer);

void CAMERA_FollowGoBehindPlayer(Camera *camera)
{
    Instance *focusInstance;

    focusInstance = camera->focusInstance;

    Decouple_AngleMoveToward(&camera->targetFocusRotation.z, focusInstance->rotation.z + 2048, camera->rotationVel.z);
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalculateLead);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcFollowPosition);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetupColInfo);

void CAMERA_DoPanicCheck(Camera *camera, CameraCollisionInfo *tmpcolInfo, Rotation *rotation, short *best_z, short *max_dist)
{
    Position targetCamPos;

    CAMERA_CalcPosition(&targetCamPos, &camera->focusPoint, rotation, camera->targetFocusDistance);

    SET_SVEC((SVector *)&camera->posSphere.position, &targetCamPos);

    CAMERA_SphereToSphereWithLines(camera, tmpcolInfo, 0);

    if ((tmpcolInfo->numCollided == 0) || ((int)*max_dist < tmpcolInfo->lenCenterToExtend))
    {
        *best_z = rotation->z;

        *max_dist = (short)tmpcolInfo->lenCenterToExtend;
    }
}

void CAMERA_Panic(Camera *camera, short min_dist)
{
    Position targetCamPos;
    Rotation rotation;
    int n;
    short best_z;
    short max_dist;
    CameraCollisionInfo tmpcolInfo;
    short free_count1;
    short free_count2;

    free_count1 = 0;
    free_count2 = 0;

    max_dist = min_dist;

    CAMERA_SetupColInfo(camera, &tmpcolInfo, &targetCamPos);

    n = 0;

    rotation = camera->focusRotation;

    best_z = rotation.z;

    while (1)
    {
        rotation.z = camera->focusRotation.z + n;

        CAMERA_DoPanicCheck(camera, &tmpcolInfo, &rotation, &best_z, &max_dist);

        if (tmpcolInfo.numCollided == 0)
        {
            free_count1++;

            if (2 < ((free_count1 * 65536) >> 16))
            {
                break;
            }
        }

        rotation.z = camera->focusRotation.z - n;

        CAMERA_DoPanicCheck(camera, &tmpcolInfo, &rotation, &best_z, &max_dist);

        if (tmpcolInfo.numCollided == 0)
        {
            free_count2++;

            if (2 < ((free_count2 * 65536) >> 16))
            {
                break;
            }
        }

        n += 128;

        if (n > 2047)
        {
            break;
        }
    }

    if (max_dist == min_dist)
    {
        panic_count = -32767;
    }
    else
    {
        camera->always_rotate_flag = 0x1;

        camera->rotState = 3;

        camera->smooth = -112;

        camera->targetFocusRotation.z = best_z;

        camera->collisionTargetFocusRotation.z = best_z;

        camera->signalRot.z = best_z;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_DoCameraCollision2);

int CAMERA_FocusInstanceMoved(Camera *camera)
{
    return ((camera->newFocusInstancePos.x != camera->oldFocusInstancePos.x) || (camera->newFocusInstancePos.y != camera->oldFocusInstancePos.y)
    || (camera->newFocusInstancePos.z != camera->oldFocusInstancePos.z) || (camera->newFocusInstanceRot.x != camera->oldFocusInstanceRot.x)
    || (camera->newFocusInstanceRot.y != camera->oldFocusInstanceRot.y) || (camera->newFocusInstanceRot.z != camera->oldFocusInstanceRot.z));
}
