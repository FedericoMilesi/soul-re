.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_DisableDualShock
/* 21E18 80031618 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 21E1C 8003161C 0D80023C */  lui        $v0, %hi(dualshock_motors)
/* 21E20 80031620 1CA24524 */  addiu      $a1, $v0, %lo(dualshock_motors)
/* 21E24 80031624 21200000 */  addu       $a0, $zero, $zero
/* 21E28 80031628 1000BFAF */  sw         $ra, 0x10($sp)
/* 21E2C 8003162C 2A9280A7 */  sh         $zero, %gp_rel(dualshock_onflag)($gp)
/* 21E30 80031630 0100A0A0 */  sb         $zero, 0x1($a1)
/* 21E34 80031634 1CA240A0 */  sb         $zero, %lo(dualshock_motors)($v0)
/* 21E38 80031638 6CBA80AF */  sw         $zero, %gp_rel(dualshock1_time)($gp)
/* 21E3C 8003163C 68BA80AF */  sw         $zero, %gp_rel(dualshock0_time)($gp)
/* 21E40 80031640 6EF7020C */  jal        PadSetAct
/* 21E44 80031644 02000624 */   addiu     $a2, $zero, 0x2
/* 21E48 80031648 1000BF8F */  lw         $ra, 0x10($sp)
/* 21E4C 8003164C 00000000 */  nop
/* 21E50 80031650 0800E003 */  jr         $ra
/* 21E54 80031654 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMEPAD_DisableDualShock, . - GAMEPAD_DisableDualShock
