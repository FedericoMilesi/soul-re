#include "common.h"
#include "Game/DRAW.h"
#include "Game/PIPE3D.h"
#include "Game/MATH3D.h"
#include "Game/HASM.h"
#include "Game/CAMERA.h"
#include "Game/GAMELOOP.h"
#include "Game/LIGHT3D.h"
#include "Game/STREAM.h"
#include "Game/FX.h"

long modelFadeValue; // not from decls.h

long draw_belowSplit;

void PIPE3D_AspectAdjustMatrix(MATRIX *matrix)
{
    int temp, temp2, temp3; // not from decls.h

    temp = matrix->m[1][0];
    temp2 = matrix->m[1][1];
    temp3 = matrix->m[1][2];

    matrix->m[1][0] = temp;
    matrix->m[1][1] = temp2;
    matrix->m[1][2] = temp3;

    matrix->m[0][0] = (matrix->m[0][0] * 512) / 320;
    matrix->m[0][1] = (matrix->m[0][1] * 512) / 320;
    matrix->m[0][2] = (matrix->m[0][2] * 512) / 320;
}

void PIPE3D_CalculateWCTransform(CameraCore *cameraCore)
{
    MATRIX user_rotation;
    MATRIX first;
    MATRIX *cam_wcTrans;
    SVECTOR v0;
    VECTOR v1;

    cam_wcTrans = cameraCore->wcTransform;

    v0.vx = -cameraCore->position.x;
    v0.vy = -cameraCore->position.y;
    v0.vz = -cameraCore->position.z;

    if (!(gameTrackerX.debugFlags & 0x8))
    {
        MATH3D_SetUnityMatrix(&user_rotation);

        RotMatrixZ(-cameraCore->rotation.z, &user_rotation);
        RotMatrixX(-cameraCore->rotation.x, &user_rotation);
        RotMatrixY(-cameraCore->rotation.y, &user_rotation);

        v0.vx = -cameraCore->position.x;
        v0.vy = -cameraCore->position.y;
        v0.vz = -cameraCore->position.z;
    }
    else
    {
        MATH3D_SetUnityMatrix(&user_rotation);

        RotMatrixZ(-cameraCore->debugRot.z, &user_rotation);
        RotMatrixY(-cameraCore->debugRot.y, &user_rotation);
        RotMatrixX(-cameraCore->debugRot.x, &user_rotation);

        v0.vx = -cameraCore->debugPos.x;
        v0.vy = -cameraCore->debugPos.y;
        v0.vz = -cameraCore->debugPos.z;

        cameraCore->nondebugPos.x = cameraCore->position.x;
        cameraCore->nondebugPos.y = cameraCore->position.y;
        cameraCore->nondebugPos.z = cameraCore->position.z;

        cameraCore->position.x = cameraCore->debugPos.x;
        cameraCore->position.y = cameraCore->debugPos.y;
        cameraCore->position.z = cameraCore->debugPos.z;
    }

    first.m[0][0] = 4096;
    first.m[0][1] = 0;
    first.m[0][2] = 0;

    first.m[1][0] = 0;
    first.m[1][1] = 0;
    first.m[1][2] = -4096;

    first.m[2][0] = 0;
    first.m[2][1] = 4096;
    first.m[2][2] = 0;

    MulMatrix0(&first, &user_rotation, cam_wcTrans);
    MulMatrix0(&first, &user_rotation, cameraCore->wcTransform2);

    PIPE3D_AspectAdjustMatrix(cam_wcTrans);

    cam_wcTrans->m[0][0] = (cam_wcTrans->m[0][0] * cameraCore->screenScale.x) >> 12;
    cam_wcTrans->m[0][1] = (cam_wcTrans->m[0][1] * cameraCore->screenScale.x) >> 12;
    cam_wcTrans->m[0][2] = (cam_wcTrans->m[0][2] * cameraCore->screenScale.x) >> 12;

    cam_wcTrans->m[1][0] = (cam_wcTrans->m[1][0] * cameraCore->screenScale.y) >> 12;
    cam_wcTrans->m[1][1] = (cam_wcTrans->m[1][1] * cameraCore->screenScale.y) >> 12;
    cam_wcTrans->m[1][2] = (cam_wcTrans->m[1][2] * cameraCore->screenScale.y) >> 12;

    cam_wcTrans->m[2][0] = (cam_wcTrans->m[2][0] * cameraCore->screenScale.z) >> 12;
    cam_wcTrans->m[2][1] = (cam_wcTrans->m[2][1] * cameraCore->screenScale.z) >> 12;
    cam_wcTrans->m[2][2] = (cam_wcTrans->m[2][2] * cameraCore->screenScale.z) >> 12;

    gte_SetRotMatrix(cam_wcTrans);
    gte_ldv0(&v0);
    gte_nrtv0();
    gte_stlvnl(&v1);

    TransMatrix(cam_wcTrans, &v1);

    gte_SetRotMatrix(cameraCore->wcTransform2);
    gte_ldv0(&v0);
    gte_nrtv0();
    gte_stlvnl(&v1);

    TransMatrix(cameraCore->wcTransform2, &v1);
}

