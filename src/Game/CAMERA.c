#include "common.h"
#include "Game/CAMERA.h"
#include "Game/PLAYER.h"
#include "Game/GAMELOOP.h"
#include "Game/MATH3D.h"
#include "Game/STREAM.h"
#include "Game/COLLIDE.h"
#include "Game/LIGHT3D.h"

long camera_modeToIndex[15] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0};

static short shorten_count = 0;

static short shorten_flag = 0;

static short camera_still = 0;

static long roll_target = 0;

static long current_roll_amount = 0;

static int roll_inc = 0;

EXTERN STATIC short Camera_lookHeight;

EXTERN STATIC short Camera_lookDist;

EXTERN STATIC short CenterFlag;

EXTERN STATIC short combat_cam_angle;

EXTERN STATIC Rotation splinecam_helprot;

EXTERN STATIC short combat_cam_weight;

EXTERN STATIC long cameraMode;

EXTERN STATIC short combat_cam_debounce;

int CAMERA_FocusInstanceMoved(Camera *camera);
void CAMERA_EndLook(Camera *camera);

void CAMERA_CalculateViewVolumeNormals(Camera *camera)
{
    short projDistance;
    Normal n0;
    Normal n1;
    Normal n2;
    Normal n3;
    int x1;
    int x2;
    int y1;
    int y2;

    projDistance = camera->core.projDistance;

    x1 = (camera->core.leftX - 160) << 4;
    x2 = (camera->core.rightX - 160) << 4;

    y1 = (camera->core.topY - 120) << 4;
    y2 = (camera->core.bottomY - 120) << 4;

    n0.x = x1;
    n0.y = y1;
    n0.z = (projDistance << 16) >> 12;

    n1.x = x2;
    n1.y = y1;
    n1.z = (projDistance << 16) >> 12;

    n2.x = x1;
    n2.y = y2;
    n2.z = (projDistance << 16) >> 12;

    n3.x = x2;
    n3.y = y2;
    n3.z = (projDistance << 16) >> 12;

    camera->core.viewVolumeNormal[0].x = 0;
    camera->core.viewVolumeNormal[0].y = 0;
    camera->core.viewVolumeNormal[0].z = 4096;

    camera->core.viewVolumeNormal[1].x = (((n0.y * n1.z) - (n0.z * n1.y)) >> 12);
    camera->core.viewVolumeNormal[1].y = -(((n0.x * n1.z) - (n0.z * n1.x)) >> 12);
    camera->core.viewVolumeNormal[1].z = (((n0.x * n1.y) - (n0.y * n1.x)) >> 12);

    CAMERA_Normalize((SVector *)&camera->core.viewVolumeNormal[1]);

    camera->core.viewVolumeNormal[2].x = (((n2.y * n0.z) - (n2.z * n0.y)) >> 12);
    camera->core.viewVolumeNormal[2].y = -(((n2.x * n0.z) - (n2.z * n0.x)) >> 12);
    camera->core.viewVolumeNormal[2].z = (((n2.x * n0.y) - (n2.y * n0.x)) >> 12);

    CAMERA_Normalize((SVector *)&camera->core.viewVolumeNormal[2]);

    camera->core.viewVolumeNormal[3].x = (((n1.y * n3.z) - (n1.z * n3.y)) >> 12);
    camera->core.viewVolumeNormal[3].y = -(((n1.x * n3.z) - (n1.z * n3.x)) >> 12);
    camera->core.viewVolumeNormal[3].z = (((n1.x * n3.y) - (n1.y * n3.x)) >> 12);

    CAMERA_Normalize((SVector *)&camera->core.viewVolumeNormal[3]);

    camera->core.viewVolumeNormal[4].x = (((n3.y * n2.z) - (n3.z * n2.y)) >> 12);
    camera->core.viewVolumeNormal[4].y = -(((n3.x * n2.z) - (n3.z * n2.x)) >> 12);
    camera->core.viewVolumeNormal[4].z = (((n3.x * n2.y) - (n3.y * n2.x)) >> 12);

    CAMERA_Normalize((SVector *)&camera->core.viewVolumeNormal[4]);
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcVVClipInfo);

void CAMERA_SetViewVolume(Camera *camera)
{
    CAMERA_CalculateViewVolumeNormals(camera);

    CAMERA_CalcVVClipInfo(camera);
}

void CAMERA_SetProjDistance(Camera *camera, long distance)
{
    Level *level;
    int i;

    SetGeomScreen(distance);

    camera->core.projDistance = distance;

    CAMERA_CalculateViewVolumeNormals(camera);

    for (i = 0; i < 16; i++)
    {
        if (StreamTracker.StreamList[i].used == 2)
        {
            level = StreamTracker.StreamList[i].level;

            SetFogNearFar(level->fogNear, level->fogFar, camera->core.projDistance);

            LIGHT_CalcDQPTable(level);
        }
    }
}

void CAMERA_CreateNewFocuspoint(Camera *camera)
{
    SVector sv;

    camera->focusRotation.x = camera->actual_x_rot;

    CAMERA_CalcPosition(&camera->targetPos, &camera->core.position, &camera->focusRotation, camera->focusDistance);

    SET_SVEC3(&sv, &camera->core.position, &camera->targetPos);

    SET_SVEC2((SVector *)&camera->focusPoint, &camera->core.position, (Position *)&sv);
}

