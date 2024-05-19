#include "common.h"
#include "Game/REAVER.h"
#include "Game/INSTANCE.h"

EXTERN STATIC short FireReaverFlag;

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverInit);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverCollide);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverProcess);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", CollideReaverProjectile);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverQuery);

void SoulReaverImbue(Instance *instance, int number)
{
    long color;
    ReaverTuneData *tuneData;

    tuneData = (ReaverTuneData *)instance->data;

    color = ((long *)tuneData)[number - 1];

    FX_DoBlastRing(instance, (SVector *)&instance->position, instance->matrix, 0, 320, 0, 240, 0, 0, -65536, 0, 0, 160, 320, color, 0, 0, 20, 1);
}

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverCharge);

void StopSoulReaverCharge(ReaverData *data, Instance *instance)
{
    data->ReaverChargeTime = 0;
    data->ReaverShockAmount = 0;

    GAMEPAD_Shock1(0, 0);

    FX_EndInstanceEffects(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverPost);

unsigned long REAVER_GetGlowColor(Instance *instance)
{
    ReaverTuneData *tuneData;
    ReaverData *data;

    data = (ReaverData *)instance->extraData;

    tuneData = (ReaverTuneData *)instance->data;

    return ((unsigned long *)tuneData)[data->CurrentReaver - 1];
}

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", _SoulReaverAnimate);

int SoulReaverFire()
{
    return FireReaverFlag;
}
