#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_SetGameTime);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_KeepGameTime);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_UpdateFog);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_UpdateHealth);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_UpdateMana);

void DEBUG_FillUpHealth(long *var)
{
    RAZIEL_DebugHealthFillUp();

    RAZIEL_DebugManaFillUp();
}

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_FogLoad);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_FogRestore);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_SendCinematicSwitch);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_SendMoveTo);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", process_cheat_codes);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_Process);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_Draw);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_MenuCountLength);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_ExitMenus);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", get_last_menu_line);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", num_menu_items);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", maybe_change_menu_choice);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", handle_line_type_long);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", handle_line_type_bit);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", handle_line_type_action);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", handle_line_type_action_with_line);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", handle_line_type_menu);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", process_menu_line);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", pre_process_functions);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", post_process_functions);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", set_debug_leading);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", set_user_leading);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", isdigit);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", adjust_format);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", find_eol);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", draw_menu_item);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", draw_menu);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_Menu);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_DisplayStatus);

void DEBUG_DrawShrinkCels(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_ContinueGame);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_ExitGame);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_ReloadCurrentLevel);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_LevelSelectNew);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_SetViewVram);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_EndViewVram);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_ViewVram);

void DEBUG_CaptureScreen(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_PageFlip);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_FatalError);

void DEBUG_ProcessSecondController(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_ProcessCheat);

INCLUDE_ASM("asm/nonmatchings/Game/DEBUG", DEBUG_DoAreaProtection);