void PIPE3D_InvertTransform(MATRIX *target, MATRIX *source)
{
    VECTOR sourceTrans;
    MATRIX normMat;

    if (((short *)&source->t)[-1] == 1)
    {
        PIPE3D_NormalizeMatrix(&normMat, source);

        TransposeMatrix(&normMat, target);
    }
    else
    {
        TransposeMatrix(source, target);
    }

    sourceTrans.vx = -source->t[0];
    sourceTrans.vy = -source->t[1];
    sourceTrans.vz = -source->t[2];

    ApplyMatrixLV(target, &sourceTrans, (VECTOR *)target->t);
}

long PIPE3D_MatrixColumnLength(MATRIX *transform, long column)
{
    return MATH3D_FastSqrt0(MATH3D_SquareLength(transform->m[0][column], transform->m[1][column], transform->m[2][column]));
}

void PIPE3D_NormalizeMatrix(MATRIX *target, MATRIX *source)
{
    VECTOR scalevec;
    long scale;
    typedef struct
    {
        long m[3];
    } tmm;
    typedef struct
    {
        long m[5];
    } cmm;

    scale = PIPE3D_MatrixColumnLength(source, 0);

    if (scale != 0)
    {
        scale = 16777216 / scale;
    }

    scalevec.vx = scale;

    scale = PIPE3D_MatrixColumnLength(source, 1);

    if (scale != 0)
    {
        scale = 16777216 / scale;
    }

    scalevec.vy = scale;

    scale = PIPE3D_MatrixColumnLength(source, 2);

    if (scale != 0)
    {
        scale = 16777216 / scale;
    }

    scalevec.vz = scale;

    *(tmm *)(target->t) = *(tmm *)(source->t);
    *(cmm *)(target->m) = *(cmm *)(source->m);

    ScaleMatrix(target, &scalevec);
}

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_TransformVerticesToWorld);

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_InstanceTransformAndDraw);

