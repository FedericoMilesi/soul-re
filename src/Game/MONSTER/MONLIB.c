#include "common.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MONSTER.h"
#include "Game/MONSTER/MONSENSE.h"
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
#include "Game/CAMERA.h"
#include "Game/GAMELOOP.h"
#include "Game/SOUND.h"
#include "Game/STREAM.h"
#include "Game/G2/ANIMG2.h"
#include "Game/OBTABLE.h"

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

void MON_SwitchState(Instance *instance, enum MonsterState state)
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

void MON_SwitchStateDoEntry(Instance *instance, enum MonsterState state)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    MON_SwitchState(instance, state);

    if (mv != NULL)
    {
        (((MonsterState *)MONTABLE_GetStateFuncs(instance, instance->currentMainState))->entryFunction)(instance);

        mv->mvFlags &= ~0x1;
    }
}

int MON_TransNodeAnimation(Instance *instance)
{
    return G2Anim_SegmentHasActiveChannels(&instance->anim, 0, 0x700);
}

MonsterAnim *MON_GetAnim(Instance *instance, char *animList, int index)
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
    MonsterAnim *manim;
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

void MON_PlayAnim(Instance *instance, enum MonsterAnim animtype, int mode)
{
    MON_PlayAnimFromList(instance, ((MonsterVars *)instance->extraData)->subAttr->animList, animtype, mode);
}

int MON_AnimPlaying(Instance *instance, enum MonsterAnim animtype)
{
    return MON_AnimPlayingFromList(instance, ((MonsterVars *)instance->extraData)->subAttr->animList, animtype);
}

void MON_PlayAnimIfNotPlaying(Instance *instance, enum MonsterAnim animtype, int mode)
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

int MON_ShouldIEvade(Instance *instance)
{
    
    int rv;
    MonsterVars *mv;

    mv = (MonsterVars *) instance->extraData;
    rv = 0;
    
    if (!(mv->mvFlags & 0x40000000))
    {

        MonsterIR *enemy;
        enemy = mv->enemy;
        
        if ((unsigned short) (MON_FacingOffset(instance, enemy->instance) + 0x2A9U) < 0x553U)
        {
            if (MON_CheckConditions(instance, enemy, mv->subAttr->combatAttributes->evadeProbability) != 0) {
                mv->enemy->mirConditions = 0;
                rv = 1;
            }
        }
    }
    
    return rv;
}

int MON_ChooseLeftOrRight(struct _Instance *instance, struct _MonsterIR *enemy)
{
    
    short offset;
    int leftDist;
    int rightDist;
    
    offset = MON_FacingOffset(instance, enemy->instance);
    
    if (offset >= -0x40)
    {
        if (offset >= 0x41)
        {
            return 1;
        }
        
        leftDist = MONSENSE_GetDistanceInDirection(instance, instance->rotation.z + 0x400);
        rightDist = MONSENSE_GetDistanceInDirection(instance, instance->rotation.z - 0x400);
        
        if (leftDist != rightDist)
        {
            if (leftDist < rightDist)
            {
                return 1;
            }
            return -1;
        }
        return 0;
    }
    return -1;
}

int MON_ChooseEvadeMove(Instance *instance)
{
    
    int anim; // v0
    int leftOrRight; // v1
    
    leftOrRight = MON_ChooseLeftOrRight(instance, ((MonsterVars *)instance->extraData)->enemy);

    if (leftOrRight == 0)
    {
        if (rand() & 1)
        {
            leftOrRight = 1;
        }
        else
        {
            leftOrRight = -1;
        }
    }
    
    anim = MONSTER_ANIM_EVADERIGHT;
    if (leftOrRight < 0)
    {
        anim = MONSTER_ANIM_EVADELEFT;
    }
    
    return anim;
}

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
            idle = &ma->idleList[(int)((MonsterBehavior *)((uintptr_t)behavior + mv->ambient))->idleList[0]];
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

    MON_PlayAnimIfNotPlaying(instance, (enum MonsterAnim)anim, mode);
}

void MON_GetRandomPoint(Position *out, Position *in, short r)
{
    
    int mult;
    int ang;
    
    mult = rand() % r;
    ang = rand();

    out->x = in->x + (mult * rcos(ang) >> 0xC);
    out->y = in->y + (mult * rsin(ang) >> 0xC);
    out->z = in->z;
}

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

    return PhysicsCheckGravity(instance, (intptr_t)&data.UpperOffset, (!(mv->mvFlags & 0x800)) << 2);
}

