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

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", StopSoulReaverCharge);

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
