#include "common.h"

EXTERN STATIC long vmRealClock;

EXTERN STATIC long vmClock;

void VM_Tick(long time)
{
	vmRealClock += time;
    
	vmClock = vmRealClock >> 8;
}

INCLUDE_ASM("asm/nonmatchings/Game/VM", VM_UpdateMorph);

INCLUDE_ASM("asm/nonmatchings/Game/VM", VM_VMObjectSetTable);
