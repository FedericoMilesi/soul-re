#include "common.h"

static long vmRealClock = 0;

static long vmClock = 0;

void VM_Tick(long time)
{
	vmRealClock += time;
    
	vmClock = vmRealClock >> 8;
}

INCLUDE_ASM("asm/nonmatchings/Game/VM", VM_UpdateMorph);

INCLUDE_ASM("asm/nonmatchings/Game/VM", VM_VMObjectSetTable);
