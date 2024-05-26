#include "common.h"
#include "Game/GENERIC.h"
#include "Game/INSTANCE.h"
#include "Game/GAMELOOP.h"
#include "Game/OBTABLE.h"

INCLUDE_ASM("asm/nonmatchings/Game/GENERIC", GenericInit);

void GenericCollide(void)
{
}

void GenericProcess(Instance *instance, GameTracker *gameTracker)
{
    Object *object;

    object = instance->object;

    if ((object != NULL) && (object->numAnims != 0) && (!(object->oflags2 & 0x40000000)))
    {
        G2EmulationInstancePlayAnimation(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/GENERIC", GenericQuery);

INCLUDE_ASM("asm/nonmatchings/Game/GENERIC", GenericMessage);

void GenericRelocateTune(Object *object, long offset)
{
    GenericTune *tune;

    tune = (GenericTune *)object->data;

    if ((tune != NULL) && (tune->shatterData != NULL))
    {
        tune->shatterData = (char *)tune->shatterData + offset;
    }
}
