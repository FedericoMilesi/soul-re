#include "common.h"
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

INCLUDE_ASM("asm/nonmatchings/Game/GENERIC", GenericRelocateTune);
