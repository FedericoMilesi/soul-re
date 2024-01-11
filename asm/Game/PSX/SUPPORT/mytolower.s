.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mytolower
/* 65054 80074854 BFFF8224 */  addiu      $v0, $a0, -0x41
/* 65058 80074858 1A00422C */  sltiu      $v0, $v0, 0x1A
/* 6505C 8007485C 02004010 */  beqz       $v0, .L80074868
/* 65060 80074860 00000000 */   nop
/* 65064 80074864 20008424 */  addiu      $a0, $a0, 0x20
.L80074868:
/* 65068 80074868 0800E003 */  jr         $ra
/* 6506C 8007486C 21108000 */   addu      $v0, $a0, $zero
.size mytolower, . - mytolower
