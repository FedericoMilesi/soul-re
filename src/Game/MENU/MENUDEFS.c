#include "Game/MENU/MENUDEFS.h"
#include "Game/GAMELOOP.h"
#include "Game/GAMEPAD.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", do_push_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", do_pop_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", do_function);

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

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", do_main_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", flashStart);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_main_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_confirmexit_menu);

INCLUDE_ASM("asm/nonmatchings/Game/MENU/MENUDEFS", menudefs_pause_menu);
