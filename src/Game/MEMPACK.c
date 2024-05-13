#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Init);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GetSmallestBlockTopBottom);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_GetSmallestBlockBottomTop);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_RelocatableType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Malloc);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMORY_MergeAddresses);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Return);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Free);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_FreeByType);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_Size);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_ReportFreeMemory);

INCLUDE_ASM("asm/nonmatchings/Game/MEMPACK", MEMPACK_ReportMemory2);

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
