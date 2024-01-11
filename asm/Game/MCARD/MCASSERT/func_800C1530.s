.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1530
/* B1D30 800C1530 0800C010 */  beqz       $a2, .L800C1554
/* B1D34 800C1534 21180000 */   addu      $v1, $zero, $zero
.L800C1538:
/* B1D38 800C1538 0000A28C */  lw         $v0, 0x0($a1)
/* B1D3C 800C153C 0400A524 */  addiu      $a1, $a1, 0x4
/* B1D40 800C1540 01006324 */  addiu      $v1, $v1, 0x1
/* B1D44 800C1544 000082AC */  sw         $v0, 0x0($a0)
/* B1D48 800C1548 2B106600 */  sltu       $v0, $v1, $a2
/* B1D4C 800C154C FAFF4014 */  bnez       $v0, .L800C1538
/* B1D50 800C1550 04008424 */   addiu     $a0, $a0, 0x4
.L800C1554:
/* B1D54 800C1554 0800E003 */  jr         $ra
/* B1D58 800C1558 00000000 */   nop
.size func_800C1530, . - func_800C1530
