#include "common.h"
#include "Game/DRAW.h"

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", fDRAW_SPLIT_INTPL_XYZ);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_InitShadow);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_DrawShadow);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_FlatQuad);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_TranslucentQuad);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_DrawButton);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_LoadButton);

void DRAW_FreeButton(ButtonTexture *button)
{
    VRAM_ClearVramBlock(button->vramBlock);
}

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_RingLine);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_RingPoint);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_DrawRingPoints);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_GlowQuad);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_CreateAGlowingCircle);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_DrawGlowPoints2);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_DrawGlowPoint);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_DisplayTFace_zclipped_C);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_Zclip_subdiv);

INCLUDE_ASM("asm/nonmatchings/Game/DRAW", DRAW_LoadingMessage);
