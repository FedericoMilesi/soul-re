#include "common.h"
#include "Game/UNDRWRLD.h"
#include "Game/MATH3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_StartProcess);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_RotateScreenStep);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_DoUV);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_Poly);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_DisplayFrame);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_SetupSource);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_InitDisplayProcess);

INCLUDE_ASM("asm/nonmatchings/Game/UNDRWRLD", UNDERWORLD_LoadLevel);

void UNDERWORLD_UpdatePlayer(Intro *playerIntro, Instance *instance)
{
    SVector offset;

    SUB_VEC(&offset, &playerIntro->position, &instance->position);

    STREAM_RelocateInstance(instance, &offset);
}
