#include "common.h"
#include "Game/MONSTER/MONSTER.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MONMSG.h"
#include "Game/MONSTER/MONSENSE.h"
#include "Game/PHYSICS.h"
#include "Game/MONSTER/MISSILE.h"
#include "Game/G2/ANMG2ILF.h"
#include "Game/MATH3D.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/FX.h"

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

void MON_LandInWaterEntry(Instance *instance)
{
    instance->checkMask &= ~0x20;
}

void MON_LandInWater(Instance *instance)
{
    MON_SwitchState(instance, MONSTER_STATE_FALL);
}

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

void MON_Stunned(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    if ((instance->flags2 & 0x10))
    {
        if (!(mv->mvFlags & 0x100))
        {
            MON_SwitchState(instance, MONSTER_STATE_COMBAT);
        }
        else
        {
            MON_PlayAnim(instance, MONSTER_ANIM_STUNNED, 1);
        }
    }

    if (mv->generalTimer < MON_GetTime(instance))
    {
        instance->xVel = 0;
        instance->yVel = 0;
        instance->zVel = 0;
    }

    if ((!(mv->mvFlags & 0x100)) && (MON_AnimPlaying(instance, MONSTER_ANIM_STUNNED_RECOVERY) == 0))
    {
        MON_PlayAnim(instance, MONSTER_ANIM_STUNNED_RECOVERY, 1);
    }

    MON_DefaultQueueHandler(instance);

    PHYSICS_StopIfCloseToTarget(instance, 0, 0, 0);

    PhysicsMove(instance, &instance->position, gameTrackerX.timeMult);

    if (instance->currentMainState != MONSTER_STATE_STUNNED)
    {
        instance->checkMask &= ~0x20;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_GrabbedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Grabbed);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_HitEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Hit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_AttackEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Attack);

void MON_CombatEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    mv->mode = 0x2000000;

    mv->mvFlags &= ~0x40000;
    mv->mvFlags |= 0x10000;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Combat);

void MON_ProjectileEntry(Instance *instance)
{
    MonsterVars *mv;
    MonsterAttributes *ma;
    MonsterMissile *missileDef;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    missileDef = &ma->missileList[(int)mv->subAttr->combatAttributes->missileAttack];

    do {} while (0); // garbage code for reordering

    MON_PlayAnimFromList(instance, missileDef->animList, 0, 1);

    mv->attackState = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Projectile);

void MON_IdleEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    mv->mvFlags &= ~0x1000;
    mv->mvFlags &= ~0x40000;

    mv->mode = 1;

    if ((mv->mvFlags & 0x4))
    {
        MonsterAttributes *ma;

        ma = (MonsterAttributes *)instance->data;

        if (mv->enemy != NULL)
        {
            MON_PlayCombatIdle(instance, 2);
        }
        else
        {
            MON_PlayAnimID(instance, ma->idleList->anim, 2);
        }
    }
    else if (!(instance->anim.section->flags & 0x1))
    {
        G2Anim_SetLooping(&instance->anim);

        mv->mvFlags |= 0x4000000;
    }
}