void CAMERA_SaveMode(Camera *camera, long mode)
{
    long i;

    if (++camera->stack >= 3)
    {
        camera->stack = 2;

        for (i = 0; i < 2; i++)
        {
            camera->savedMode[i] = camera->savedMode[i + 1];
            camera->savedCinematic[i] = camera->savedCinematic[i + 1];
        }
    }

    camera->savedMode[camera->stack] = mode;

    if ((mode == 2) || (mode == 5) || (mode == 4))
    {
        camera->savedCinematic[camera->stack].position = camera->core.position;

        camera->savedCinematic[camera->stack].focusPoint = camera->focusPoint;

        camera->savedCinematic[camera->stack].targetPos = camera->targetPos;
        camera->savedCinematic[camera->stack].targetFocusPoint = camera->targetFocusPoint;

        camera->savedCinematic[camera->stack].focusRotation = camera->focusRotation;
        camera->savedCinematic[camera->stack].targetFocusRotation = camera->targetFocusRotation;

        camera->savedCinematic[camera->stack].focusPointVel = camera->focusPointVel;
        camera->savedCinematic[camera->stack].focusPointAccl = camera->focusPointAccl;

        camera->savedCinematic[camera->stack].maxVel = camera->maxVel;

        camera->savedCinematic[camera->stack].focusDistance = camera->focusDistance;
        camera->savedCinematic[camera->stack].targetFocusDistance = camera->targetFocusDistance;

        camera->savedCinematic[camera->stack].posSpline = camera->data.Cinematic.posSpline;
        camera->savedCinematic[camera->stack].targetSpline = camera->data.Cinematic.targetSpline;

        camera->savedCinematic[camera->stack].level = gameTrackerX.level;
    }
}

void CAMERA_RestoreMode(Camera *camera)
{
    long mode;
    short temp; // not from decls.h

    if (camera->stack >= 0)
    {
        mode = camera->savedMode[camera->stack];

        if (camera->mode == 5)
        {
            if (camera->smooth != 0)
            {
                camera->smooth = 8;
            }
            else
            {
                camera->flags |= 0x1000;
            }
        }

        switch (mode)
        {
        case 0:
        case 12:
        case 13:
        case 16:
            CAMERA_SetProjDistance(camera, 320);

            if (camera->mode == 5)
            {
                camera->focusInstance = gameTrackerX.playerInstance;

                camera->focusOffset.x = 0;
                camera->focusOffset.y = 0;
                camera->focusOffset.z = 352;

                CAMERA_Restore(camera, 7);
            }

            cameraMode = mode;

            if (mode == 12)
            {
                gameTrackerX.gameFlags &= ~0x40;
            }
            else
            {
                gameTrackerX.gameFlags |= 0x40;
            }

            camera->mode = (short)mode;

            camera->targetFocusDistance = (short)camera->focusDistanceList[camera_modeToIndex[(short)mode]][camera->presetIndex];

            camera->data.Follow.stopTimer = 0xE5A20000;

            camera->focusRotVel.z = 0;

            if (mode == 16)
            {
                camera->flags |= 0x2000;
            }
            else
            {
                camera->flags &= ~0x2000;
            }

            break;
        case 2:
        case 4:
        case 5:
            CAMERA_SetProjDistance(camera, 320);

            camera->core.position = camera->savedCinematic[camera->stack].position;

            camera->focusPoint = camera->savedCinematic[camera->stack].focusPoint;

            camera->targetPos = camera->savedCinematic[camera->stack].targetPos;

            camera->targetFocusPoint = camera->savedCinematic[camera->stack].targetFocusPoint;
            camera->targetFocusDistance = camera->savedCinematic[camera->stack].targetFocusDistance;
            camera->targetFocusRotation = camera->savedCinematic[camera->stack].targetFocusRotation;

            if ((camera->smooth == 0) && (camera->mode != 6))
            {
                camera->focusDistance = camera->savedCinematic[camera->stack].focusDistance;
                camera->focusRotation = camera->savedCinematic[camera->stack].focusRotation;
            }
            else
            {
                camera->always_rotate_flag = 1;
            }

            camera->focusPointVel = camera->savedCinematic[camera->stack].focusPointVel;
            camera->focusPointAccl = camera->savedCinematic[camera->stack].focusPointAccl;

            camera->maxVel = (short)camera->savedCinematic[camera->stack].maxVel;

            camera->data.Cinematic.posSpline = camera->savedCinematic[camera->stack].posSpline;
            camera->data.Cinematic.targetSpline = camera->savedCinematic[camera->stack].targetSpline;

            camera->mode = (short)mode;

            if ((INSTANCE_Query(camera->focusInstance, 9) & 0x50))
            {
                CAMERA_ChangeToUnderWater(camera, camera->focusInstance);
            }

            break;
        case 6:
            if ((camera->mode == 4) || (camera->mode == 5) || (camera->mode == 2))
            {
                temp = (short)camera->savedTargetFocusDistance[camera->targetStack];

                camera->focusDistance = temp;

                camera->targetFocusDistance = temp;

                if (camera->targetStack >= 0)
                {
                    camera->targetStack--;
                }

                camera->flags |= 0x800;
            }

            camera->lookTimer = 4;

            camera->mode = (short)mode;

            camera->targetFocusDistance = 2000;
            break;
        case 1:
        case 3:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 14:
        case 15:
        default:
            camera->mode = (short)mode;
        }

        camera->stack--;
    }
}

