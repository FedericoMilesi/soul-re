.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_EnableDualShock
/* 21E58 80031658 01000224 */  addiu      $v0, $zero, 0x1
/* 21E5C 8003165C 2A9282A7 */  sh         $v0, %gp_rel(dualshock_onflag)($gp)
/* 21E60 80031660 289280A7 */  sh         $zero, %gp_rel(align_flag)($gp)
/* 21E64 80031664 0800E003 */  jr         $ra
/* 21E68 80031668 00000000 */   nop
.size GAMEPAD_EnableDualShock, . - GAMEPAD_EnableDualShock
