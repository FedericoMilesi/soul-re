#include "common.h"
#include "Game/MONSTER/MONSTER.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MONMSG.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_DoCombatTimers);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_ChangeHumanOpinion);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_CutOut_Monster);

void MON_DeadEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    MON_TurnOffAllSpheres(instance);

    if ((mv->enemy != NULL) && ((INSTANCE_Query(mv->enemy->instance, 1) & 0x1)))
    {
        MON_ChangeHumanOpinion(instance);
    }

    if (mv->previousMainState == -1)
    {
        MON_PlayAnim(instance, MONSTER_ANIM_GENERALDEATH, 1);
    }

    mv->mvFlags |= 0x200;

    instance->flags2 &= ~0x20000;
    instance->flags2 &= ~0x40;
    instance->flags2 &= ~0x80;

    mv->damageTimer = 0;

    if (mv->soulJuice != 0)
    {
        if (mv->soulID == 0)
        {
            MON_BirthSoul(instance, 1);
        }
    }
    else
    {
        mv->damageTimer = MON_GetTime(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Dead);

void MON_MissileHitEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    instance->xAccl = 0;
    instance->yAccl = 0;

    instance->xVel = 0;
    instance->yVel = 0;

    MON_PlayAnim(instance, MONSTER_ANIM_MISSILEIMPALEDEATH, 1);

    mv->mvFlags |= 0x200000;
    mv->mvFlags &= ~0x10;

    MON_TurnOffAllSpheres(instance);

    mv->causeOfDeath = 0;

    MON_DropAllObjects(instance);

    mv->heldID = mv->held->introUniqueID;

    INSTANCE_Post(mv->held, 0x800002, SetObjectData(0, 0, 0, instance, 3));

    SOUND_Play3dSound(&instance->position, 39, -100, 100, 16000);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_MissileHit);

void MON_BirthEntry(Instance *instance)
{
    (void)instance;
}

void MON_Birth(Instance *instance)
{
    MON_SwitchState(instance, MONSTER_STATE_IDLE);
}

void MON_ParryEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    MON_PlayAnim(instance, MONSTER_ANIM_JUMPRIGHT, 1);

    do {} while (0); // garbage code for reordering

    MON_TurnToPosition(instance, &mv->enemy->instance->position, 4096);
}

void MON_Parry(Instance *instance)
{
    if ((instance->flags2 & 0x10))
    {
        MON_SwitchState(instance, MONSTER_STATE_COMBAT);
    }

    MON_DefaultQueueHandler(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_LandOnFeetEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_LandOnFeet);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_LandInWaterEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_LandInWater);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_BreakHoldEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_BreakHold);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_ImpactEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Impact);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_FallEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Fall);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_ThrownEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Thrown);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_ImpaleDeathEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_ImpaleDeath);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_TerrainImpaleDeathEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_TerrainImpaleDeath);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_SurprisedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Surprised);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_StunnedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Stunned);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_GrabbedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Grabbed);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_HitEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Hit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_AttackEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Attack);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_CombatEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Combat);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_ProjectileEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Projectile);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_IdleEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Idle);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_FleeEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Flee);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_PursueEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Pursue);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_WanderEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Wander);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_HideEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Hide);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_SurpriseAttackEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_SurpriseAttack);

void MON_EnvironmentDamageEntry(Instance *instance)
{
    (void)instance;
}

void MON_EnvironmentDamage(Instance *instance)
{
    (void)instance;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_MonsterGlow);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_GeneralDeathEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_GeneralDeath);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_NoticeEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Notice);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_PupateEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Pupate);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_EmbraceEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Embrace);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_PetrifiedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Petrified);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MONSTER_CalcDamageIntensity);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MONSTER_ProcessClosestVerts);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", ProcessBloodyMess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MONSTER_InitVertexColors);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MONSTER_StartVertexBlood);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MONSTER_VertexBlood);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", ProcessBurntMess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MONSTER_StartVertexBurnt);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MONSTER_VertexBurnt);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_DamageEffect);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_DefaultInit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_CleanUp);
