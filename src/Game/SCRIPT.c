#include "common.h"
#include "Game/MATH3D.h"
#include "Game/GAMELOOP.h"
#include "Game/G2/QUATG2.h"
#include "Game/SPLINE.h"
#include "Game/SCRIPT.h"
#include "Game/G2/QUATG2.h"
#include "Game/HASM.h"

void SCRIPT_CombineEulerAngles(Rotation *combinedRotation, Rotation *inputRotation1, Rotation *inputRotation2)
{
    MATRIX rotMatrix1;
    MATRIX rotMatrix2;
    G2EulerAngles ea;

    RotMatrix((SVECTOR *)inputRotation1, &rotMatrix1);
    RotMatrix((SVECTOR *)inputRotation2, &rotMatrix2);

    MulMatrix2(&rotMatrix2, &rotMatrix1);

    G2EulerAngles_FromMatrix(&ea, (G2Matrix *)&rotMatrix1, 21);

    COPY_SVEC(Rotation, combinedRotation, G2EulerAngles, &ea);
}

void SCRIPT_InstanceSplineInit(Instance *instance)
{
    Spline *spline;
    RSpline *rspline;
    Spline *sspline;
    MultiSpline *multi;
    SplineDef *sd;
    SplineDef *rsd;
    SplineDef *ssd;
    unsigned long isParent;
    unsigned long isClass;

    multi = SCRIPT_GetMultiSpline(instance, &isParent, &isClass);

    if (multi != NULL)
    {
        sd = SCRIPT_GetPosSplineDef(instance, multi, isParent, isClass);
        rsd = SCRIPT_GetRotSplineDef(instance, multi, isParent, isClass);
        ssd = SCRIPT_GetScaleSplineDef(instance, multi, isParent, isClass);

        spline = multi->positional;
        rspline = multi->rotational;
        sspline = multi->scaling;

        if (rspline != NULL)
        {
            G2Quat *q;
            G2EulerAngles ea;

            q = SplineGetFirstRot(rspline, rsd);

            if ((isParent == 0) && (isClass == 0))
            {
                if (1)
                {
                    G2Quat_ToMatrix_S(q, (G2Matrix *)&multi->curRotMatrix);

                    q = (G2Quat *)&instance->rotation;

                    if (instance->intro != NULL)
                    {
                        MATRIX introTransform;

                        RotMatrix((SVECTOR *)&instance->intro->rotation, &introTransform);

                        MulMatrix0(&multi->curRotMatrix, &introTransform, &multi->curRotMatrix);
                    }

                    instance->flags |= 0x1;
                }
            }
            else
            {
                Rotation combinedRotation;

                G2Quat_ToEuler(q, &ea, 0);

                instance->rotation.x = ea.x;
                instance->rotation.y = ea.y;
                instance->rotation.z = ea.z;

                SCRIPT_CombineEulerAngles((Rotation *)&combinedRotation, (Rotation *)&instance->rotation, &instance->intro->rotation);

                COPY_SVEC(Rotation, &instance->rotation, Rotation, &combinedRotation);
            }
        }

        if (spline != NULL)
        {
            SVector *start_point;

            start_point = SplineGetFirstPoint(spline, sd);

            if (start_point != NULL)
            {
                if (isClass != 0)
                {
                    ADD_SVEC(Position, &instance->position, Position, &instance->initialPos, SVector, start_point);
                }
                else
                {
                    instance->position.x = start_point->x;
                    instance->position.y = start_point->y;
                    instance->position.z = start_point->z;
                }
            }
        }

        if (sspline != NULL)
        {
            SVector *start_point;

            start_point = SplineGetFirstPoint(sspline, ssd);

            if (start_point != NULL)
            {
                instance->scale.x = start_point->x;
                instance->scale.y = start_point->y;
                instance->scale.z = start_point->z;
            }
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPTCountFramesInSpline);

Spline *ScriptGetPosSpline(Instance *instance)
{
    MultiSpline *multi;

    multi = SCRIPT_GetMultiSpline(instance, NULL, NULL);

    if (multi != NULL)
    {
        return multi->positional;
    }

    return NULL;
}

RSpline *ScriptGetRotSpline(Instance *instance)
{
    MultiSpline *multi;

    multi = SCRIPT_GetMultiSpline(instance, NULL, NULL);

    if (multi != NULL)
    {
        return multi->rotational;
    }

    return NULL;
}

int SCRIPT_GetSplineFrameNumber(Instance *instance, SplineDef *splineDef)
{
    if (ScriptGetPosSpline(instance) != NULL)
    {
        return SplineGetFrameNumber(ScriptGetPosSpline(instance), splineDef);
    }
    else
    {
        return SplineGetFrameNumber((Spline *)ScriptGetRotSpline(instance), splineDef);
    }
}

MultiSpline *SCRIPT_GetMultiSpline(Instance *instance, unsigned long *isParent, unsigned long *isClass)
{
    MultiSpline *multi;

    multi = NULL;

    if (isParent != NULL)
    {
        *isParent = 0;
    }

    if (isClass != NULL)
    {
        *isClass = 0;
    }

    if ((instance != NULL) && (instance->intro != NULL) && (instance->intro->multiSpline != NULL))
    {
        multi = instance->intro->multiSpline;

        if (((instance->flags & 0x100002) == 0x2) && (isParent != NULL))
        {
            *isParent = 1;
        }
    }

    if ((multi == NULL) && (instance->object->modelList[0] != NULL))
    {
        multi = instance->object->modelList[0]->multiSpline;

        if (isClass != NULL)
        {
            *isClass = 1;
        }
    }

    return multi;
}

SplineDef *SCRIPT_GetPosSplineDef(Instance *instance, MultiSpline *multi, unsigned long isParent, unsigned long isClass)
{
    SplineDef *splineDef;

    if ((isParent != 0) || (isClass != 0))
    {
        splineDef = (SplineDef *)&instance->work0;

        return splineDef;
    }

    if (multi == NULL)
    {
        return NULL;
    }

    return &multi->curPositional;
}

SplineDef *SCRIPT_GetRotSplineDef(Instance *instance, MultiSpline *multi, unsigned long isParent, unsigned long isClass)
{
    SplineDef *splineDef;

    if ((isParent != 0) || (isClass != 0))
    {
        splineDef = (SplineDef *)&instance->work2;

        return splineDef;
    }

    if (multi == NULL)
    {
        return NULL;
    }

    return &multi->curRotational;
}

SplineDef *SCRIPT_GetScaleSplineDef(Instance *instance, MultiSpline *multi, unsigned long isParent, unsigned long isClass)
{
    SplineDef *splineDef;

    if ((isParent != 0) || (isClass != 0))
    {
        splineDef = (SplineDef *)&instance->work4;

        return splineDef;
    }

    if (multi == NULL)
    {
        return NULL;
    }

    return &multi->curScaling;
}

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_RelativisticSpline);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_InstanceSplineSet);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_SplineProcess);

long SCRIPT_InstanceSplineProcess(Instance *instance, SplineDef *splineDef, SplineDef *rsplineDef, SplineDef *ssplineDef, int direction)
{
    MultiSpline *multi;
    unsigned long isClass;
    unsigned long isParent;

    multi = SCRIPT_GetMultiSpline(instance, &isParent, &isClass);

    if (multi != NULL)
    {
        if (((isParent != 0) || (isClass != 0)) || ((splineDef == NULL) && (rsplineDef == NULL) && (ssplineDef == NULL)))
        {
            splineDef = SCRIPT_GetPosSplineDef(instance, multi, isParent, isClass);
            rsplineDef = SCRIPT_GetRotSplineDef(instance, multi, isParent, isClass);
            ssplineDef = SCRIPT_GetScaleSplineDef(instance, multi, isParent, isClass);
        }

        return SCRIPT_SplineProcess(instance, multi, splineDef, rsplineDef, ssplineDef, direction, isClass);
    }

    return -1;
}

void SCRIPT_FadeOutProcess(Instance *instance)
{
    instance->fadeValue += (gameTrackerX.timeMult / 32);

    if (instance->fadeValue >= 4096)
    {
        INSTANCE_PlainDeath(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", ScriptKillInstance);
