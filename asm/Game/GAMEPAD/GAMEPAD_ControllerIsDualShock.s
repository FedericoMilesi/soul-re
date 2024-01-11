.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_ControllerIsDualShock
/* 21E00 80031600 2C92828F */  lw         $v0, %gp_rel(dualShock)($gp)
/* 21E04 80031604 0800E003 */  jr         $ra
/* 21E08 80031608 00000000 */   nop
.size GAMEPAD_ControllerIsDualShock, . - GAMEPAD_ControllerIsDualShock
