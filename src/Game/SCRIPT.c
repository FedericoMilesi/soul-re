#include "common.h"
#include "Game/MATH3D.h"
#include "Game/GAMELOOP.h"
#include "Game/G2/QUATG2.h"
#include "Game/SPLINE.h"
#include "Game/SCRIPT.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_InstanceSplineInit);

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

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", ScriptGetRotSpline);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_GetSplineFrameNumber);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_GetMultiSpline);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_GetPosSplineDef);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_GetRotSplineDef);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_GetScaleSplineDef);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_RelativisticSpline);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_InstanceSplineSet);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_SplineProcess);

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", SCRIPT_InstanceSplineProcess);

void SCRIPT_FadeOutProcess(Instance *instance)
{
    instance->fadeValue += (gameTrackerX.timeMult / 32);

    if (instance->fadeValue >= 4096)
    {
        INSTANCE_PlainDeath(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/SCRIPT", ScriptKillInstance);
