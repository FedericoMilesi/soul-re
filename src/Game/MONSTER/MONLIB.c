#include "common.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/PHYSOBS.h"
#include "Game/INSTANCE.h"
#include "Game/MONSTER/MONTABLE.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/G2/ANMG2ILF.h"
#include "Game/STATE.h"
#include "Game/MATH3D.h"
#include "Game/PHYSICS.h"
#include "Game/FX.h"

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

int MON_AnimPlayingFromList(Instance *instance, char *animList, int animtype)
{
    return MON_AnimIDPlaying(instance, animList[animtype]);
}

void MON_PlayAnimFromListIfNotPlaying(Instance *instance, char *animList, int animtype, int mode)
{
    int index;

    index = animList[animtype];

    if (MON_AnimIDPlaying(instance, index) == 0)
    {
        MON_PlayAnimID(instance, index, mode);
    }
}

void MON_PlayAnim(Instance *instance, MonsterAnim animtype, int mode)
{
    MON_PlayAnimFromList(instance, ((MonsterVars *)instance->extraData)->subAttr->animList, animtype, mode);
}

int MON_AnimPlaying(Instance *instance, MonsterAnim animtype)
{
    return MON_AnimPlayingFromList(instance, ((MonsterVars *)instance->extraData)->subAttr->animList, animtype);
}

void MON_PlayAnimIfNotPlaying(Instance *instance, MonsterAnim animtype, int mode)
{
    MON_PlayAnimFromListIfNotPlaying(instance, ((MonsterVars *)instance->extraData)->subAttr->animList, animtype, mode);
}

long MON_AnimCallback(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, void *data)
{
    Instance *instance;
    MonsterVars *mv;

    instance = (Instance *)data;

    mv = (MonsterVars *)instance->extraData;

    switch (message)
    {
    case 1:
        instance->flags2 |= 0x10;

        mv->mvFlags &= ~0x4000000;
        break;
    case 2:
        instance->flags2 |= 0x2;
        break;
    case 4:
        break;
    default:
        INSTANCE_DefaultAnimCallback(anim, sectionID, message, messageDataA, messageDataB, instance);
    }

    return messageDataA;
}

void MON_AnimInit(Instance *instance)
{
    MonsterVars *mv;
    G2AnimSection *animSection;
    int i;
    int startSection;
    int numSections;
    int sectionEnd;

    mv = (MonsterVars *)instance->extraData;

    numSections = mv->subAttr->numSections;

    mv->anim = NULL;

    G2EmulationInstanceSetTotalSections(instance, numSections);

    startSection = 0;

    for (i = 0; i < numSections; i++)
    {
        sectionEnd = mv->subAttr->sectionEnd[i];

        animSection = &instance->anim.section[i];

        if (sectionEnd == 0)
        {
            G2EmulationInstanceSetStartAndEndSegment(instance, i, startSection, (short)instance->object->modelList[instance->currentModel]->numSegments - 1);
        }
        else
        {
            G2EmulationInstanceSetStartAndEndSegment(instance, i, startSection, sectionEnd);

            startSection = mv->subAttr->sectionEnd[i] + 1;
        }

        G2AnimSection_SetInterpInfo(animSection, &mv->interpInfo[i]);

        G2EmulationInstanceSetAnimation(instance, i, 0, 0, 0);
        G2EmulationInstanceSetMode(instance, i, 2);
    }

    G2EmulationInstanceInitSection(instance, 0, MON_AnimCallback, instance);

    MON_PlayRandomIdle(instance, 2);
}

short MON_FacingOffset(Instance *instance, Instance *target)
{
    return MATH3D_AngleFromPosToPos(&target->position, &instance->position) - target->rotation.z;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_CheckConditions);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIAttackInstance);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIAttack);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseAttack);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ShouldIEvade);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseLeftOrRight);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseEvadeMove);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChooseCombatMove);

void MON_PlayRandomIdle(Instance *instance, int mode)
{
    MonsterVars *mv;
    MonsterAttributes *ma;
    MonsterBehavior *behavior;
    MonsterIdle *idle;
    int chance;
    int i;
    char *idleIndex;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    idle = NULL;

    chance = rand() % 100;

    if ((mv->mvFlags & 0x4))
    {
        behavior = ma->behaviorList;

        idle = &ma->idleList[(int)behavior->idleList[0]];
    }
    else
    {
        if (mv->subAttr->behaviorList != NULL)
        {
            i = mv->subAttr->behaviorList[mv->behaviorState];
        }
        else
        {
            i = -1;
        }

        if (i == -1)
        {
            behavior = ma->behaviorList;
        }
        else
        {
            behavior = &ma->behaviorList[i];
        }

        if (mv->behaviorState == 0)
        {
            idle = &ma->idleList[(int)((MonsterBehavior *)((int)behavior + mv->ambient))->idleList[0]];
        }
        else
        {
            for (i = behavior->numIdles, idleIndex = &behavior->idleList[0]; i != 0; i--, idleIndex++)
            {
                if (*idleIndex < 0)
                {
                    break;
                }

                idle = &ma->idleList[(int)*idleIndex];

                if (chance < idle->probability)
                {
                    break;
                }

                chance -= idle->probability;
            }
        }
    }

    if (idle != NULL)
    {
        MON_PlayAnimIDIfNotPlaying(instance, idle->anim, mode);

        mv->alertness = behavior->alertness;
    }
}