void PIPE3D_InstanceListTransformAndDrawFunc(StreamUnit *unit, unsigned long **ot, CameraCore *cameraCore, Instance *instance)
{
    VertexPool *vertexPool;
    PrimPool *primPool;
    VECTOR dpv[2];
    long maxRad;
    Level *level;
    SVECTOR bsPos;

    level = unit->level;

    vertexPool = gameTrackerX.vertexPool;
    primPool = gameTrackerX.primPool;

    bsPos.vx = instance->position.x;
    bsPos.vy = instance->position.y;
    bsPos.vz = instance->position.z;

    if ((unit == NULL) || (!(unit->flags & 0x1)) || (unit->StreamUnitID == gameTrackerX.StreamUnitID) || (WARPGATE_IsObjectOnWarpSide(instance) != 0))
    {
        maxRad = instance->object->modelList[instance->currentModel]->maxRad;

        gte_SetRotMatrix(&cameraCore->vvNormalWorVecMat[0]);
        gte_ldv0(&bsPos);
        gte_nrtv0();
        gte_stlvnl(&dpv[0]);

        dpv[0].vx -= cameraCore->vvPlaneConsts[0];

        if ((-maxRad < dpv[0].vx) && (dpv[0].vx < (cameraCore->farPlane + maxRad)) && (-maxRad < (dpv[0].vy - cameraCore->vvPlaneConsts[1]))
        && (-maxRad < (dpv[0].vz - cameraCore->vvPlaneConsts[2])))
        {
            gte_SetRotMatrix(&cameraCore->vvNormalWorVecMat[1]);
            gte_ldv0(&bsPos);
            gte_nrtv0();
            gte_stlvnl(&dpv[1]);

            if ((-maxRad < (dpv[1].vx - cameraCore->vvPlaneConsts[3])) && (-maxRad < (dpv[1].vy - cameraCore->vvPlaneConsts[4])))
            {
                if ((instance->flags & 0x80))
                {
                    PIPE3D_AnimateTextures(instance->object->modelList[instance->currentModel]->aniTextures, instance->currentTextureAnimFrame);
                }
                else
                {
                    PIPE3D_AnimateTextures(instance->object->modelList[instance->currentModel]->aniTextures, gameTrackerX.frameCount);

                    instance->currentTextureAnimFrame++;
                }

                LIGHT_SetMatrixForLightGroupInstance(instance, level);

                if ((!(instance->halvePlane.flags & 0xB)) || ((instance->flags2 & 0x800000)))
                {
                    PIPE3D_InstanceTransformAndDraw(instance, cameraCore, vertexPool, primPool, ot, NULL);
                }
                else
                {
                    PIPE3D_HalvePlaneInstanceTransformAndDraw(instance, cameraCore->wcTransform, vertexPool, primPool, ot, NULL);
                }

                if ((instance->flags2 & 0x40))
                {
                    LIGHT_DrawShadow(cameraCore->wcTransform, instance, primPool, ot);
                }

                if (instance->additionalDrawFunc != NULL)
                {
                    instance->additionalDrawFunc(cameraCore->wcTransform, instance, vertexPool, primPool, ot);
                }

                gameTrackerX.visibleInstances++;

                instance->flags |= 0x200;
            }
            else
            {
                instance->flags &= ~0x200;
            }
        }
        else
        {
            instance->flags &= ~0x200;
        }
    }
    else
    {
        instance->flags &= ~0x200;
    }
}

