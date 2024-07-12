#include "common.h"
#include "Game/MATH3D.h"
#include "Game/PIPE3D.h"
#include "Game/COLLIDE.h"
#include "Game/HASM.h"

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

void COLLIDE_LineWithBoxFace(short startDist, long lineDist, short planeDist, SVector *start, Vector *line, HBox *hbox, long (*collideBoundFunc)(), SVector *normal);
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

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndInstanceTrivialReject);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndWorld);

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

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndPoint);

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

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceList);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndHFace);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SAndT);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndTerrain);

void COLLIDE_InstanceTerrain(Instance *instance, Level *level);
INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_LineWithSignals);

void COLLIDE_InstanceTerrainSignal(Instance *instance, Level *level);
INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceTerrainSignal);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_CameraWithStreamSignals);

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

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndTfaceFunc);
