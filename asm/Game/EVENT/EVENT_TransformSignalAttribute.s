.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformSignalAttribute
/* 54650 80063E50 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 54654 80063E54 2120A000 */  addu       $a0, $a1, $zero
/* 54658 80063E58 1A000224 */  addiu      $v0, $zero, 0x1A
/* 5465C 80063E5C 1000BFAF */  sw         $ra, 0x10($sp)
/* 54660 80063E60 0400858C */  lw         $a1, 0x4($a0)
/* 54664 80063E64 0600C210 */  beq        $a2, $v0, .L80063E80
/* 54668 80063E68 21180000 */   addu      $v1, $zero, $zero
/* 5466C 80063E6C 32000224 */  addiu      $v0, $zero, 0x32
/* 54670 80063E70 0500C210 */  beq        $a2, $v0, .L80063E88
/* 54674 80063E74 21300000 */   addu      $a2, $zero, $zero
/* 54678 80063E78 A68F0108 */  j          .L80063E98
/* 5467C 80063E7C 00000000 */   nop
.L80063E80:
/* 54680 80063E80 A58F0108 */  j          .L80063E94
/* 54684 80063E84 080086AC */   sw        $a2, 0x8($a0)
.L80063E88:
/* 54688 80063E88 0600A594 */  lhu        $a1, 0x6($a1)
/* 5468C 80063E8C 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 54690 80063E90 0100A530 */   andi      $a1, $a1, 0x1
.L80063E94:
/* 54694 80063E94 01000324 */  addiu      $v1, $zero, 0x1
.L80063E98:
/* 54698 80063E98 1000BF8F */  lw         $ra, 0x10($sp)
/* 5469C 80063E9C 21106000 */  addu       $v0, $v1, $zero
/* 546A0 80063EA0 0800E003 */  jr         $ra
/* 546A4 80063EA4 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformSignalAttribute, . - EVENT_TransformSignalAttribute