void PIPE3D_InstanceListTransformAndDraw(StreamUnit *unit, GameTracker *gameTracker, unsigned long **ot, CameraCore *cameraCore)
{
    Instance *instance;
    int id;
    Instance *player;

    instance = gameTracker->instanceList->first;

    player = gameTracker->playerInstance;

    id = unit->StreamUnitID;

    if ((player->currentStreamUnitID == id) && (!(player->flags & 0x800)))
    {
        PIPE3D_InstanceListTransformAndDrawFunc(unit, ot, cameraCore, player);
    }

    for (; instance != NULL; instance = instance->next)
    {
        if ((!(instance->flags & 0x800)) && (!(instance->flags2 & 0x4000000)) && (instance->currentStreamUnitID == id) && (instance != player))
        {
            PIPE3D_InstanceListTransformAndDrawFunc(unit, ot, cameraCore, instance);
        }
    }
}

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_TransformFromZAxis);
#else
void PIPE3D_TransformFromZAxis(MATRIX *transform, SVector *normal)
{
    G2EulerAngles ea1;
    SVector xprod;
    SVector yprod;

    if ((abs(normal->x) < 5) && (abs(normal->y) < 5))
    {
        if (normal->z >= 0)
        {
            MATH3D_SetUnityMatrix(transform);
        }
        else
        {
            transform->m[0][0] = 4096;
            transform->m[0][1] = 0;
            transform->m[0][2] = 0;

            transform->m[1][0] = 0;
            transform->m[1][1] = -4096;
            transform->m[1][2] = 0;

            transform->m[2][0] = 0;
            transform->m[2][1] = 0;
            transform->m[2][2] = -4096;
        }

        return;
    }

    xprod.x = (short *)-normal->y;
    xprod.y = (short *)normal->x;
    xprod.z = 0;

    MATH3D_Normalize((Normal *)&xprod);

    yprod.x = ((normal->y * xprod.z) - (normal->z * xprod.y)) >> 12;
    yprod.y = -(((normal->x * xprod.z) - (normal->z * xprod.x)) >> 12);
    yprod.z = ((normal->x * xprod.y) - (normal->y * xprod.x)) >> 12;

    MATH3D_Normalize((Normal *)&yprod);

    transform->m[0][0] = xprod.x;
    transform->m[0][1] = xprod.y;
    transform->m[0][2] = xprod.z;

    transform->m[1][0] = yprod.x;
    transform->m[1][1] = yprod.y;
    transform->m[1][2] = yprod.z;

    transform->m[2][0] = normal->x;
    transform->m[2][1] = normal->y;
    transform->m[2][2] = normal->z;

    G2EulerAngles_FromMatrix(&ea1, (G2Matrix *)transform, 21);

    RotMatrix((SVECTOR *)&ea1, transform);
}
#endif

void PIPE3D_CalcWorldToSplitPlaneTransform(MATRIX *wpTransform, SVector *normal, SVector *translation)
{
    SVector svector;
    Vector vector;

    PIPE3D_TransformFromZAxis(wpTransform, normal);

    svector.x = -translation->x;
    svector.y = -translation->y;
    svector.z = -translation->z;

    gte_SetRotMatrix(&wpTransform->m[0][0]);
    gte_ldv0(&svector.x);
    gte_nrtv0();
    gte_stlvnl(&vector);

    wpTransform->t[0] = vector.x;
    wpTransform->t[1] = vector.y;
    wpTransform->t[2] = vector.z;
}

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_TransformAnimatedSplitInstanceVertices);

void PIPE3D_TransformSplitInstanceVertices(MVertex *vertexList, PVertex *pvertex, Model *model, MATRIX *wpTransform, MATRIX *matrixPool, Mirror *mirror)
{
    MATRIX *spTransform;
    Vector *vector;
    long i;
    Segment *segment;

    (void)mirror;

    vector = (Vector *)getScratchAddr(8);

    spTransform = (MATRIX *)getScratchAddr(0);

    for (segment = model->segmentList, i = 0; i < model->numSegments; segment++, i++)
    {
        if (model->segmentList[i].lastVertex != -1)
        {
            MVertex *firstVertex;
            MVertex *lastVertex;
            MVertex *modelVertex;

            firstVertex = &vertexList[segment->firstVertex];
            lastVertex = &vertexList[segment->lastVertex];

            CompMatrix(wpTransform, &matrixPool[i], spTransform);

            SetRotMatrix(spTransform);
            SetTransMatrix(spTransform);

            for (modelVertex = firstVertex; modelVertex <= lastVertex; pvertex++, modelVertex++)
            {
                gte_ldv0(modelVertex);
                gte_nrtvx();
                gte_stlvnl(vector);

                pvertex->x = (short)vector->x;
                pvertex->y = (short)vector->y;
                *(short *)&pvertex->otz = (short)vector->z;
            }
        }
    }
}