void MON_ApplyPhysics(Instance *instance)
{
    PhysicsMove(instance, &instance->position, gameTrackerX.timeMult);
}

void MON_ChangeBehavior(Instance *instance, int behavior)
{
    
    enum MonsterState state;
    MonsterVars *mv;

    if (behavior != -1)
    {
        mv = (MonsterVars *)instance->extraData;
        switch (behavior) {
        case 9:
            state = MONSTER_STATE_FLEE;
            break;
        case 2:
            state = MONSTER_STATE_WANDER;
            break;
        case 4:
        case 8:
            state = MONSTER_STATE_HIDE;
            break;
        case 11:
        default:
            state = MONSTER_STATE_PURSUE;
            break;
        }
        MON_SwitchState(instance, state);
        mv->behaviorState = behavior;
    }
}


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

int MON_CheckPointSuitability(Instance *instance, Position *origin, Position *destination)
{
    int result;
    int rc;
    MonsterVars *mv;
    evPhysicsDropHeightData *data;

    rc = 0;
    mv = (MonsterVars *)instance->extraData;
    data = (evPhysicsDropHeightData *)SetPhysicsDropHeightData(destination, mv->subAttr->fallDistance, 0x40);
    result = PhysicsCheckDropHeight(instance, (intptr_t) data, 1);
    
    if (result == 1)
    {
        result = MON_CheckTerrain(instance, data->bsp, data->tface) | 1;
        destination->z = data->origin.z;
    }

    
    if (!(result & mv->avoidMask))
    {
        if (mv->mvFlags & 0x800 || result != 0)
        {
            rc = 1;
        }
    }
    
    return rc;
}


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

void MON_BirthSoul(Instance *instance, int link)
{

    MonsterVars *mv;
    mv = instance->extraData;

    if (mv->soulJuice != 0)
    {

        long soulID;
        soulID = mv->soulID;

        if (soulID == 0 || soulID >= 0x2000)
        {

            Object *soulObj;
            soulObj = (Object *)objectAccess[9].object;

            if (soulObj != NULL)
            {

                Instance *newInstance;
                newInstance = INSTANCE_BirthObject(instance, soulObj, 0);

                if (newInstance != NULL)
                {

                    if (mv->soulID >= 0x2000)
                    {

                        newInstance->flags2 |= 0x08000000;
                        MORPH_SetupInstanceFlags(newInstance);
                    }

                    if (link != 0)
                    {
                        mv->soulID = newInstance->introUniqueID;
                    }
                    else
                    {
                        newInstance->parent = NULL;
                    }

                    if (instance->matrix != NULL)
                    {

                        MATRIX *mat;
                        mat = instance->matrix + 1;

                        newInstance->position.x = mat->t[0];
                        newInstance->position.y = mat->t[1];
                        newInstance->position.z = mat->t[2];
                    }

                    ((MonsterVars *)newInstance->extraData)->soulJuice = mv->soulJuice;
                }
            }
        }
        else
        {

            Instance *monster;
            monster = INSTANCE_Find(soulID);

            if (monster != NULL)
            {

                instance->flags2 &= ~0x80;
                mv->soulID = monster->introUniqueID;
                ((MonsterVars *)monster->extraData)->soulID = instance->introUniqueID;
            }
            else
            {
                instance->flags2 |= 0x80;
            }
        }
    }
}

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

    if (z != 0) // garbage code for reordering
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

int MON_TakeDamage(Instance *instance, int damage, int type)
{
    
    MonsterVars *mv;
    MonsterCombatAttributes *mca;

    mv = instance->extraData;
    mca = mv->subAttr->combatAttributes;
    
    if (mca != NULL)
    {

        if ((signed char) mca->hitPoints != 0)
        {
            
            uintptr_t enemyInstance;
            enemyInstance = INSTANCE_Query(instance, 1);

            if (type != 0x40000 || enemyInstance & 8)
            {
                
                mv->hitPoints -= damage;
                mv->damageType = type;
                
                if (mv->hitPoints <= 0)
                {
                    mv->hitPoints = 0;
                    return 1;
                }
            }
        }
    }
    
    return 0;
}

