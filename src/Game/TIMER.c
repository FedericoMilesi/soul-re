#include "common.h"

EXTERN volatile int gameTimer;

unsigned long TIMER_GetTimeMS()
{
    unsigned long ticks;
    unsigned long mticks;

    EnterCriticalSection();

    ticks = GetRCnt(0xF2000000) & 0xFFFF;

    mticks = gameTimer;

    ExitCriticalSection();

    return ((mticks >> 16) * 126819) + ((ticks | mticks << 16) / 33869);
}

INCLUDE_ASM("asm/nonmatchings/Game/TIMER", TIMER_TimeDiff);