void PIPE3D_AnimateTextures(AniTex *aniTextures, long req_frame)
{
    AniTexInfo *ani_tex_info;
    TextureMT3 *dest;
    TextureMT3 *src;
    long i;

    if ((aniTextures != NULL) && (req_frame != -1))
    {
        for (ani_tex_info = &aniTextures->aniTexInfo, i = 0; i < aniTextures->numAniTextues; ani_tex_info++, i++)
        {
            dest = ani_tex_info->texture;

            src = &dest[((unsigned int)req_frame / ani_tex_info->speed) % ani_tex_info->numFrames] + 1;

            *(int *)&dest->u0 = *(int *)&src->u0;
            *(int *)&dest->u1 = *(int *)&src->u1;
            *(int *)&dest->u2 = *(int *)&src->u2;

            dest->color = src->color;
        }
    }
}

void PIPE3D_AnimateTerrainTextures(DrMoveAniTex *aniTextures, long req_frame, PrimPool *primPool, unsigned long **drawot)
{
    unsigned long *prim;
    DrMoveAniTexDestInfo *dest;
    DrMoveAniTexSrcInfo *src;
    long i;
    unsigned long **otl;

    prim = primPool->nextPrim;

    otl = &drawot[3071];

    if (aniTextures != NULL)
    {
        if ((char *)prim < (char *)&primPool->lastPrim[-(aniTextures->numAniTextues * 24)])
        {
            for (i = 0; i < aniTextures->numAniTextues; i++)
            {
                dest = ((DrMoveAniTex *)((unsigned long *)aniTextures + i))->aniTexInfo;

                src = &dest->frame + ((req_frame / (unsigned long)dest->speed) % dest->numFrames);

                if (*(int *)&src->pixSrcX != *(int *)&dest->pixCurrentX) // TODO: this is likely an optimization
                {
                    prim[1] = 0x1000000;
                    prim[2] = 0x80000000;
                    prim[3] = *(int *)src;
                    prim[4] = ((int *)dest)[0];
                    prim[5] = ((int *)dest)[1];

                    //addPrim(otl[0], prim);

                    *(int *)prim = getaddr(&otl[0]) | 0x5000000;
                    *(int *)&otl[0] = (int)prim & 0xFFFFFF;

                    *(int *)&dest->pixCurrentX = *(int *)&src->pixSrcX;

                    prim += 24 / 4;

                    primPool->numPrims++;
                }

                if (*(int *)&src->clutSrcX != *(int *)&dest->clutCurrentX) // TODO: this is likely an optimization
                {
                    prim[1] = 0x1000000;
                    prim[2] = 0x80000000;
                    prim[3] = *(int *)&src->clutSrcX;
                    prim[4] = *(int *)&dest->clutDstX;
                    prim[5] = *(int *)&dest->clutW;

                    //addPrim(otl[0], prim);

                    *(int *)prim = getaddr(&otl[0]) | 0x5000000;
                    *(int *)&otl[0] = (int)prim & 0xFFFFFF;

                    prim += 24 / 4;

                    *(int *)&dest->clutCurrentX = *(int *)&src->clutSrcX;

                    primPool->numPrims++;
                }
            }
        }

        primPool->nextPrim = prim;
    }
}

