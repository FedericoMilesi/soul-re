.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_DualShockEnabled
/* 21E0C 8003160C 2A928287 */  lh         $v0, %gp_rel(dualshock_onflag)($gp)
/* 21E10 80031610 0800E003 */  jr         $ra
/* 21E14 80031614 00000000 */   nop
.size GAMEPAD_DualShockEnabled, . - GAMEPAD_DualShockEnabled
