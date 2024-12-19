#include "common.h"
#include "Game/MEMPACK.h"
#include "Game/LOAD3D.h"
#include "Game/HASM.h"

static NewMemTracker newMemTracker;

void MEMPACK_Init()
{
    newMemTracker.rootNode = (MemHeader *)overlayAddress;

    newMemTracker.totalMemory = (0x80000000 + (0x200000 - (0x100000 / 256))) - (intptr_t)overlayAddress;

    newMemTracker.rootNode->magicNumber = 0xBADE;

    newMemTracker.rootNode->memStatus = 0;
    newMemTracker.rootNode->memType = 0;
    newMemTracker.rootNode->memSize = newMemTracker.totalMemory;

    newMemTracker.lastMemoryAddress = (char *)newMemTracker.rootNode + newMemTracker.totalMemory;

    newMemTracker.currentMemoryUsed = 0;

    newMemTracker.doingGarbageCollection = 0;
}

MemHeader *MEMPACK_GetSmallestBlockTopBottom(long allocSize)
{
    MemHeader *address;
    MemHeader *bestAddress;

    address = newMemTracker.rootNode;

    bestAddress = NULL;

    while ((char *)address != newMemTracker.lastMemoryAddress)
    {
        if ((address->memStatus == 0) && (address->memSize >= (unsigned long)allocSize) && (bestAddress == NULL))
        {
            bestAddress = address;
            break;
        }

        address = (MemHeader *)((char *)address + address->memSize);
    }

    return bestAddress;
}

MemHeader *MEMPACK_GetSmallestBlockBottomTop(long allocSize)
{
    MemHeader *address;
    MemHeader *bestAddress;

    address = newMemTracker.rootNode;

    bestAddress = NULL;

    while ((char *)address != newMemTracker.lastMemoryAddress)
    {
        if ((address->memStatus == 0) && (address->memSize >= (unsigned long)allocSize) && ((bestAddress == NULL) || ((char *)address > (char *)bestAddress)))
        {
            bestAddress = address;
        }

        address = (MemHeader *)((char *)address + address->memSize);
    }

    return bestAddress;
}

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

void MEMPACK_Return(char *address, long takeBackSize)
{
    MemHeader *memAddress;
    MemHeader *nextAddress;

    takeBackSize = (takeBackSize >> 2) << 2;

    if (takeBackSize >= (long)sizeof(MemHeader))
    {
        memAddress = (MemHeader *)(address - 8);

        memAddress->memSize -= takeBackSize;

        newMemTracker.currentMemoryUsed -= takeBackSize;

        memAddress = (MemHeader *)((char *)memAddress + memAddress->memSize);

        memAddress->magicNumber = 0xBADE;

        memAddress->memStatus = 0;
        memAddress->memType = 0;
        memAddress->memSize = takeBackSize;

        nextAddress = (MemHeader *)((char *)memAddress + takeBackSize);

        if ((char *)nextAddress != newMemTracker.lastMemoryAddress)
        {
            MEMORY_MergeAddresses(memAddress, nextAddress);
        }
    }
}

void MEMPACK_Free(char *address)
{
    MemHeader *memAddress;
    MemHeader *secondAddress;

    memAddress = (MemHeader *)(address - 8);

    memAddress->memStatus = 0;
    memAddress->memType = 0;

    newMemTracker.currentMemoryUsed -= memAddress->memSize;

    secondAddress = (MemHeader *)((char *)memAddress + memAddress->memSize);

    if ((char *)secondAddress != newMemTracker.lastMemoryAddress)
    {
        MEMORY_MergeAddresses(memAddress, secondAddress);
    }

    secondAddress = memAddress;

    memAddress = newMemTracker.rootNode;

    while ((char *)memAddress != newMemTracker.lastMemoryAddress)
    {
        if (((char *)memAddress + memAddress->memSize) == (char *)secondAddress)
        {
            MEMORY_MergeAddresses(memAddress, (MemHeader *)((char *)memAddress + memAddress->memSize));
            break;
        }

        memAddress = (MemHeader *)((char *)memAddress + memAddress->memSize);
    }
}

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
