#include "Game/MENU/MENUDEFS.h"
#include "Game/MENU/MENU.h"
#include "Game/GAMELOOP.h"
#include "Game/GAMEPAD.h"

STATIC int StartGameFading;

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

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", do_start_game);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", do_save_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", womp_background);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", play_movie_dup1);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_reset_hack_attract_mode);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", check_hack_attract);

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
