.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PlayCombatIdle
/* 71674 80080E74 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 71678 80080E78 1000BFAF */  sw         $ra, 0x10($sp)
/* 7167C 80080E7C 6C01828C */  lw         $v0, 0x16C($a0)
/* 71680 80080E80 2130A000 */  addu       $a2, $a1, $zero
/* 71684 80080E84 0000428C */  lw         $v0, 0x0($v0)
/* 71688 80080E88 00000000 */  nop
/* 7168C 80080E8C 10004230 */  andi       $v0, $v0, 0x10
/* 71690 80080E90 02004010 */  beqz       $v0, .L80080E9C
/* 71694 80080E94 0A000524 */   addiu     $a1, $zero, 0xA
/* 71698 80080E98 0B000524 */  addiu      $a1, $zero, 0xB
.L80080E9C:
/* 7169C 80080E9C D0FF010C */  jal        MON_PlayAnimIfNotPlaying
/* 716A0 80080EA0 00000000 */   nop
/* 716A4 80080EA4 1000BF8F */  lw         $ra, 0x10($sp)
/* 716A8 80080EA8 00000000 */  nop
/* 716AC 80080EAC 0800E003 */  jr         $ra
/* 716B0 80080EB0 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_PlayCombatIdle, . - MON_PlayCombatIdle