void MON_SetUpSaveInfo(Instance *instance, MonsterSaveInfo *saveData)
{
    MonsterVars *mv;
    MonsterAttributes *ma;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    saveData->mvFlags = mv->mvFlags & ~0x440004;
    saveData->auxFlags = mv->auxFlags & ~0x8000000;

    saveData->age = mv->age;

    saveData->state = instance->currentMainState;

    saveData->behaviorState = mv->behaviorState;

    saveData->causeOfDeath = mv->causeOfDeath;

    if ((instance->currentMainState == MONSTER_STATE_DEAD) && (mv->causeOfDeath == 0))
    {
        saveData->soulJuice = mv->heldID;
    }
    else
    {
        saveData->soulJuice = mv->soulJuice;
    }

    saveData->soulID = mv->soulID;

    if (mv->anim != NULL)
    {
        saveData->animLooping = instance->anim.section->flags >> 1;

        saveData->anim = mv->anim - ma->animList;
    }
    else
    {
        saveData->anim = ma->numAnims;
    }
}

void MON_GetSaveInfo(Instance *instance, MonsterSaveInfo *saveData)
{
    MonsterVars *mv;
    MonsterAttributes *ma;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    do
    {

    } while (0); // garbage code for reordering

    mv->age = saveData->age;

    mv->subAttr = ma->subAttributesList[mv->age];

    instance->currentModel = mv->subAttr->modelNum;

    if (!(saveData->mvFlags & 0x8000))
    {
        MON_TurnOffBodySpheres(instance);
    }
    else
    {
        MON_TurnOnBodySpheres(instance);
    }

    mv->mvFlags = saveData->mvFlags | (mv->mvFlags & 0xC000);
    mv->auxFlags = saveData->auxFlags | (mv->auxFlags & 0x8000000);

    mv->behaviorState = saveData->behaviorState;

    mv->causeOfDeath = saveData->causeOfDeath;

    mv->soulID = saveData->soulID;

    mv->soulJuice = saveData->soulJuice;

    switch (saveData->state)
    {
    case 16:
        instance->flags2 &= ~0x40;

        mv->soulID = ~0x80000000;
    case 23:
        if (mv->causeOfDeath == 0)
        {
            mv->heldID = mv->soulJuice;

            mv->soulJuice = 4096;

            instance->flags2 |= 0x80;
        }

        instance->currentMainState = MONSTER_STATE_DEAD;
        break;
    case 10:
    case 11:
    case 12:
    case 14:
        instance->currentMainState = MONSTER_STATE_IDLE;
        break;
    case 6:
    case 8:
    case 9:
    case 21:
    case 28:
        instance->currentMainState = MONSTER_STATE_COMBAT;
        break;
    default:
        instance->currentMainState = saveData->state;
    }

    {
        int mode;

        mode = 1;

        instance->position = instance->oldPos;

        if (saveData->anim < ma->numAnims)
        {
            if (saveData->animLooping)
            {
                mode = 2;
            }

            if (instance->currentMainState == MONSTER_STATE_DEAD)
            {
                MON_PlayAnim(instance, MONSTER_ANIM_GENERALDEATH, 1);
            }
            else
            {
                MON_PlayAnimID(instance, saveData->anim, mode);
            }
        }
    }
}

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

int MON_ValidUnit(Instance *instance, unsigned long unitId)
{
    MonsterVars *mv;
    short *unit;

    mv = (MonsterVars *)instance->extraData;

    unit = (short *)&mv->validUnits;

    if (*unit == 0)
    {
        return 1;
    }

    while (*unit != 0)
    {
        if ((unsigned short)unitId == (unsigned short)*unit++)
        {
            return 1;
        }
    }

    return 0;
}

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

void MON_TurnOffSphereCollisions(Instance *instance)
{
    
    int i;
    HModel *hmodel;

    hmodel = &instance->hModelList[instance->currentModel];
    i = hmodel->numHPrims;
    
    if (i != 0)
    {
        
        HPrim *hprim;
        hprim = hmodel->hPrimList;
        
        if (hprim->withFlags & 0x20)
        {
            for (; i != 0; i--, hprim++)
            {
                hprim->withFlags &= 0xDF;
            }
        }
    }
}

