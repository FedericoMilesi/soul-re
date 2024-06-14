#include "common.h"
#include "Game/LOAD3D.h"
#include "Game/STRMLOAD.h"
#include "Game/DEBUG.h"

static LoadQueueEntry LoadQueue[40];

EXTERN STATIC int loadFromHead;

EXTERN STATIC int gCurDir;

static LoadQueueEntry *loadFree;

static LoadQueueEntry *loadHead;

static LoadQueueEntry *loadTail;

static int numLoads;

extern char D_800D19E8[];

extern char D_800D1980[];

void STREAM_NextLoadFromHead()
{
    loadFromHead = 1;
}

void STREAM_NextLoadAsNormal()
{
    loadFromHead = 0;
}

void STREAM_InitLoader(char *bigFileName, char *voiceFileName)
{
    int i;

    LOAD_InitCdLoader(bigFileName, voiceFileName);

    loadFree = (LoadQueueEntry *)&LoadQueue->next;

    loadHead = NULL;

    loadTail = NULL;

    numLoads = 0;

    for (i = 38; i >= 0; i--)
    {
        LoadQueue[i].next = &LoadQueue[i + 1];
    }

    LoadQueue[39].next = NULL;
}

void STREAM_RemoveQueueHead()
{
    LoadQueueEntry *entry;

    entry = loadHead;

    loadHead = entry->next;

    if (loadHead == NULL)
    {
        loadTail = NULL;
    }

    entry->next = loadFree;

    numLoads--;

    loadFree = entry;
}

void STREAM_RemoveQueueEntry(LoadQueueEntry *entry, LoadQueueEntry *prev)
{
    if (loadTail == entry)
    {
        loadTail = prev;
    }

    if (prev == NULL)
    {
        loadHead = entry->next;
    }
    else
    {
        prev->next = entry->next;
    }

    entry->next = loadFree;

    loadFree = entry;

    numLoads--;
}

LoadQueueEntry *STREAM_AddQueueEntryToTail()
{
    LoadQueueEntry *entry;

    entry = loadFree;

    if (entry == NULL)
    {
        DEBUG_FatalError(D_800D1980);
    }

    loadFree = entry->next;

    entry->next = NULL;

    if (loadTail != NULL)
    {
        loadTail->next = entry;
    }
    else
    {
        loadHead = entry;
    }

    loadTail = entry;

    numLoads++;

    return entry;
}

LoadQueueEntry *STREAM_AddQueueEntryToHead()
{
    LoadQueueEntry *entry;

    entry = loadFree;

    if (entry == NULL)
    {
        DEBUG_FatalError(D_800D1980);
    }

    loadFree = entry->next;

    if ((loadHead == NULL) || (loadHead->status == 1) || (loadHead->status == 5) || (loadHead->status == 10) || (loadHead->status == 8))
    {
        entry->next = loadHead;

        loadHead = entry;
    }
    else
    {
        entry->next = loadHead->next;

        loadHead->next = entry;
    }

    if (loadTail == NULL)
    {
        loadTail = entry;
    }

    numLoads++;

    return entry;
}

int STREAM_IsCdBusy(long *numberInQueue)
{
    if (numberInQueue != NULL)
    {
        *numberInQueue = numLoads;
    }

    return numLoads;
}

int STREAM_PollLoadQueue();
INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_PollLoadQueue);

LoadQueueEntry *STREAM_SetUpQueueEntry(char *fileName, void *retFunc, void *retData, void *retData2, void **retPointer, int fromhead)
{
    LoadQueueEntry *currentEntry;

    currentEntry = (fromhead != 0) ? STREAM_AddQueueEntryToHead() : STREAM_AddQueueEntryToTail();

    strcpy(currentEntry->loadEntry.fileName, fileName);

    currentEntry->loadEntry.fileHash = LOAD_HashName(fileName);
    currentEntry->loadEntry.dirHash = LOAD_GetSearchDirectory();

    currentEntry->loadEntry.posInFile = 0;

    currentEntry->loadEntry.checksumType = 1;

    if (LOAD_GetSearchDirectory() != 0)
    {
        currentEntry->loadEntry.dirHash = LOAD_GetSearchDirectory();

        LOAD_SetSearchDirectory(0);
    }
    else
    {
        currentEntry->loadEntry.dirHash = gCurDir;
    }

    currentEntry->loadEntry.retFunc = retFunc;
    currentEntry->loadEntry.retData = retData;
    currentEntry->loadEntry.retData2 = retData2;
    currentEntry->loadEntry.retPointer = retPointer;

    if (retPointer != NULL)
    {
        *(long *)retPointer = 0xFAFBFCFD;
    }

    return currentEntry;
}

