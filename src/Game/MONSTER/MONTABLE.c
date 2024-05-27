#include "common.h"
#include "Game/MONSTER.h"
#include "Game/MONSTER/MONTABLE.h"
#include "Game/MONSTER/MONAPI.h"

static MonsterFunctionTable DefaultFunctionTable = {
    MON_DefaultInit,
    MON_CleanUp,
    MON_DamageEffect,
    MonsterQuery,
    MonsterMessage,
    NULL,
    monVersion,
    NULL,
};

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_SetupTablePointer);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_GetStateFuncs);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_GetDamageEffectFunc);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONTABLE", MONTABLE_GetInitFunc);

void *MONTABLE_GetCleanUpFunc(Instance *instance)
{
    MonsterFunctionTable *ft;

    ft = (MonsterFunctionTable *)instance->object->relocModule;

    if ((ft != NULL) && (ft->cleanUpFunc != NULL))
    {
        return (void *)ft->cleanUpFunc;
    }

    return (void *)DefaultFunctionTable.cleanUpFunc;
}

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