void CAMERA_Save(Camera *camera, long save)
{
    int i;

    if ((save & 0x1))
    {
        camera->targetStack++;

        if (camera->targetStack == 3)
        {
            camera->targetStack = 2;

            for (i = 0; i < 2; i++)
            {
                camera->savedTargetFocusDistance[i] = camera->savedTargetFocusDistance[i + 1];
            }
        }

        camera->savedTargetFocusDistance[camera->targetStack] = camera->targetFocusDistance;
    }

    if ((save & 0x2))
    {
        camera->savedfocusRotation.x = camera->targetFocusRotation.x;
    }

    if ((save & 0x4))
    {
        camera->savedfocusRotation.z = camera->focusRotation.z;
    }

    if ((save & 0x100))
    {
        CAMERA_SaveMode(camera, camera->mode);
    }
}

void CAMERA_Restore(Camera *camera, long restore)
{
    if ((restore & 0x7))
    {
        if ((restore & 0x1))
        {
            if (camera->targetStack >= 0)
            {
                camera->distanceState = 3;

                camera->signalFocusDistance = (short)camera->savedTargetFocusDistance[camera->targetStack];

                if (camera->targetStack >= 0)
                {
                    camera->targetStack -= 1;
                }
            }
        }

        if ((restore & 0x2))
        {
            camera->tiltState = 3;

            camera->signalRot.x = camera->savedfocusRotation.x;
        }

        if ((restore & 0x4))
        {
            camera->rotState = 3;

            camera->forced_movement = 0;

            camera->always_rotate_flag = 1;

            camera->signalRot.z = camera->savedfocusRotation.z;

            camera->teleportZRot = camera->signalRot.z;
        }
    }

    if ((restore & 0x100))
    {
        CAMERA_RestoreMode(camera);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", SplineGetNextPointDC);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetMode);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_Initialize);

void CAMERA_SetInstanceFocus(Camera *camera, Instance *instance)
{
    camera->focusInstance = instance;

    camera->flags |= 0x800;

    camera->newFocusInstancePos = instance->position;

    if (instance->object != NULL)
    {
        if (instance == gameTrackerX.playerInstance)
        {
            camera->focusOffset.x = 0;
            camera->focusOffset.y = 0;
            camera->focusOffset.z = 352;
        }
        else
        {
            camera->focusOffset.x = 0;
            camera->focusOffset.y = 0;
            camera->focusOffset.z = 512;
        }
    }
}

void CAMERA_SetZRotation(Camera *camera, short zrot)
{
    camera->core.rotation.z = zrot;

    camera->focusRotation.z = zrot;

    camera->targetRotation.z = zrot;

    camera->targetFocusRotation.z = zrot;

    camera->rotationAccl.z = 0;
    camera->rotationVel.z = 0;

    camera->rotationAccl.z = 0;
    camera->rotationVel.z = 0;
}

long CAMERA_LengthSVector(SVector *sv)
{
    return MATH3D_FastSqrt0((sv->x * sv->x) + (sv->y * sv->y) + (sv->z * sv->z));
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetValue);

short CAMERA_AngleDifference(short angle0, short angle1)
{
    angle0 &= 0xFFF;
    angle1 &= 0xFFF;

    if ((angle1 - angle0) > 2048)
    {
        angle0 |= 0x1000;
    }
    else if ((angle0 - angle1) > 2048)
    {
        angle1 |= 0x1000;
    }

    return (MAX(angle0, angle1) - MIN(angle0, angle1));
}

short CAMERA_SignedAngleDifference(short angle0, short angle1)
{
    return AngleDiff(angle1, angle0);
}

unsigned long CAMERA_QueryMode(Camera *camera)
{
    unsigned long mode;

    mode = INSTANCE_Query(camera->focusInstance, 10);

    if (camera->focusInstance == gameTrackerX.playerInstance)
    {
        if ((mode & 0x2000000))
        {
            combat_cam_debounce = 1;
        }
        else if (combat_cam_debounce > 0)
        {
            combat_cam_debounce--;

            mode |= 0x2000000;
        }
    }
    else
    {
        mode &= ~0x2000000;
    }

    if (WARPGATE_IsWarpgateActive() != 0)
    {
        mode |= 0x80000000;
    }

    return mode;
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SetMaxVel);

void CAMERA_SetTarget(Camera *camera, Position *pos)
{
    SVector sv;
    long len;

    CAMERA_CalcRotation(&camera->targetFocusRotation, pos, &camera->core.position);

    SET_SVEC3(&sv, pos, &camera->core.position);

    len = CAMERA_LengthSVector(&sv);

    camera->focusDistance = (short)len;

    camera->targetFocusDistance = (short)len;

    camera->collisionTargetFocusDistance = (short)len;
}

void CAMERA_CalcPosition(Position *position, Position *base, Rotation *rotation, short distance);
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

void CAMERA_SetSmoothValue(Camera *camera, long smooth)
{
    camera->smooth = (short)smooth;

    if ((smooth == 0) && ((camera->mode == 12) || (camera->mode == 13) || (camera->mode == 16)))
    {
        camera->focusPoint = camera->targetFocusPoint;
    }
}

void CAMERA_SetTimer(Camera *camera, long time)
{
    (void)time;

    CAMERA_Save(camera, -1);
}

void CAMERA_Adjust_tilt(Camera *camera, long tilt)
{
    camera->tiltState = 3;

    camera->signalRot.x = tilt & 0xFFF;

    if (camera->smooth == 0)
    {
        camera->tilt = 0;

        camera->actual_x_rot = camera->tfaceTilt = camera->focusRotation.x = camera->targetRotation.x = camera->targetFocusRotation.x = camera->signalRot.x;
    }
}

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

TFace *CAMERA_SphereToSphereWithLines(Camera *camera, CameraCollisionInfo *colInfo, int secondcheck_flag);
INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SphereToSphereWithLines);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcTilt);

