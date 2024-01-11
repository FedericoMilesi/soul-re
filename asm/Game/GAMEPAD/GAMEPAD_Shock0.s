.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_Shock0
/* 21FA8 800317A8 2A928287 */  lh         $v0, %gp_rel(dualshock_onflag)($gp)
/* 21FAC 800317AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 21FB0 800317B0 08004010 */  beqz       $v0, .L800317D4
/* 21FB4 800317B4 1000BFAF */   sw        $ra, 0x10($sp)
/* 21FB8 800317B8 68BA85AF */  sw         $a1, %gp_rel(dualshock0_time)($gp)
/* 21FBC 800317BC 0D80053C */  lui        $a1, %hi(dualshock_motors)
/* 21FC0 800317C0 1CA2A4A0 */  sb         $a0, %lo(dualshock_motors)($a1)
/* 21FC4 800317C4 21200000 */  addu       $a0, $zero, $zero
/* 21FC8 800317C8 1CA2A524 */  addiu      $a1, $a1, %lo(dualshock_motors)
/* 21FCC 800317CC 6EF7020C */  jal        func_800BDDB8
/* 21FD0 800317D0 02000624 */   addiu     $a2, $zero, 0x2
.L800317D4:
/* 21FD4 800317D4 1000BF8F */  lw         $ra, 0x10($sp)
/* 21FD8 800317D8 00000000 */  nop
/* 21FDC 800317DC 0800E003 */  jr         $ra
/* 21FE0 800317E0 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMEPAD_Shock0, . - GAMEPAD_Shock0
