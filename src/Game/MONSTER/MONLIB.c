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
#include "Game/G2/ANMCTRLR.h"

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

unsigned long MON_GetTime(Instance *instance)
{
    if ((instance->object->oflags & 0x80000))
    {
        return gameTrackerX.currentTime;
    }
    else if ((instance->flags2 & 0x8000000))
    {
        return gameTrackerX.currentSpectralTime;
    }

    return gameTrackerX.currentMaterialTime;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_BirthSoul);

void MON_ProcessIntro(Instance *instance)
{
    MonsterVars *mv;
    long initialBehavior;
    long triggeredBehavior;
    long activeBehavior;
    long guardRange;
    long wanderRange;
    long ambushRange;
    long hitPoints;
    int spectral;
    long flags;
    MonsterAttributes *ma;

    initialBehavior = -1;
    triggeredBehavior = -1;
    activeBehavior = -1;

    guardRange = 0;
    wanderRange = 0;
    ambushRange = 0;

    spectral = 0;

    ma = (MonsterAttributes *)instance->data;

    mv = (MonsterVars *)instance->extraData;

    mv->age = ma->defaultAge;

    mv->ambushArc = 2048;
    mv->ambushElevation = 1024;

    hitPoints = -1;

    mv->auxFlags |= 0x80000000;

    flags = 0;

    if (instance->introData != NULL)
    {
        INICommand *command;

        command = (INICommand *)instance->introData;

        if (!(instance->flags & 0x2))
        {
            while (command->command != 0)
            {
                switch (command->command)
                {
                case 255:
                {
                    break;
                }
                case 1:
                {
                    initialBehavior = command->parameter[0];
                    break;
                }
                case 2:
                {
                    triggeredBehavior = command->parameter[0];
                    break;
                }
                case 3:
                {
                    spectral = 1;
                    break;
                }
                case 22:
                {
                    ambushRange = command->parameter[0];
                    break;
                }
                case 25:
                {
                    mv->ambushJumpType = (char)command->parameter[0];
                    break;
                }
                case 23:
                {
                    mv->ambushArc = (short)((command->parameter[0] << 12) / 360);
                    break;
                }
                case 24:
                {
                    mv->ambushElevation = (short)((command->parameter[0] << 12) / 360);
                    break;
                }
                case 4:
                {
                    wanderRange = command->parameter[0];
                    break;
                }
                case 5:
                {
                    guardRange = command->parameter[0];
                    break;
                }
                case 6:
                {
                    mv->age = (unsigned char)command->parameter[0];
                    break;
                }
                case 7:
                {
                    flags |= 0x100000;
                    break;
                }
                case 8:
                {
                    hitPoints = command->parameter[0];
                    break;
                }
                case 9:
                {
                    instance->flags2 |= 0x20000;

                    flags |= 0x1000000;

                    if (command->numParameters != 0)
                    {
                        mv->regenTime = (short)command->parameter[0];
                    }
                    else
                    {
                        mv->regenTime = 0;
                    }

                    break;
                }
                case 10:
                {
                    short *pmarker;
                    long *param;
                    int i;

                    i = command->numParameters;

                    pmarker = mv->patrolMarkers;

                    param = command->parameter;

                    for (; i != 0; i--)
                    {
                        *pmarker = (short)*param;

                        param++;

                        pmarker++;
                    }

                    *pmarker = 0;

                    mv->currentMarker = mv->patrolMarkers;
                    break;
                }
                case 12:
                {
                    mv->ambushMarker = (char)command->parameter[0];
                    break;
                }
                case 13:
                {
                    mv->fleeMarker = (short)command->parameter[0];
                    break;
                }
                case 14:
                {
                    int i;
                    short *unit;

                    unit = mv->validUnits;

                    for (i = 0; i < command->numParameters; i++, unit++)
                    {
                        *unit = (short)command->parameter[i];
                    }

                    *unit = 0;
                    break;
                }
                case 11:
                {
                    mv->ambient = (unsigned char)command->parameter[0];
                    break;
                }
                case 15:
                {
                    mv->soulID = command->parameter[0];
                    break;
                }
                case 16:
                {
                    mv->causeOfDeath = (unsigned char)command->parameter[0];

                    if (mv->soulID == 0)
                    {
                        mv->soulID = ~0x80000000;
                    }

                    break;
                }
                case 17:
                {
                    mv->auxFlags &= ~0x80000000;
                    break;
                }
                case 20:
                {
                    activeBehavior = command->parameter[0];
                    break;
                }
                }

                command = (INICommand *)&command->parameter[command->numParameters];
            }
        }
    }

    MON_SetDefaults(instance);

    mv->mvFlags ^= flags;

    if (initialBehavior != -1)
    {
        mv->initialBehavior = (char)initialBehavior;

        mv->behaviorState = (char)initialBehavior;
    }

    if (triggeredBehavior != -1)
    {
        mv->triggeredBehavior = (char)triggeredBehavior;
    }

    if (activeBehavior != -1)
    {
        mv->activeBehavior = (char)activeBehavior;
    }

    if (hitPoints != -1)
    {
        mv->hitPoints = (short)(hitPoints << 8);
    }

    if (spectral != 0)
    {
        if ((instance->flags2 & 0x8000000))
        {
            instance->flags2 &= ~0x8000000;
        }
        else
        {
            instance->flags2 |= 0x8000000;
        }
    }

    if (guardRange != 0)
    {
        mv->guardRange = (short)guardRange;
    }

    if (wanderRange != 0)
    {
        mv->wanderRange = (short)wanderRange;
    }

    if (ambushRange != 0)
    {
        mv->ambushRange = (short)ambushRange;
    }

    if ((mv->triggeredBehavior == 8) && (mv->initialBehavior != 4) && (mv->initialBehavior != 16))
    {
        mv->initialBehavior = 4;

        mv->behaviorState = 4;
    }
}

