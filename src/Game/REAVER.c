#include "common.h"
#include "Game/REAVER.h"
#include "Game/INSTANCE.h"

EXTERN STATIC short FireReaverFlag;

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverInit);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverCollide);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverProcess);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", CollideReaverProjectile);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverQuery);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverImbue);

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
