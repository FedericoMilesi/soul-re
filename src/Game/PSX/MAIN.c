#include "Game/PSX/MAIN.h"
#include "Game/GAMELOOP.h"
#include "Game/RAZIEL/RAZLIB.h"
#include "Game/PSX/AADLIB.h"
#include "Game/LOAD3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", ClearDisplay);

void screen_to_vram(long *screen, int buffer)
{
    LOAD_LoadTIM2(screen, 0, buffer * 256, 512, 256);
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", show_screen);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", play_movie);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", InitMainTracker);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", FindTextInLine);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", ExtractWorldName);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", ExtractLevelNum);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", ProcessArgs);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", InitDisplay);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", StartTimer);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", VblTick);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", DrawCallback);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", FadeOutSayingLoading);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", CheckForDevStation);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_ShowLoadingScreen);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_LoadTim);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", init_menus);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_DoMainInit);

void MAIN_InitVolume()
{
    aadInitVolume();

    aadStartMasterVolumeFade(gameTrackerX.sound.gMasterVol, 256, NULL);

    gameTrackerX.sound.soundsLoaded = 1;

    aadSetNoUpdateMode(0);
}

void MAIN_ResetGame()
{
    GAMELOOP_SetScreenWipe(0, 0, -1);

    gameTrackerX.gameFlags &= ~0x80;
    gameTrackerX.gameFlags &= ~0x10;
    gameTrackerX.gameFlags &= ~0x1;

    RAZIEL_StartNewGame();
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_MainMenuInit);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_FreeMainMenuStuff);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_StartGame);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_DoMainMenu);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MainG2);
