#include "common.h"
#include "Game/MATH3D.h"
#include "Game/PIPE3D.h"
#include "Game/COLLIDE.h"
#include "Game/HASM.h"
#include "Game/MEMPACK.h"
#include "Game/GAMELOOP.h"
#include "Game/CAMERA.h"
#include "Game/STREAM.h"
#include "Game/INSTANCE.h"
#include "Game/SIGNAL.h"
#include "Game/EVENT.h"

long dyna_clddyna[8] = {
    0x0C, 0x0D, 0x0E, 0x0F, 0x1C, 0x1D, 0x1E, 0x1F};

long stat_clddyna[8] = {
    0x04, 0x05, 0x06, 0x07, 0x14, 0x15, 0x16, 0x17};

long dyna_cldstat[8] = {
    0x0A, 0x0B, 0x0E, 0x0F, 0x1A, 0x1B, 0x1E, 0x1F};

long collide_ignoreAttr = 0;

long collide_acceptAttr = 0;

long collide_t0;

long collide_t1;

SVector *collide_point0;

SVector *collide_point1;

SVector *collide_normal0;

SVector *collide_normal1;

int COLLIDE_PointInTriangle(SVector *v0, SVector *v1, SVector *v2, SVector *point, SVector *normal)
{
    Triangle2D *triangle;
    int nx;
    int ny;
    short tx;
    short ty;
    int inside_flag;
    int line_flag;
    DVECTOR *vert1;
    DVECTOR *vert0;
    int yflag1;
    int yflag0;
    int j;
    long ydist;
    long xdist;
    long xdiff;
    long ydiff;
    long ix;
    int temp; // not from decls.h

    nx = normal->x > 0 ? normal->x : -normal->x;
    ny = normal->y > 0 ? normal->y : -normal->y;

    triangle = (Triangle2D *)getScratchAddr(0);

    if (ny < nx)
    {
        if (abs(normal->z) < nx)
        {
            tx = point->y;
            ty = point->z;

            *(int *)&triangle->x0 = (unsigned short)v0->y | (v0->z << 16);
            *(int *)&triangle->x1 = (unsigned short)v1->y | (v1->z << 16);
            *(int *)&triangle->x2 = (unsigned short)v2->y | (v2->z << 16);
        }
        else
        {
            tx = point->x;
            ty = point->y;

            *(int *)&triangle->x0 = (unsigned short)v0->x | (v0->y << 16);
            *(int *)&triangle->x1 = (unsigned short)v1->x | (v1->y << 16);
            *(int *)&triangle->x2 = (unsigned short)v2->x | (v2->y << 16);
        }
    }
    else
    {
        if (abs(normal->z) < ny)
        {
            tx = point->x;
            ty = point->z;

            *(int *)&triangle->x0 = (unsigned short)v0->x | (v0->z << 16);
            *(int *)&triangle->x1 = (unsigned short)v1->x | (v1->z << 16);
            *(int *)&triangle->x2 = (unsigned short)v2->x | (v2->z << 16);
        }
        else
        {
            tx = point->x;
            ty = point->y;

            *(int *)&triangle->x0 = (unsigned short)v0->x | (v0->y << 16);
            *(int *)&triangle->x1 = (unsigned short)v1->x | (v1->y << 16);
            *(int *)&triangle->x2 = (unsigned short)v2->x | (v2->y << 16);
        }
    }

    vert1 = (DVECTOR *)triangle;
    vert0 = (DVECTOR *)vert1 + 2;

    yflag0 = (vert0->vy >= ty);
    inside_flag = 0;
    line_flag = 0;

    for (j = 3; j != 0; j--)
    {
        yflag1 = (vert1->vy >= ty);

        if (yflag0 != yflag1)
        {
            temp = (vert0->vx >= tx);

            if (temp == (vert1->vx >= tx))
            {
                if (temp != 0)
                {
                    inside_flag = !inside_flag;
                }
            }
            else
            {
                xdist = vert1->vx - tx;
                ydiff = vert0->vy - vert1->vy;
                xdiff = vert0->vx - vert1->vx;
                ydist = vert1->vy - ty;

                ix = xdist * ydiff - ydist * xdiff;

                if (ydiff < 0)
                {
                    ydiff = -ydiff;
                    ix = -ix;
                }

                ydiff = ydiff / 2;

                if (ydiff < ix)
                {
                    inside_flag = !inside_flag;
                }
                else if (ix >= -ydiff)
                {
                    return 1;
                }
            }

            if (line_flag != 0)
            {
                return inside_flag;
            }

            line_flag = 1;
        }
        else
        {
            if ((yflag1 != 0) && (ty == vert0->vy))
            {
                if (ty == vert1->vy)
                {
                    if ((((vert0->vx < tx) != (vert1->vx < tx)) == 0) && (tx != vert0->vx))
                    {
                        if (tx == vert1->vx)
                        {
                            return 1;
                        }
                    }
                    else
                    {
                        return 1;
                    }
                }
                else if (tx == vert0->vx)
                {
                    return 1;
                }
            }
        }

        yflag0 = yflag1;
        vert0 = vert1;
        vert1++;
    }

    return inside_flag;
}

int COLLIDE_PointInTriangle2DPub(short *v0, short *v1, short *v2, short *point)
{
    SVector normal = {.x = 0, .y = 0, .z = 4096};

    return COLLIDE_PointInTriangle((SVector *)v0, (SVector *)v1, (SVector *)v2, (SVector *)point, (SVector *)&normal);
}

long COLLIDE_GetNormal(short nNum, short *nrmlArray, SVector *nrml)
{
    short *sPtr;
    long bitMask;

    if (nNum >= 0)
    {
        sPtr = &nrmlArray[nNum * 3];

        bitMask = *sPtr++;

        nrml->x = bitMask & 0x1FFF;
        nrml->y = *sPtr++;
        nrml->z = *sPtr;

        bitMask >>= 13;
    }
    else
    {
        sPtr = &nrmlArray[-nNum * 3];

        bitMask = *sPtr++;

        nrml->x = -(bitMask & 0x1FFF);
        nrml->y = -(*sPtr++);
        nrml->z = -(*sPtr);

        bitMask >>= 13;
    }

    return bitMask;
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_MakeNormal);

void COLLIDE_UpdateAllTransforms(Instance *instance, SVECTOR *offset)
{
    MATRIX *swTransform;
    int i;
    long numMatrices;
    long ox;
    long oy;
    long oz;

    if (instance->matrix != NULL)
    {
        ox = offset->vx;
        oy = offset->vy;
        oz = offset->vz;

        if ((instance->object->animList != NULL) && (!(instance->object->oflags2 & 0x40000000)))
        {
            swTransform = instance->matrix - 1;

            numMatrices = instance->object->modelList[instance->currentModel]->numSegments + 1;
        }
        else
        {
            swTransform = instance->matrix;

            numMatrices = instance->object->modelList[instance->currentModel]->numSegments;
        }

        for (i = numMatrices; i != 0; i--, swTransform++)
        {
            swTransform->t[0] += ox;
            swTransform->t[1] += oy;
            swTransform->t[2] += oz;
        }
    }
}

void COLLIDE_MoveAllTransforms(Instance *instance, Position *offset)
{
    MATRIX *swTransform;
    int i;
    long numMatrices;
    long ox;
    long oy;
    long oz;

    if (instance->oldMatrix != NULL)
    {
        ox = offset->x;
        oy = offset->y;
        oz = offset->z;

        if ((instance->object->animList != NULL) && (!(instance->object->oflags2 & 0x40000000)))
        {
            swTransform = instance->oldMatrix - 1;

            numMatrices = instance->object->modelList[instance->currentModel]->numSegments + 1;
        }
        else
        {
            swTransform = instance->oldMatrix;

            numMatrices = instance->object->modelList[instance->currentModel]->numSegments;
        }

        for (i = numMatrices; i != 0; i--, swTransform++)
        {
            swTransform->t[0] += ox;
            swTransform->t[1] += oy;
            swTransform->t[2] += oz;
        }
    }
}

