#include "common.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/PHYSOBS.h"
#include "Game/INSTANCE.h"
#include "Game/MONSTER/MONTABLE.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/G2/ANMG2ILF.h"
#include "Game/STATE.h"

void MON_TurnOffWeaponSpheres(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    if (instance->LinkChild != NULL)
    {
        Instance *weapon;

        for (weapon = instance->LinkChild; weapon != NULL; weapon = weapon->LinkSibling)
        {
            TurnOffCollisionPhysOb(weapon, 3);
        }
    }

    if ((mv->mvFlags & 0x4000))
    {
        int i;
        HPrim *hprim;
        HModel *hmodel;

        hmodel = &instance->hModelList[instance->currentModel];

        hprim = hmodel->hPrimList;

        for (i = hmodel->numHPrims; i != 0; i--, hprim++)
        {
            if ((hprim->type == 1) && (hprim->data.hsphere->id == 9))
            {
                hprim->hpFlags &= ~0x1;
            }
        }

        mv->mvFlags &= ~0x4000;
    }
}

void MON_TurnOnWeaponSpheres(Instance *instance)
{
    MonsterVars *mv;
    int i;
    HPrim *hprim;
    HModel *hmodel;

    mv = (MonsterVars *)instance->extraData;

    if ((!(mv->mvFlags & 0x4000)) && (instance->hModelList != NULL))
    {
        hmodel = &instance->hModelList[instance->currentModel];

        hprim = hmodel->hPrimList;

        for (i = hmodel->numHPrims; i != 0; i--, hprim++)
        {
            if ((hprim->type == 1) && (hprim->data.hsphere->id == 9))
            {
                hprim->hpFlags |= 0x1;
                break;
            }
        }

        mv->mvFlags |= 0x4000;
    }
}

void MON_TurnOnWeaponSphere(Instance *instance, int segment)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    if (instance->LinkChild != NULL)
    {
        Instance *weapon;

        weapon = INSTANCE_GetChildLinkedToSegment(instance, segment);

        if (weapon != NULL)
        {
            TurnOnCollisionPhysOb(weapon, 3);

            mv->mvFlags |= 0x4000;
        }
    }
    else if ((!(mv->mvFlags & 0x4000)) && (instance->hModelList != NULL))
    {
        int i;
        HPrim *hprim;
        HModel *hmodel;

        hmodel = &instance->hModelList[instance->currentModel];

        hprim = hmodel->hPrimList;

        for (i = hmodel->numHPrims; i != 0; i--, hprim++)
        {
            if ((hprim->segment == segment) && (hprim->type == 1) && (hprim->data.hsphere->id == 9))
            {
                hprim->hpFlags |= 0x1;
            }
        }

        mv->mvFlags |= 0x4000;
    }
}

void MON_TurnOffBodySpheres(Instance *instance)
{
    MonsterVars *mv;
    int i;
    HPrim *hprim;
    HModel *hmodel;

    mv = (MonsterVars *)instance->extraData;

    if ((mv->mvFlags & 0x8000))
    {
        hmodel = &instance->hModelList[instance->currentModel];

        hprim = hmodel->hPrimList;

        for (i = hmodel->numHPrims; i != 0; i--, hprim++)
        {
            if ((hprim->type == 1) && (hprim->data.hsphere->id == 8))
            {
                hprim->hpFlags &= ~0x1;
            }
        }

        mv->mvFlags &= ~0x8000;
    }
}

void MON_TurnOnBodySpheres(Instance *instance)
{
    MonsterVars *mv;
    int i;
    HPrim *hprim;
    HModel *hmodel;

    mv = (MonsterVars *)instance->extraData;

    if ((!(mv->mvFlags & 0x8000)) && (instance->hModelList != NULL))
    {
        hmodel = &instance->hModelList[instance->currentModel];

        hprim = hmodel->hPrimList;

        for (i = hmodel->numHPrims; i != 0; i--, hprim++)
        {
            if ((hprim->type == 1) && (hprim->data.hsphere->id == 8))
            {
                hprim->hpFlags |= 0x1;
            }
        }

        mv->mvFlags |= 0x8000;
    }
}

void MON_TurnOffAllSpheres(Instance *instance)
{
    MON_TurnOffWeaponSpheres(instance);

    MON_TurnOffBodySpheres(instance);
}

void MON_TurnOnAllSpheres(Instance *instance)
{
    MON_TurnOnWeaponSpheres(instance);

    MON_TurnOnBodySpheres(instance);
}

