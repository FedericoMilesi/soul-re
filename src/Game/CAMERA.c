#include "common.h"
#include "Game/TYPES.h"
#include "Game/CAMERA.h"

EXTERN STATIC short panic_count;

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

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetLookRot);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_StartLookaroundMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_StartSwimThrowMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_EndSwimThrowMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ForceEndLookaroundMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Control);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_EndLook);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ChangeToUnderWater);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ChangeToOutOfWater);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_UpdateFocusDistance);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_UpdateFocusTilt);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_UpdateFocusRoll);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_UpdateFocusRotate);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_UpdateFocusRotationX);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FollowPlayerTilt);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FollowGoBehindPlayerWithTimer);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FollowGoBehindPlayer);

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
