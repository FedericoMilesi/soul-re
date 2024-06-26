#include "common.h"
#include "Game/MATH3D.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndInstance);

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