long COLLIDE_WithinYZBounds(SVector *point, HBox *hbox)
{
    int temp; // not from decls.h

    temp = 0;

    if ((point->y >= hbox->minY) && (hbox->maxY >= point->y))
    {
        if (point->z >= hbox->minZ)
        {
            temp = hbox->maxZ >= point->z;
        }
    }

    return temp;
}

long COLLIDE_WithinXZBounds(SVector *point, HBox *hbox)
{
    int temp; // not from decls.h

    temp = 0;

    if ((point->x >= hbox->minX) && (hbox->maxX >= point->x))
    {
        if (point->z >= hbox->minZ)
        {
            temp = hbox->maxZ >= point->z;
        }
    }

    return temp;
}

long COLLIDE_WithinXYBounds(SVector *point, HBox *hbox)
{
    int temp; // not from decls.h

    temp = 0;

    if ((point->x >= hbox->minX) && (hbox->maxX >= point->x))
    {
        if (point->y >= hbox->minY)
        {
            temp = hbox->maxY >= point->y;
        }
    }

    return temp;
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_LineWithBoxFace);

long COLLIDE_IntersectLineAndBox(SVector *point0, SVector *normal0, SVector *point1, SVector *normal1, SVector *end, SVector *start, HBox *hbox)
{
    SVector normal;
    Vector line;

    collide_t0 = 4097;
    collide_t1 = 4097;

    collide_point0 = point0;
    collide_point1 = point1;

    collide_normal0 = normal0;
    collide_normal1 = normal1;

    SUB_LVEC(Vector, &line, SVector, end, SVector, start);
    normal.x = -4096;
    normal.y = 0;
    normal.z = 0;

    COLLIDE_LineWithBoxFace(-start->x, -line.x, -hbox->minX, start, &line, hbox, COLLIDE_WithinYZBounds, &normal);

    normal.x = 4096;
    normal.y = 0;
    normal.z = 0;

    COLLIDE_LineWithBoxFace(start->x, line.x, hbox->maxX, start, &line, hbox, COLLIDE_WithinYZBounds, &normal);

    normal.x = 0;
    normal.y = -4096;
    normal.z = 0;

    COLLIDE_LineWithBoxFace(-start->y, (short)-line.y, -hbox->minY, start, &line, hbox, COLLIDE_WithinXZBounds, &normal);

    normal.x = 0;
    normal.y = 4096;
    normal.z = 0;

    COLLIDE_LineWithBoxFace(start->y, line.y, hbox->maxY, start, &line, hbox, COLLIDE_WithinXZBounds, &normal);

    normal.x = 0;
    normal.y = 0;
    normal.z = -4096;

    COLLIDE_LineWithBoxFace(-start->z, (short)-line.z, -hbox->minZ, start, &line, hbox, COLLIDE_WithinXYBounds, &normal);

    normal.x = 0;
    normal.y = 0;
    normal.z = 4096;

    COLLIDE_LineWithBoxFace(start->z, line.z, hbox->maxZ, start, &line, hbox, COLLIDE_WithinXYBounds, &normal);

    if (collide_t1 != 4097)
    {
        return 2;
    }

    if (collide_t0 != 4097)
    {
        return 1;
    }

    return 0;
}

TFace *COLLIDE_PointAndTerrain(Terrain *terrain, PCollideInfo *pcollideInfo, LCollideInfo *lcol)
{
    return COLLIDE_PointAndTerrainFunc(terrain, pcollideInfo, 0, NULL, 0, 0, lcol);
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndTerrainFunc);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndHFace);

