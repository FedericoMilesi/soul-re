#include "common.h"
#include "Game/SAVEINFO.h"
#include "Game/MCARD/MEMCARD.h"
#include "Game/MEMPACK.h"
#include "Game/STRMLOAD.h"
#include "Game/DEBUG.h"
#include "Game/GAMEPAD.h"

//static SavedInfoTracker savedInfoTracker;
SavedInfoTracker savedInfoTracker;

//static int the_header_size;
EXTERN STATIC int the_header_size;

//static long numbufferedIntros;
EXTERN STATIC long numbufferedIntros;

//static SavedBasic *bufferSavedIntroArray[64];
SavedBasic *bufferSavedIntroArray[64];

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

void SAVE_ClearMemory(GameTracker *gameTracker)
{
    char *buffer;

    (void)gameTracker;

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

extern char D_800D1E84[];
void SAVE_RestoreGlobalSaveTracker()
{
    if (GlobalSave->saveVersion != 21793)
    {
        //DEBUG_FatalError("error: old save game\n");
        DEBUG_FatalError(D_800D1E84);
    }
    else
    {
        gameTrackerX.currentTime = GlobalSave->currentTime;

        memcpy(&gameTrackerX.sound, &GlobalSave->sound, sizeof(gSoundData));

        SOUND_SetSfxVolume(gameTrackerX.sound.gSfxVol);
        SOUND_SetMusicVolume(gameTrackerX.sound.gMusicVol);
        SOUND_SetVoiceVolume(gameTrackerX.sound.gVoiceVol);

        if ((GlobalSave->flags & 0x2))
        {
            GAMEPAD_EnableDualShock();
        }
        else
        {
            GAMEPAD_DisableDualShock();
        }
    }
}

void SAVE_SaveEverythingInMemory()
{
    Instance *instance;
    long i;
    Instance *next;
    Level *level;

    for (instance = gameTrackerX.instanceList->first, next = NULL; instance != NULL; instance = next, next = NULL)
    {
        next = instance->next;

        level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

        if (level != NULL)
        {
            SAVE_Instance(instance, level);
        }
    }

    for (i = 0; i < 16; i++)
    {
        if (StreamTracker.StreamList[i].used == 2)
        {
            EVENT_SaveEventsFromLevel(StreamTracker.StreamList[i].StreamUnitID, StreamTracker.StreamList[i].level);

            SAVE_CreatedSavedLevel(StreamTracker.StreamList[i].StreamUnitID, StreamTracker.StreamList[i].level);
        }
    }
}

void SAVE_SaveGame()
{
    while (STREAM_PollLoadQueue() != 0)
    {
    }

    SAVE_SaveEverythingInMemory();

    SAVE_UpdateGlobalSaveTracker();

    GlobalSave->sizeUsedInBlock = *(unsigned short *)&savedInfoTracker.InfoEnd - *(unsigned short *)&savedInfoTracker.InfoStart;
}

extern char D_800D1E9C[];
void SAVE_RestoreGame()
{
    gameTrackerX.streamFlags |= 0x200000;

    SAVE_RestoreGlobalSavePointer();
    SAVE_RestoreGlobalSaveTracker();

    savedInfoTracker.InfoEnd = &savedInfoTracker.InfoStart[GlobalSave->sizeUsedInBlock];

    //GAMELOOP_RequestLevelChange("under", 1, &gameTrackerX);
    GAMELOOP_RequestLevelChange(D_800D1E9C, 1, &gameTrackerX);
}

void SAVE_DebugSaveGame()
{
}

void SAVE_LoadSaveGame()
{
    gameTrackerX.streamFlags |= 0x200000;

    //GAMELOOP_RequestLevelChange("under", 1, &gameTrackerX);
    GAMELOOP_RequestLevelChange(D_800D1E9C, 1, &gameTrackerX);

    gameTrackerX.gameMode = 0;
}

long SAVE_SizeOfFreeSpace()
{
    return savedInfoTracker.EndOfMemory - savedInfoTracker.InfoEnd;
}

