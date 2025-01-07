#ifndef _LOAD3D_H_
#define _LOAD3D_H_

#include "common.h"

void LOAD_CleanUpBuffers();
void LOAD_StopLoad();
long LOAD_HashName(char *string);
long LOAD_HashUnit(char *name);
void LOAD_InitCdLoader(char *bigFileName, char *voiceFileName);
long LOAD_GetSearchDirectory();
void LOAD_SetSearchDirectory(long id);
long LOAD_DoesFileExist(char *fileName);
void LOAD_InitCdStreamMode();
char *LOAD_ReadFileFromCD(char *filename, int memType);
void LOAD_ProcessReadQueue();
int LOAD_IsFileLoading();
long LOAD_RelocBinaryData(long *data, long fileSize);
void LOAD_NonBlockingReadFile(NonBlockLoadEntry *loadEntry);
int LOAD_ChangeDirectoryFlag();
void LOAD_CD_ReadPartOfFile(NonBlockLoadEntry *loadEntry);
int LOAD_ChangeDirectoryByID(int id);
void *LOAD_InitBuffers();
void LOAD_DumpCurrentDir();
void LOAD_UpdateBigFilePointers(BigFileDir *oldDir, BigFileDir *newDir);
void LOAD_PlayXA(int number);
long *LOAD_ReadFile(char *fileName, unsigned char memType);

#endif
