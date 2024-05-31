#include "common.h"
#include "Game/OBTABLE.h"

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_InstanceInit);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceCollideFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceAdditionalCollideFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceProcessFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceQueryFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_GetInstanceMessageFunc);

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_InitObjectWithID);

void OBTABLE_ClearObjectReferences()
{
    ObjectAccess *oa;

    for (oa = objectAccess; oa->objectName != NULL; oa++)
    {
        oa->object = NULL;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/OBTABLE", OBTABLE_RemoveObjectEntry);

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
