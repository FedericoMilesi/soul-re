#ifndef _CAMERA_H_
#define _CAMERA_H_

#include "common.h"
#include "Game/SPLINE.h"

// size: 0xE0
typedef struct _CameraCore_Type {
    // offset: 0000 (6 bytes)
    struct _Position position;
    // offset: 0006
    short pad1;
    // offset: 0008 (64 bytes)
    struct MATRIX vvNormalWorVecMat[2];
    // offset: 0048 (24 bytes)
    long vvPlaneConsts[6];
    // offset: 0060 (32 bytes)
    struct MATRIX *wcTransform;
    // offset: 0064
    long farPlane;
    // offset: 0068
    long projDistance;
    // offset: 006C
    long nearPlane;
    // offset: 0070 (32 bytes)
    struct MATRIX *wcTransform2;
    // offset: 0074 (32 bytes)
    struct MATRIX *cwTransform2;
    // offset: 0078 (40 bytes)
    struct _Normal viewVolumeNormal[5];
    // offset: 00A0
    int leftX;
    // offset: 00A4
    int rightX;
    // offset: 00A8
    int topY;
    // offset: 00AC
    int bottomY;
    // offset: 00B0 (8 bytes)
    struct _Rotation rotation;
    // offset: 00B8
    short pad2;
    // offset: 00BA (8 bytes)
    struct _SVector screenScale;
    // offset: 00C2
    short pad3;
    // offset: 00C4 (6 bytes)
    struct _Position debugPos;
    // offset: 00CA
    short pad4;
    // offset: 00CC (8 bytes)
    struct _Rotation debugRot;
    // offset: 00D4
    short pad5;
    // offset: 00D6 (6 bytes)
    struct _Position nondebugPos;
    // offset: 00DC
    short pad6;
} CameraCore;

// size: 0x70
typedef struct _SavedCinematic {
    // offset: 0000 (6 bytes)
    struct _Position position;
    // offset: 0006 (6 bytes)
    struct _Position focusPoint;
    // offset: 000C (6 bytes)
    struct _Position base;
    // offset: 0012 (6 bytes)
    struct _Position targetPos;
    // offset: 0018 (6 bytes)
    struct _Position targetFocusPoint;
    // offset: 001E (6 bytes)
    struct _Position targetBase;
    // offset: 0024 (8 bytes)
    struct _Rotation baseRot;
    // offset: 002C (8 bytes)
    struct _Rotation focusRotation;
    // offset: 0034 (8 bytes)
    struct _Rotation targetFocusRotation;
    // offset: 003C
    short focusDistance;
    // offset: 003E
    short targetFocusDistance;
    // offset: 0040 (8 bytes)
    struct _SVector focusPointVel;
    // offset: 0048 (8 bytes)
    struct _SVector focusPointAccl;
    // offset: 0050 (8 bytes)
    struct _SVector baseVel;
    // offset: 0058 (8 bytes)
    struct _SVector baseAccl;
    // offset: 0060
    long maxVel;
    // offset: 0064
    struct MultiSpline *posSpline;
    // offset: 0068
    struct MultiSpline *targetSpline;
    // offset: 006C
    struct Level *level;
} SavedCinematic;