void COLLIDE_PointAndInstance(PCollideInfo *pcollideInfo, Instance *instance)
{
    MATRIX *swTransform;
    MATRIX *wsTransform;
    MATRIX *swNormMat;
    Vector *oldPosVec;
    Vector *lNormal;
    Vector *wNormal;
    Vector *dv;
    Vector *newPosVec;
    SVector *oldPos;
    SVector *newPos;
    SVector *point;
    long *flag;
    Model *model;
    HModel *hmodel;
    HPrim *hprim;
    int i;
    long collideType;

    wsTransform = (MATRIX *)getScratchAddr(40);

    swNormMat = (MATRIX *)getScratchAddr(64);

    oldPosVec = (Vector *)getScratchAddr(76);

    lNormal = (Vector *)getScratchAddr(84);

    wNormal = (Vector *)getScratchAddr(88);

    dv = (Vector *)getScratchAddr(96);

    newPosVec = (Vector *)getScratchAddr(100);

    oldPos = (SVector *)getScratchAddr(104);

    newPos = (SVector *)getScratchAddr(106);

    point = (SVector *)getScratchAddr(108);

    flag = (long *)getScratchAddr(112);

    hmodel = &instance->hModelList[instance->currentModel];

    collideType = pcollideInfo->collideType;

    model = instance->object->modelList[instance->currentModel];

    for (i = hmodel->numHPrims, hprim = hmodel->hPrimList; i != 0; i--, hprim++)
    {
        if (((hprim->hpFlags & 0x1)) && ((hprim->hpFlags & 0x8)))
        {
            HBox *hbox;
            HFace *hface;
            HSphere *hsphere;
            typedef struct
            {
                long m[3];
            } tmm;

            swTransform = &instance->matrix[hprim->segment];

            PIPE3D_InvertTransform(wsTransform, swTransform);

            *(tmm *)(swNormMat->t) = *(tmm *)(swTransform->t);

            TransposeMatrix(wsTransform, swNormMat);

            SetRotMatrix(wsTransform);
            SetTransMatrix(wsTransform);

            RotTrans(pcollideInfo->newPoint, (VECTOR *)newPosVec, flag);
            RotTrans(pcollideInfo->oldPoint, (VECTOR *)oldPosVec, flag);

            oldPos->x = (short)oldPosVec->x;
            oldPos->y = (short)oldPosVec->y;
            oldPos->z = (short)oldPosVec->z;

            newPos->x = (short)newPosVec->x;
            newPos->y = (short)newPosVec->y;
            newPos->z = (short)newPosVec->z;

            switch (hprim->type)
            {
            case 1:
                hsphere = hprim->data.hsphere;

                if (((hsphere->attr & 0x2000)) && (!(collideType & 0x20)))
                {
                    COLLIDE_NearestPointOnLine_S(point, (SVECTOR *)oldPos, (SVECTOR *)newPos, &hsphere->position);

                    dv->x = point->x - hsphere->position.x;
                    dv->y = point->y - hsphere->position.y;
                    dv->z = point->z - hsphere->position.z;

                    if ((unsigned long)((dv->x * dv->x) + (dv->y * dv->y) + (dv->z * dv->z)) < hsphere->radiusSquared)
                    {
                        long len;
                        long a;
                        long b;
                        long c;

                        dv->x = newPos->x - hsphere->position.x;
                        dv->y = newPos->y - hsphere->position.y;
                        dv->z = newPos->z - hsphere->position.z;

                        a = abs(dv->x);
                        b = abs(dv->y);
                        c = abs(dv->z);

                        MATH3D_Sort3VectorCoords(&a, &b, &c);

                        len = (c * 30) + (b * 12) + (a * 9);

                        if (len != 0)
                        {
                            lNormal->x = (dv->x << 12) / (len >> 5);
                            lNormal->y = (dv->y << 12) / (len >> 5);
                            lNormal->z = (dv->z << 12) / (len >> 5);

                            dv->x *= hsphere->radius - (len >> 5);
                            dv->y *= hsphere->radius - (len >> 5);
                            dv->z *= hsphere->radius - (len >> 5);

                            dv->x = (dv->x << 5) / len;
                            dv->y = (dv->y << 5) / len;
                            dv->z = (dv->z << 5) / len;

                            newPos->x += (short)dv->x;
                            newPos->y += (short)dv->y;
                            newPos->z += (short)dv->z;

                            SetRotMatrix(swNormMat);
                            SetTransMatrix(swTransform);

                            RotTrans((SVECTOR *)newPos, (VECTOR *)newPosVec, flag);

                            ApplyMatrixLV(swNormMat, (VECTOR *)lNormal, (VECTOR *)wNormal);

                            pcollideInfo->newPoint->vx = (short)newPosVec->x;
                            pcollideInfo->newPoint->vy = (short)newPosVec->y;
                            pcollideInfo->newPoint->vz = (short)newPosVec->z;

                            pcollideInfo->wNormal.vx = (short)wNormal->x;
                            pcollideInfo->wNormal.vy = (short)wNormal->y;
                            pcollideInfo->wNormal.vz = (short)wNormal->z;

                            pcollideInfo->type = 1;

                            pcollideInfo->segment = hprim->segment;

                            pcollideInfo->prim = hsphere;

                            pcollideInfo->inst = instance;
                        }
                    }
                }

                break;
            case 2:
            {
                SVector hfNormal;

                hface = hprim->data.hface;

                if (COLLIDE_PointAndHFace(newPos, oldPos, hface, model, &hfNormal) != 0)
                {
                    ApplyMatrixSV(swNormMat, (SVECTOR *)&hfNormal, &pcollideInfo->wNormal);

                    pcollideInfo->type = 2;

                    pcollideInfo->segment = hprim->segment;

                    pcollideInfo->prim = hface;

                    pcollideInfo->inst = instance;
                }

                break;
            }
            case 5:
            {
                SVector hbNormal;
                SVector point0;
                SVector point1;
                SVector normal1;

                hbox = hprim->data.hbox;

                if ((hbox->flags & 0x2000))
                {
                    unsigned short temp; // not from SYMDUMP

                    temp = instance->scale.x;

                    if (temp == 4096)
                    {
                        hbox->maxX = hbox->refMaxX;
                        hbox->minX = hbox->refMinX;
                    }
                    else
                    {
                        hbox->maxX = (hbox->refMaxX * temp) >> 12;
                        hbox->minX = (hbox->refMinX * temp) >> 12;
                    }

                    temp = instance->scale.y;

                    if (temp == 4096)
                    {
                        hbox->maxY = hbox->refMaxY;
                        hbox->minY = hbox->refMinY;
                    }
                    else
                    {
                        hbox->maxY = (hbox->refMaxY * temp) >> 12;
                        hbox->minY = (hbox->refMinY * temp) >> 12;
                    }

                    temp = instance->scale.z;

                    if (temp == 4096)
                    {
                        hbox->maxZ = hbox->refMaxZ;
                        hbox->minZ = hbox->refMinZ;
                    }
                    else
                    {
                        hbox->maxZ = (hbox->refMaxZ * temp) >> 12;
                        hbox->minZ = (hbox->refMinZ * temp) >> 12;
                    }

                    if (COLLIDE_IntersectLineAndBox(&point0, &hbNormal, &point1, &normal1, newPos, oldPos, hbox) != 0)
                    {
                        COPY_SVEC(SVector, newPos, SVector, &point0);

                        ApplyMatrixSV(swNormMat, (SVECTOR *)&hbNormal, &pcollideInfo->wNormal);

                        pcollideInfo->type = 5;

                        pcollideInfo->segment = hprim->segment;

                        pcollideInfo->prim = hbox;

                        pcollideInfo->inst = instance;
                    }
                }

                break;
            }
            }

            if ((newPos->x != newPosVec->x) || (newPos->y != newPosVec->y) || (newPos->z != newPosVec->z))
            {
                pcollideInfo->cldPoint.vx = newPos->x;
                pcollideInfo->cldPoint.vy = newPos->y;
                pcollideInfo->cldPoint.vz = newPos->z;

                SetRotMatrix(swNormMat);
                SetTransMatrix(swTransform);

                RotTrans((SVECTOR *)newPos, (VECTOR *)newPosVec, flag);

                pcollideInfo->newPoint->vx = (short)newPosVec->x;
                pcollideInfo->newPoint->vy = (short)newPosVec->y;
                pcollideInfo->newPoint->vz = (short)newPosVec->z;
            }
        }
    }
}

void COLLIDE_PointAndInstanceTrivialReject(PCollideInfo *pcollideInfo, Instance *instance)
{
    Vector *dv;
    SVector linePoint;

    dv = (Vector *)getScratchAddr(0);

    if ((MEMPACK_MemoryValidFunc((char *)instance->object) != 0) && (!(instance->flags & 0x40)) && (instance->hModelList != NULL) && ((!(pcollideInfo->collideType & 0x40)) || (!(instance->object->oflags2 & 0x40))))
    {
        COLLIDE_NearestPointOnLine_S(&linePoint, pcollideInfo->oldPoint, pcollideInfo->newPoint, &instance->position);

        SUB_LVEC(Vector, dv, SVector, &linePoint, Position, &instance->position);

        dv->x >>= 1;
        dv->y >>= 1;
        dv->z >>= 1;

        if ((((dv->x * dv->x) + (dv->y * dv->y) + (dv->z * dv->z)) < (instance->object->modelList[instance->currentModel]->maxRadSq >> 2)) && (instance->matrix != NULL))
        {
            COLLIDE_PointAndInstance(pcollideInfo, instance);
        }
    }
}

