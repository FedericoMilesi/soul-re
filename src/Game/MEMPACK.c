#include "common.h"
#include "Game/MEMPACK.h"
#include "Game/LOAD3D.h"

static NewMemTracker newMemTracker;

int overlayAddress;

void MEMPACK_Init()
{
    newMemTracker.rootNode = (MemHeader *)overlayAddress;

    newMemTracker.totalMemory = (0x80000000 + (2097152 - (1048576 / 256))) - overlayAddress;

    newMemTracker.rootNode->magicNumber = 0xBADE;

    newMemTracker.rootNode->memStatus = 0;
    newMemTracker.rootNode->memType = 0;
    newMemTracker.rootNode->memSize = newMemTracker.totalMemory;

    newMemTracker.lastMemoryAddress = (char *)newMemTracker.rootNode + newMemTracker.totalMemory;

    newMemTracker.currentMemoryUsed = 0;

    newMemTracker.doingGarbageCollection = 0;
}

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

unsigned long MEMPACK_Size(char *address)
{
    return ((int *)address)[-1] - sizeof(MemHeader);
}

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

void MEMPACK_SetMemoryBeingStreamed(char *address)
{
    address[-6] = 2;
}

void MEMPACK_SetMemoryDoneStreamed(char *address)
{
    address[-6] = 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_MemoryValidFunc);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GarbageCollectMalloc);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GarbageSplitMemoryNow);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GarbageCollectFree);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_DoGarbageCollection);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocateAreaType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocateG2AnimKeylistType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocateObjectType);

void MEMPACK_RelocateCDMemory(MemHeader *newAddress, long offset, BigFileDir *oldDir)
{
    BigFileDir *newDir;

    (void)offset;

    newDir = (BigFileDir *)(newAddress + 1);

    LOAD_UpdateBigFilePointers(oldDir, newDir);
}