// size: 0x4C4
typedef struct Camera {
    // offset: 0000 (224 bytes)
    struct _CameraCore_Type core;
    // offset: 00E0
    long shake;
    // offset: 00E4
    short shakeFrame;
    // offset: 00E6
    short shakeScale;
    // offset: 00E8
    long flags;
    // offset: 00EC
    long lock;
    // offset: 00F0
    short mode;
    // offset: 00F2
    short state;
    // offset: 00F4
    short posState;
    // offset: 00F6
    short rotState;
    // offset: 00F8
    short tiltState;
    // offset: 00FA
    short distanceState;
    // offset: 00FC
    short lagZ;
    // offset: 00FE
    short tilt;
    // offset: 0100 (6 bytes)
    struct _Position focusPoint;
    // offset: 0106
    short focusDistance;
    // offset: 0108 (668 bytes)
    struct _Instance *focusInstance;
    // offset: 010C (6 bytes)
    struct _Position oldFocusInstancePos;
    // offset: 0112 (6 bytes)
    struct _Position newFocusInstancePos;
    // offset: 0118 (8 bytes)
    struct _Rotation oldFocusInstanceRot;
    // offset: 0120 (8 bytes)
    struct _Rotation newFocusInstanceRot;
    // offset: 0128 (8 bytes)
    struct _SVector focusInstanceVelVec;
    // offset: 0130 (6 bytes)
    struct _Position focusLeadPivot;
    // offset: 0136 (6 bytes)
    struct _Position focusOffset;
    // offset: 013C (8 bytes)
    struct _Rotation focusRotation;
    // offset: 0144
    short tiltVel;
    // offset: 0146
    short tiltAccl;
    // offset: 0148 (8 bytes)
    struct _SVector positionVel;
    // offset: 0150 (8 bytes)
    struct _SVector positionAccl;
    // offset: 0158 (8 bytes)
    struct _SVector focusPointVel;
    // offset: 0160 (8 bytes)
    struct _SVector focusPointAccl;
    // offset: 0168
    short focusDistanceVel;
    // offset: 016A
    short focusDistanceAccl;
    // offset: 016C (8 bytes)
    struct _SVector focusRotVel;
    // offset: 0174 (8 bytes)
    struct _SVector focusRotAccl;
    // offset: 017C (8 bytes)
    struct _SVector maxFocusVel;
    // offset: 0184 (8 bytes)
    struct _SVector rotationVel;
    // offset: 018C (8 bytes)
    struct _SVector rotationAccl;
    // offset: 0194
    short maxVel;
    // offset: 0196
    short maxRot;
    // offset: 0198 (6 bytes)
    struct _Position targetPos;
    // offset: 019E
    short targetTilt;
    // offset: 01A0 (8 bytes)
    struct _Rotation targetRotation;
    // offset: 01A8
    short targetFocusDistance;
    // offset: 01AA (6 bytes)
    struct _Position targetFocusPoint;
    // offset: 01B0
    short collisionTargetFocusDistance;
    // offset: 01B2 (8 bytes)
    struct _Rotation targetFocusRotation;
    // offset: 01BA
    short tfaceTilt;
    // offset: 01BC (8 bytes)
    struct _Rotation collisionTargetFocusRotation;
    // offset: 01C4
    short smooth;
    // offset: 01C8 (24 bytes)
    struct _CameraKey *cameraKey;
    // offset: 01CC (12 bytes)
    struct _Sphere focusSphere;
    // offset: 01D8 (12 bytes)
    struct _Sphere smallBaseSphere;
    // offset: 01E4 (12 bytes)
    struct _Sphere posSphere;
    // offset: 01F0
    short lookTimer;
    // offset: 01F2
    short lookSavedMode;
    // offset: 01F4
    short presetIndex;
    // offset: 01F6 (6 bytes)
    short presetFocusDistance[3];
    // offset: 01FC
    long minFocusDistance;
    // offset: 0200
    long maxFocusDistance;
    // offset: 0204
    long minTilt;
    // offset: 0208
    long maxTilt;
    // offset: 020C (12 bytes)
    long pad[3];
    // offset: 0218
    long minXYDist;
    // offset: 021C
    long maxXYDist;
    // offset: 0220
    long oppositeError;
    // offset: 0224
    long tempsplinePointAhead;
    // offset: 0228
    long noTeleport;
    // offset: 022C (36 bytes)
    long focusDistanceList[3][3];
    // offset: 0250 (36 bytes)
    long tiltList[3][3];
    // offset: 0274
    long cineControl;
    // offset: 0278
    short stack;
    // offset: 027A
    short targetStack;
    // offset: 027C (12 bytes)
    long savedMode[3];
    // offset: 0288 (12 bytes)
    long savedTargetFocusDistance[3];
    // offset: 0294 (8 bytes)
    struct _Rotation savedFocusRotation;
    // offset: 029C
    short savedFocusDistance;
    // offset: 029E
    short signalFocusDistance;
    // offset: 02A0 (336 bytes)
    struct _SavedCinematic savedCinematic[3];
    // offset: 03F0 (8 bytes)
    struct _Rotation savedfocusRotation;
    // offset: 03F8 (6 bytes)
    struct _Position signalPos;
    // offset: 03FE
    short pad11;
    // offset: 0400 (8 bytes)
    struct _Rotation signalRot;
    // offset: 0408
    short forced_movement;
    // offset: 040A
    short last_forced_movement;
    // offset: 040C
    short rotDirection;
    // offset: 0410
    unsigned long lastModTime;
    // offset: 0414 (8 bytes)
    struct _Rotation lookRot;
    // offset: 041C
    struct MultiSpline *Spline00;
    // offset: 0420
    struct MultiSpline *Spline01;
    // offset: 0424 (96 bytes)
    // size: 0x60
    struct {
        // offset: 0000 (28 bytes)
        // size: 0x1C
        struct {
            // offset: 0000
            struct MultiSpline *posSpline;
            // offset: 0004
            struct MultiSpline *targetSpline;
            // offset: 0008 (8 bytes)
            struct _SVector lastSplinePos;
            // offset: 0010
            short splinePointAhead;
            // offset: 0012
            short cinema_done;
            // offset: 0014
            int splinecam_currkey;
            // offset: 0018
            int splinecam_helpkey;
        } Cinematic;
        // offset: 001C (20 bytes)
        // size: 0x14
        struct {
            // offset: 0000 (6 bytes)
            struct _Position offset;
            // offset: 0006 (8 bytes)
            struct _Rotation rotation;
            // offset: 0010
            long focusDistance;
        } Idle;
        // offset: 0030 (28 bytes)
        // size: 0x1C
        struct {
            // offset: 0000 (12 bytes)
            struct _TFace *tface;
            // offset: 0004 (12 bytes)
            struct _TFace *oldTFace;
            // offset: 0008 (8 bytes)
            struct _SVector oldTargetRot;
            // offset: 0010
            long timer;
            // offset: 0014 (8 bytes)
            struct _SVector oldFocusInstancePos;
        } Behind;
        // offset: 004C (20 bytes)
        // size: 0x14
        struct {
            // offset: 0000
            long stopTimer;
            // offset: 0004
            long stopHit;
            // offset: 0008 (12 bytes)
            struct _TFace *tface;
            // offset: 000C (12 bytes)
            struct _TFace *oldTFace;
            // offset: 0010
            long hit;
        } Follow;
    } data;
    // offset: 0484
    long cuckooTimer;
    // offset: 0488
    short teleportZRot;
    // offset: 048A
    short extraZRot;
    // offset: 048C
    short extraXRot;
    // offset: 048E
    short leftTimer;
    // offset: 0490
    short rightTimer;
    // offset: 0492
    short collideRotControl;
    // offset: 0494
    short collision_lastPush;
    // offset: 0496
    short collision_timer;
    // offset: 0498
    unsigned long prev_instance_mode;
    // offset: 049C
    unsigned long instance_mode;
    // offset: 04A0
    long instance_xyvel;
    // offset: 04A4
    long instance_prev_xyvel;
    // offset: 04A8 (6 bytes)
    struct _Position real_focuspoint;
    // offset: 04AE
    short always_rotate_flag;
    // offset: 04B0
    short follow_flag;
    // offset: 04B2
    short actual_x_rot;
    // offset: 04B4
    short actual_vel_x;
    // offset: 04B6
    short actual_acc_x;
    // offset: 04B8
    short x_rot_change;
    // offset: 04BA
    short focuspoint_fallz;
    // offset: 04BC
    short lead_angle;
    // offset: 04BE
    short lead_vel;
    // offset: 04C0
    short lead_accl;
    // offset: 04C2
    short lead_timer;
} Camera;

