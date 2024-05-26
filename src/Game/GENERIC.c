#include "common.h"
#include "Game/GENERIC.h"
#include "Game/INSTANCE.h"
#include "Game/GAMELOOP.h"
#include "Game/OBTABLE.h"
#include "Game/STATE.h"
#include "Game/SAVEINFO.h"

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

void GenericMessage(Instance *instance, unsigned long message, unsigned long data)
{
    evAnimationInstanceSwitchData *Ptr;

    switch (message)
    {
    case 0x8000008:
        Ptr = (evAnimationInstanceSwitchData *)data;

        if (instance->anim.section[0].interpInfo != NULL)
        {
            G2EmulationInstanceSetAnimation(instance, 0, Ptr->anim, Ptr->frame, Ptr->frames);
        }
        else
        {
            G2EmulationInstanceSetAnimation(instance, 0, Ptr->anim, Ptr->frame, 0);
        }

        G2EmulationInstanceSetMode(instance, 0, Ptr->mode);
        break;
    case 0x4000A:
        STREAM_SetInstancePosition(instance, (evPositionData *)data);
        break;
    case 0x4000B:
    {
        evPositionData *temp; // not from decls.h

        temp = (evPositionData *)data;

        instance->rotation.x = temp->x;
        instance->rotation.y = temp->y;
        instance->rotation.z = temp->z;
        break;
    }
    case 0x8000010:
        G2EmulationInstanceSetMode(instance, 0, data);
        break;
    case 0x40002:
        ScriptKillInstance(instance, data);
        break;
    case 0x100007:
    {
        evControlSaveDataData *temp; // not from decls.h

        temp = (evControlSaveDataData *)data;

        instance->flags = ((MonsterSaveInfo *)temp->data)->mvFlags;
        instance->flags2 = ((MonsterSaveInfo *)temp->data)->auxFlags;
        break;
    }
    }
}

void GenericRelocateTune(Object *object, long offset)
{
    GenericTune *tune;

    tune = (GenericTune *)object->data;

    if ((tune != NULL) && (tune->shatterData != NULL))
    {
        tune->shatterData = (char *)tune->shatterData + offset;
    }
}