void MON_SetDefaults(Instance *instance)
{
    MonsterVars *mv;
    MonsterAttributes *ma;
    MonsterSubAttributes *subAttr;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    if (mv->age >= ma->numSubAttributes)
    {
        mv->age = ma->numSubAttributes - 1;
    }

    subAttr = ma->subAttributesList[mv->age];

    mv->subAttr = subAttr;

    instance->currentModel = subAttr->modelNum;

    instance->scale.x = instance->scale.y = instance->scale.z = subAttr->scale;

    mv->behaviorState = subAttr->defInitialBehavior;

    mv->initialBehavior = subAttr->defInitialBehavior;
    mv->triggeredBehavior = subAttr->defTriggeredBehavior;

    mv->wanderRange = subAttr->defWanderRange;
    mv->guardRange = subAttr->defGuardRange;
    mv->ambushRange = subAttr->defAmbushRange;

    mv->soulJuice = 4096;

    mv->alertness = 3;

    mv->lastSideMove = 8;

    if (subAttr->combatAttributes != NULL)
    {
        mv->hitPoints = subAttr->combatAttributes->hitPoints * 256;

        if (subAttr->combatAttributes->missileAttack != -1)
        {
            mv->mvFlags |= 0x20;
        }
    }

    if ((mv->age == 2) && ((ma->whatAmI & 0x2)))
    {
        mv->mvFlags |= 0x10000000;
    }

    if (subAttr->defSpectral != 0)
    {
        instance->flags2 |= 0x8000000;
    }

    mv->avoidMask = 0x100;

    if (subAttr->waterVuln != 0)
    {
        mv->avoidMask = 0x110;
    }

    if (subAttr->fireVuln != 0)
    {
        mv->avoidMask |= 0x20;
    }

    if (subAttr->sunVuln != 0)
    {
        mv->avoidMask |= 0x40;
    }

    if (subAttr->soundVuln != 0)
    {
        mv->avoidMask |= 0x200;
    }

    if (subAttr->impaleVuln != 0)
    {
        mv->avoidMask |= 0x80;
    }
}