void MON_Idle(Instance *instance)
{
    MonsterVars *mv;
    int combatIdle;

    mv = (MonsterVars *)instance->extraData;

    combatIdle = 0;

    if (!(mv->mvFlags & 0x4))
    {
        int state;
        MonsterIR *enemy;

        enemy = mv->enemy;

        state = -1;

        if (MON_ValidPosition(instance) == 0)
        {
            state = 1;
        }
        else if (enemy != NULL)
        {
            combatIdle = 1;

            if (MON_ShouldIFlee(instance) != 0)
            {
                state = 19;
            }
            else if ((enemy->mirFlags & 0x100))
            {
                state = 25;
            }
            else if (((mv->behaviorState == 7) && (enemy->distance > mv->guardRange)) || (MON_ValidUnit(instance, enemy->instance->currentStreamUnitID) == 0))
            {
                MON_TurnToPosition(instance, (Position *)&enemy->instance->position.x, mv->subAttr->speedPivotTurn);
            }
            else
            {
                state = 13;
            }

            mv->lookAtPos = &enemy->instance->position;
        }
        else if (((mv->behaviorState == 2) || (mv->behaviorState == 3)) && ((instance->flags2 & 0x2)))
        {
            state = 5;
        }

        if (state != -1)
        {
            MON_SwitchState(instance, (MonsterState)state);
        }
    }
    else if ((mv->auxFlags & 0x10000000))
    {
        AngleMoveToward(&instance->rotation.z, mv->destination.z, (short)((mv->subAttr->speedPivotTurn * gameTrackerX.timeMult) / 4096));

        if (instance->rotation.z == mv->destination.z)
        {
            mv->auxFlags &= ~0x10000000;
        }
    }

    if ((!(mv->mvFlags & 0x4)) && ((!(mv->mvFlags & 0x4000000)) || ((instance->flags2 & 0x2))))
    {
        if (combatIdle != 0)
        {
            MON_PlayCombatIdle(instance, 2);
        }
        else
        {
            MON_PlayRandomIdle(instance, 2);
        }
    }

    MON_IdleQueueHandler(instance);
}

void MON_FleeEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    mv->mode = 4;

    mv->mvFlags |= 0x1000;
    mv->mvFlags &= ~0x10000;
    mv->mvFlags &= ~0x20000;

    MON_PlayAnim(instance, MONSTER_ANIM_RUN, 2);
}

void MON_Flee(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    if (mv->enemy == NULL)
    {
        MON_SwitchState(instance, MONSTER_STATE_IDLE);

        mv->behaviorState = mv->initialBehavior;
        return;
    }

    if (((mv->mvFlags & 0x2000000)) && (mv->ally != NULL) && (mv->ally->distance < mv->enemy->distance))
    {
        if (!(INSTANCE_Query(instance, 1) & 0x4))
        {
            MON_SwitchState(instance, MONSTER_STATE_PURSUE);
            return;
        }
    }

    if (mv->enemy->distance > mv->subAttr->fleeRange)
    {
        MON_SwitchState(instance, MONSTER_STATE_WANDER);
        return;
    }

    if (MON_ValidPosition(instance) == 0)
    {
        MON_SwitchState(instance, MONSTER_STATE_PURSUE);
        return;
    }

    AngleMoveToward(&instance->rotation.z, MONSENSE_GetClosestFreeDirection(instance, MATH3D_AngleFromPosToPos(&mv->enemy->instance->position, &instance->position), 1000), mv->subAttr->speedFleeTurn);

    MON_DefaultQueueHandler(instance);
}

void MON_PursueEntry(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    mv->mvFlags |= 0x1000;
    mv->mvFlags &= ~0x10000;

    if ((mv->mvFlags & 0x4))
    {
        MON_PlayAnim(instance, MONSTER_ANIM_RUN, 2);
    }
    else
    {
        MON_GetPlanSlot(mv);

        MON_PlayCombatIdle(instance, 2);
    }

    mv->mode = 4;

    mv->mvFlags &= ~0x20000;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Pursue);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_WanderEntry);