void STREAM_QueueNonblockingLoads(char *fileName, unsigned char memType, void *retFunc, void *retData, void *retData2, void **retPointer, long relocateBinary)
{
    LoadQueueEntry *currentEntry;
    int fromhead;

    fromhead = loadFromHead;

    loadFromHead = 0;

    currentEntry = STREAM_SetUpQueueEntry(fileName, retFunc, retData, retData2, retPointer, fromhead);

    currentEntry->loadEntry.loadAddr = NULL;

    currentEntry->mempackUsed = 1;

    currentEntry->loadEntry.memType = memType;

    currentEntry->relocateBinary = relocateBinary;

    if (memType == 0)
    {
        currentEntry->status = 5;
    }
    else
    {
        currentEntry->status = 1;
    }
}

void LOAD_LoadToAddress(char *fileName, void *loadAddr, long relocateBinary)
{
    LoadQueueEntry *currentEntry;

    currentEntry = STREAM_SetUpQueueEntry(fileName, NULL, NULL, NULL, NULL, 0);

    currentEntry->loadEntry.loadAddr = loadAddr;

    currentEntry->status = 1;

    currentEntry->relocateBinary = relocateBinary;

    currentEntry->mempackUsed = 0;

    while (STREAM_PollLoadQueue() != 0)
    {
    }
}

void LOAD_NonBlockingBinaryLoad(char *fileName, void *retFunc, void *retData, void *retData2, void **retPointer, int memType)
{
    STREAM_QueueNonblockingLoads(fileName, memType, retFunc, retData, retData2, retPointer, 1);
}

void LOAD_NonBlockingFileLoad(char *fileName, void *retFunc, void *retData, void *retData2, void **retPointer, int memType)
{
    STREAM_QueueNonblockingLoads(fileName, memType, retFunc, retData, retData2, retPointer, 0);
}

void LOAD_NonBlockingBufferedLoad(char *fileName, void *retFunc, void *retData, void *retData2)
{
    STREAM_QueueNonblockingLoads(fileName, 0, retFunc, retData, retData2, NULL, 0);
}

int LOAD_IsXAInQueue()
{
    LoadQueueEntry *entry;

    entry = loadHead;

    while (entry != NULL)
    {
        if ((entry->status == 8) || (entry->status == 9))
        {
            return 1;
        }

        entry = entry->next;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_PlayXA);

long *LOAD_ReadFile(char *fileName, unsigned char memType)
{
    void *loadAddr;

    STREAM_QueueNonblockingLoads(fileName, memType, NULL, NULL, NULL, &loadAddr, 0);

    while (STREAM_PollLoadQueue() != 0);

    return (long *)loadAddr;
}

void LOAD_ChangeDirectory(char *name)
{
    LoadQueueEntry *currentEntry;

    currentEntry = STREAM_AddQueueEntryToTail();

    gCurDir = LOAD_HashUnit(name);

    currentEntry->loadEntry.dirHash = gCurDir;
    currentEntry->loadEntry.fileHash = 0;

    currentEntry->status = 10;

    sprintf(&currentEntry->loadEntry.fileName, D_800D19E8, name);
}

void LOAD_AbortDirectoryChange(char *name)
{
    LoadQueueEntry *entry;
    LoadQueueEntry *prev;
    long hash;

    if (loadHead != NULL)
    {
        hash = LOAD_HashUnit(name);

        prev = loadHead;

        entry = prev->next;

        while (entry != NULL)
        {
            if ((entry->status == 10) && (entry->loadEntry.dirHash == hash))
            {
                STREAM_RemoveQueueEntry(entry, prev);
                break;
            }

            prev = entry;

            entry = prev->next;
        }
    }
}

void LOAD_AbortFileLoad(char *fileName, void *retFunc)
{
    LoadQueueEntry *entry;
    LoadQueueEntry *prev;
    long hash;
    typedef void (*ret)(long *, void *, void *); // not from decls.h
    ret returnFunction; // not from decls.h

    if (loadHead != NULL)
    {
        prev = NULL;

        hash = LOAD_HashName(fileName);

        entry = loadHead;

        while (entry != NULL)
        {
            if (entry->loadEntry.fileHash == hash)
            {
                if (prev == NULL)
                {
                    LOAD_StopLoad();
                }

                if (entry->status == 6)
                {
                    LOAD_CleanUpBuffers();
                }

                returnFunction = (ret)retFunc;

                returnFunction(entry->loadEntry.loadAddr, entry->loadEntry.retData, entry->loadEntry.retData2);

                STREAM_RemoveQueueEntry(entry, prev);
                break;
            }
            else
            {
                prev = entry;

                entry = entry->next;
            }
        }
    }
}
