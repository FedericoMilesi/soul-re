.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razInBaseArea
/* 986A8 800A7EA8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 986AC 800A7EAC 2400B1AF */  sw         $s1, 0x24($sp)
/* 986B0 800A7EB0 21888000 */  addu       $s1, $a0, $zero
/* 986B4 800A7EB4 2000B0AF */  sw         $s0, 0x20($sp)
/* 986B8 800A7EB8 2180A000 */  addu       $s0, $a1, $zero
/* 986BC 800A7EBC 24BF8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX + 0x15C)
/* 986C0 800A7EC0 2800BFAF */  sw         $ra, 0x28($sp)
/* 986C4 800A7EC4 1CF4020C */  jal        func_800BD070
/* 986C8 800A7EC8 1000A427 */   addiu     $a0, $sp, 0x10
/* 986CC 800A7ECC 03004014 */  bnez       $v0, .L800A7EDC
/* 986D0 800A7ED0 1000A527 */   addiu     $a1, $sp, 0x10
/* 986D4 800A7ED4 BC9F0208 */  j          .L800A7EF0
/* 986D8 800A7ED8 21100000 */   addu      $v0, $zero, $zero
.L800A7EDC:
/* 986DC 800A7EDC 2110B000 */  addu       $v0, $a1, $s0
/* 986E0 800A7EE0 000040A0 */  sb         $zero, 0x0($v0)
/* 986E4 800A7EE4 83F7020C */  jal        func_800BDE0C
/* 986E8 800A7EE8 21202002 */   addu      $a0, $s1, $zero
/* 986EC 800A7EEC 0100422C */  sltiu      $v0, $v0, 0x1
.L800A7EF0:
/* 986F0 800A7EF0 2800BF8F */  lw         $ra, 0x28($sp)
/* 986F4 800A7EF4 2400B18F */  lw         $s1, 0x24($sp)
/* 986F8 800A7EF8 2000B08F */  lw         $s0, 0x20($sp)
/* 986FC 800A7EFC 0800E003 */  jr         $ra
/* 98700 800A7F00 3000BD27 */   addiu     $sp, $sp, 0x30
.size razInBaseArea, . - razInBaseArea
