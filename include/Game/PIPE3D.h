#ifndef _PIPE3D_H_
#define _PIPE3D_H_

#include "TYPES.h"
#include "Game/CAMERA.h"

// size: 0xC
typedef struct AniTexInfo {
    // offset: 0000 (16 bytes)
    struct TextureMT3 *texture;
    // offset: 0004
    long numFrames;
    // offset: 0008
    long speed;
} AniTexInfo;

// size: 0x10
typedef struct AniTex {
    // offset: 0000
    long numAniTextues;
    // offset: 0004 (12 bytes)
    struct AniTexInfo aniTexInfo;
} AniTex;

// size: 0x8
typedef struct _Mirror {
    // offset: 0000
    short a;
    // offset: 0002
    short b;
    // offset: 0004
    short c;
    // offset: 0006
    short d;
} Mirror;

// size: 0x8
typedef struct _PVertex {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    long otz;
} PVertex;

// size: 0x18C0
typedef struct _VertexPool {
    // offset: 0000 (4224 bytes)
    struct _PVertex vertex[528];
    // offset: 1080 (2112 bytes)
    struct CVECTOR color[528];
} VertexPool;

// size: 0x8
typedef struct DrMoveAniTexSrcInfo {
    // offset: 0000
    short pixSrcX;
    // offset: 0002
    short pixSrcY;
    // offset: 0004
    short clutSrcX;
    // offset: 0006
    short clutSrcY;
} DrMoveAniTexSrcInfo;

// size: 0x28
typedef struct DrMoveAniTexDestInfo {
    // offset: 0000
    short pixDstX;
    // offset: 0002
    short pixDstY;
    // offset: 0004
    short pixW;
    // offset: 0006
    short pixH;
    // offset: 0008
    short clutDstX;
    // offset: 000A
    short clutDstY;
    // offset: 000C
    short clutW;
    // offset: 000E
    short clutH;
    // offset: 0010
    short pixCurrentX;
    // offset: 0012
    short pixCurrentY;
    // offset: 0014
    short clutCurrentX;
    // offset: 0016
    short clutCurrentY;
    // offset: 0018
    long numFrames;
    // offset: 001C
    long speed;
    // offset: 0020 (8 bytes)
    struct DrMoveAniTexSrcInfo frame;
} DrMoveAniTexDestInfo;

// size: 0x8
typedef struct DrMoveAniTex {
    // offset: 0000
    long numAniTextues;
    // offset: 0004 (40 bytes)
    struct DrMoveAniTexDestInfo *aniTexInfo;
} DrMoveAniTex;

void PIPE3D_InvertTransform(MATRIX *target, MATRIX *source);
void PIPE3D_NormalizeMatrix(MATRIX *target, MATRIX *source);
void PIPE3D_AnimateTextures(AniTex *aniTextures, long req_frame);
void PIPE3D_InstanceTransformAndDraw(Instance *instance, CameraCore *cameraCore, VertexPool *vertexPool, PrimPool *primPool, unsigned long **ot, Mirror *mirror);
void PIPE3D_HalvePlaneInstanceTransformAndDraw(Instance *instance, MATRIX *wcTransform, VertexPool *vertexPool, PrimPool *primPool, unsigned long **ot, Mirror *mirror);
void PIPE3D_TransformFromZAxis(MATRIX *transform, SVector *normal);
long PIPE3D_TransformAnimatedSplitInstanceVertices(MVertex *vertexList, PVertex *poolVertex, Model *model, MATRIX *wcTransform, MATRIX *matrixPool, Mirror *mirror, MATRIX *lm, CVECTOR *vertexColor, CVECTOR *vertexSrcCol);

#endif
