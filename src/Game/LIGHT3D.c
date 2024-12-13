#include "common.h"
#include "Game/HASM.h"

static inline int LIGHT3D_FixedDivision(long a, long b)
{
    long r;

    r = (a << 12) / (a - b);

    return r;
}

static inline void LIGHT3D_FogCalc(long a, Level *level)
{
    int r;

    r = (a * level->fogFar) / (a - level->fogFar);

    if (level->holdFogNear == level->fogNear)
    {
        level->holdFogNear = r;
    }

    level->fogNear = r;
}

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_GetLightMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_PresetInstanceLight);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_GetAmbient);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_CalcLightValue);

void LIGHT_SetAmbientInstance(Instance *instance, Level *level)
{
    (void)level;
    SetBackColor(((ColorType *)&instance->light_color)->r, ((ColorType *)&instance->light_color)->g, ((ColorType *)&instance->light_color)->b);
}

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_SetMatrixForLightGroupInstance);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_DrawShadow);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_CalcShadowPositions);

void LIGHT_Restore()
{
}

void LIGHT_CalcDQPTable(Level *level)
{
    long dqa;
    long limit;

    if (level->fogFar != level->fogNear)
    {
        dqa = -((level->fogFar * level->fogNear) / (level->fogFar - level->fogNear));

        limit = 40958;

        if (dqa > limit)
        {
            dqa = limit;

            LIGHT3D_FogCalc(limit, level);
        }

        if (dqa < -limit)
        {
            dqa = -limit;

            LIGHT3D_FogCalc(-limit, level);
        }

        depthQFogStart = (4096 * -dqa) / LIGHT3D_FixedDivision(level->fogFar, level->fogNear);

        if ((level->backColorR != 0) || (level->backColorG != 0))
        {
            depthQBlendStart = depthQFogStart;
        }
        else
        {
            depthQBlendStart = 65535;
        }

        level->depthQFogStart = depthQFogStart;
        level->depthQBlendStart = depthQBlendStart;
    }
}
