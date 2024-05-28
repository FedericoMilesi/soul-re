#include "common.h"
#include "Game/MONSTER/MONLIB.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnOffWeaponSpheres);

void MON_TurnOnWeaponSpheres(Instance *instance);
INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnOnWeaponSpheres);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnOnWeaponSphere);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnOffBodySpheres);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_TurnOnBodySpheres);

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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SwitchState);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SwitchStateDoEntry);

int MON_TransNodeAnimation(Instance *instance)
{
    return G2Anim_SegmentHasActiveChannels(&instance->anim, 0, 0x700);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetAnim);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_PlayAnimID);

void MON_PlayAnimFromList(Instance *instance, char *animList, int animtype, int mode)
{
    MON_PlayAnimID(instance, animList[animtype], mode);
}

int MON_AnimIDPlaying(Instance *instance, int index);
INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_AnimIDPlaying);

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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIFlee);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_RelocateCoords);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ValidUnit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ValidPosition);

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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_StartSpecialFade);

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

    INSTANCE_Post(enemy, 0x1000006, (int)instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_BurnInAir);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_BirthMana);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SoulSucked);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SetUpKnockBack);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_DoDrainEffects);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_SetFXHitData);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_LaunchMonster);
