#include "Game/PSX/MAIN.h"

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", ClearDisplay);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", screen_to_vram);

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

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_InitVolume);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_ResetGame);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_MainMenuInit);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_FreeMainMenuStuff);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_StartGame);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MAIN_DoMainMenu);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/MAIN", MainG2);