// size: 0x5C
typedef struct CameraCollisionInfo {
    // offset: 0000 (20 bytes)
    struct _TFace *tfaceList[5];
    // offset: 0014 (20 bytes)
    struct _Terrain *tfaceTerrain[5];
    // offset: 0028 (12 bytes)
    short bspTree[6];
    // offset: 0034 (12 bytes)
    short lengthList[6];
    // offset: 0040
    long flags;
    // offset: 0044
    long line;
    // offset: 0048
    long numCollided;
    // offset: 004C
    long lenCenterToExtend;
    // offset: 0050 (12 bytes)
    struct _Sphere *start;
    // offset: 0054 (12 bytes)
    struct _Sphere *end;
    // offset: 0058
    long cldLines;
} CameraCollisionInfo;


void Decouple_AngleMoveToward(short *current_ptr, short destination, short step);
void CriticalDampAngle(long dampMode, short *currentVal, short target, short *vel, short *accl, int smooth);
short CAMERA_AngleDifference(short angle0, short angle1);
void CriticalDampValue(long dampMode, short *sourceVal, short targetVal, short *vel, short *accl, int smooth);
void CAMERA_SetMode(Camera *camera, long mode);
void CAMERA_RestoreMode(Camera *camera);
void CAMERA_CalcVVClipInfo(Camera *camera);
long CAMERA_CalcTilt(Normal *normal, short zRot);
unsigned long CAMERA_QueryMode(Camera *camera);
void CAMERA_HandleTransitions(Camera *camera);
void CAMERA_LookProcess(Camera *camera);
void CAMERA_GenericCameraProcess(Camera *camera);
void CAMERA_CinematicProcess(Camera *camera);
void CAMERA_SplineProcess(Camera *camera);
void CAMERA_ShakeCamera(Camera *camera);
void CAMERA_SplineGetNearestPoint2(Camera *camera, Spline *spline, SVector *point, int *currkey, SVector *ret_dpoint);
void CAMERA_CalcRotation(Rotation *rotation, Position *target, Position *position);
void CAMERA_SetFocus(Camera *camera, Position *targetfocusPoint);
void CAMERA_SplineGetNearestPoint(Spline *spline, SVector *point, int *currkey, SVector *ret_dpoint);
void CriticalDampPosition(long dampMode, Position *position, Position *targetPos, SVector *vel, SVector *accl, int smooth);
long CAMERA_DoCameraCollision2(Camera *camera, Position *targetCamPos, int simpleflag);
void CAMERA_CalcFollowPosition(Camera *camera, Rotation *rotation);
void CAMERA_CalculateLead(Camera *camera);
void CAMERA_Normalize(SVector *svector);
void CAMERA_CalcPosition(Position *position, Position *base, Rotation *rotation, short distance);
SVector *SplineGetNextPointDC(Spline *spline, SplineDef *def);
void CAMERA_SetMaxVel(Camera *camera);
void CAMERA_UpdateFocusRoll(Camera *camera);
long CAMERA_ACNoForcedMovement(Camera *camera, CameraCollisionInfo *colInfo);
long CAMERA_ACForcedMovement(Camera *camera, CameraCollisionInfo *colInfo);
void CAMERA_Restore(Camera *camera, long restore);
void CAMERA_ChangeToUnderWater(Camera *camera, Instance *instance);

extern int CameraCenterDelay;
Camera theCamera;

#endif
