#include "common.h"
#include "Game/INSTANCE.h"
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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WALBOSC_Collide);

void WALBOSC_Message(Instance *instance, unsigned long message, unsigned long data)
{
    if ((message == 0x1000017) && (data == 0))
    {
        COLLIDE_SegmentCollisionOff(instance, 1);

        instance->flags2 |= 0x20000000;
    }
}