void MON_TurnOnSphereCollisions(Instance *instance)
{
    
    int i;
    HModel *hModel;
    
    hModel = &instance->hModelList[instance->currentModel];
    i = hModel->numHPrims;
    
    if (i != 0)
    {
        
        HPrim *hprim;
        hprim = hModel->hPrimList;
        
        if (!(hprim->withFlags & 0x20))
        {
            for (; i != 0; i--, hprim++)
            {
                hprim->withFlags |= 0x20;
            } 
        }
    }
}

void MON_ProcessSpecialFade(Instance *instance)
{
    MonsterVars *mv;
    int currentFadeValue;
    int targetFadeValue;
    int fadeRate;
    Instance *child;
    int temp; // not from decls.h

    mv = (MonsterVars *)instance->extraData;

    if ((instance->object->oflags & 0x80000))
    {
        if ((instance->currentMainState != MONSTER_STATE_DEAD) && (instance->currentMainState != MONSTER_STATE_GENERALDEATH))
        {
            if ((*(int *)&gameTrackerX.gameData.asmData.MorphTime == 1000) || ((gameTrackerX.gameData.asmData.MorphType == 1) && (gameTrackerX.gameData.asmData.MorphTime != 1000))) // double-check
            {
                targetFadeValue = mv->targetFade;

                currentFadeValue = 4096 - targetFadeValue;
            }
            else
            {
                currentFadeValue = mv->targetFade;

                targetFadeValue = 4096 - currentFadeValue;
            }

            if (gameTrackerX.gameData.asmData.MorphTime < 333)
            {
                instance->fadeValue = currentFadeValue + (((4096 - currentFadeValue) * gameTrackerX.gameData.asmData.MorphTime) / 333);
            }
            else if (gameTrackerX.gameData.asmData.MorphTime > 666)
            {
                instance->fadeValue = (((targetFadeValue - 4096) * (gameTrackerX.gameData.asmData.MorphTime - 666)) / 333) + 4096;
            }
            else
            {
                instance->fadeValue = 4096;
            }

            if (instance->fadeValue < 0)
            {
                instance->fadeValue = 0;
            }
            else if (instance->fadeValue > 4096)
            {
                instance->fadeValue = 4096;
            }

            if (instance->fadeValue == 4096)
            {
                MON_TurnOffSphereCollisions(instance);

                instance->flags |= 0x800;
            }
            else
            {
                MON_TurnOnSphereCollisions(instance);

                instance->flags &= ~0x800;
            }
        }
    }
    else if ((mv->auxFlags & 0x8000000))
    {
        fadeRate = mv->fadeRate;

        targetFadeValue = mv->targetFade;

        temp = fadeRate * gameTrackerX.timeMult;

        currentFadeValue = instance->fadeValue + (temp / 4096);

        if (fadeRate > 0)
        {
            if (targetFadeValue < currentFadeValue)
            {
                currentFadeValue = targetFadeValue;

                mv->auxFlags &= ~0x8000000;
            }
        }
        else if (currentFadeValue < targetFadeValue)
        {
            currentFadeValue = targetFadeValue;

            mv->auxFlags &= ~0x8000000;
        }

        instance->fadeValue = currentFadeValue;
    }

    for (child = instance->LinkChild; child != NULL; child = child->LinkSibling)
    {
        child->fadeValue = instance->fadeValue;
    }
}

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

void MON_BurnInAir(Instance *instance, int currentState)
{
    
    MonsterVars *mv;
    mv = (MonsterVars *) instance->extraData;
    
    if (!(mv->mvFlags & 0x400000))
    {
        mv->mvFlags |= 0x400000;
        mv->effectTimer = MON_GetTime(instance) + 0x2710;
        MON_MonsterGlow(instance, 0x4960, -1, 0, 0);
        INSTANCE_Post(instance, 0x400000, SetFXHitData(NULL, 0, 0, 0x20));
    }
    
    instance->currentMainState = currentState;
    mv->mvFlags &= ~1;
    instance->checkMask &= ~0x20;
}

void MON_BirthMana(Instance *instance)
{
    MonsterVars *mv;

    if (instance->matrix != NULL)
    {
        mv = (MonsterVars *)instance->extraData;

        if (mv->chance < 25)
        {
            int type;
            MATRIX *mat;

            type = ((rand() % 100) < 80) == 0;

            mat = &instance->matrix[1];

            PHYSOB_BirthCollectible(instance, mat->t[0], mat->t[1], mat->t[2], type, 10);
        }
    }
}

