#ifndef _STRMLOAD_H_
#define _STRMLOAD_H_

// size: 0x64
typedef struct _NonBlockLoadEntry {
    // offset: 0000
    long fileHash;
    // offset: 0004
    long dirHash;
    // offset: 0008
    long filePos;
    // offset: 000C
    long *loadAddr;
    // offset: 0010
    long loadSize;
    // offset: 0014
    long checksum;
    // offset: 0018
    long checksumType;
    // offset: 001C
    long memType;
    // offset: 0020
    long posInFile;
    // offset: 0024
    void *retFunc;
    // offset: 0028
    void *retData;
    // offset: 002C
    void *retData2;
    // offset: 0030
    void **retPointer;
    // offset: 0034 (48 bytes)
    char fileName[48];
} NonBlockLoadEntry;

// size: 0x70
typedef struct _LoadQueueEntry {
    // offset: 0000 (112 bytes)
    struct _LoadQueueEntry *next;
    // offset: 0004
    short status;
    // offset: 0006
    char relocateBinary;
    // offset: 0007
    char mempackUsed;
    // offset: 0008 (100 bytes)
    NonBlockLoadEntry loadEntry;
    // offset: 006C
    long endLoadTime;
} LoadQueueEntry;

void LOAD_AbortDirectoryChange(char *name);
void LOAD_AbortFileLoad(char *fileName, void *retFunc);
LoadQueueEntry *STREAM_AddQueueEntryToHead();
LoadQueueEntry *STREAM_AddQueueEntryToTail();
void STREAM_NextLoadAsNormal();

#endif
