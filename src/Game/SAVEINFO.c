#include "common.h"
#include "Game/SAVEINFO.h"
#include "Game/MCARD/MEMCARD.h"
#include "Game/MEMPACK.h"

//static SavedInfoTracker savedInfoTracker;
SavedInfoTracker savedInfoTracker;

//static int the_header_size;
EXTERN STATIC int the_header_size;

//static long numbufferedIntros;
EXTERN STATIC long numbufferedIntros;

//static SavedBasic *bufferSavedIntroArray[64];
EXTERN STATIC SavedBasic *bufferSavedIntroArray[64];

long DoMainMenu;

void SAVE_GetInstanceRotation(Instance *instance, SmallRotation *vector)
{
    evPositionData *rotation;

    rotation = (evPositionData *)INSTANCE_Query(instance, 7);

    if (rotation == NULL)
    {
        vector->x = instance->rotation.x;
        vector->y = instance->rotation.y;
        vector->z = instance->rotation.z;
    }
    else
    {
        vector->x = rotation->x;
        vector->y = rotation->y;
        vector->z = rotation->z;
    }
}

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_ClearMemory);
#else
void SAVE_ClearMemory(GameTracker *gameTracker)
{
    char *buffer;

    buffer = savedInfoTracker.MemoryCardBuffer;

    savedInfoTracker.InfoStart = &buffer[the_header_size];
    savedInfoTracker.InfoEnd = &buffer[the_header_size];

    savedInfoTracker.EndOfMemory = &buffer[24576];

    memset(&savedInfoTracker.MemoryCardBuffer[the_header_size], 0, 24576 - the_header_size);

    numbufferedIntros = 0;

    memset(bufferSavedIntroArray, 0, sizeof(bufferSavedIntroArray));

    GlobalSave = (GlobalSaveTracker *)SAVE_GetSavedBlock(6, 0);

    GlobalSave->CurrentBirthID = 8192;

    GlobalSave->humanOpinionOfRaziel = 0;

    SAVE_GetSavedBlock(4, 0);
}
#endif

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_Init);
#else
void SAVE_Init(GameTracker *gt)
{
    void *buffer;

    buffer = MEMPACK_Malloc(24576, 18);

    if (DoMainMenu != 0)
    {
        gt->memcard = &gMemcard;

        the_header_size = memcard_initialize(&gMemcard, gt, 3, buffer, 24576);
    }
    else
    {
        gt->memcard = NULL;
    }

    savedInfoTracker.MemoryCardBuffer = (char *)buffer;

    SAVE_ClearMemory(gt);
}
#endif

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_GetSavedBlock);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_PurgeAMemoryBlock);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_SaveableInstance);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_UpdateSavedIntro);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_UpdateSavedIntroWithIntro);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_GetSavedEvent);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_DeleteSavedEvent);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_GetSavedNextEvent);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_BufferIntro);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_IntroduceBufferIntros);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_IntroForStreamID);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_HasSavedIntro);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_HasSavedLevel);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_UpdateLevelWithSave);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_CreatedSavedLevel);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_DeleteBlock);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_Instance);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_DeleteInstance);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_SetDeadDeadBit);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_RestoreGlobalSavePointer);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_IsUniqueIDDeadDead);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_IsIntroDeadDead);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_DoInstanceDeadDead);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_MarkDeadDead);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_UndestroyInstance);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_GetSavedSmallIntro);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_GetIntroSpline);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_UpdateGlobalSaveTracker);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_RestoreGlobalSaveTracker);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_SaveEverythingInMemory);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_SaveGame);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_RestoreGame);

void SAVE_DebugSaveGame()
{
}

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_LoadSaveGame);

long SAVE_SizeOfFreeSpace()
{
    return savedInfoTracker.EndOfMemory - savedInfoTracker.InfoEnd;
}

