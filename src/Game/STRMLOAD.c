#include "common.h"

EXTERN STATIC int loadFromHead;

void STREAM_NextLoadFromHead()
{
    loadFromHead = 1;
}

void STREAM_NextLoadAsNormal()
{
    loadFromHead = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_InitLoader);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_RemoveQueueHead);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_RemoveQueueEntry);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_AddQueueEntryToTail);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_AddQueueEntryToHead);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_IsCdBusy);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_PollLoadQueue);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_SetUpQueueEntry);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", STREAM_QueueNonblockingLoads);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_LoadToAddress);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_NonBlockingBinaryLoad);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_NonBlockingFileLoad);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_NonBlockingBufferedLoad);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_IsXAInQueue);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_PlayXA);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_ReadFile);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_ChangeDirectory);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_AbortDirectoryChange);

INCLUDE_ASM("asm/nonmatchings/Game/STRMLOAD", LOAD_AbortFileLoad);
