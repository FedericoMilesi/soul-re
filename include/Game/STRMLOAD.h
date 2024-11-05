#ifndef _STRMLOAD_H_
#define _STRMLOAD_H_

#include "common.h"

void LOAD_AbortDirectoryChange(char *name);
void LOAD_AbortFileLoad(char *fileName, void *retFunc);
LoadQueueEntry *STREAM_AddQueueEntryToHead();
LoadQueueEntry *STREAM_AddQueueEntryToTail();
void STREAM_NextLoadAsNormal();
void LOAD_NonBlockingBinaryLoad(char *fileName, void *retFunc, void *retData, void *retData2, void **retPointer, int memType);
void LOAD_NonBlockingBufferedLoad(char *fileName, void *retFunc, void *retData, void *retData2);
int STREAM_PollLoadQueue();
void LOAD_ChangeDirectory(char *name);
int STREAM_IsCdBusy(long *numberInQueue);
void LOAD_LoadToAddress(char *fileName, void *loadAddr, long relocateBinary);
void LOAD_NonBlockingFileLoad(char *fileName, void *retFunc, void *retData, void *retData2, void **retPointer, int memType);

#endif
