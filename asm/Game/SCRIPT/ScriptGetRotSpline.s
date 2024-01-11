.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ScriptGetRotSpline
/* 2D914 8003D114 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2D918 8003D118 1000BFAF */  sw         $ra, 0x10($sp)
/* 2D91C 8003D11C 21280000 */  addu       $a1, $zero, $zero
/* 2D920 8003D120 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 2D924 8003D124 2130A000 */   addu      $a2, $a1, $zero
/* 2D928 8003D128 03004014 */  bnez       $v0, .L8003D138
/* 2D92C 8003D12C 00000000 */   nop
/* 2D930 8003D130 4FF40008 */  j          .L8003D13C
/* 2D934 8003D134 21100000 */   addu      $v0, $zero, $zero
.L8003D138:
/* 2D938 8003D138 0400428C */  lw         $v0, 0x4($v0)
.L8003D13C:
/* 2D93C 8003D13C 1000BF8F */  lw         $ra, 0x10($sp)
/* 2D940 8003D140 00000000 */  nop
/* 2D944 8003D144 0800E003 */  jr         $ra
/* 2D948 8003D148 1800BD27 */   addiu     $sp, $sp, 0x18
.size ScriptGetRotSpline, . - ScriptGetRotSpline
