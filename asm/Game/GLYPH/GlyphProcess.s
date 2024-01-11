.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphProcess
/* 6B488 8007AC88 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B48C 8007AC8C 1000B0AF */  sw         $s0, 0x10($sp)
/* 6B490 8007AC90 21808000 */  addu       $s0, $a0, $zero
/* 6B494 8007AC94 1400BFAF */  sw         $ra, 0x14($sp)
/* 6B498 8007AC98 6C01028E */  lw         $v0, 0x16C($s0)
/* 6B49C 8007AC9C 21280000 */  addu       $a1, $zero, $zero
/* 6B4A0 8007ACA0 0000428C */  lw         $v0, 0x0($v0)
/* 6B4A4 8007ACA4 00000000 */  nop
/* 6B4A8 8007ACA8 09F84000 */  jalr       $v0
/* 6B4AC 8007ACAC 2130A000 */   addu      $a2, $a1, $zero
/* 6B4B0 8007ACB0 2C00028E */  lw         $v0, 0x2C($s0)
/* 6B4B4 8007ACB4 00000000 */  nop
/* 6B4B8 8007ACB8 5F004788 */  lwl        $a3, 0x5F($v0)
/* 6B4BC 8007ACBC 5C004798 */  lwr        $a3, 0x5C($v0)
/* 6B4C0 8007ACC0 60004884 */  lh         $t0, 0x60($v0)
/* 6B4C4 8007ACC4 670007AA */  swl        $a3, 0x67($s0)
/* 6B4C8 8007ACC8 640007BA */  swr        $a3, 0x64($s0)
/* 6B4CC 8007ACCC 680008A6 */  sh         $t0, 0x68($s0)
/* 6B4D0 8007ACD0 6700078A */  lwl        $a3, 0x67($s0)
/* 6B4D4 8007ACD4 6400079A */  lwr        $a3, 0x64($s0)
/* 6B4D8 8007ACD8 68000886 */  lh         $t0, 0x68($s0)
/* 6B4DC 8007ACDC 5F0007AA */  swl        $a3, 0x5F($s0)
/* 6B4E0 8007ACE0 5C0007BA */  swr        $a3, 0x5C($s0)
/* 6B4E4 8007ACE4 600008A6 */  sh         $t0, 0x60($s0)
/* 6B4E8 8007ACE8 2C00038E */  lw         $v1, 0x2C($s0)
/* 6B4EC 8007ACEC 1400028E */  lw         $v0, 0x14($s0)
/* 6B4F0 8007ACF0 3800638C */  lw         $v1, 0x38($v1)
/* 6B4F4 8007ACF4 000C4234 */  ori        $v0, $v0, 0xC00
/* 6B4F8 8007ACF8 140002AE */  sw         $v0, 0x14($s0)
/* 6B4FC 8007ACFC 380003AE */  sw         $v1, 0x38($s0)
/* 6B500 8007AD00 1400BF8F */  lw         $ra, 0x14($sp)
/* 6B504 8007AD04 1000B08F */  lw         $s0, 0x10($sp)
/* 6B508 8007AD08 0800E003 */  jr         $ra
/* 6B50C 8007AD0C 1800BD27 */   addiu     $sp, $sp, 0x18
.size GlyphProcess, . - GlyphProcess