void PIPE3D_HalvePlaneInstanceTransformAndDraw(Instance *instance, MATRIX *wcTransform, VertexPool *vertexPool, PrimPool *primPool, unsigned long **ot, Mirror *mirror)
{
    Object *object;
    Model *model;
    MATRIX *matrixPool;
    MATRIX wpTransform;
    MATRIX pwTransform;
    MATRIX pcTransform;
    MATRIX lm;
    MVertex *vertexList;
    SVector normalX;
    SVector *normal;
    SVector translation;

    (void)object;

    normal = &normalX;

    matrixPool = instance->matrix;

    model = instance->object->modelList[instance->currentModel];

    vertexList = model->vertexList;

    normal->x = instance->halvePlane.a;
    normal->y = instance->halvePlane.b;
    normal->z = instance->halvePlane.c;

    translation.x = -(short)((normal->x * instance->halvePlane.d) >> 12);
    translation.y = -(short)((normal->y * instance->halvePlane.d) >> 12);
    translation.z = -(short)((normal->z * instance->halvePlane.d) >> 12);

    PIPE3D_CalcWorldToSplitPlaneTransform(&wpTransform, normal, &translation);

    PIPE3D_InvertTransform(&pwTransform, &wpTransform);

    CompMatrix(wcTransform, &pwTransform, &pcTransform);

    if (matrixPool != NULL)
    {
        LIGHT_PresetInstanceLight(instance, 2048, &lm);

        modelFadeValue = INSTANCE_GetFadeValue(instance);

        PIPE3D_TransformAnimatedSplitInstanceVertices(vertexList, vertexPool->vertex, model, &wpTransform, matrixPool, mirror, &lm, vertexPool->color, instance->perVertexColor);

        if (&primPool->nextPrim[model->numFaces * 12] < primPool->lastPrim)
        {
            if ((instance->halvePlane.flags & 0x2))
            {
                draw_belowSplit = 1;
            }
            else
            {
                draw_belowSplit = 0;
            }

            primPool->nextPrim = DRAW_SplitModel_S(model, instance, vertexPool, &pcTransform, primPool, ot);
        }
    }
}

void PIPE3D_HalvePlaneGetRingPoints(Instance *instance, MATRIX *wcTransform, VertexPool *vertexPool, PrimPool *primPool, unsigned long **ot, FXHalvePlane *ring)
{
    Object *object;
    Model *model;
    MATRIX *matrixPool;
    MATRIX wpTransform;
    MATRIX pwTransform;
    MATRIX pcTransform;
    MVertex *vertexList;
    PVertex *poolVertex;
    SVector normalX;
    SVector *normal;
    SVector translation;
    PlaneConstants *halvePlane;

    poolVertex = (PVertex *)vertexPool;

    object = instance->object;

    normal = &normalX;

    matrixPool = instance->matrix;

    model = object->modelList[instance->currentModel];

    vertexList = model->vertexList;

    if (ring->type == 0)
    {
        halvePlane = &ring->ringPlane;
    }
    else
    {
        halvePlane = &instance->halvePlane;
    }

    normal->x = halvePlane->a;
    normal->y = halvePlane->b;
    normal->z = halvePlane->c;

    translation.x = -(short)((normal->x * halvePlane->d) >> 12);
    translation.y = -(short)((normal->y * halvePlane->d) >> 12);
    translation.z = -(short)((normal->z * halvePlane->d) >> 12);

    PIPE3D_CalcWorldToSplitPlaneTransform(&wpTransform, normal, &translation);

    PIPE3D_InvertTransform(&pwTransform, &wpTransform);

    if (ring->type == 2)
    {
        PIPE3D_InvertTransform(&pcTransform, &wpTransform);
    }
    else
    {
        CompMatrix(wcTransform, &pwTransform, &pcTransform);
    }

    if (matrixPool != NULL)
    {
        PIPE3D_TransformSplitInstanceVertices(vertexList, poolVertex, model, &wpTransform, matrixPool, NULL);

        draw_belowSplit = 0;

        primPool->nextPrim = DRAW_DrawRingPoints(model, vertexPool, &pcTransform, primPool, ot, ring->currentColor, ring->type);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PIPE3D", PIPE3D_DoGlow);

long PIPE3D_Segment2ScreenPt(Instance *instance, MATRIX *wcTransform, int segIndex, Position *pos)
{
    MATRIX scTransform;
    Position vOrigin;
    long face_z;

    CompMatrix(wcTransform, &instance->matrix[segIndex], &scTransform);

    SetRotMatrix(&scTransform);
    SetTransMatrix(&scTransform);

    vOrigin.z = 0;
    vOrigin.y = 0;
    vOrigin.x = 0;

    gte_ldv0(&vOrigin);
    gte_nrtps();
    gte_stsxy(pos);
    gte_stsz(&face_z);

    return (face_z >> 2) - 20;
}
