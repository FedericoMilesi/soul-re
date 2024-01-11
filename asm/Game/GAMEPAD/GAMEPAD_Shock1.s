.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_Shock1
/* 21FE4 800317E4 2A928287 */  lh         $v0, %gp_rel(dualshock_onflag)($gp)
/* 21FE8 800317E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 21FEC 800317EC 08004010 */  beqz       $v0, .L80031810
/* 21FF0 800317F0 1000BFAF */   sw        $ra, 0x10($sp)
/* 21FF4 800317F4 6CBA85AF */  sw         $a1, %gp_rel(dualshock1_time)($gp)
/* 21FF8 800317F8 0D80053C */  lui        $a1, %hi(dualshock_motors)
/* 21FFC 800317FC 1CA2A524 */  addiu      $a1, $a1, %lo(dualshock_motors)
/* 22000 80031800 0100A4A0 */  sb         $a0, 0x1($a1)
/* 22004 80031804 21200000 */  addu       $a0, $zero, $zero
/* 22008 80031808 6EF7020C */  jal        PadSetAct
/* 2200C 8003180C 02000624 */   addiu     $a2, $zero, 0x2
.L80031810:
/* 22010 80031810 1000BF8F */  lw         $ra, 0x10($sp)
/* 22014 80031814 00000000 */  nop
/* 22018 80031818 0800E003 */  jr         $ra
/* 2201C 8003181C 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMEPAD_Shock1, . - GAMEPAD_Shock1
