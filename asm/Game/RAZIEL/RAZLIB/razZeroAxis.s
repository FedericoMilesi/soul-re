.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razZeroAxis
/* 962F8 800A5AF8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 962FC 800A5AFC 1400B1AF */  sw         $s1, 0x14($sp)
/* 96300 800A5B00 21888000 */  addu       $s1, $a0, $zero
/* 96304 800A5B04 1800B2AF */  sw         $s2, 0x18($sp)
/* 96308 800A5B08 2190A000 */  addu       $s2, $a1, $zero
/* 9630C 800A5B0C 1000B0AF */  sw         $s0, 0x10($sp)
/* 96310 800A5B10 2180C000 */  addu       $s0, $a2, $zero
/* 96314 800A5B14 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 96318 800A5B18 0000248E */  lw         $a0, 0x0($s1)
/* 9631C 800A5B1C 0000458E */  lw         $a1, 0x0($s2)
/* 96320 800A5B20 E7E9000C */  jal        MATH3D_SquareLength
/* 96324 800A5B24 21300000 */   addu      $a2, $zero, $zero
/* 96328 800A5B28 2B805000 */  sltu       $s0, $v0, $s0
/* 9632C 800A5B2C 04000012 */  beqz       $s0, .L800A5B40
/* 96330 800A5B30 00000000 */   nop
/* 96334 800A5B34 21100000 */  addu       $v0, $zero, $zero
/* 96338 800A5B38 000020AE */  sw         $zero, 0x0($s1)
/* 9633C 800A5B3C 000040AE */  sw         $zero, 0x0($s2)
.L800A5B40:
/* 96340 800A5B40 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 96344 800A5B44 1800B28F */  lw         $s2, 0x18($sp)
/* 96348 800A5B48 1400B18F */  lw         $s1, 0x14($sp)
/* 9634C 800A5B4C 1000B08F */  lw         $s0, 0x10($sp)
/* 96350 800A5B50 0800E003 */  jr         $ra
/* 96354 800A5B54 2000BD27 */   addiu     $sp, $sp, 0x20
.size razZeroAxis, . - razZeroAxis