void COLLIDE_PointAndWorld(PCollideInfo *pcollideInfo, Level *level)
{
    int i;
    LCollideInfo lcol;
    Instance *instance;
    Level *thislevel;
    TFace *tface;
    int in_warpRoom;
    Terrain *terrain;
    InstanceList *instanceList;
    StreamUnit *streamUnit;

    in_warpRoom = 0;

    pcollideInfo->type = 0;

    if ((pcollideInfo->collideType & 0x1))
    {
        tface = NULL;

        if ((level != NULL) && (MEMPACK_MemoryValidFunc((char *)level) != 0))
        {
            terrain = level->terrain;

            tface = COLLIDE_PointAndTerrain(terrain, pcollideInfo, &lcol);

            if (tface != NULL)
            {
                pcollideInfo->type = 3;

                pcollideInfo->prim = tface;

                pcollideInfo->inst = (Instance *)level;

                pcollideInfo->segment = lcol.curTree;

                if (gameTrackerX.gameData.asmData.MorphTime != 1000)
                {
                    COLLIDE_MakeNormal(terrain, tface, (SVector *)&pcollideInfo->wNormal);
                }
                else
                {
                    COLLIDE_GetNormal((short)tface->normal, &terrain->normalList->x, (SVector *)&pcollideInfo->wNormal);
                }
            }
            else if ((STREAM_GetStreamUnitWithID(level->streamUnitID)->flags & 0x1))
            {
                in_warpRoom = 1;
            }
        }

        if (tface == NULL)
        {
            streamUnit = &StreamTracker.StreamList[0];

            for (i = 0; i < 16; i++, streamUnit++)
            {
                thislevel = streamUnit->level;

                if ((streamUnit->used == 2) && (thislevel != level) && ((in_warpRoom == 0) || (!(streamUnit->flags & 0x1))))
                {
                    if (MEMPACK_MemoryValidFunc((char *)thislevel) != 0)
                    {
                        terrain = thislevel->terrain;

                        tface = COLLIDE_PointAndTerrain(terrain, pcollideInfo, &lcol);

                        if (tface != NULL)
                        {
                            pcollideInfo->type = 3;

                            pcollideInfo->prim = tface;

                            pcollideInfo->inst = (Instance *)thislevel;

                            pcollideInfo->segment = lcol.curTree;

                            if (gameTrackerX.gameData.asmData.MorphTime != 1000)
                            {
                                COLLIDE_MakeNormal(terrain, tface, (SVector *)&pcollideInfo->wNormal);
                            }
                            else
                            {
                                COLLIDE_GetNormal((short)tface->normal, &terrain->normalList->x, (SVector *)&pcollideInfo->wNormal);
                            }

                            break;
                        }
                    }
                }
            }

            if (tface == NULL)
            {
                pcollideInfo->type = 0;

                pcollideInfo->prim = NULL;

                pcollideInfo->inst = NULL;

                pcollideInfo->wNormal.vx = 0;
                pcollideInfo->wNormal.vy = 0;
                pcollideInfo->wNormal.vz = 0;
            }
        }
    }

    instanceList = gameTrackerX.instanceList;

    if ((pcollideInfo->collideType & 0x8))
    {
        for (i = 16; i < 32; i++)
        {
            instance = (Instance *)instanceList->group[i].next;

            while (instance != NULL)
            {
                if (!(instance->flags2 & 0x24000000))
                {
                    COLLIDE_PointAndInstanceTrivialReject(pcollideInfo, instance);
                }

                instance = (Instance *)instance->node.next;
            }
        }
    }
    else if ((pcollideInfo->collideType & 0x10))
    {
        if ((pcollideInfo->collideType & 0x2))
        {
            for (i = 0; i < 8; i++)
            {
                instance = (Instance *)(&instanceList->group[stat_clddyna[i]])->next;

                while (instance != NULL)
                {
                    if (!(instance->flags2 & 0x24000000))
                    {
                        COLLIDE_PointAndInstanceTrivialReject(pcollideInfo, instance);
                    }

                    instance = (Instance *)instance->node.next;
                }
            }
        }

        if ((pcollideInfo->collideType & 0x4))
        {
            for (i = 0; i < 8; i++)
            {
                instance = (Instance *)(&instanceList->group[dyna_clddyna[i]])->next;

                while (instance != NULL)
                {
                    if (!(instance->flags2 & 0x24000000))
                    {
                        COLLIDE_PointAndInstanceTrivialReject(pcollideInfo, instance);
                    }

                    instance = (Instance *)instance->node.next;
                }
            }
        }
    }
    else if ((pcollideInfo->collideType & 0x4))
    {
        for (i = 0; i < 8; i++)
        {
            instance = (Instance *)(&instanceList->group[dyna_cldstat[i]])->next;

            while (instance != NULL)
            {
                if (!(instance->flags2 & 0x24000000))
                {
                    COLLIDE_PointAndInstanceTrivialReject(pcollideInfo, instance);
                }

                instance = (Instance *)instance->node.next;
            }
        }
    }
}

long COLLIDE_ClosestPointInBoxToPoint(Position *boxPoint, HBox *hbox, SVector *point)
{
    long inside;

    inside = 1;

    if (point->x < hbox->minX)
    {
        boxPoint->x = hbox->minX;

        inside = 0;
    }
    else if (hbox->maxX < point->x)
    {
        boxPoint->x = hbox->maxX;

        inside = 0;
    }
    else
    {
        boxPoint->x = point->x;
    }

    if (point->y < hbox->minY)
    {
        boxPoint->y = hbox->minY;

        inside = 0;
    }
    else if (hbox->maxY < point->y)
    {
        boxPoint->y = hbox->maxY;

        inside = 0;
    }
    else
    {
        boxPoint->y = point->y;
    }

    if (point->z < hbox->minZ)
    {
        boxPoint->z = hbox->minZ;

        inside = 0;
    }
    else if (hbox->maxZ < point->z)
    {
        boxPoint->z = hbox->maxZ;

        inside = 0;
    }
    else
    {
        boxPoint->z = point->z;
    }

    return inside;
}

long COLLIDE_SphereAndPoint(Sphere *sphere, SVector *point, SVector *normal)
{
    long len;
    Vector *line;

    line = (Vector *)getScratchAddr(0);

    SUB_LVEC(Vector, line, Position, &sphere->position, SVector, point);

    if ((unsigned long)((line->x * line->x) + (line->y * line->y) + (line->z * line->z)) < sphere->radiusSquared)
    {
        long a;
        long b;
        long c;

        a = abs(line->x);
        b = abs(line->y);
        c = abs(line->z);

        MATH3D_Sort3VectorCoords(&a, &b, &c);

        len = (c * 30) + (b * 12) + (a * 9);

        if ((len >> 5) != 0)
        {
            normal->x = (short)((line->x << 12) / (len >> 5));
            normal->y = (short)((line->y << 12) / (len >> 5));
            normal->z = (short)((line->z << 12) / (len >> 5));

            line->x *= sphere->radius;
            line->y *= sphere->radius;
            line->z *= sphere->radius;

            line->x = (line->x << 5) / len;
            line->y = (line->y << 5) / len;
            line->z = (line->z << 5) / len;

            sphere->position.x = (short)(point->x + line->x);
            sphere->position.y = (short)(point->y + line->y);
            sphere->position.z = (short)(point->z + line->z);

            return 1;
        }
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndHBox);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_Instance1SpheresToInstance2);

void COLLIDE_Instances(Instance *instance1, Instance *instance2)
{
    long lx;
    long ly;
    long lz;
    long mrmr;

    if ((instance1 != instance2) && (INSTANCE_Linked(instance1, instance2) == 0))
    {
        lx = (instance1->position.x - instance2->position.x) >> 1;
        ly = (instance1->position.y - instance2->position.y) >> 1;
        lz = (instance1->position.z - instance2->position.z) >> 1;

        mrmr = (instance1->object->modelList[instance1->currentModel]->maxRad + instance2->object->modelList[instance2->currentModel]->maxRad) >> 1;

        hasm_sqrlen1((short)lx, (short)ly, (short)lz);
        gte_sqr0();
        hasm_sqrlen2(lx, ly, lz);

        if (((unsigned long)lx < (unsigned long)(mrmr * mrmr)) && (instance1->matrix != NULL) && (instance1->oldMatrix != NULL) && (instance2->matrix != NULL) && (instance2->oldMatrix != NULL))
        {
            COLLIDE_Instance1SpheresToInstance2(instance1, instance2, 1);
            COLLIDE_Instance1SpheresToInstance2(instance2, instance1, 0);
        }
    }
}

