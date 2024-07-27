#include "common.h"
#include "Game/OBTABLE.h"

ObjectFunc objectFunc[8924+8];

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_InstanceInit);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceCollideFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceAdditionalCollideFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceProcessFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceQueryFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceMessageFunc);

void OBTABLE_InitObjectWithID(Object *object)
{
    long id;

    if (object != NULL)
    {
        ObjectAccess *oa;

        if ((object->oflags2 & 0x40000))
        {
            for (id = 0; (objectFunc[id].scriptName != NULL) && (strcmp(objectFunc[id].scriptName, "physical")); id++)
            {

            }
        }
        else if ((object->oflags2 & 0x80000))
        {
            for (id = 0; (objectFunc[id].scriptName != NULL) && (strcmp(objectFunc[id].scriptName, "monster_")); id++)
            {

            }
        }
        else
        {
            for (id = 0; (objectFunc[id].scriptName != NULL) && (strcmp(objectFunc[id].scriptName, object->script)); id++)
            {

            }
        }

        if (objectFunc[id].scriptName != NULL)
        {
            object->id = (short)id;
        }
        else
        {
            object->id = -1;
        }

        for (oa = objectAccess; oa->objectName != NULL; oa++)
        {
            if ((((unsigned int *)oa->objectName)[0] == ((unsigned int *)object->name)[0])
            && (((unsigned int *)oa->objectName)[1] == ((unsigned int *)object->name)[1]))
            {
                oa->object = object;
                break;
            }
        }
    }
}

void OBTABLE_ClearObjectReferences()
{
    ObjectAccess *oa;

    for (oa = objectAccess; oa->objectName != NULL; oa++)
    {
        oa->object = NULL;
    }
}

void OBTABLE_RemoveObjectEntry(Object *object)
{
    ObjectAccess *oa;

    for (oa = objectAccess; oa->objectName != NULL; oa++)
    {
        if (oa->object == object)
        {
            oa->object = NULL;
            break;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_FindObject);

void OBTABLE_ChangeObjectAccessPointers(Object *oldObject, Object *newObject)
{
    ObjectAccess *oa;

    for (oa = objectAccess; oa->objectName != NULL; oa++)
    {
        if (oa->object == oldObject)
        {
            oa->object = newObject;
            break;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_RelocateObjectTune);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_RelocateInstanceObject);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_InitAnimPointers);
