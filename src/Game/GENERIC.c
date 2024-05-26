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

unsigned long GenericQuery(Instance *instance, unsigned long query)
{
    long ret;
    evControlSaveDataData *pdata;
    Object *object;

    ret = 0;

    switch (query)
    {
    case 6:
        ret = SetPositionData(instance->position.x, instance->position.y, instance->position.z);
        break;
    case 7:
        ret = SetPositionData(instance->rotation.x, instance->rotation.y, instance->rotation.z);
        break;
    case 11:
        ret = 1;

        if ((instance->flags2 & 0x8000000))
        {
            ret = 2;
        }

        break;
    case 12:
        ret = (long)instance->matrix;
        break;
    case 17:
        ret = G2EmulationInstanceQueryAnimation(instance, 0);
        break;
    case 18:
        ret = G2EmulationInstanceQueryFrame(instance, 0);
        break;
    case 24:
        if ((instance->flags2 & 0x4))
        {
            pdata = (evControlSaveDataData *)CIRC_Alloc(sizeof(evControlSaveDataData) + 4);

            ret = (long)pdata;

            pdata->length = 8;

            memcpy(pdata->data, &instance->flags, 8);
        }

        break;
    case 1:
        object = instance->object;

        if ((object->oflags2 & 0x4000000))
        {
            ret = 0x40000;
            break;
        }

        if ((object->oflags & 0x100000))
        {
            ret = 0x100000;
            break;
        }

        if ((object->oflags2 & 0x20))
        {
            ret = 0x200000;
            break;
        }

        ret = 0x80000000;
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
        ret = 0;
        break;
    }

    return ret;
}

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
