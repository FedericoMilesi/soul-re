#include "common.h"

STATIC LoadStatus loadStatus;

void LOAD_InitCd()
{
    CdInit();

    ResetCallback();

    CdSetDebug(0);
}

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_CdSeekCallback);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_CdDataReady);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_CdReadReady);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_UpdateCheckSum);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_DoCDReading);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_DoCDBufferedReading);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_SetupFileToDoCDReading);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_SetupFileToDoBufferedCDReading);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_ProcessReadQueue);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_ReadFileFromCD);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_CdReadFromBigFile);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_ReadDirectory);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_InitCdLoader);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_SetupFileInfo);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_NonBlockingReadFile);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_CD_ReadPartOfFile);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_HashName);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_HashUnit);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_GetBigFileEntryByHash);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_GetBigFileEntry);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_DoesFileExist);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_LoadTIM);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_LoadTIM2);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_RelocBinaryData);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_CleanUpBuffers);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_InitBuffers);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_InitCdStreamMode);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_DumpCurrentDir);

INCLUDE_ASM("asm/nonmatchings/Game/LOAD3D", LOAD_ChangeDirectoryByID);

void LOAD_SetSearchDirectory(long id)
{
    loadStatus.bigFile.searchDirID = id;
}

long LOAD_GetSearchDirectory()
{
    return loadStatus.bigFile.searchDirID;
}

int LOAD_ChangeDirectoryFlag()
{
    return loadStatus.changeDir;
}

void LOAD_UpdateBigFilePointers(BigFileDir *oldDir, BigFileDir *newDir)
{
    if (loadStatus.bigFile.currentDir == oldDir)
    {
        loadStatus.bigFile.currentDir = newDir;
    }

    if (loadStatus.bigFile.cachedDir == oldDir)
    {
        loadStatus.bigFile.cachedDir = newDir;
    }
}

int LOAD_IsFileLoading()
{
    return loadStatus.currentQueueFile.readStatus != 0;
}

void LOAD_StopLoad()
{
    loadStatus.state = 5;

    loadStatus.currentQueueFile.readStatus = 0;

    if (loadStatus.currentDirLoading != 0)
    {
        loadStatus.currentDirLoading = 0;
    }
}
