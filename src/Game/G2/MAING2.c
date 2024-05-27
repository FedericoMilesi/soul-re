#include "common.h"
#include "Game/G2/MAING2.h"

G2Bool MainG2_InitEngine(void *appData, unsigned int screenWidth, unsigned int screenHeight, char *filesystemName)
{
    (void)appData;
    (void)screenWidth;
    (void)screenHeight;
    (void)filesystemName;
    return !G2FALSE;
}

void MainG2_ShutDownEngine(void)
{
}