void CAMERA_SetLookFocusAndBase(Instance *focusInstance, Position *focusPoint);
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

void CAMERA_update_dist_debounced(Camera *camera, short dist)
{
    if ((!(camera->instance_mode & 0x2000000)) || (dist >= 600) || (combat_cam_weight >= 4040))
    {
        shorten_flag = 1;

        if (++shorten_count >= 3)
        {
            camera->collisionTargetFocusDistance = dist;
        }
    }
}

short CAMERA_dampgetline(short angle)
{
    static short target_angle = 0;
    static short angle_vel = 0;
    static short angle_accl = 0;

    CriticalDampAngle(1, &target_angle, angle, &angle_vel, &angle_accl, 1024);

    if (target_angle > 2048)
    {
        target_angle -= 4096;
    }

    if ((abs(target_angle) < 32) && (abs(angle) > 31))
    {
        target_angle = angle < 0 ? -32 : 32;
    }

    return target_angle;
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ACNoForcedMovement);

long CAMERA_AbsoluteCollision(Camera *camera, CameraCollisionInfo *colInfo)
{
    long hit;

    hit = 0;

    if ((gameTrackerX.debugFlags & 0x10000))
    {
        return hit;
    }

    camera->focusRotation.x &= 0xFFF;

    if ((((camera->flags & 0x10000)) || ((camera->instance_mode & 0x24000000)) || ((camera->flags & 0x2000))
        || (camera->rotState != 0) || (camera->always_rotate_flag != 0)) && (!(camera->lock & 0x1)))
    {
        if ((camera->flags & 0x10000))
        {
            if ((colInfo->flags & 0x18))
            {
                camera->collisionTargetFocusDistance = (short)colInfo->lenCenterToExtend - 150;

                if (400 > camera->collisionTargetFocusDistance)
                {
                    camera->collisionTargetFocusDistance = 400;
                }
            }
            else
            {
                hit = CAMERA_ACNoForcedMovement(camera, colInfo);
            }
        }
        else
        {
            camera->collisionTargetFocusDistance = (short)colInfo->lenCenterToExtend;
        }
    }
    else if ((camera->forced_movement != 0) || (camera->last_forced_movement != 0))
    {
        hit = CAMERA_ACForcedMovement(camera, colInfo);
    }
    else
    {
        hit = CAMERA_ACNoForcedMovement(camera, colInfo);
    }

    return hit;
}

/*TODO: migrate to CAMERA_update_z_damped*/
static short D_800D03F6 = 0; // upvel
static short D_800D03F8 = 0; // upaccl
static short D_800D03FA = 0; // upmaxVel
INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_update_z_damped);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CombatCamDist);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_GenericCameraProcess);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CinematicProcess);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_GetDistSq);

void CAMERA_NearestPointOnLineVec(SVector *linePoint, SVector *start, SVector *line, Position *point)
{
    MATRIX nmat;
    Vector dpv;
    long t;

    nmat.m[0][0] = line->x;
    nmat.m[0][1] = line->y;
    nmat.m[0][2] = line->z;

    nmat.m[1][0] = start->x;
    nmat.m[1][1] = start->y;
    nmat.m[1][2] = start->z;

    nmat.m[2][0] = point->x;
    nmat.m[2][1] = point->y;
    nmat.m[2][2] = point->z;

    ApplyMatrix(&nmat, (SVECTOR *)line, (VECTOR *)&dpv);

    t = (dpv.y - dpv.z) * 4096;

    if (dpv.x != 0)
    {
        t = -t / dpv.x;
    }

    linePoint->x = start->x + ((line->x * t) >> 12);
    linePoint->y = start->y + ((line->y * t) >> 12);
    linePoint->z = start->z + ((line->z * t) >> 12);
}

int CAMERA_CheckPoint(int linePoint, int linept1, int linept2)
{
    if ((linept1 < (linePoint - 20)) && (linept2 < (linePoint - 20)))
    {
        return 1;
    }

    if (((linePoint + 20) < linept1) && ((linePoint + 20) < linept2))
    {
        return 1;
    }

    return 0;
}

int CAMERA_CheckIfPointOnLine(SVector *linePoint, SVector *linept1, SVector *linept2)
{
    if ((CAMERA_CheckPoint(linePoint->x, linept1->x, linept2->x) == 0) && (CAMERA_CheckPoint(linePoint->y, linept1->y, linept2->y) == 0))
    {
        return CAMERA_CheckPoint(linePoint->z, linept1->z, linept2->z) == 0;
    }
    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FindLinePoint);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SplineGetNearestPoint2);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_SplineGetNearestPoint);

