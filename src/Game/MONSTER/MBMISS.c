#include "common.h"
#include "Game/INSTANCE.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_Message);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ShouldIgniteEgg);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_Process);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ExplodeProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_SplitProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_CommonPostProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_CommonPostProcess2);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_ExplodeCollide);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WCBEGG_Collide);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WALBOSC_AnimCallback);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MBMISS", WALBOSC_Collide);

void WALBOSC_Message(Instance *instance, unsigned long message, unsigned long data)
{
    if ((message == 0x1000017) && (data == 0))
    {
        COLLIDE_SegmentCollisionOff(instance, 1);

        instance->flags2 |= 0x20000000;
    }
}
