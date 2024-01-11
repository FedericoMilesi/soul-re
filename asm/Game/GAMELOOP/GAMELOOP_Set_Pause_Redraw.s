.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_Set_Pause_Redraw
/* 209B8 800301B8 01000224 */  addiu      $v0, $zero, 0x1
/* 209BC 800301BC 3CBA82A7 */  sh         $v0, %gp_rel(pause_redraw_flag)($gp)
/* 209C0 800301C0 0800E003 */  jr         $ra
/* 209C4 800301C4 00000000 */   nop
.size GAMELOOP_Set_Pause_Redraw, . - GAMELOOP_Set_Pause_Redraw
