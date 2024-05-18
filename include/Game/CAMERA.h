#ifndef _CAMERA_H_
#define _CAMERA_H_

#include "Game/TYPES.h"
#include "Game/COLLIDE.h"

// size: 0xE0
struct _CameraCore_Type {
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
};

extern int CameraCenterDelay;

typedef struct Camera Camera;

typedef struct _CameraCore_Type CameraCore;

#endif
