#include "common.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_CalcDQPTable);