void MON_Wander(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    if ((mv->mvFlags & 0x4))
    {
        MON_TurnToPosition(instance, &mv->destination, mv->subAttr->speedWalkTurn);

        if (MATH3D_LengthXYZ(instance->position.x - mv->destination.x, instance->position.y - mv->destination.y, instance->position.z - mv->destination.z) < 300)
        {
            MON_SwitchState(instance, MONSTER_STATE_IDLE);
        }

        MON_GroundMoveQueueHandler(instance);
    }
    else if (!(mv->mvFlags & 0x40000))
    {
        if (mv->generalTimer < MON_GetTime(instance))
        {
            MON_SwitchState(instance, MONSTER_STATE_IDLE);
        }
        else if (mv->behaviorState == 3)
        {
            if (mv->currentMarker != NULL)
            {
                int markerID;

                markerID = *mv->currentMarker;

                mv->currentMarker++;

                PLANAPI_FindNodePositionInUnit(STREAM_GetStreamUnitWithID(instance->currentStreamUnitID), &mv->destination, markerID, 0);

                if (*mv->currentMarker == 0)
                {
                    mv->currentMarker = mv->patrolMarkers;
                }

                mv->mvFlags |= 0x40000;
            }
        }
        else
        {
            Position *target;
            short range;

            range = mv->wanderRange;

            target = NULL;

            if (mv->leader != NULL)
            {
                range = 800;

                target = &mv->leader->instance->position;
            }
            else if (instance->intro != NULL)
            {
                target = &instance->intro->position;
            }

            MON_GetRandomDestinationInWorld(instance, target, range);
        }

        MON_GroundMoveQueueHandler(instance);
    }
    else
    {
        int planresult;
        int state;

        planresult = MON_DefaultPlanMovement(instance, 2, 100);

        state = -1;

        switch (planresult)
        {
        case 0:
        case 1:
        case 5:
        case 6:
            break;
        case 4:
            if (mv->behaviorState != 4)
            {
                if (!(rand() & 0x3))
                {
                    mv->generalTimer = MON_GetTime(instance) + 1000;

                    state = 5;
                }
                else
                {
                    state = 2;
                }
            }
            else
            {
                state = 20;
            }

            break;
        case 2:
        case 3:
            state = 2;
            break;
        }

        if (state != -1)
        {
            MON_SwitchState(instance, state);
        }
    }

    if (mv->enemy != NULL)
    {
        if (MON_ShouldIFlee(instance) != 0)
        {
            MON_SwitchState(instance, MONSTER_STATE_FLEE);
        }

        mv->lookAtPos = &mv->enemy->instance->position;
    }
}

void MON_HideEntry(Instance *instance)
{
    MON_PlayRandomIdle(instance, 1);
}

void MON_Hide(Instance *instance)
{
    MonsterVars *mv;
    MonsterIR *enemy;

    mv = (MonsterVars *)instance->extraData;

    enemy = mv->enemy;

    if ((!(mv->mvFlags & 0x4)) && (enemy != NULL))
    {
        switch (mv->behaviorState)
        {
        case 4:
            MON_ChangeBehavior(instance, mv->triggeredBehavior);
            break;
        case 9:
            MON_SwitchState(instance, MONSTER_STATE_FLEE);
            break;
        case 8:
            if ((!(mv->mvFlags & 0x40000000)) && (MON_ShouldIAmbushEnemy(instance) != 0))
            {
                if (mv->ambushJumpType == 0)
                {
                    MON_TurnToPosition(instance, &enemy->instance->position, 4096);

                    MON_SwitchState(instance, MONSTER_STATE_SURPRISEATTACK);
                }
                else
                {
                    if (mv->ambushJumpType == 1)
                    {
                        MON_PlayAnim(instance, MONSTER_ANIM_EVADELEFT, 1);
                    }
                    else
                    {
                        MON_PlayAnim(instance, MONSTER_ANIM_EVADERIGHT, 1);
                    }

                    mv->mvFlags |= 0x40000000;
                }
            }

            break;
        default:
            MON_SwitchState(instance, MONSTER_STATE_PURSUE);
        }
    }

    if ((instance->flags2 & 0x10))
    {
        if ((mv->mvFlags & 0x40000000))
        {
            MON_SwitchState(instance, MONSTER_STATE_COMBAT);
        }
        else
        {
            MON_PlayRandomIdle(instance, 1);
        }
    }

    MON_DefaultQueueHandler(instance);
}

void MON_SurpriseAttackEntry(Instance *instance)
{
    MonsterVars *mv;
    MonsterCombatAttributes *combatAttr;
    MonsterAttributes *ma;

    mv = (MonsterVars *)instance->extraData;

    combatAttr = mv->subAttr->combatAttributes;

    ma = (MonsterAttributes *)instance->data;

    do {} while (0); // garbage code for reordering

    mv->attackType = &ma->attackAttributesList[(int)combatAttr->ambushAttack];

    mv->attackState = 0;

    MON_PlayAnimFromList(instance, mv->attackType->animList, 0, 1);

    if (mv->behaviorState == 8)
    {
        if (mv->activeBehavior != -1)
        {
            mv->behaviorState = mv->activeBehavior;
        }
        else
        {
            mv->behaviorState = mv->initialBehavior;
        }
    }
}