void CAMERA_SplineHelpMove(Camera *camera)
{
    SVector camPos;
    Position pos;
    Rotation rotation;
    Instance *focusInstance;
    MultiSpline *posSpline;
    short temp; // not from decls.h

    posSpline = camera->data.Cinematic.posSpline;

    focusInstance = camera->focusInstance;

    if (CAMERA_AngleDifference(splinecam_helprot.z, camera->targetFocusRotation.z) < 400)
    {
        splinecam_helprot.z = camera->targetFocusRotation.z + 2048;

        camera->targetFocusRotation.z &= 0xFFF;
    }

    CAMERA_CalcPosition(&pos, &camera->targetFocusPoint, &splinecam_helprot, camera->targetFocusDistance);

    CAMERA_SplineGetNearestPoint2(camera, posSpline->positional, (SVector *)&pos, &camera->data.Cinematic.splinecam_helpkey, &camPos);

    CAMERA_CalcRotation(&rotation, &camera->focusPoint, (Position *)&camPos);

    splinecam_helprot.x = rotation.x;
    splinecam_helprot.z = rotation.z;

    if (CAMERA_AngleDifference(focusInstance->rotation.z, camera->lagZ + 2048) < 900)
    {
        rotation.z = (rotation.z + 2048) & 0xFFF;

        temp = CAMERA_SignedAngleDifference(rotation.z, camera->lagZ);

        if (abs(temp) < 900)
        {
            camera->lagZ += (temp * 1331) >> 11;
        }
    }
}

