#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/PHYSOBS.h"
#include "Game/STATE.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MBMISS.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ExplodeCollide);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_Collide);

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
