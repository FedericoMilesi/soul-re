#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/SPLINE.h"
#include "Game/OBTABLE.h"

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Deactivate);

void INSTANCE_Reactivate(Instance *instance)
{
    Object *object;

    object = instance->object;

    instance->flags2 &= ~0x1;

    if ((instance->flags & 0x40000))
    {
        instance->flags &= ~0x40000;
        instance->flags2 |= 0x20000000;
    }
    else
    {
        instance->flags2 &= ~0x20000000;
    }

    if (object->animList != NULL)
    {
        if (!(object->oflags2 & 0x40000000))
        {
            G2Anim_Restore(&instance->anim);
        }
    }
}

void INSTANCE_ForceActive(Instance *instance)
{
    if ((instance->flags2 & 0x1))
    {
        INSTANCE_Reactivate(instance);
    }
}

void INSTANCE_DeactivatedProcess(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DeactivateFarInstances);

void INSTANCE_InitInstanceList(InstanceList *list, InstancePool *pool)
{
    long i;

    pool->numFreeInstances = 60;

    for (i = 1; i < 59; i++)
    {
        pool->instance[i].next = &pool->instance[i + 1];
        pool->instance[i].prev = &pool->instance[i - 1];
    }

    pool->instance[0].next = &pool->instance[1];
    pool->instance[0].prev = NULL;

    pool->instance[59].prev = &pool->instance[58];
    pool->instance[59].next = NULL;

    pool->first_free = &pool->instance[0];

    list->pool = pool;

    list->numInstances = 0;

    list->first = NULL;

    for (i = 0; i < 32; i++)
    {
        list->group[i].next = NULL;
        list->group[i].prev = NULL;
    }

    pool->nextInstanceID = 1;
}

Instance *INSTANCE_NewInstance(InstanceList *list)
{
    Instance *temp;
    Instance *instance;

    if (list->pool->numFreeInstances != 0)
    {
        list->pool->numFreeInstances--;

        instance = list->pool->first_free;

        list->pool->first_free = instance->next;

        temp = list->first;

        list->first = instance;

        instance->next = temp;

        if (instance->next != NULL)
        {
            temp->prev = instance;
        }

        instance->prev = NULL;

        instance->instanceID = list->pool->nextInstanceID++;

        list->numInstances++;

        return instance;
    }

    return NULL;
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InstanceGroupNumber);

void INSTANCE_InsertInstanceGroup(InstanceList *list, Instance *instance)
{
    LIST_InsertFunc(&list->group[INSTANCE_InstanceGroupNumber(instance)], &instance->node);
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ReallyRemoveInstance);

void INSTANCE_CleanUpInstanceList(InstanceList *list, long reset)
{
    Instance *instance;
    Instance *next;

    instance = list->first;

    while (instance != NULL)
    {
        next = instance->next;

        if (!(instance->flags & 0x400))
        {
            if ((instance->flags & 0x20))
            {
                instance->flags |= 0x20;
            }
        }
        else if ((instance->flags & 0x20))
        {
            instance->flags &= ~0x20;
        }

        instance = next;
    }

    instance = list->first;

    while (instance != NULL)
    {
        next = instance->next;

        if ((instance->flags & 0x20))
        {
            INSTANCE_ReallyRemoveInstance(list, instance, reset);
        }

        instance = next;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Introduced);

INICommand *INSTANCE_GetIntroCommand(INICommand *command, int cmd)
{
    if (command != NULL)
    {
        while (command->command != 0)
        {
            if (command->command != cmd)
            {
                command += command->numParameters + 1;
            }
            else
            {
                return command;
            }
        }
    }

    return 0;
}

INICommand *INSTANCE_FindIntroCommand(Instance *instance, int cmd)
{
    return INSTANCE_GetIntroCommand((INICommand *)instance->introData, cmd);
}

void INSTANCE_ProcessIntro(Instance *instance)
{
    INICommand *command;

    if (instance->introData != NULL)
    {
        command = (INICommand *)instance->introData;

        if (!(instance->flags & 0x2))
        {
            while (command->command != 0)
            {
                if (command->command == 18)
                {
                    instance->currentModel = (short)command->parameter[0];
                }

                command += command->numParameters + 1;
            }
        }
    }
}

void INSTANCE_InitEffects(Instance *instance, Object *object)
{
    int i;

    if ((!(object->oflags2 & 0x100)) && (object->numberOfEffects != 0))
    {
        for (i = 0; i < object->numberOfEffects; i++)
        {
            FX_StartInstanceEffect(instance, &object->effectList[i], 1);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_AdditionalCollideFunctions);

long INSTANCE_GetSplineFrameNumber(Instance *instance, MultiSpline *spline)
{
    return SCRIPT_GetSplineFrameNumber(instance, SCRIPT_GetPosSplineDef(instance, spline, 0, 0));
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ProcessFunctions);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_BirthObject);

void INSTANCE_BuildStaticShadow(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DefaultInit);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_PlainDeath);

void INSTANCE_KillInstance(Instance *instance)
{
    if (!(instance->flags & 0x20))
    {
        INSTANCE_PlainDeath(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Query);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Post);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Broadcast);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InPlane);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_FindWithID);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_FindWithName);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_FindIntro);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Find);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceSavedInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceSavedInstanceWithIntro);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_SpatialRelationships);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_SetStatsData);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_LinkToParent);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_UnlinkFromParent);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_UnlinkChildren);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_UpdateFamilyStreamUnitID);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ReallyRemoveAllChildren);

Instance *INSTANCE_GetChildLinkedToSegment(Instance *instance, int segment)
{
    Instance *child;

    child = instance->LinkChild;

    while (child != NULL)
    {
        if (child->ParentLinkNode == segment)
        {
            break;
        }

        child = child->LinkSibling;
    }

    return child;
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Linked);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_GetFadeValue);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DefaultAnimCallback);
