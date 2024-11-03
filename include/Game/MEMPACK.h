#ifndef _MEMPACK_H_
#define _MEMPACK_H_

// size: 0x8
typedef struct MemHeader
{
    // offset: 0000
    unsigned short magicNumber;
    // offset: 0002
    unsigned char memStatus;
    // offset: 0003
    unsigned char memType;
    // offset: 0004
    unsigned long memSize;
} MemHeader;

// size: 0x14
typedef struct NewMemTracker
{
    // offset: 0000 (8 bytes)
    struct MemHeader *rootNode;
    // offset: 0004
    unsigned long totalMemory;
    // offset: 0008
    unsigned long currentMemoryUsed;
    // offset: 000C
    char *lastMemoryAddress;
    // offset: 0010
    long doingGarbageCollection;
} NewMemTracker;

char *MEMPACK_Malloc(unsigned long allocSize, unsigned char memType);
void MEMPACK_Free(char *address);
long MEMPACK_MemoryValidFunc(char *address);
unsigned long MEMPACK_Size(char *address);
void MEMPACK_DoGarbageCollection();
unsigned long MEMPACK_ReportFreeMemory();
void MEMPACK_Return(char *address, long takeBackSize);
void MEMPACK_SetMemoryDoneStreamed(char *address);
void MEMPACK_SetMemoryBeingStreamed(char *address);

#endif
