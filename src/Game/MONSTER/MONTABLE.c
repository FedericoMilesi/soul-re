#include "common.h"
#include "Game/MONSTER/MONTABLE.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_SetupTablePointer);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_GetStateFuncs);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_GetDamageEffectFunc);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_GetInitFunc);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_GetCleanUpFunc);

void MONTABLE_SetQueryFunc(Instance *instance)
{
    MonsterFunctionTable *ft;

    ft = (MonsterFunctionTable *)instance->object->relocModule;

    if ((ft != NULL) && (ft->queryFunc != NULL))
    {
        instance->queryFunc = ft->queryFunc;
    }
}

void MONTABLE_SetMessageFunc(Instance *instance)
{
    MonsterFunctionTable *ft;

    ft = (MonsterFunctionTable *)instance->object->relocModule;

    if ((ft != NULL) && (ft->messageFunc != NULL))
    {
        instance->messageFunc = ft->messageFunc;
    }
}