void MON_SwitchState(Instance *instance, MonsterState state)
{
    MonsterVars *mv;
    int temp; // not from decls.h

    mv = (MonsterVars *)instance->extraData;

    if ((mv->mvFlags & 0x4000))
    {
        MON_TurnOffWeaponSpheres(instance);
    }

    if (!(mv->mvFlags & 0x1))
    {
        mv->previousMainState = (char)instance->currentMainState;
    }

    if ((state == MONSTER_STATE_GENERALDEATH) || (state == MONSTER_STATE_DEAD) || (state == MONSTER_STATE_IMPALEDEATH) || (state == MONSTER_STATE_GRABBED))
    {
        PurgeMessageQueue(&mv->messageQueue);
    }
    else if (state == MONSTER_STATE_MISSILEHIT)
    {
        PurgeMessageQueue(&mv->messageQueue);
    }

    instance->currentMainState = state;

    mv->mvFlags |= 0x1;
    mv->mvFlags &= ~0x1000;
    mv->mvFlags &= ~0x20000;
    mv->mvFlags &= ~0x40000000;
    mv->mvFlags &= ~0x4000000;

    temp = -1;

    if ((char)mv->pathSlotID != temp)
    {
        ENMYPLAN_ReleasePlanningWorkspace((char)mv->pathSlotID);

        mv->pathSlotID = temp;
    }
}

void MON_SwitchStateDoEntry(Instance *instance, MonsterState state)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    MON_SwitchState(instance, state);

    if (mv != NULL)
    {
        (((MonsterStateFunction *)MONTABLE_GetStateFuncs(instance, instance->currentMainState))->entryFunction)(instance);

        mv->mvFlags &= ~0x1;
    }
}

int MON_TransNodeAnimation(Instance *instance)
{
    return G2Anim_SegmentHasActiveChannels(&instance->anim, 0, 0x700);
}

MonsterAnimation *MON_GetAnim(Instance *instance, char *animList, int index)
{
    int whichAnim;
    MonsterAttributes *temp; // not from decls.h

    whichAnim = animList[index];

    if (whichAnim == -1)
    {
        return NULL;
    }

    temp = (MonsterAttributes *)instance->data;

    return &temp->animList[whichAnim];
}

void MON_PlayAnimID(Instance *instance, int index, int mode)
{
    MonsterVars *mv;
    MonsterAnimation *manim;
    MonsterAttributes *ma;
    int anim;
    int anim0;
    int i;
    int interpFrames;
    int alphaTable;

    ma = (MonsterAttributes *)instance->data;

    mv = (MonsterVars *)instance->extraData;

    manim = &ma->animList[index];

    anim0 = *manim->index;

    if ((anim0 < 0) || (anim0 >= instance->object->numAnims))
    {
        anim0 = 0;
    }

    G2Anim_SetCallback(&instance->anim, (void *)INSTANCE_DefaultAnimCallback, instance);

    if ((mv->anim != NULL) && (mv->anim->interpOut != 0))
    {
        interpFrames = mv->anim->interpOut;

        alphaTable = mv->anim->alphaTableOut;
    }
    else
    {
        interpFrames = manim->interpFrames;

        alphaTable = manim->alphaTable;
    }

    for (i = 0; i < mv->subAttr->numSections; i++)
    {
        anim = manim->index[i];

        if (anim == -1)
        {
            anim = anim0;
        }

        G2EmulationInstanceSwitchAnimationAlpha(instance, i, anim, manim->startFrame, interpFrames, mode, alphaTable);

        G2EmulationInstanceSetAnimSpeed(instance, i, manim->playSpeed);
    }

    mv->anim = manim;

    mv->mvFlags |= 0x4000000;

    (instance->anim.section + manim->controllingSection)->callback = MON_AnimCallback;
    (instance->anim.section + manim->controllingSection)->callbackData = instance;
}

void MON_PlayAnimFromList(Instance *instance, char *animList, int animtype, int mode)
{
    MON_PlayAnimID(instance, animList[animtype], mode);
}

int MON_AnimIDPlaying(Instance *instance, int index)
{
    MonsterAttributes *ma;
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    return mv->anim == &ma->animList[index];
}

