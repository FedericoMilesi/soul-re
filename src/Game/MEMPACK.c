#include "common.h"
#include "Game/MEMPACK.h"

static NewMemTracker newMemTracker;

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Init);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GetSmallestBlockTopBottom);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GetSmallestBlockBottomTop);

long MEMPACK_RelocatableType(long memType)
{
    if ((memType == 1) || (memType == 2) || (memType == 44) || (memType == 47) || (memType == 4))
    {
        return 1;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Malloc);

void MEMORY_MergeAddresses(MemHeader *firstAddress, MemHeader *secondAddress)
{
    if ((firstAddress->memStatus == 0) && (secondAddress->memStatus == 0))
    {
        firstAddress->memSize += secondAddress->memSize;

        secondAddress->magicNumber = 0;
        secondAddress->memStatus = 1;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Return);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Free);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_FreeByType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Size);

unsigned long MEMPACK_ReportFreeMemory()
{
    return newMemTracker.totalMemory - newMemTracker.currentMemoryUsed;
}

void MEMPACK_ReportMemory2()
{
    MemHeader *address;

    address = newMemTracker.rootNode;

    while ((char *)address != newMemTracker.lastMemoryAddress)
    {
        address = (MemHeader *)((char *)address + address->memSize);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_ReportMemory);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_SetMemoryBeingStreamed);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_SetMemoryDoneStreamed);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_MemoryValidFunc);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GarbageCollectMalloc);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GarbageSplitMemoryNow);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GarbageCollectFree);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_DoGarbageCollection);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocateAreaType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocateG2AnimKeylistType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocateObjectType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocateCDMemory);
