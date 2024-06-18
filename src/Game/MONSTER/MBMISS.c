#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/PHYSOBS.h"
#include "Game/STATE.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MBMISS.h"
#include "Game/PSX/SUPPORT.h"

extern char D_800D1BFC[];

void WCBEGG_Message(Instance *instance, unsigned long message, unsigned long data)
{
    //PhysObData *pod; unused
    Dummy *temp; // not from decls.h

    if (message == 0x800002)
    {
        if (instance->processFunc != WCBEGG_Process)
        {
            return;
        }

        temp = (Dummy *)instance->extraData; // extraData needs parsing to the correct struct

        temp->unknown = MON_GetTime(instance);

        G2EmulationInstanceSwitchAnimationAlpha(instance, 0, 1, 0, 0, 2, 0);
    }

    PhysicalObjectPost(instance, message, data);
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ShouldIgniteEgg);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_Process);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ExplodeProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_SplitProcess);

void WCBEGG_CommonPostProcess(Instance *instance, GameTracker *gameTracker)
{
    //PhysObData *data; unused
    Dummy *temp; // not from decls.h

    temp = (Dummy *)instance->extraData; // extraData needs parsing to the correct struct

    INSTANCE_Post(gameTrackerX.playerInstance, 0x40003, SetActionPlayHostAnimationData(gameTrackerX.playerInstance, instance, 6, 0, 0, 2));

    instance->processFunc = WCBEGG_CommonPostProcess2;

    temp->unknown = MON_GetTime(instance);

    ProcessPhysicalObject(instance, gameTracker);
}

void WCBEGG_CommonPostProcess2(Instance *instance, GameTracker *gameTracker)
{
    //PhysObData *data; unused
    int time;
    Dummy *temp; // not from decls.h

    temp = (Dummy *)instance->extraData; // extraData needs parsing to the correct struct

    time = 3960;

    if ((long)MON_GetTime(instance) >= (temp->unknown + time))
    {
        INSTANCE_UnlinkFromParent(instance);

        INSTANCE_KillInstance(instance);
    }
    else
    {
        ProcessPhysicalObject(instance, gameTracker);
    }
}

void WCBEGG_ExplodeCollide(Instance *instance, GameTracker *gameTracker)
{
    CollideInfo *collideInfo;
    HSphere *s1;
    Instance *inst1;
    PhysObData *data;
    HSphere *temp; // not from decls.h

    collideInfo = instance->collideInfo;

    data = (PhysObData *)instance->extraData;

    s1 = (unsigned char)collideInfo->type1;

    temp = collideInfo->prim1;

    if (((int)s1 == 1) && (temp->id == 8))
    {
        inst1 = collideInfo->inst1;

        if ((inst1 != NULL) && (INSTANCE_Query(inst1, 1) == 0x10102))
        {
            if (instance->LinkParent == NULL)
            {
                if ((data->Mode & 0x10000))
                {
                    INSTANCE_Post(inst1, 0x1000017, 2);

                    G2EmulationInstanceSwitchAnimationAlpha(instance, 0, 4, 0, 0, (int)s1, 0);

                    instance->processFunc = WCBEGG_ExplodeProcess;
                }
                else
                {
                    G2EmulationInstanceSwitchAnimationAlpha(instance, 0, 3, 0, 0, (int)s1, 0);

                    instance->processFunc = WCBEGG_SplitProcess;
                }

                data->Mode = (data->Mode | 0x1001) & ~0x4000;

                instance->zVel = 0;
                instance->yVel = 0;
                instance->xVel = 0;

                ((Dummy *)data)->unknown = MON_GetTime(instance); // data needs parsing to the correct struct
            }

            TurnOffCollisionPhysOb(instance, 7);
            return;
        }
    }

    CollidePhysicalObject(instance, gameTracker);

    data->zRotVel = 0;
    data->yRotVel = 0;
    data->xRotVel = 0;

    data->throwFlags &= ~0x1;
}

void WCBEGG_Collide(Instance *instance, GameTracker *gameTracker)
{
    CollideInfo *collideInfo;
    Instance *inst1;

    collideInfo = (CollideInfo *)instance->collideInfo;

    if (((unsigned char)collideInfo->type1 != 1) || (inst1 = (Instance *)collideInfo->inst1, strcmpi(inst1->object->name, D_800D1BFC) != 0))
    {
        TurnOffCollisionPhysOb(instance, 7);

        instance->collideFunc = WCBEGG_ExplodeCollide;
    }

    CollidePhysicalObject(instance, gameTracker);
}

long WALBOSC_AnimCallback(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, Instance *instance)
{
    if (message == G2ANIM_MSG_DONE)
    {
        COLLIDE_SegmentCollisionOff(instance, 1);

        instance->flags |= 0x800;

        instance->flags2 |= 0x20000000;

        instance->halvePlane.flags = 0;
    }
    else
    {
        INSTANCE_DefaultAnimCallback(anim, sectionID, message, messageDataA, messageDataB, instance);
    }

    return messageDataA;
}

void WALBOSC_Collide(Instance *instance, GameTracker *gameTracker)
{
    CollideInfo *collideInfo;
    HSphere *s1;
    Instance *inst1;

    (void)gameTracker;

    collideInfo = (CollideInfo *)instance->collideInfo;

    inst1 = collideInfo->inst1;

    s1 = collideInfo->prim1;

    if (s1->id == 8)
    {
        PhysObWeaponProperties *Prop;

        Prop = (PhysObWeaponProperties *)instance->data;

        COLLIDE_SegmentCollisionOff(instance, 1);

        INSTANCE_Post(inst1, 0x400000, SetFXHitData(instance, (unsigned char)collideInfo->segment, Prop->WeaponAttributes.Damage / 128, 256));
        INSTANCE_Post(inst1, 0x1000000, SetMonsterHitData(instance, NULL, Prop->WeaponAttributes.Damage, Prop->WeaponAttributes.knockBackDistance, Prop->WeaponAttributes.knockBackFrames));
    }
}

void WALBOSC_Message(Instance *instance, unsigned long message, unsigned long data)
{
    if ((message == 0x1000017) && (data == 0))
    {
        COLLIDE_SegmentCollisionOff(instance, 1);

        instance->flags2 |= 0x20000000;
    }
}
