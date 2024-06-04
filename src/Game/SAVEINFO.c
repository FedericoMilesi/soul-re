#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_GetInstanceRotation);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_ClearMemory);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_Init);

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

void SAVE_DebugSaveGame(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_LoadSaveGame);

INCLUDE_ASM("asm/nonmatchings/Game/SAVEINFO", SAVE_SizeOfFreeSpace);