void CAMERA_SplineProcess(Camera *camera)
{
    SVector camPos;
    SVector sv;
    short targetFocusDistance;
    MultiSpline *posSpline;
    short smooth;
    short dist_smooth;
    static short hold_flag = 0;
    Rotation targetFocusRotation;

    posSpline = camera->data.Cinematic.posSpline;

    targetFocusRotation.x = camera->targetFocusRotation.x;
    targetFocusRotation.y = 0;
    targetFocusRotation.z = camera->targetFocusRotation.z;

    CAMERA_SetFocus(camera, &camera->targetFocusPoint);

    targetFocusDistance = camera->targetFocusDistance;

    if (posSpline != NULL)
    {
        CAMERA_CalcPosition(&camera->targetPos, &camera->targetFocusPoint, &targetFocusRotation, targetFocusDistance);

        if (camera->mode == 4)
        {
            CAMERA_SplineGetNearestPoint2(camera, posSpline->positional, (SVector *)&camera->targetPos, &camera->data.Cinematic.splinecam_currkey, &camPos);
        }
        else
        {
            CAMERA_SplineGetNearestPoint(posSpline->positional, (SVector *)&camera->targetPos, &camera->data.Cinematic.splinecam_currkey, &camPos);
        }

        camera->maxVel = 512;

        CriticalDampPosition(5, &camera->focusPoint, &camera->targetFocusPoint, &camera->focusPointVel, &camera->focusPointAccl, camera->maxVel);

        if (camera->forced_movement == 1)
        {
            hold_flag = 1;
        }
        else if (CAMERA_FocusInstanceMoved(camera) != 0)
        {
            if (hold_flag != 0)
            {
                camera->always_rotate_flag = 1;
            }

            hold_flag = 0;
        }

        if ((camera->forced_movement != 1) && (hold_flag == 0) && (camera->rotState != 3))
        {
            CAMERA_CalcRotation(&targetFocusRotation, &camera->focusPoint, (Position *)&camPos);

            SET_SVEC3(&sv, &camera->focusPoint, (Position *)&camPos);

            targetFocusDistance = (short)CAMERA_LengthSVector(&sv);

            camera->targetFocusRotation.z = targetFocusRotation.z;
        }

        smooth = 64;

        if (camera->always_rotate_flag != 0)
        {
            dist_smooth = 128;
        }
        else
        {
            smooth = 80;
            dist_smooth = 64;
        }

        camera->focusRotation.y = targetFocusRotation.y;

        camera->x_rot_change = camera->focusRotation.x;

        CriticalDampAngle(1, &camera->focusRotation.x, targetFocusRotation.x, &camera->focusRotVel.x, &camera->focusRotAccl.x, 64);

        camera->x_rot_change = CAMERA_SignedAngleDifference(camera->x_rot_change, camera->focusRotation.x);

        if (camera->rotState == 3)
        {
            targetFocusRotation.z = camera->targetFocusRotation.z;
        }

        CriticalDampAngle(5, &camera->focusRotation.z, targetFocusRotation.z, &camera->focusRotVel.z, &camera->focusRotAccl.z, smooth);

        if ((camera->forced_movement == 1) || (camera->always_rotate_flag != 0) || (hold_flag != 0))
        {
            CAMERA_CalcPosition(&camera->targetPos, &camera->focusPoint, &camera->focusRotation, camera->targetFocusDistance);

            camera->data.Follow.hit = CAMERA_DoCameraCollision2(camera, &camera->targetPos, 1);

            if (camera->data.Follow.hit != 0)
            {
                targetFocusDistance = camera->collisionTargetFocusDistance;
            }
        }

        CriticalDampValue(5, &camera->focusDistance, targetFocusDistance, &camera->focusDistanceVel, &camera->focusDistanceAccl, dist_smooth);

        if (CAMERA_AngleDifference(camera->focusRotation.z, targetFocusRotation.z) < 32)
        {
            camera->always_rotate_flag = 0;

            camera->rotState = 0;
        }

        CAMERA_CalcFollowPosition(camera, &camera->focusRotation);

        if ((camera->mode == 4) && (!(camera->flags & 0x10000)))
        {
            CAMERA_SplineHelpMove(camera);
        }

        CAMERA_CalculateLead(camera);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_ShakeCamera);

void CAMERA_Process(Camera *camera)
{
    Instance *focusInstance;

    focusInstance = camera->focusInstance;

    camera->focuspoint_fallz -= camera->newFocusInstancePos.z - focusInstance->oldPos.z;

    camera->oldFocusInstancePos = camera->newFocusInstancePos;
    camera->newFocusInstancePos = focusInstance->position;

    camera->oldFocusInstanceRot = camera->newFocusInstanceRot;
    camera->newFocusInstanceRot = focusInstance->rotation;

    if ((camera->signalPos.x == camera->core.position.x) && (camera->signalPos.y == camera->core.position.y) && (camera->signalPos.z == camera->core.position.z))
    {
        camera_still = 1;
    }
    else
    {
        camera_still = 0;
    }

    camera->signalPos = camera->core.position;

    camera->prev_instance_mode = camera->instance_mode;

    camera->x_rot_change = 0;

    camera->instance_mode = CAMERA_QueryMode(camera);

    SET_SVEC3(&camera->focusInstanceVelVec, &camera->newFocusInstancePos, &camera->oldFocusInstancePos);

    camera->instance_prev_xyvel = camera->instance_xyvel;

    camera->instance_xyvel = MATH3D_FastSqrt0((camera->focusInstanceVelVec.x * camera->focusInstanceVelVec.x) + (camera->focusInstanceVelVec.y * camera->focusInstanceVelVec.y));

    if (shorten_flag == 0)
    {
        shorten_count = 0;
    }

    shorten_flag = 0;

    if (camera->cuckooTimer > 0)
    {
        camera->cuckooTimer--;
    }

    if (camera->mode != 6)
    {
        CAMERA_HandleTransitions(camera);
    }

    switch (camera->mode)
    {
    case 6:
        CAMERA_LookProcess(camera);
        break;
    case 0:
    case 12:
    case 13:
        CAMERA_GenericCameraProcess(camera);
        break;
    case 5:
        CAMERA_CinematicProcess(camera);
        break;
    case 2:
    case 4:
        CAMERA_SplineProcess(camera);
        break;
    case 8:
    case 15:
        return;
    }

    camera->flags &= ~0x800;
    camera->flags &= ~0x1000;

    CAMERA_ShakeCamera(camera);
}

void CAMERA_CenterCamera(Camera *camera)
{
    if ((camera->instance_mode & 0x2000000))
    {
        int tmp1 = CAMERA_AngleDifference(camera->focusRotation.z, (camera->focusInstance->rotation.z + 1024));
        int tmp2 = CAMERA_AngleDifference(camera->focusRotation.z, (camera->focusInstance->rotation.z - 1024));

        if (tmp1 < tmp2)
        {
            CenterFlag = camera->focusInstance->rotation.z + 1024;
        }
        else
        {
            CenterFlag = camera->focusInstance->rotation.z - 1024;
        }
    }
    else
    {
        CenterFlag = camera->focusInstance->rotation.z + 2048;
    }

    camera->focusRotAccl.z = 0;

    camera->focusRotVel.z = 0;

    CenterFlag &= 0xFFF;
}

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

static short CameraLookStickyFlag = 0;
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

void CAMERA_Control(Camera *camera, Instance *playerInstance)
{
    long *controlCommand;
    int lookmode;
    Instance *focusInstance;

    controlCommand = &gameTrackerX.controlCommand[0][0];

    focusInstance = camera->focusInstance;

    if ((gameTrackerX.streamFlags & 0x100000))
    {
        return;
    }

    lookmode = 1;

    if (CameraLookStickyFlag == 0)
    {
        lookmode = ((gameTrackerX.controlCommand[0][0] & 0xC00) == 0xC00);
    }

    camera->last_forced_movement = camera->forced_movement;

    if ((camera->instance_xyvel != 0) || (camera->forced_movement != 1) || ((camera->instance_mode & 0x2000000)))
    {
        camera->forced_movement = 0;
    }

    if ((camera->mode == 8) || ((int)camera->instance_mode < 0))
    {
        return;
    }

    if (CenterFlag != -1)
    {
        if (!(camera->instance_mode & 0x2000000))
        {
            camera->forced_movement = 1;
        }

        CriticalDampAngle(1, &camera->focusRotation.z, CenterFlag, &camera->focusRotVel.z, &camera->focusRotAccl.z, 144);

        camera->targetFocusRotation.z = camera->collisionTargetFocusRotation.z = camera->focusRotation.z;

        if (CAMERA_AngleDifference(camera->focusRotation.z, CenterFlag) < 8)
        {
            CenterFlag = -1;
        }
    }
    else
    {
        if ((gameTrackerX.cheatMode == 1) && ((controlCommand[0] & 0xF)))
        {
            return;
        }

        if ((!(camera->lock & 0x4)) && (!(camera->flags & 0x10000)) && ((camera->mode == 0) || (camera->mode == 12) || (camera->mode == 4) || (camera->mode == 13))
        && (!(playerInstance->flags & 0x100)))
        {
            if (((controlCommand[0] & 0x400)) && (lookmode == 0))
            {
                if (++camera->leftTimer >= 3)
                {
                    camera->rotDirection = -1;

                    camera->focusRotation.z = (camera->focusRotation.z - ((gameTrackerX.timeMult * 32) >> 12)) & 0xFFF;

                    camera->lastModTime = gameTrackerX.frameCount;

                    camera->forced_movement = 1;

                    camera->data.Follow.stopTimer = 0xE5A20000;

                    camera->focusRotation.z &= 0xFFF;

                    camera->targetFocusRotation.z = camera->collisionTargetFocusRotation.z = camera->focusRotation.z;
                }
            }
            else
            {
                if (((camera->leftTimer >= 1) && (camera->leftTimer < 4)) && (lookmode == 0))
                {
                    CAMERA_CenterCamera(camera);
                }

                camera->leftTimer = 0;
            }

            if (((controlCommand[0] & 0x800)) && (lookmode == 0))
            {
                if (++camera->rightTimer >= 3)
                {
                    camera->rotDirection = 1;

                    camera->forced_movement = 1;

                    camera->focusRotation.z = (camera->focusRotation.z + ((gameTrackerX.timeMult * 32) >> 12)) & 0xFFF;

                    camera->lastModTime = gameTrackerX.frameCount;

                    camera->data.Follow.stopTimer = 0xE5A20000;

                    camera->focusRotation.z &= 0xFFF;

                    camera->targetFocusRotation.z = camera->collisionTargetFocusRotation.z = camera->focusRotation.z;
                }
            }
            else
            {
                if (((camera->rightTimer >= 1) && (camera->rightTimer < 4)) && (lookmode == 0))
                {
                    CAMERA_CenterCamera(camera);
                }

                camera->rightTimer = 0;
            }
        }
        else
        {
            camera->rightTimer = 0;
            camera->leftTimer = 0;
        }

        if ((gameTrackerX.debugFlags2 & 0x2000000))
        {
            if (!(camera->lock & 0x1))
            {
                if ((controlCommand[0] & 0x40000008) == 0x40000008)
                {
                    camera->targetFocusDistance -= 20;

                    if (camera->targetFocusDistance < 200)
                    {
                        camera->targetFocusDistance = 200;
                    }
                }

                if ((controlCommand[0] & 0x40000004) == 0x40000004)
                {
                    camera->targetFocusDistance += 20;

                    if (camera->targetFocusDistance > 4096)
                    {
                        camera->targetFocusDistance = 4096;
                    }
                }
            }

            if (!(camera->lock & 0x2))
            {
                if ((controlCommand[0] & 0x40000002) == 0x40000002)
                {
                    camera->extraXRot += 16;
                }

                if ((controlCommand[0] & 0x40000001) == 0x40000001)
                {
                    camera->extraXRot -= 16;
                }
            }
        }

        if ((lookmode != 0) && (!(playerInstance->flags & 0x100)))
        {
            if (((camera->flags & 0x20000)) && (camera->mode != 5))
            {
                if (++camera->lookTimer == 2)
                {
                    if ((PLAYER_OkToLookAround(focusInstance) != 0) && (!(camera->lock & 0x200)))
                    {
                        CAMERA_StartLookaroundMode(camera);

                        PLAYER_SetLookAround(focusInstance);
                    }
                    else
                    {
                        camera->lookTimer = 0;
                    }
                }
                else if ((camera->lookTimer >= 3) && (camera->mode == 6))
                {
                    PLAYER_TurnHead(focusInstance, &camera->lookRot.x, &camera->lookRot.z, &gameTrackerX);
                }
            }
        }
        else
        {
            camera->flags |= 0x20000;

            CAMERA_EndLook(camera);
        }

        camera->collideRotControl = 0;
    }
}

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

        if (((camera->forced_movement != 3) && (!(camera->lock & 0x2))) || ((camera->flags & 0x10000)))
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

void CAMERA_UpdateFocusRotationX(Camera *camera, Instance *focusInstance)
{
    short cameraPlayerRotX;
    short dist;
    short tfaceFlag;
    Normal normal;
    //int mult; unused
    int tmpsmooth;

    dist = camera->targetFocusDistance;

    tfaceFlag = 0;

    if ((focusInstance->tface != NULL) && (((Level *)focusInstance->tfaceLevel)->terrain != NULL) && (focusInstance->tface->textoff != 0xFFFF)
    && ((((TextureFT3 *)((char *)((Level *)focusInstance->tfaceLevel)->terrain->StartTextureList + focusInstance->tface->textoff))->attr & 0x8000))
    && (dist < 2912))
    {
        COLLIDE_GetNormal(focusInstance->tface->normal, (short *)((Level *)focusInstance->tfaceLevel)->terrain->normalList, (SVector *)&normal);

        if (normal.z < 3950)
        {
            tfaceFlag = 1;

            camera->targetTilt = (CAMERA_CalcTilt(&normal, camera->focusRotation.z) * 9) / 16;

            if (camera->targetTilt < -256)
            {
                camera->targetTilt = -256;
            }
            else if (camera->targetTilt > 256)
            {
                camera->targetTilt = 256;
            }

            if ((2912 - dist) < 512)
            {
                camera->targetTilt = (camera->targetTilt * (2912 - dist)) / 512;
            }

            CriticalDampAngle(1, &camera->tilt, camera->targetTilt, &camera->tiltVel, &camera->tiltAccl, 8);
        }
    }

    if (tfaceFlag == 0)
    {
        tmpsmooth = 24;

        if (!(camera->instance_mode & 0x38))
        {
            camera->targetTilt = 0;
        }

        if (((camera->instance_mode & 0x2000)) && (camera->real_focuspoint.z < camera->focuspoint_fallz))
        {
            camera->targetTilt = -384;

            tmpsmooth = 12;
        }

        CriticalDampAngle(1, &camera->tilt, camera->targetTilt, &camera->tiltVel, &camera->tiltAccl, tmpsmooth);
    }

    cameraPlayerRotX = (((camera->targetFocusRotation.x + camera->tilt + camera->extraXRot) & 0xFFF));

    if ((cameraPlayerRotX > 768) && (cameraPlayerRotX < 2048))
    {
        cameraPlayerRotX = 768;
    }
    else if ((cameraPlayerRotX >= 2048) && (cameraPlayerRotX < 3328))
    {
        cameraPlayerRotX = -768;
    }

    cameraPlayerRotX &= 0xFFF;

    camera->tfaceTilt = cameraPlayerRotX;

    if ((camera->instance_mode & 0x2000000))
    {
        if (cameraPlayerRotX > 2048)
        {
            cameraPlayerRotX |= 0xF000;
        }

        if (combat_cam_angle < cameraPlayerRotX)
        {
            camera->tfaceTilt = combat_cam_angle + 0x1000;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_FollowPlayerTilt);

void CAMERA_FollowGoBehindPlayerWithTimer(Camera *camera)
{
    Instance *focusInstance;

    focusInstance = camera->focusInstance;

    if (camera->data.Follow.hit != 0)
    {
        camera->data.Follow.stopTimer = 0xE5A20000;
    }

    if (CAMERA_FocusInstanceMoved(camera) != 0)
    {
        camera->data.Follow.stopTimer = -CameraCenterDelay * 122880;
    }
    else if (!(gameTrackerX.streamFlags & 0x100000))
    {
        camera->data.Follow.stopTimer += gameTrackerX.timeMult;
    }

    if (camera->data.Follow.stopTimer > 0)
    {
        Decouple_AngleMoveToward(&camera->targetFocusRotation.z, focusInstance->rotation.z + 2048, 32);
        Decouple_AngleMoveToward(&camera->collisionTargetFocusRotation.z, focusInstance->rotation.z + 2048, 32);

        CriticalDampAngle(1, &camera->focusRotation.z, camera->collisionTargetFocusRotation.z, &camera->focusRotVel.z, &camera->focusRotAccl.z, 32);

        camera->forced_movement = 1;
    }
}

void CAMERA_FollowGoBehindPlayer(Camera *camera)
{
    Instance *focusInstance;

    focusInstance = camera->focusInstance;

    Decouple_AngleMoveToward(&camera->targetFocusRotation.z, focusInstance->rotation.z + 2048, camera->rotationVel.z);
}

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalculateLead);

INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_CalcFollowPosition);

void CAMERA_SetupColInfo(Camera *camera, CameraCollisionInfo *colInfo, Position *targetCamPos)
{
    static short toggle = 0;
    if (camera->mode == 6)
    {
        SET_SVEC((SVector *)&camera->focusSphere.position, &camera->targetFocusPoint);
    }
    else
    {
        SET_SVEC((SVector *)&camera->focusSphere.position, &camera->real_focuspoint);
    }

    SET_SVEC((SVector *)&camera->posSphere.position, targetCamPos);

    colInfo->start = &camera->focusSphere;
    colInfo->end = &camera->posSphere;

    if (camera->data.Follow.tface == NULL)
    {
        colInfo->cldLines = 6;

        if (toggle != 0)
        {
            colInfo->cldLines = 14;
        }
        else
        {
            colInfo->cldLines = 22;
        }
    }
    else
    {
        colInfo->cldLines = 30;
    }

    if (toggle != 0)
    {
        toggle = 0;
    }
    else
    {
        toggle = 1;
    }
}

void CAMERA_DoPanicCheck(Camera *camera, CameraCollisionInfo *tmpcolInfo, Rotation *rotation, short *best_z, short *max_dist)
{
    Position targetCamPos;

    CAMERA_CalcPosition(&targetCamPos, &camera->focusPoint, rotation, camera->targetFocusDistance);

    SET_SVEC((SVector *)&camera->posSphere.position, &targetCamPos);

    CAMERA_SphereToSphereWithLines(camera, tmpcolInfo, 0);

    if ((tmpcolInfo->numCollided == 0) || (*max_dist < tmpcolInfo->lenCenterToExtend))
    {
        *best_z = rotation->z;

        *max_dist = tmpcolInfo->lenCenterToExtend;
    }
}

static short panic_count = 0;
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

/*TODO: migrate to CAMERA_DoCameraCollision2*/
static long D_800D0404 = 0; // collisiontimeDown
INCLUDE_ASM("asm/nonmatchings/Game/CAMERA", CAMERA_DoCameraCollision2);

int CAMERA_FocusInstanceMoved(Camera *camera)
{
    return ((camera->newFocusInstancePos.x != camera->oldFocusInstancePos.x) || (camera->newFocusInstancePos.y != camera->oldFocusInstancePos.y)
    || (camera->newFocusInstancePos.z != camera->oldFocusInstancePos.z) || (camera->newFocusInstanceRot.x != camera->oldFocusInstanceRot.x)
    || (camera->newFocusInstanceRot.y != camera->oldFocusInstanceRot.y) || (camera->newFocusInstanceRot.z != camera->oldFocusInstanceRot.z));
}
