#include "common.h"
#include "Game/DRAW.h"
#include "Game/VRAM.h"

SVECTOR shadow_vertices[11];

void fDRAW_SPLIT_INTPL_XYZ(SVector *newVertex, SVector *pvb, SVector *pvc)
{
    newVertex->x = pvb->x + ((pvb->z * (pvc->x - pvb->x)) / (pvb->z - pvc->z));
    newVertex->y = pvb->y + ((pvb->z * (pvc->y - pvb->y)) / (pvb->z - pvc->z));
    newVertex->z = 0;
}

void DRAW_InitShadow()
{
    int n;
    int inc;
    int deg;

    deg = 0;

    inc = 1677721;

    for (n = 0; n < 10; n++)
    {
        shadow_vertices[n].vx = rcos(deg / 4096) / 32;
        shadow_vertices[n].vy = rsin(deg / 4096) / 32;
        shadow_vertices[n].vz = 0;

        deg += inc;
    }

    shadow_vertices[10].vx = shadow_vertices[0].vx;
    shadow_vertices[10].vy = shadow_vertices[0].vy;
    shadow_vertices[10].vz = shadow_vertices[0].vz;
}

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