void COLLIDE_InstanceList(InstanceList *instanceList)
{
    Instance *instance;
    Instance *instance2;
    Instance *playerInstance;
    int i;
    int j;

    playerInstance = gameTrackerX.playerInstance;

    if (gameTrackerX.cheatMode != 1)
    {
        for (i = 16; i < 32; i++)
        {
            instance = (Instance *)instanceList->group[i].next;

            while (instance != NULL)
            {
                if ((instance->flags2 & 0x24040000) == 0)
                {
                    COLLIDE_Instances(instance, playerInstance);
                }

                instance = (Instance *)instance->node.next;
            }
        }
    }

    for (i = 0; i < 8; i++)
    {
        instance = (Instance *)(instanceList->group + dyna_clddyna[i])->next;

        while (instance != NULL)
        {
            if (!(instance->flags2 & 0x24040000))
            {
                instance2 = (Instance *)instance->node.next;

                while (instance2 != NULL)
                {
                    if (!(instance2->flags2 & 0x24040000))
                    {
                        COLLIDE_Instances(instance, instance2);
                    }

                    instance2 = (Instance *)instance2->node.next;
                }

                for (j = i + 1; j < 8; j++)
                {
                    instance2 = (Instance *)(instanceList->group + dyna_clddyna[j])->next;

                    while (instance2 != NULL)
                    {
                        if (!(instance2->flags2 & 0x24040000))
                        {
                            COLLIDE_Instances(instance, instance2);
                        }

                        instance2 = (Instance *)instance2->node.next;
                    }
                }
            }

            instance = (Instance *)instance->node.next;
        }
    }

    for (i = 0; i < 8; i++)
    {
        instance = (Instance *)(instanceList->group + dyna_cldstat[i])->next;

        while (instance != NULL)
        {
            if (!(instance->flags2 & 0x24040000))
            {
                for (j = 0; j < 8; j++)
                {
                    instance2 = (Instance *)(instanceList->group + stat_clddyna[j])->next;

                    while (instance2 != NULL)
                    {
                        if (!(instance2->flags2 & 0x24040000))
                        {
                            COLLIDE_Instances(instance, instance2);
                        }

                        instance2 = (Instance *)instance2->node.next;
                    }
                }
            }

            instance = (Instance *)instance->node.next;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndHFace);

long COLLIDE_SAndT(SCollideInfo *scollideInfo, Level *level)
{
    struct SandTScratch *CSpad;
    void **stack;
    BSPNode *bspNode;
    Terrain *terrain;
    long curTree;
    void (*collideFunc)(); // not from decls.h
    short normal;          // not from decls.h

    CSpad = (struct SandTScratch *)getScratchAddr(114);

    terrain = level->terrain;

    stack = (void **)getScratchAddr(167);

    if (gameTrackerX.gameData.asmData.MorphTime != 1000)
    {
        CSpad->in_spectral = 2;
    }
    else if (gameTrackerX.gameData.asmData.MorphType == 1)
    {
        CSpad->in_spectral = 1;
    }
    else
    {
        CSpad->in_spectral = 0;
    }

    CSpad->normalList = (HNormal *)terrain->normalList;
    CSpad->vertexList = terrain->vertexList;

    CSpad->collideFunc = scollideInfo->collideFunc;

    CSpad->instance = scollideInfo->instance;

    CSpad->prim = scollideInfo->prim;

    CSpad->sphere = *scollideInfo->sphere;

    CSpad->result = 0;

    CSpad->collide_ignoreAttr = collide_ignoreAttr;
    CSpad->collide_acceptAttr = collide_acceptAttr;

    COPY_SVEC(SVector, &CSpad->oldPos, SVector, (SVector *)scollideInfo->oldPos);

    CSpad->spherePos.x = CSpad->sphere.position.x;
    CSpad->spherePos.y = CSpad->sphere.position.y;
    CSpad->spherePos.z = CSpad->sphere.position.z;

    CSpad->midPoint.x = CSpad->spherePos.x - CSpad->oldPos.x;
    CSpad->midPoint.y = CSpad->spherePos.y - CSpad->oldPos.y;
    CSpad->midPoint.z = CSpad->spherePos.z - CSpad->oldPos.z;

    {
        long a;
        long b;
        long c;

        a = abs(CSpad->midPoint.x);
        b = abs(CSpad->midPoint.y);
        c = abs(CSpad->midPoint.z);

        MATH3D_Sort3VectorCoords(&a, &b, &c);

        CSpad->midRadius = (30 * c) + (12 * b) + (9 * a);
    }

    if (CSpad->midRadius == 0)
    {
        return 0;
    }

    CSpad->midPoint.x = (CSpad->spherePos.x + CSpad->oldPos.x) >> 1;
    CSpad->midPoint.y = (CSpad->spherePos.y + CSpad->oldPos.y) >> 1;
    CSpad->midPoint.z = (CSpad->spherePos.z + CSpad->oldPos.z) >> 1;

    CSpad->midRadius = (CSpad->midRadius / 2) + CSpad->sphere.radius;

    if (CSpad->in_spectral == 2)
    {
        CSpad->midRadius += 2048;
    }

    for (curTree = 0; curTree < terrain->numBSPTrees; curTree++)
    {
        BSPTree *bsp;

        bsp = &terrain->BSPTreeArray[curTree];

        if ((((bsp->ID >= 0) && ((!(bsp->flags & 0x4000)) || (gameTrackerX.raziel_collide_override != 0))) && ((!(bsp->flags & 0x2000)) || ((unsigned char)gameTrackerX.monster_collide_override != 0))) && ((!(bsp->flags & 0x102)) || (((bsp->flags & 0xE0)) && ((INSTANCE_Query(CSpad->instance, 1) & 0x2)))))
        {
            CSpad->collideInfo.bspID = bsp->ID;

            SUB_SVEC(SVector, &CSpad->oldPos, SVector, &CSpad->oldPos, Position, &bsp->globalOffset);
            SUB_SVEC(SVector, &CSpad->midPoint, SVector, &CSpad->midPoint, Position, &bsp->globalOffset);
            SUB_SVEC(Position, &CSpad->sphere.position, Position, &CSpad->sphere.position, Position, &bsp->globalOffset);

            CSpad->posMatrix.m[0][0] = CSpad->sphere.position.x;
            CSpad->posMatrix.m[0][1] = CSpad->sphere.position.y;
            CSpad->posMatrix.m[0][2] = CSpad->sphere.position.z;

            CSpad->posMatrix.m[1][0] = CSpad->oldPos.x;
            CSpad->posMatrix.m[1][1] = CSpad->oldPos.y;
            CSpad->posMatrix.m[1][2] = CSpad->oldPos.z;

            *stack = stack;

            SetRotMatrix(&CSpad->posMatrix);

            *++stack = bsp->bspRoot;

            while (*stack != stack)
            {
                bspNode = (BSPNode *)*stack--;

                if ((bspNode->flags & 0x2))
                {
                    SVector *point;
                    BoundingBox *box;
                    int temp; // not from decls.h

                    box = (BoundingBox *)&bspNode->d;

                    point = (SVector *)&CSpad->midPoint;

                    temp = (point->x - (short)CSpad->midRadius < box->maxX) && (point->x + (short)CSpad->midRadius > box->minX) && (point->y - (short)CSpad->midRadius < box->maxY) && (point->y + (short)CSpad->midRadius > box->minY) && (point->z - (short)CSpad->midRadius < box->maxZ) && (point->z + (short)CSpad->midRadius > box->minZ);

                    if (temp != 0)
                    {
                        TFace *tface;

                        *(unsigned int *)&CSpad->posMatrix.m[0][0] = *(unsigned int *)&CSpad->sphere.position.x;
                        CSpad->posMatrix.m[0][2] = CSpad->sphere.position.z;

                        gte_ldsvrtrow0(&CSpad->posMatrix);

                        for (CSpad->i = bspNode->c, tface = *(TFace **)&bspNode->a; CSpad->i != 0; CSpad->i--, tface++)
                        {
                            if (((!(tface->attr & CSpad->collide_ignoreAttr)) || ((tface->attr & CSpad->collide_acceptAttr))) && ((tface->textoff == 0xFFFF) || (!(((TextureFT3 *)((char *)terrain->StartTextureList + tface->textoff))->attr & 0x2000))) && (!(tface->attr & 0x8)))
                            {
                                if ((CSpad->in_spectral == 2) && (tface->normal != terrain->morphNormalIdx[(int)(tface - terrain->faceList)]))
                                {
                                    COLLIDE_MakeNormal(terrain, (TFace *)tface, &CSpad->normal);
                                }
                                else
                                {
                                    short *nrmlArray;
                                    SVector *nrml;
                                    short *sPtr;

                                    normal = (short)tface->normal;

                                    nrmlArray = (short *)CSpad->normalList;

                                    nrml = &CSpad->normal;

                                    if (normal >= 0)
                                    {
                                        sPtr = &nrmlArray[normal * 3];

                                        nrml->x = *sPtr++ & 0x1FFF;
                                        nrml->y = *sPtr++;
                                        nrml->z = *sPtr;
                                    }
                                    else
                                    {
                                        sPtr = &nrmlArray[-normal * 3];

                                        nrml->x = -(*sPtr++ & 0x1FFF);
                                        nrml->y = -*sPtr++;
                                        nrml->z = -*sPtr;
                                    }
                                }

                                {
                                    SVector *vertex0;

                                    vertex0 = (SVector *)&CSpad->vertexList[tface->face.v0];

                                    gte_ldv2_ext(vertex0);
                                    gte_ldv0(&CSpad->normal);
                                    gte_nrtv0();
                                    gte_stlvnl(&CSpad->dpv);

                                    if ((CSpad->dpv.x <= CSpad->dpv.y) && ((CSpad->dpv.x - CSpad->dpv.z) < CSpad->sphere.radius) && ((CSpad->dpv.y - CSpad->dpv.z) >= -CSpad->sphere.radius))
                                    {
                                        CSpad->hfaceInfo.hface = (HFace *)tface;

                                        CSpad->hfaceInfo.vertex0 = (HVertex *)vertex0;
                                        CSpad->hfaceInfo.vertex1 = (HVertex *)&CSpad->vertexList[(short)tface->face.v1];
                                        CSpad->hfaceInfo.vertex2 = (HVertex *)&CSpad->vertexList[(short)tface->face.v2];

                                        CSpad->hfaceInfo.normal = *(SVector *)&CSpad->normal;

                                        if (COLLIDE_SphereAndHFace(&CSpad->sphere, (Position *)&CSpad->oldPos, &CSpad->hfaceInfo,
                                                                   (SVector *)&CSpad->collideInfo.point1, &CSpad->edge) != 0)
                                        {
                                            CSpad->collideInfo.flags = 0;

                                            if (CSpad->edge != 0)
                                            {
                                                CSpad->collideInfo.flags = 0x4;
                                            }
                                            else
                                            {
                                                CSpad->collideInfo.flags = 0x8;
                                            }

                                            CSpad->collideInfo.type0 = 1;
                                            CSpad->collideInfo.type1 = 3;

                                            CSpad->collideInfo.inst0 = CSpad->instance;
                                            CSpad->collideInfo.inst1 = bsp;

                                            CSpad->collideInfo.level = level;

                                            CSpad->collideInfo.segment = (char)scollideInfo->segment;

                                            CSpad->collideInfo.prim0 = CSpad->prim;

                                            CSpad->collideInfo.offset.x = CSpad->sphere.position.x - CSpad->posMatrix.m[0][0];
                                            CSpad->collideInfo.offset.y = CSpad->sphere.position.y - CSpad->posMatrix.m[0][1];
                                            CSpad->collideInfo.offset.z = CSpad->sphere.position.z - CSpad->posMatrix.m[0][2];

                                            CSpad->collideInfo.prim1 = tface;

                                            if (CSpad->instance != NULL)
                                            {
                                                CSpad->instance->collideInfo = &CSpad->collideInfo;

                                                if (CSpad->collideFunc != NULL)
                                                {
                                                    collideFunc = CSpad->collideFunc;

                                                    collideFunc(CSpad->instance, &gameTrackerX);
                                                }
                                            }

                                            CSpad->result = 1;

                                            *(unsigned int *)&CSpad->posMatrix.m[0][0] = *(unsigned int *)&CSpad->sphere.position.x;
                                            CSpad->posMatrix.m[0][2] = CSpad->sphere.position.z;
                                        }

                                        SetRotMatrix(&CSpad->posMatrix);
                                    }
                                }
                            }
                        }

                        *(unsigned int *)&CSpad->posMatrix.m[0][0] = *(unsigned int *)&CSpad->sphere.position.x;
                        CSpad->posMatrix.m[0][2] = CSpad->sphere.position.z;

                        gte_ldsvrtrow0(&CSpad->posMatrix);
                    }
                }
                else
                {
                    int plane_front_error;
                    int plane_back_error;

                    gte_ldv0(&bspNode->a);
                    gte_nrtv0();
                    gte_stlvnl(&CSpad->dpv);

                    CSpad->dpv.x -= bspNode->d;
                    CSpad->dpv.y -= bspNode->d;

                    if (CSpad->in_spectral != 0)
                    {
                        plane_front_error = bspNode->front_spectral_error;
                        plane_back_error = bspNode->back_spectral_error;
                    }
                    else
                    {
                        plane_front_error = bspNode->front_material_error;
                        plane_back_error = bspNode->back_material_error;
                    }

                    if ((CSpad->sphere.radius + plane_front_error) <= CSpad->dpv.y)
                    {
                        if ((CSpad->sphere.radius + plane_front_error) < CSpad->dpv.x)
                        {
                            if (bspNode->front != NULL)
                            {
                                *++stack = bspNode->front;
                            }
                        }
                        else
                        {
                            if (bspNode->back != NULL)
                            {
                                *++stack = bspNode->back;
                            }

                            if (bspNode->front != NULL)
                            {
                                *++stack = bspNode->front;
                            }
                        }
                    }
                    else if ((plane_back_error - CSpad->sphere.radius) >= CSpad->dpv.y)
                    {
                        if ((plane_back_error - CSpad->sphere.radius) <= CSpad->dpv.x)
                        {
                            if (bspNode->front != NULL)
                            {
                                *++stack = bspNode->front;
                            }
                        }

                        if (bspNode->back != NULL)
                        {
                            *++stack = bspNode->back;
                        }
                    }
                    else if (CSpad->dpv.x >= CSpad->dpv.y)
                    {
                        if (bspNode->front != NULL)
                        {
                            *++stack = bspNode->front;
                        }

                        if (bspNode->back != NULL)
                        {
                            *++stack = bspNode->back;
                        }
                    }
                    else
                    {
                        if (bspNode->back != NULL)
                        {
                            *++stack = bspNode->back;
                        }

                        if (bspNode->front != NULL)
                        {
                            *++stack = bspNode->front;
                        }
                    }
                }
            }

            ADD_SVEC(SVector, &CSpad->oldPos, SVector, &CSpad->oldPos, Position, &bsp->globalOffset);
            ADD_SVEC(SVector, &CSpad->midPoint, SVector, &CSpad->midPoint, Position, &bsp->globalOffset);
            ADD_SVEC(Position, &CSpad->sphere.position, Position, &CSpad->sphere.position, Position, &bsp->globalOffset);
        }
    }

    COPY_SVEC(Position, &scollideInfo->sphere->position, Position, &CSpad->sphere.position);

    return CSpad->result;
}

long COLLIDE_SphereAndTerrain(SCollideInfo *scollideInfo, Level *level)
{
    int result;
    int d;
    int in_warpRoom;
    StreamUnit *stream;

    result = COLLIDE_SAndT(scollideInfo, level);

    in_warpRoom = 0;

    stream = STREAM_GetStreamUnitWithID(level->streamUnitID);

    if (stream != NULL)
    {
        in_warpRoom = stream->flags & 0x1;
    }

    for (d = 0; d < 16; d++)
    {
        if ((StreamTracker.StreamList[d].used == 2) && (StreamTracker.StreamList[d].level != level) && ((in_warpRoom == 0) || (!(StreamTracker.StreamList[d].flags & 0x1))) && (MEMPACK_MemoryValidFunc((char *)StreamTracker.StreamList[d].level) != 0))
        {
            result = COLLIDE_SAndT(scollideInfo, StreamTracker.StreamList[d].level);
        }
    }

    return result;
}

void COLLIDE_InstanceTerrain(Instance *instance, Level *level)
{
    Vector *newPosVec;
    Vector *oldPosVec;
    SVector *oldPos;
    SCollideInfo scollideInfoX;
    SCollideInfo *scollideInfo;
    Sphere *wSphere;
    MATRIX *swTransform;
    MATRIX *oldSWTransform;
    HSphere *hsphere;
    long flags;
    int i;
    HModel *hmodel;
    HPrim *hprim;
    int currentModel;
    unsigned char withFlags;
    void (*collideFunc)();

    newPosVec = (Vector *)getScratchAddr(82);
    oldPosVec = (Vector *)getScratchAddr(86);

    oldPos = (SVector *)getScratchAddr(90);

    wSphere = (Sphere *)getScratchAddr(110);

    scollideInfo = &scollideInfoX;

    if ((instance->matrix != NULL) && (instance->oldMatrix != NULL))
    {
        if ((instance->object->oflags2 & 0x80000))
        {
            gameTrackerX.monster_collide_override = 1;
        }

        collideFunc = instance->collideFunc;

        currentModel = instance->currentModel;

        if (collideFunc != NULL)
        {
            hmodel = &instance->hModelList[currentModel];

            for (i = hmodel->numHPrims, hprim = hmodel->hPrimList; i != 0; i--, hprim++)
            {
                if ((hprim->hpFlags & 0x1))
                {
                    withFlags = hprim->withFlags;

                    if (((withFlags & 0x2)) && (hprim->type == 1))
                    {
                        swTransform = &instance->matrix[hprim->segment];

                        oldSWTransform = &instance->oldMatrix[hprim->segment];

                        hsphere = hprim->data.hsphere;

                        SetRotMatrix(swTransform);
                        SetTransMatrix(swTransform);

                        RotTrans((SVECTOR *)&hsphere->position, (VECTOR *)newPosVec, &flags);

                        SetRotMatrix(oldSWTransform);
                        SetTransMatrix(oldSWTransform);

                        RotTrans((SVECTOR *)&hsphere->position, (VECTOR *)oldPosVec, &flags);

                        wSphere->position.x = (short)newPosVec->x;
                        wSphere->position.y = (short)newPosVec->y;
                        wSphere->position.z = (short)newPosVec->z;

                        wSphere->radius = hsphere->radius;
                        wSphere->radiusSquared = hsphere->radiusSquared;

                        oldPos->x = (short)oldPosVec->x;
                        oldPos->y = (short)oldPosVec->y;
                        oldPos->z = (short)oldPosVec->z;

                        scollideInfo->sphere = wSphere;

                        scollideInfo->oldPos = (SVECTOR *)oldPos;

                        scollideInfo->collideFunc = collideFunc;

                        scollideInfo->instance = instance;

                        scollideInfo->segment = hprim->segment;

                        scollideInfo->id = hsphere->id;

                        scollideInfo->prim = (void *)hsphere;

                        COLLIDE_SphereAndTerrain(scollideInfo, level);
                    }
                }
            }
        }

        gameTrackerX.monster_collide_override = 0;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_LineWithSignals);

void COLLIDE_InstanceTerrainSignal(Instance *instance, Level *level)
{
    Model *model;
    int numSignals;
    int d;
    MultiSignal *msignal;
    SVector startPoint;
    SVector endPoint;
    MultiSignal *signalListArray[8];

    model = instance->object->modelList[instance->currentModel];

    if ((instance->matrix != NULL) && (instance->oldMatrix != NULL))
    {
        if (((instance->object->oflags2 & 0x80000)) && (INSTANCE_Query(instance, 1) != 130))
        {
            startPoint = *(SVector *)&instance->oldPos;

            startPoint.z += 100;

            endPoint = *(SVector *)&instance->position;

            endPoint.z += 100;
        }
        else if ((model != NULL) && (model->numSegments >= 2))
        {
            startPoint.x = (short)instance->oldMatrix[1].t[0];
            startPoint.y = (short)instance->oldMatrix[1].t[1];
            startPoint.z = (short)instance->oldMatrix[1].t[2];

            endPoint.x = (short)instance->matrix[1].t[0];
            endPoint.y = (short)instance->matrix[1].t[1];
            endPoint.z = (short)instance->matrix[1].t[2];
        }
        else
        {
            startPoint = *(SVector *)&instance->oldPos;

            endPoint = *(SVector *)&instance->position;
        }

        numSignals = COLLIDE_LineWithSignals(&startPoint, &endPoint, signalListArray, 8, level);

        for (d = 0; d < numSignals; d++)
        {
            msignal = signalListArray[d];

            if (instance == gameTrackerX.playerInstance)
            {
                msignal->flags |= 0x1;
            }

            SIGNAL_HandleSignal(instance, msignal->signalList, 0);

            EVENT_AddSignalToReset(msignal);
        }
    }
}

StreamUnit *COLLIDE_CameraWithStreamSignals(Camera *camera)
{
    SVector startPoint;
    SVector endPoint;
    Model *model;
    long numSignals;
    long i;
    long numStreamSignals;
    MultiSignal *signalListArray[8];
    StreamUnit *streamSignalUnits[8];
    StreamUnit *playerStreamUnit;
    Level *level;
    long playerStreamUnitID;
    Instance *instance;
    MultiSignal *msignal;
    long isWarpGateSignal;
    StreamUnit *cameraStreamUnit;
    long cameraStreamID;
    int number;

    instance = camera->focusInstance;

    playerStreamUnitID = instance->currentStreamUnitID;

    if ((instance == gameTrackerX.playerInstance) && (gameTrackerX.SwitchToNewStreamUnit != 0))
    {
        playerStreamUnitID = gameTrackerX.moveRazielToStreamID;
    }

    playerStreamUnit = STREAM_GetStreamUnitWithID(playerStreamUnitID);

    endPoint = *(SVector *)&camera->core.position;

    if (instance->matrix != NULL)
    {
        model = instance->object->modelList[instance->currentModel];

        if (model != NULL)
        {
            if (model->numSegments >= 2)
            {
                startPoint.x = (short)instance->matrix[1].t[0];
                startPoint.y = (short)instance->matrix[1].t[1];
                startPoint.z = (short)instance->matrix[1].t[2];
            }
            else
            {
                startPoint = *(SVector *)&instance->position;
            }
        }
        else
        {
            startPoint = *(SVector *)&instance->position;
        }
    }
    else
    {
        startPoint = *(SVector *)&instance->position;
    }

    level = playerStreamUnit->level;

    numStreamSignals = 0;

    if (level != NULL)
    {
        numSignals = COLLIDE_LineWithSignals(&startPoint, &endPoint, signalListArray, 8, level);

        for (i = 0; i < numSignals; i++)
        {
            msignal = (MultiSignal *)signalListArray[i]->signalList;

            if (SIGNAL_IsStreamSignal((Signal *)msignal, &isWarpGateSignal) != 0)
            {
                if (isWarpGateSignal != 0)
                {
                    if (WARPGATE_IsWarpgateActive() != 0)
                    {
                        if (gameTrackerX.SwitchToNewWarpIndex == -1)
                        {
                            number = CurrentWarpNumber;
                        }
                        else
                        {
                            number = gameTrackerX.SwitchToNewWarpIndex;
                        }

                        cameraStreamID = WarpRoomArray[number].streamUnit->StreamUnitID;
                    }
                    else
                    {
                        cameraStreamID = 0;
                    }
                }
                else
                {
                    cameraStreamID = msignal->signalList->id;
                }

                if (cameraStreamID != 0)
                {
                    cameraStreamUnit = STREAM_GetStreamUnitWithID(cameraStreamID);
                }
                else
                {
                    cameraStreamUnit = NULL;
                }

                if (cameraStreamUnit != NULL)
                {
                    streamSignalUnits[numStreamSignals++] = cameraStreamUnit;
                }
            }
        }
    }

    if (numStreamSignals != 0)
    {
        if (numStreamSignals == 1)
        {
            return streamSignalUnits[0];
        }

        for (i = 0; i < numStreamSignals; i++)
        {
            if (streamSignalUnits[i]->StreamUnitID != playerStreamUnitID)
            {
                return streamSignalUnits[i];
            }
        }

        return NULL;
    }

    return NULL;
}

void COLLIDE_InstanceListWithSignals(InstanceList *instanceList)
{
    Instance *instance;
    Level *level;

    instance = (Instance *)instanceList->first;

    while (instance != NULL)
    {
        if (!(instance->flags2 & 0x24000000))
        {
            level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

            if (level != NULL)
            {
                COLLIDE_InstanceTerrainSignal(instance, level);
            }
        }

        instance = instance->next;
    }
}

void COLLIDE_InstanceListTerrain(InstanceList *instanceList)
{
    long i;
    Instance *instance;
    Level *level;

    for (i = 1; i < 32; i += 2)
    {
        instance = (Instance *)instanceList->group[i].next;

        while (instance != NULL)
        {
            if ((instance->hModelList != NULL) && (!(instance->flags2 & 0x24040000)))
            {
                level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

                if (level != NULL)
                {
                    COLLIDE_InstanceTerrain(instance, level);
                }
            }

            instance = (Instance *)instance->node.next;
        }
    }
}

void COLLIDE_SegmentCollisionOn(Instance *instance, int segment)
{
    int i;
    HModel *hmodel;
    HPrim *hprim;

    if (instance->hModelList != NULL)
    {
        hmodel = &instance->hModelList[instance->currentModel];

        hprim = hmodel->hPrimList;

        for (i = hmodel->numHPrims; i != 0; i--)
        {
            if (hprim->segment == segment)
            {
                hprim->hpFlags |= 0x1;
            }

            hprim++;
        }

        instance->flags2 &= ~0x40000;
    }
}

void COLLIDE_SegmentCollisionOff(Instance *instance, int segment)
{
    int i;
    int enabled;
    HModel *hmodel;
    HPrim *hprim;

    if (instance->hModelList != NULL)
    {
        hmodel = &instance->hModelList[instance->currentModel];

        hprim = hmodel->hPrimList;

        enabled = 0;

        for (i = hmodel->numHPrims; i != 0; i--)
        {
            if (hprim->segment == segment)
            {
                hprim->hpFlags &= ~0x1;
            }

            if ((enabled == 0) && ((hprim->hpFlags & 0x1)))
            {
                enabled = 1;
            }

            hprim++;
        }

        if (enabled == 0)
        {
            instance->flags2 |= 0x40000;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_FindCollisionFaceNormal);

short *COLLIDE_GetBSPTreeFlag(CollideInfo *collideInfo)
{
    Level *level;
    Terrain *terrain;
    BSPTree *bspTree;

    level = (Level *)collideInfo->level;

    terrain = level->terrain;

    bspTree = &terrain->BSPTreeArray[collideInfo->bspID];

    return &bspTree->flags;
}

void COLLIDE_SetBSPTreeFlag(CollideInfo *collideInfo, short flag)
{
    short *bspTreeFlags;

    bspTreeFlags = COLLIDE_GetBSPTreeFlag(collideInfo);

    *bspTreeFlags |= flag;
}

int COLLIDE_PointAndTfaceFunc(Terrain *terrain, BSPTree *bsp, SVector *orgNewPos, SVector *orgOldPos, TFace *tface, long ignoreAttr, long flags)
{
    struct PandTFScratch *CSpad;
    int result;

    CSpad = (struct PandTFScratch *)getScratchAddr(16);

    result = 0;

    if ((tface == NULL) || ((bsp->flags & 0x2)))
    {
        return 0;
    }

    if (!((1 << (tface->attr & 0x1F)) & ignoreAttr))
    {
        SUB_SVEC(SVector, (SVector *)getScratchAddr(26), SVector, orgNewPos, Position, &bsp->globalOffset);
        SUB_SVEC(SVector, (SVector *)getScratchAddr(28), SVector, orgOldPos, Position, &bsp->globalOffset);

        CSpad->posMatrix.m[0][0] = CSpad->newPos.x;
        CSpad->posMatrix.m[0][1] = CSpad->newPos.y;
        CSpad->posMatrix.m[0][2] = CSpad->newPos.z;

        CSpad->posMatrix.m[1][0] = CSpad->oldPos.x;
        CSpad->posMatrix.m[1][1] = CSpad->oldPos.y;
        CSpad->posMatrix.m[1][2] = CSpad->oldPos.z;

        SetRotMatrix(&CSpad->posMatrix);

        {
            short *nrmlArray;
            SVector *nrml;
            short *sPtr;
            short temp; // not from decls.h

            temp = tface->normal;

            nrmlArray = (short *)terrain->normalList;

            nrml = &CSpad->normal;

            if (temp >= 0)
            {
                sPtr = &nrmlArray[3 * temp];

                nrml->x = *sPtr++ & 0x1FFF;
                nrml->y = *sPtr++;
                nrml->z = *sPtr;
            }
            else
            {
                sPtr = &nrmlArray[3 * -temp];

                nrml->x = -(*sPtr++ & 0x1FFF);
                nrml->y = -*sPtr++;
                nrml->z = -*sPtr;
            }
        }

        {
            SVector *vertex0;
            SVector *vertex1;

            vertex0 = (SVector *)&terrain->vertexList[tface->face.v0];
            vertex1 = (SVector *)&terrain->vertexList[tface->face.v1];

            gte_ldv2_ext(vertex0);
            gte_ldv0(&CSpad->normal);
            gte_nrtv0();
            gte_stlvnl(&CSpad->dpv);

            CSpad->dpv.x -= CSpad->dpv.z;
            CSpad->dpv.y -= CSpad->dpv.z;

            if ((((CSpad->dpv.x < 0) && (CSpad->dpv.y >= 0)) || (((flags & 0x1)) && (CSpad->dpv.x > 0) && (CSpad->dpv.y <= 0))) && (COLLIDE_IntersectLineAndPlane_S(&CSpad->planePoint, (Position *)&CSpad->oldPos, (Position *)&CSpad->newPos, &CSpad->normal, CSpad->dpv.z) != 0) && (COLLIDE_PointInTriangle(vertex0, vertex1, (SVector *)&terrain->vertexList[tface->face.v2], &CSpad->planePoint, &CSpad->normal) != 0))
            {
                result = 1;

                ADD_SVEC(SVector, orgNewPos, SVector, &CSpad->planePoint, Position, &bsp->globalOffset);
            }
        }
    }

    return result;
}