void MON_SurpriseAttack(Instance *instance)
{
    MON_Attack(instance);
}

void MON_EnvironmentDamageEntry(Instance *instance)
{
    (void)instance;
}

void MON_EnvironmentDamage(Instance *instance)
{
    (void)instance;
}

void MON_MonsterGlow(Instance *instance, long color, int glowtime, int glowin, int glowfade)
{
    FXGlowEffect *glow;
    MonsterAttributes *ma;

    ma = (MonsterAttributes *)instance->data;

    if (glowtime > 0)
    {
        glowtime *= 33;
    }

    if (glowfade > 0)
    {
        glowfade *= 33;
    }

    if (glowin > 0)
    {
        glowin *= 33;
    }

    glow = FX_DoInstanceTwoSegmentGlow(instance, ma->waistSegment, ma->leftFootSegment, &color, 1, 1024, 160);

    glow->lifeTime = glowtime;

    glow->fadein_time = glowin;
    glow->fadeout_time = glowfade;

    glow = FX_DoInstanceTwoSegmentGlow(instance, ma->waistSegment, ma->rightFootSegment, &color, 1, 1024, 160);

    glow->lifeTime = glowtime;

    glow->fadein_time = glowin;
    glow->fadeout_time = glowfade;

    glow = FX_DoInstanceTwoSegmentGlow(instance, ma->leftShoulderSegment, ma->leftWeaponSegment, &color, 1, 1024, 128);

    glow->lifeTime = glowtime;

    glow->fadein_time = glowin;
    glow->fadeout_time = glowfade;

    glow = FX_DoInstanceTwoSegmentGlow(instance, ma->rightShoulderSegment, ma->rightWeaponSegment, &color, 1, 1024, 128);

    glow->lifeTime = glowtime;

    glow->fadein_time = glowin;
    glow->fadeout_time = glowfade;

    glow = FX_DoInstanceTwoSegmentGlow(instance, ma->headSegment, ma->waistSegment, &color, 1, 1024, 192);

    glow->lifeTime = glowtime;

    glow->fadein_time = glowin;
    glow->fadeout_time = glowfade;
}

