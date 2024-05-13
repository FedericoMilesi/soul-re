#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_GetLightMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_PresetInstanceLight);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_GetAmbient);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_CalcLightValue);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_SetAmbientInstance);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_SetMatrixForLightGroupInstance);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_DrawShadow);

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_CalcShadowPositions);

void LIGHT_Restore(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/LIGHT3D", LIGHT_CalcDQPTable);