void MON_PlayCombatIdle(Instance *instance, int mode)
{
    int anim;

    if ((((MonsterVars *)instance->extraData)->mvFlags & 0x10))
    {
        anim = MONSTER_ANIM_STANCE_VULNERABLE;
    }
    else
    {
        anim = MONSTER_ANIM_STANCE_HEALTHY;
    }

    MON_PlayAnimIfNotPlaying(instance, (MonsterAnim)anim, mode);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetRandomPoint);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_GetRandomDestinationInWorld);

void MON_MoveForward(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    PhysicsSetVelFromRot(instance, &instance->rotation, mv->speed);

    instance->xAccl = 0;
    instance->yAccl = 0;
    instance->zAccl = 0;

    PhysicsMove(instance, &instance->position, gameTrackerX.timeMult);
}

int MON_TurnToPosition(Instance *instance, Position *position, short turnspeed)
{
    short temp; // not from decls.h

    temp = MATH3D_AngleFromPosToPos(&instance->position, position);

    AngleMoveToward(&instance->rotation.z, temp, (short)((turnspeed * gameTrackerX.timeMult) / 4096));

    return instance->rotation.z == temp;
}

void MON_MoveToPosition(Instance *instance, Position *position, short turnSpeed)
{
    MON_TurnToPosition(instance, position, turnSpeed);

    if (MON_TransNodeAnimation(instance) == 0)
    {
        MON_MoveForward(instance);
    }
}

int MON_OnGround(Instance *instance)
{
    MonsterVars *mv;
    evPhysicsGravityData data;
    int minUpper;
    long xyDist;

    mv = (MonsterVars *)instance->extraData;

    xyDist = MATH3D_LengthXY(instance->oldPos.x - instance->position.x, instance->oldPos.y - instance->position.y);

    data.UpperOffset = instance->oldPos.z - instance->position.z;
    data.LowerOffset = (short)xyDist;

    minUpper = 400;

    if ((mv->mvFlags & 0x2))
    {
        minUpper = 100;
    }

    if (data.UpperOffset < minUpper)
    {
        data.UpperOffset = minUpper;
    }

    if ((short)xyDist < 100)
    {
        data.LowerOffset = 100;
    }

    data.UpperOffset += mv->subAttr->upOnGroundOffset;
    data.LowerOffset += mv->subAttr->downOnGroundOffset;

    data.slipSlope = 3200;

    return PhysicsCheckGravity(instance, (int)&data.UpperOffset, (!(mv->mvFlags & 0x800)) << 2);
}

void MON_ApplyPhysics(Instance *instance)
{
    PhysicsMove(instance, &instance->position, gameTrackerX.timeMult);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_ChangeBehavior);

