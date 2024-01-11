.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_Shock
/* 21F64 80031764 2A928287 */  lh         $v0, %gp_rel(dualshock_onflag)($gp)
/* 21F68 80031768 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 21F6C 8003176C 0A004010 */  beqz       $v0, .L80031798
/* 21F70 80031770 1000BFAF */   sw        $ra, 0x10($sp)
/* 21F74 80031774 68BA85AF */  sw         $a1, %gp_rel(dualshock0_time)($gp)
/* 21F78 80031778 0D80053C */  lui        $a1, %hi(dualshock_motors)
/* 21F7C 8003177C 1CA2A4A0 */  sb         $a0, %lo(dualshock_motors)($a1)
/* 21F80 80031780 1CA2A524 */  addiu      $a1, $a1, %lo(dualshock_motors)
/* 21F84 80031784 21200000 */  addu       $a0, $zero, $zero
/* 21F88 80031788 6CBA87AF */  sw         $a3, %gp_rel(dualshock1_time)($gp)
/* 21F8C 8003178C 0100A6A0 */  sb         $a2, 0x1($a1)
/* 21F90 80031790 6EF7020C */  jal        PadSetAct
/* 21F94 80031794 02000624 */   addiu     $a2, $zero, 0x2
.L80031798:
/* 21F98 80031798 1000BF8F */  lw         $ra, 0x10($sp)
/* 21F9C 8003179C 00000000 */  nop
/* 21FA0 800317A0 0800E003 */  jr         $ra
/* 21FA4 800317A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMEPAD_Shock, . - GAMEPAD_Shock