void MON_SoulSucked(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    if ((mv->mvFlags & 0x200))
    {
        if (!(((MonsterAttributes *)instance->data)->whatAmI & 0x8))
        {
            mv->damageTimer = MON_GetTime(instance);
        }

        mv->soulID = 0;

        MON_BirthMana(instance);
    }
}

int MON_SetUpKnockBack(Instance *instance, Instance *enemy, evMonsterHitData *data)
{
    MonsterVars *mv;
    long d;
    long t;
    long a;
    long v;
    int front;
    short temp; // not from decls.h

    mv = (MonsterVars *)instance->extraData;

    d = data->knockBackDistance;
    t = data->knockBackDuration;

    a = PHYSICS_FindAFromDAndT(d, t);
    v = PHYSICS_FindVFromAAndD(a, d);

    temp = ((instance->rotation.z - MATH3D_AngleFromPosToPos(&instance->position, &enemy->position)) + 1024) & 0xFFF;

    if (temp <= 2047)
    {
        MON_TurnToPosition(instance, &enemy->position, 4096);

        PHYSICS_SetVAndAFromRot(instance, &instance->rotation, -v, a);

        front = 1;
    }
    else
    {
        PHYSICS_SetVAndAFromRot(instance, &instance->rotation, v, -a);

        front = 0;
    }

    mv->generalTimer = MON_GetTime(instance) + (t * 33);

    return front;
}

void MON_DoDrainEffects(Instance *instance, Instance *ei)
{
    MonsterAttributes *ma;
    MonsterVars *mv;
    MATRIX *mat;
    SVector location;
    SVector position;
    SVector vel;
    SVector accel;

    ma = (MonsterAttributes *)instance->data;

    mv = (MonsterVars *)instance->extraData;

    memset(&accel, 0, sizeof(SVector));

    if (ei == gameTrackerX.playerInstance)
    {
        mat = &ei->matrix[(rand() % (ei->object->modelList[ei->currentModel]->numSegments - 16)) + 14];
    }
    else
    {
        mat = &ei->matrix[rand() % ei->object->modelList[ei->currentModel]->numSegments];
    }

    location.x = mat->t[0];
    location.y = mat->t[1];
    location.z = mat->t[2];

    mat = &instance->matrix[ma->headSegment];

    vel.x = (mat->t[0] - location.x) / 48;
    vel.y = (mat->t[1] - location.y) / 48;
    vel.z = (mat->t[2] - location.z) / 48;

    position.x = mat->t[0];
    position.y = mat->t[1];
    position.z = mat->t[2];

    FX_Dot(&location, &vel, &accel, 0, 0xFF6060, 24, 20, 0);

    if (ei == gameTrackerX.playerInstance)
    {
        mat = &ei->matrix[14];

        location.x = mat->t[0];
        location.y = mat->t[1];
        location.z = mat->t[2];

        mv->effectTimer = (mv->effectTimer + ((gameTrackerX.timeMult * 80) / 4096)) & 0xFFF;

        FX_Lightning(theCamera.core.wcTransform, gameTrackerX.drawOT, NULL, mv->effectTimer, &position, &location, 0, 96, 24, 80, 1, 0xD06060, 0xFF6400);
    }
}

void MON_SetFXHitData(Instance *instance, evFXHitData *data, int type, int amount)
{
    data->type = type;

    data->amount = amount;

    if (instance->matrix != NULL)
    {
        MATRIX *mat;

        mat = &instance->matrix[((MonsterAttributes *)instance->data)->spineSegment];

        data->location.x = mat->t[0];
        data->location.y = mat->t[1];
        data->location.z = mat->t[2];
    }
    else
    {
        data->location.x = instance->position.x;
        data->location.y = instance->position.y;
        data->location.z = instance->position.z + 256;
    }

    data->velocity.x = 0;
    data->velocity.y = 0;
    data->velocity.z = 0;
}

void MON_LaunchMonster(Instance *instance, int zDirection, int power, int loft)
{
    instance->rotation.z = zDirection + 2048;
    instance->rotation.x = 0;
    instance->rotation.y = 0;

    instance->xAccl = 0;
    instance->yAccl = 0;
    instance->zAccl = -8;

    if (MON_SetVelocityTowardsImpalingObject(instance, 1) == 0)
    {
        PhysicsSetVelFromZRot(instance, zDirection, power);

        instance->zVel = loft;
    }

    MON_SwitchState(instance, MONSTER_STATE_THROWN);
}