void MON_GetPlanSlot(MonsterVars *mv)
{
    if (mv->pathSlotID != -1)
    {
        ENMYPLAN_ReleasePlanningWorkspace(mv->pathSlotID);
    }

    mv->pathSlotID = ENMYPLAN_GetInitializedPlanningWorkspaceFinal();
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONLIB", MON_DefaultPlanMovement);

void MON_DropAllObjects(Instance *instance)
{
    Instance *child;
    Instance *next;

    child = instance->LinkChild;

    while (child != NULL)
    {
        next = child->LinkSibling;

        do
        {

        } while (0); // garbage code for reordering 

        if (child->ParentLinkNode == 3)
        {
            INSTANCE_Post(child, 0x800008, 2);
        }
        else
        {
            INSTANCE_Post(child, 0x800008, 1);
        }

        child = next;
    }
}

void MON_EnableHeadMove(Instance *instance)
{
    MonsterAttributes *ma;

    ma = (MonsterAttributes *)instance->data;

    if ((ma->neckSegment != 0) && (G2Anim_IsControllerActive(&instance->anim, ma->neckSegment, 14) == G2FALSE))
    {
        G2Anim_SetControllerAngleOrder(&instance->anim, ma->neckSegment, 14, 1);

        G2Anim_EnableController(&instance->anim, ma->neckSegment, 14);

        if (ma->spineSegment != ma->neckSegment)
        {
            G2Anim_SetControllerAngleOrder(&instance->anim, ma->spineSegment, 14, 1);

            G2Anim_EnableController(&instance->anim, ma->spineSegment, 14);
        }
    }
}

void MON_DisableHeadMove(Instance *instance)
{
    MonsterAttributes *ma;

    ma = (MonsterAttributes *)instance->data;

    if ((ma->neckSegment != 0) && (G2Anim_IsControllerActive(&instance->anim, ma->neckSegment, 14) != G2FALSE))
    {
        G2Anim_DisableController(&instance->anim, ma->neckSegment, 14);

        if ((ma->spineSegment != 0) && (ma->spineSegment != ma->neckSegment))
        {
            G2Anim_DisableController(&instance->anim, ma->spineSegment, 14);
        }
    }
}

void MON_LookInDirection(Instance *instance, short tx, short tz)
{
    G2SVector3 Rot;
    MonsterAttributes *ma;

    ma = (MonsterAttributes *)instance->data;

    if (ma->neckSegment != 0)
    {
        if (ma->spineSegment != ma->neckSegment)
        {
            Rot.y = 0;
            Rot.x = (tx * 70) / 100;
            Rot.z = (tz * 70) / 100;

            G2Anim_SetController_Vector(&instance->anim, ma->neckSegment, 14, &Rot);

            if (ma->spineSegment != 0)
            {
                Rot.y = 0;
                Rot.x = (tx * 30) / 100;
                Rot.z = (tz * 30) / 100;

                G2Anim_SetController_Vector(&instance->anim, ma->spineSegment, 14, &Rot);
            }
        }
        else
        {
            Rot.x = tx;
            Rot.y = 0;
            Rot.z = tz;

            G2Anim_SetController_Vector(&instance->anim, ma->neckSegment, 14, &Rot);
        }
    }
}

void MON_LookAtPos(Instance *instance, Position *position)
{
    MonsterVars *mv;
    short z;
    char temp; // not from decls.h

    temp = 0;

    mv = (MonsterVars *)instance->extraData;

    z = AngleDiff(instance->rotation.z, MATH3D_AngleFromPosToPos(&instance->position, position));

    if (z >= 797)
    {
        z = 796;
    }
    else if (z < -796)
    {
        z = -796;
    }

    if (z < mv->lookAngleZ)
    {
        mv->lookAngleZ -= 273;

        if (mv->lookAngleZ < z)
        {
            mv->lookAngleZ = z;
        }
    }
    else if (mv->lookAngleZ < z)
    {
        mv->lookAngleZ += 273;

        if (z < mv->lookAngleZ)
        {
            mv->lookAngleZ = z;
        }
    }

    if (z != 0) // garbage code for reodering
    {
        temp = -temp;
    }

    mv->lookAngleX = 0;

    MON_LookInDirection(instance, 0, mv->lookAngleZ);
}

void MON_ProcessLookAt(Instance *instance)
{
    MonsterVars *mv;
    int temp; // not from decls.h

    mv = (MonsterVars *)instance->extraData;

    if (mv->mode != 0x80000)
    {
        temp = mv->mvFlags;

        if (temp < 0)
        {
            MON_EnableHeadMove(instance);

            MON_LookAtPos(instance, &mv->lookAtPosData);
        }
        else if (mv->lookAtPos != NULL)
        {
            MON_EnableHeadMove(instance);

            MON_LookAtPos(instance, mv->lookAtPos);

            mv->lookAtPos = NULL;
        }
        else if ((mv->lookAngleX != 0) || (mv->lookAngleZ != 0))
        {
            AngleMoveToward(&mv->lookAngleX, 0, 100);
            AngleMoveToward(&mv->lookAngleZ, 0, 100);

            MON_LookInDirection(instance, mv->lookAngleX, mv->lookAngleZ);
        }
        else
        {
            MON_DisableHeadMove(instance);
        }
    }
}

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
