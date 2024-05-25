#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/GAMELOOP.h"
#include "Game/COLLIDE.h"
#include "Game/PHYSOBS.h"
#include "Game/G2/ANIMG2.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_Message);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ShouldIgniteEgg);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_Process);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ExplodeProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_SplitProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_CommonPostProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_CommonPostProcess2);

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
