#include "Game/MENU/MENUDEFS.h"
#include "Game/MENU/MENU.h"
#include "Game/GAMELOOP.h"
#include "Game/GAMEPAD.h"
#include "Game/MEMPACK.h"
#include "Game/PSX/MAIN.h"
#include "Game/MCARD/MEMCARD.h"
#include "Game/CINEMA/CINEPSX.h"

STATIC int StartGameFading;

long *mainMenuScreen;

STATIC int hack_attract;

STATIC int hack_attract_movie;

STATIC char *the_attract_movies[8924 + 4];

void do_check_controller(void *gt)
{
    if (((GameTracker *)gt)->gameMode == 6)
    {
        GAMEPAD_DisplayControllerStatus(170);
    }
    else
    {
        GAMEPAD_DisplayControllerStatus(200);
    }
}

int do_push_menu(void *gt, long menuparam, menu_ctrl_t ctrl)
{
    typedef int (*fn)(); // not from decls.h

    if (ctrl == menu_ctrl_engage)
    {
        menu_push(((GameTracker *)gt)->menu, (fn)menuparam);

        return 1;
    }

    return 0;
}

int do_pop_menu(void *gt, long param, menu_ctrl_t ctrl)
{
    (void)param;

    if (ctrl == menu_ctrl_engage)
    {
        menu_pop(((GameTracker *)gt)->menu);

        return 1;
    }

    return 0;
}

int do_function(void *gt, long fnparam, menu_ctrl_t ctrl)
{
    typedef int (*fn)(); // not from decls.h
    fn temp;             // not from decls.h

    (void)gt;

    if (ctrl == menu_ctrl_engage)
    {
        temp = (fn)fnparam;

        temp();

        return 1;
    }

    return 0;
}

int do_start_game(void *gt, long parameter, menu_ctrl_t ctrl)
{
    (void)parameter;

    if (ctrl == menu_ctrl_engage)
    {
        if (MEMCARD_IsWrongVersion(((GameTracker *)gt)->memcard) == 0)
        {
            menu_push(((GameTracker *)gt)->menu, memcard_main_menu);

            return 1;
        }
        else
        {
            MAIN_StartGame();

            return 1;
        }
    }

    return 0;
}

int do_save_menu(void *gt, long parameter, menu_ctrl_t ctrl)
{
    (void)parameter;

    if (ctrl == menu_ctrl_engage)
    {
        menu_push(((GameTracker *)gt)->menu, memcard_pause_menu);

        return 1;
    }

    return 0;
}

void womp_background(char *tim_path)
{
    MEMPACK_Free((char *)mainMenuScreen);

    mainMenuScreen = MAIN_LoadTim(tim_path);
}

void play_movie_dup1(char *name)
{
    if (CINE_Load() != 0)
    {
        CINE_Play(name, 0xFFFF, 2);

        CINE_Unload();

        MAIN_InitVolume();
    }
}

void menudefs_reset_hack_attract_mode()
{
    if (hack_attract > 0)
    {
        hack_attract = gameTrackerX.vblCount;
    }
}

void check_hack_attract()
{
    if ((hack_attract > 0) && ((unsigned int)(hack_attract + 2000) < gameTrackerX.vblCount))
    {
        hack_attract = 1;

        play_movie_dup1(the_attract_movies[hack_attract_movie]);

        hack_attract_movie = (hack_attract_movie + 1) & 0x3;

        hack_attract = gameTrackerX.vblCount;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", get_volume);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", set_volume);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", do_sound_adjust);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", sound_item);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_toggle_dualshock);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", options_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", main_menu);

int do_main_menu(void *gt, long param, menu_ctrl_t ctrl)
{
    (void)param;

    if ((StartGameFading == 0) && ((ctrl == menu_ctrl_start) || (ctrl == menu_ctrl_engage)))
    {
        ((GameTracker *)gt)->wipeType = 10;

        ((GameTracker *)gt)->wipeTime = -20;
        ((GameTracker *)gt)->maxWipeTime = 20;

        StartGameFading = 1;

        return 1;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", flashStart);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_main_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_confirmexit_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_pause_menu);