void MON_GeneralDeathEntry(Instance *instance)
{
    MonsterVars *mv;
    MonsterAttributes *ma;
    char temp; // not from decls.h

    temp = 0;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    if (instance->LinkParent != NULL)
    {
        MON_UnlinkFromRaziel(instance);

        instance->xAccl = 0;
        instance->yAccl = 0;
        instance->zAccl = -16;
    }

    instance->flags2 |= 0x80;

    mv->mvFlags |= 0x202000;
    mv->mvFlags &= ~0x10;

    switch (mv->damageType)
    {
    case 16:
        mv->effect = (void *)SOUND_Play3dSound(&instance->position, 35, 600, 80, 10000);

        MON_PlayAnim(instance, MONSTER_ANIM_AGONY, 2);

        mv->causeOfDeath = 3;

        mv->generalTimer = MON_GetTime(instance) + 3000;
        mv->effectTimer = MON_GetTime(instance) + 12000;

        instance->xAccl = 0;
        instance->yAccl = 0;

        instance->xVel = 0;
        instance->yVel = 0;
        break;
    case 32:
        mv->causeOfDeath = 1;
    case 64:
        if ((mv != NULL) && (mv->mvFlags != 0)) // garbage code for reordering
        {
            temp = -temp;
        }

        if ((ma->whatAmI & 0x8))
        {
            MON_PlayAnim(instance, MONSTER_ANIM_FALLOVER, 1);
        }
        else
        {
            MON_PlayAnim(instance, MONSTER_ANIM_AGONY, 2);
        }

        if (mv->damageType == 64)
        {
            mv->causeOfDeath = 2;
        }

        mv->generalTimer = MON_GetTime(instance) + 2000;

        mv->mvFlags |= 0x400000;

        mv->effectTimer = MON_GetTime(instance) + 10000;

        MON_MonsterGlow(instance, 18784, -1, 0, 0);

        instance->xAccl = 0;
        instance->yAccl = 0;

        instance->xVel = 0;
        instance->yVel = 0;
        break;
    case 1024:
        MON_PlayAnim(instance, MONSTER_ANIM_FALLOVER, 1);

        mv->causeOfDeath = 6;

        mv->generalTimer = 0;

        instance->xAccl = 0;
        instance->yAccl = 0;

        instance->xVel = 0;
        instance->yVel = 0;
        break;
    default:
        if (mv->enemy != NULL)
        {
            if (MON_SetUpKnockBack(instance, mv->enemy->instance, (evMonsterHitData *)mv->messageData) != 0)
            {
                MON_PlayAnim(instance, MONSTER_ANIM_HIT1, 1);
            }
            else
            {
                MON_PlayAnim(instance, MONSTER_ANIM_HIT2, 1);
            }
        }
        else
        {
            MON_PlayAnim(instance, MONSTER_ANIM_FALLOVER, 1);
        }

        mv->generalTimer = 0;

        mv->causeOfDeath = 7;

        MON_TurnOffAllSpheres(instance);

        instance->xAccl = 0;
        instance->yAccl = 0;

        instance->xVel = 0;
        instance->yVel = 0;
    }

    MON_DropAllObjects(instance);
}

void MON_GeneralDeath(Instance *instance)
{
    MonsterVars *mv;
    Message *message;
    int dead;

    mv = (MonsterVars *)instance->extraData;

    dead = 0;

    if ((((instance->flags2 & 0x10)) && (MON_AnimPlaying(instance, MONSTER_ANIM_FALLOVER) != 0)) || (mv->causeOfDeath == 6))
    {
        dead = 1;
    }
    else if (((instance->flags2 & 0x12)) && (mv->generalTimer < MON_GetTime(instance)))
    {
        MON_PlayAnim(instance, MONSTER_ANIM_FALLOVER, 1);

        MON_TurnOffAllSpheres(instance);
    }

    if (dead != 0)
    {
        mv->mvFlags &= ~0x10;

        G2Anim_SetNoLooping(&instance->anim);

        MON_SwitchState(instance, MONSTER_STATE_DEAD);
    }

    if ((mv->mvFlags & 0x400))
    {
        if (MON_OnGround(instance) != 0)
        {
            mv->mvFlags |= 0x2;
        }
        else
        {
            mv->mvFlags &= ~0x2;
        }
    }

    if (!(mv->mvFlags & 0x2))
    {
        MON_ApplyPhysics(instance);
    }

    while (message = DeMessageQueue(&mv->messageQueue), message != NULL)
    {
        if (message->ID == 0x100000B)
        {
            instance->xAccl = 0;
            instance->yAccl = 0;
            instance->zAccl = -16;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_NoticeEntry);

void MON_Notice(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    if ((instance->flags2 & 0x10))
    {
        if (mv->behaviorState == 8)
        {
            MON_SwitchState(instance, MONSTER_STATE_HIDE);
        }
        else
        {
            MON_SwitchState(instance, MONSTER_STATE_COMBAT);
        }
    }

    if (mv->enemy != NULL)
    {
        mv->lookAtPos = &mv->enemy->instance->position;

        MON_TurnToPosition(instance, &mv->enemy->instance->position, mv->subAttr->speedPivotTurn);
    }

    MON_DefaultQueueHandler(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_PupateEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Pupate);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_EmbraceEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Embrace);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_PetrifiedEntry);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSTER", MON_Petrified);

int MONSTER_CalcDamageIntensity(int hp, int maxHp)
{
    return ((maxHp - hp) * 256) / maxHp;
}

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
