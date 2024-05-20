#include "common.h"
#include "Game/REAVER.h"
#include "Game/INSTANCE.h"
#include "Game/GAMELOOP.h"
#include "Game/MATH3D.h"

EXTERN STATIC short FireReaverFlag;

void SoulReaverInit(Instance *instance, GameTracker *gameTracker)
{
    ReaverData *data;

    if ((instance->flags & 0x20000))
    {
        data = (ReaverData *)instance->extraData;

        MEMPACK_Free((char *)data);
    }
    else
    {
        data = (ReaverData *)MEMPACK_Malloc(sizeof(ReaverData), 30);

        instance->extraData = (void *)data;

        FireReaverFlag = 0;

        data->CurrentReaver = 2;

        data->ReaverOn = 1;
        data->ReaverChargeTime = 0;
        data->ReaverShockAmount = 0;
        data->ReaverPickedUp = 0;
        data->ReaverSize = 4096;
        data->ReaverDeg = 0;
        data->ReaverScale = 4096;
        data->ReaverTargetScale = 4096;

        COLLIDE_SegmentCollisionOff(instance, 0);
    }

    FX_ReaverBladeInit();
}

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverCollide);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", SoulReaverProcess);

INCLUDE_ASM("asm/nonmatchings/Game/REAVER", CollideReaverProjectile);

unsigned long SoulReaverQuery(Instance *instance, unsigned long query)
{
    ReaverData *reaverData;
    unsigned long retval;

    switch (query)
    {
    case 1:
        return 0x20000;
    case 4:
        return 0x1000;
    case 40:
        reaverData = (ReaverData *)instance->extraData;

        if ((unsigned)reaverData->ReaverOn != 0)
        {
            if (reaverData->ReaverTargetScale != 0)
            {
                retval = 3;
            }
            else
            {
                retval = 1;
            }

            return retval;
        }
    default:
        retval = 0;
    }

    return retval;
}

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

void _SoulReaverAnimate(Instance *instance)
{
    ReaverData *data;
    ReaverTuneData *tuneData;

    data = (ReaverData *)instance->extraData;

    tuneData = (ReaverTuneData *)instance->data;

    FX_SetReaverInstance(instance);

    data->ReaverDeg += 256 + (rand() & 31);

    data->ReaverDeg &= 0xFFF;

    if ((unsigned char)data->ReaverOn == 1)
    {
        if (data->ReaverSize < 4096)
        {
            data->ReaverSize += 256;
        }
    }
    else if (data->ReaverSize > 0)
    {
        data->ReaverSize -= 256;
    }

    if (data->CurrentReaver > 0)
    {
        unsigned long *temp; // not from decls.h

        temp = &tuneData->spectralInnerColor;

        data->ReaverBladeColor = temp[data->CurrentReaver - 1];

        temp = &tuneData->spectralInnerGlowColor;

        data->ReaverBladeGlowColor = temp[data->CurrentReaver - 1];

        temp = &tuneData->spectralGlowColor;

        data->ReaverGlowColor = temp[data->CurrentReaver - 1];
    }

    if (abs_diff(data->ReaverTargetScale, data->ReaverScale) <= 128)
    {
        data->ReaverScale = data->ReaverTargetScale;
    }
    else
    {
        if (data->ReaverScale > data->ReaverTargetScale)
        {
            data->ReaverScale -= 128;
        }

        if (data->ReaverScale < data->ReaverTargetScale)
        {
            data->ReaverScale += 128;
        }
    }

    if (((unsigned char)data->ReaverOn == 1) && (data->ReaverScale > 0))
    {
        instance->flags &= ~0x800;
    }
    else
    {
        instance->flags |= 0x800;
    }

    SoulReaverCharge(instance, data);
}

int SoulReaverFire()
{
    return FireReaverFlag;
}
