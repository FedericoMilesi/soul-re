#include "common.h"
#include "Game/TYPES.h"
#include "Game/CAMERA.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Lock);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Unlock);

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

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_DoPanicCheck);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Panic);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_DoCameraCollision2);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FocusInstanceMoved);