void MON_CheckEnvironment(Instance *instance)
{
    MonsterVars *mv;
    MonsterAttributes *ma;
    int inwater;
    SVector Hack;
    Position *temp; // not from decls.h

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    if (instance->currentMainState != MONSTER_STATE_TERRAINIMPALEDEATH)
    {
        Hack.z = 0;
        Hack.y = 0;
        Hack.x = 0;

        instance->tface = NULL;
        instance->tfaceLevel = NULL;

        if (!(ma->whatAmI & 0x4))
        {
            inwater = PhysicsCheckSwim(instance, SetPhysicsSwimData(0, &Hack, 256, 160, 64), 1);
        }
        else
        {
            inwater = 0x20;
        }

        inwater &= 0x20;

        if (inwater == 0)
        {
            if (!(mv->mvFlags & 0x400))
            {
                mv->mvFlags |= 0x400;
                mv->mvFlags &= ~0x400000;

                instance->maxXVel = 20;
                instance->maxYVel = 20;
                instance->maxZVel = 20;

                instance->xVel = 0;
                instance->yVel = 0;

                do
                {

                } while (0); // garbage code for reordering 

                SOUND_Play3dSound(&instance->position, 1, -200, 120, 10000);

                instance->flags2 &= ~0x40;
            }

            if ((mv->avoidMask & 0x10))
            {
                INSTANCE_Post(instance, 0x100000C, 16);
            }
        }
        else
        {
            int moveback;
            int onground;

            moveback = 0;

            if ((mv->mvFlags & 0x400))
            {
                mv->mvFlags &= ~0x400;

                instance->maxXVel = 400;
                instance->maxYVel = 400;
                instance->maxZVel = 400;

                do
                {

                } while (0); // garbage code for reordering 

                if ((instance->object->oflags & 0x200))
                {
                    instance->flags2 |= 0x40;
                }
            }

            if (instance->LinkParent == NULL)
            {
                onground = MON_OnGround(instance);

                if (onground != 0)
                {
                    if (!(mv->mvFlags & 0x2))
                    {
                        mv->mvFlags |= 0x2;
                    }

                    if ((mv->mvFlags & 0x1000))
                    {
                        int offset;
                        int result;
                        Position pos;

                        offset = mv->anim->velocity * 8;

                        if (offset < 100)
                        {
                            offset = 100;
                        }

                        pos.y = -offset;
                        pos.x = 0;
                        pos.z = offset / 2;

                        if (!(mv->mvFlags & 0x10000))
                        {
                            offset = mv->subAttr->fallDistance;
                        }

                        result = PhysicsCheckDropHeight(instance, SetPhysicsDropHeightData(&pos, offset, 96), 1);

                        if (!(result & mv->avoidMask))
                        {
                            if (result == 0)
                            {
                                INSTANCE_Post(instance, 0x4010080, 0);
                            }
                        }
                        else
                        {
                            INSTANCE_Post(instance, 0x4010080, 0);
                        }
                    }

                    if ((onground & 0x100000))
                    {
                        moveback = 1;
                    }
                }
                else if ((mv->mvFlags & 0x2))
                {
                    int result;
                    int offset;

                    mv->mvFlags &= ~0x2;

                    if (!(mv->mvFlags & 0x800))
                    {
                        offset = 320;

                        if (!(mv->mvFlags & 0x10000))
                        {
                            offset = mv->subAttr->fallDistance;

                            temp = &instance->position;
                        }
                        else
                        {
                            temp = &instance->position;
                        }

                        result = PhysicsCheckDropHeight(instance, SetPhysicsDropHeightData(temp, offset, 64), 1);

                        if (((result & mv->avoidMask)) || (result == 0))
                        {
                            moveback = 1;
                        }
                    }
                }

                if (moveback != 0)
                {
                    int result;

                    result = PhysicsCheckDropHeight(instance, SetPhysicsDropHeightData(&instance->oldPos, 100, 64), 1);

                    if ((result != 0) && (!(result & mv->avoidMask)))
                    {
                        instance->position = instance->oldPos;

                        mv->mvFlags |= 0x2;
                    }
                }

                if ((!(mv->mvFlags & 0x802)) && (mv->mode != 0x100000))
                {
                    INSTANCE_Post(instance, 0x100000B, 0);
                }
            }

            if (instance->tfaceLevel != NULL)
            {
                MON_CheckTerrainAndRespond(instance, &((Level *)(instance->tfaceLevel))->terrain->BSPTreeArray[instance->bspTree], instance->tface);
            }
        }

        if ((ma->whatAmI != 0x10082) && (!(ma->whatAmI & 0x4)))
        {
            FX_UpdateInstanceWaterSplit(instance);
        }
    }
}

void MON_CheckTerrainAndRespond(Instance *instance, BSPTree *bsp, TFace *tface)
{
    unsigned long results;

    results = MON_CheckTerrain(instance, bsp, tface);

    if ((results & 0x10))
    {
        INSTANCE_Post(instance, 0x100000C, 0x10);
    }

    if ((results & 0x20))
    {
        INSTANCE_Post(instance, 0x100000C, 0x20);
    }

    if ((results & 0x40))
    {
        INSTANCE_Post(instance, 0x100000C, 0x40);
    }
}

unsigned long MON_CheckTerrain(Instance *instance, BSPTree *bsp, TFace *tface)
{
    unsigned long rv;

    rv = 0;

    if (tface != NULL)
    {
        Level *level;

        level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

        if ((!(bsp->flags & 0x8)) && (((level->unitFlags & 0x2)) || ((bsp->flags & 0x50))))
        {
            rv = 0x40;
        }

        if (((bsp->flags & 0x80)) || (instance->waterFace != NULL))
        {
            rv |= 0x10;
        }

        if ((bsp->flags & 0x20))
        {
            rv |= 0x20;
        }
    }

    return rv;
}

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