void MON_PlayAnimIDIfNotPlaying(Instance *instance, int index, int mode)
{
    if (MON_AnimIDPlaying(instance, index) == 0)
    {
        MON_PlayAnimID(instance, index, mode);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_AnimPlayingFromList);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_PlayAnimFromListIfNotPlaying);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_PlayAnim);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_AnimPlaying);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_PlayAnimIfNotPlaying);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_AnimCallback);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_AnimInit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_FacingOffset);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_CheckConditions);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIAttackInstance);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIAttack);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseAttack);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIEvade);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseLeftOrRight);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseEvadeMove);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseCombatMove);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_PlayRandomIdle);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_PlayCombatIdle);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetRandomPoint);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetRandomDestinationInWorld);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_MoveForward);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnToPosition);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_MoveToPosition);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_OnGround);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ApplyPhysics);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChangeBehavior);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_CheckEnvironment);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_CheckTerrainAndRespond);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_CheckTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_CheckPointSuitability);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetTime);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_BirthSoul);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ProcessIntro);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SetDefaults);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetPlanSlot);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_DefaultPlanMovement);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_DropAllObjects);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_EnableHeadMove);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_DisableHeadMove);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_LookInDirection);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_LookAtPos);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ProcessLookAt);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TakeDamage);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SetUpSaveInfo);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetSaveInfo);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_KillMonster);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIAmbushEnemy);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIFireAtTarget);

int MON_ShouldIFlee(Instance *instance)
{
    MonsterVars *mv;
    MonsterIR *enemy;

    mv = (MonsterVars *)instance->extraData;

    enemy = mv->enemy;

    if ((enemy != NULL) && (!(enemy->mirFlags & 0x8)) && (enemy->distance < mv->subAttr->fleeRange))
    {
        if (MON_ValidPosition(instance) != 0)
        {
            if ((mv->behaviorState == 9) || (((mv->mvFlags & 0x2000000)) && ((mv->ally == NULL) || (!(mv->ally->mirFlags & 0x200))) && (mv->hitPoints < 8192)))
            {
                return 1;
            }

            if (((mv->mvFlags & 0x2000)) && (mv->hitPoints == 0))
            {
                return 1;
            }
        }
    }

    return 0;
}

void MON_RelocateCoords(Instance *instance, SVector *offset)
{
    MonsterVars *mv;
    int ox;
    int oy;
    int oz;

    mv = (MonsterVars *)instance->extraData;

    ox = offset->x;
    oy = offset->y;
    oz = offset->z;

    mv->destination.x += ox;
    mv->destination.y += oy;
    mv->destination.z += oz;

    mv->lastValidPos.x += ox;
    mv->lastValidPos.y += oy;
    mv->lastValidPos.z += oz;

    if (mv->pathSlotID != -1)
    {
        ENMYPLAN_RelocatePlanPositions(mv->pathSlotID, (Position *)offset);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ValidUnit);

int MON_ValidPosition(Instance *instance)
{
    MonsterVars *mv;

    if (MON_ValidUnit(instance, instance->currentStreamUnitID) != 0)
    {
        mv = (MonsterVars *)instance->extraData;

        mv->lastValidPos = instance->position;

        return 1;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SphereWorldPos);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_FindSphereForTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_FindNearestImpalingIntro);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TestForTerrainImpale);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_MoveInstanceToImpalePoint);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ReachableIntro);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SetVelocityTowardsImpalingObject);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnOffSphereCollisions);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnOnSphereCollisions);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ProcessSpecialFade);

void MON_StartSpecialFade(Instance *instance, int fadeLevel, int fadeTime)
{
    MonsterVars *mv;
    int diff;

    mv = (MonsterVars *)instance->extraData;

    mv->targetFade = fadeLevel;

    mv->auxFlags |= 0x8000000;

    diff = fadeLevel - instance->fadeValue;

    if (fadeTime <= 0)
    {
        fadeTime = 1;
    }

    mv->fadeRate = diff / fadeTime;

    if (((diff / fadeTime) << 16) == 0)
    {
        if (diff < 0)
        {
            mv->fadeRate = -1;
        }
        else
        {
            mv->fadeRate = 1;
        }
    }
}

void MON_UnlinkFromRaziel(Instance *instance)
{
    MonsterVars *mv;
    evPositionData *data;
    Instance *enemy;

    mv = (MonsterVars *)instance->extraData;

    enemy = mv->enemy->instance;

    INSTANCE_UnlinkFromParent(instance);

    MON_SwitchState(instance, MONSTER_STATE_FALL);

    data = (evPositionData *)INSTANCE_Query(enemy, 7);

    if (data != NULL)
    {
        instance->rotation.x = data->x;
        instance->rotation.y = data->y;
        instance->rotation.z = data->z + 2048;
    }

    INSTANCE_Post(enemy, 0x1000006, (intptr_t)instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_BurnInAir);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_BirthMana);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SoulSucked);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SetUpKnockBack);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_DoDrainEffects);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SetFXHitData);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_LaunchMonster);
