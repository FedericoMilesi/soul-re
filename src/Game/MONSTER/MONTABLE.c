#include "common.h"
#include "Game/MONSTER.h"
#include "Game/MONSTER/MONTABLE.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/SOUL.h"
#include "Game/MONSTER/SLUAGH.h"
#include "Game/MONSTER/VWRAITH.h"
#include "Game/MONSTER/WORSHIP.h"
#include "Game/MONSTER/HUMAN.h"

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

static MonsterChoice functionChoiceTable[] = {
    { 4, &SOUL_FunctionTable },
    { 0x802, &SLUAGH_FunctionTable },
    { 0x1002, &VWRAITH_FunctionTable },
    { 0x2008, &WORSHIP_FunctionTable },
    { 0x8008, &HUMAN_FunctionTable },
    { 0, NULL },
};

static MonsterStateFunction DefaultStateTable[] = {
    { MON_BirthEntry, MON_Birth },
    { MON_PursueEntry, MON_Pursue },
    { MON_IdleEntry, MON_Idle },
    { MON_MissileHitEntry, MON_MissileHit },
    { MON_FallEntry, MON_Fall },
    { MON_WanderEntry, MON_Wander },
    { MON_AttackEntry, MON_Attack },
    { MON_ImpaleDeathEntry, MON_ImpaleDeath },
    { MON_HitEntry, MON_Hit },
    { MON_StunnedEntry, MON_Stunned },
    { MON_GrabbedEntry, MON_Grabbed },
    { MON_ThrownEntry, MON_Thrown },
    { MON_ImpactEntry, MON_Impact },
    { MON_CombatEntry, MON_Combat },
    { MON_BreakHoldEntry, MON_BreakHold },
    { MON_LandOnFeetEntry, MON_LandOnFeet },
    { MON_GeneralDeathEntry, MON_GeneralDeath },
    { MON_EnvironmentDamageEntry, MON_EnvironmentDamage },
    { MON_LandInWaterEntry, MON_LandInWater },
    { MON_FleeEntry, MON_Flee },
    { MON_HideEntry, MON_Hide },
    { MON_SurpriseAttackEntry, MON_SurpriseAttack },
    { MON_ParryEntry, MON_Parry },
    { MON_DeadEntry, MON_Dead },
    { MON_SurprisedEntry, MON_Surprised },
    { MON_NoticeEntry, MON_Notice },
    { MON_PupateEntry, MON_Pupate },
    { MON_EmbraceEntry, MON_Embrace },
    { MON_ProjectileEntry, MON_Projectile },
    { MON_TerrainImpaleDeathEntry, MON_TerrainImpaleDeath },
    { MON_PetrifiedEntry, MON_Petrified },
};

void MONTABLE_SetupTablePointer(Object *object)
{
    long whatAmI;
    int i; // not from decls.h

    whatAmI = ((MonsterAttributes *)(object->data))->whatAmI;

    for (i = 0; functionChoiceTable[i].whatAmI != 0; i++)
    {
        if (whatAmI == functionChoiceTable[i].whatAmI)
        {
            object->relocModule = functionChoiceTable[i].table;
        }
    }
}

MonsterStateFunction *MONTABLE_GetStateFuncs(Instance *instance, int state)
{
    MonsterFunctionTable *ft;

    ft = (MonsterFunctionTable *)instance->object->relocModule;

    if (ft != NULL)
    {
        MonsterStateChoice *choice;

        choice = ft->stateFuncs;

        while (choice->state != -1)
        {
            if (state == choice->state)
            {
                return (MonsterStateFunction *)&choice->functions.entryFunction;
            }

            choice++;
        }
    }

    return (MonsterStateFunction *)&DefaultStateTable[state].entryFunction;
}

void *MONTABLE_GetDamageEffectFunc(Instance *instance)
{
    MonsterFunctionTable *ft;

    ft = (MonsterFunctionTable *)instance->object->relocModule;

    if ((ft != NULL) && (ft->damageEffectFunc != NULL))
    {
        return (void *)ft->damageEffectFunc;
    }

    return (void *)DefaultFunctionTable.damageEffectFunc;
}

void *MONTABLE_GetInitFunc(Instance *instance)
{
    MonsterFunctionTable *ft;

    ft = (MonsterFunctionTable *)instance->object->relocModule;

    if ((ft != NULL) && (ft->initFunc != NULL))
    {
        return (void *)ft->initFunc;
    }

    return (void *)DefaultFunctionTable.initFunc;
}

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
