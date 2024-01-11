.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ValidPosition
/* 73D4C 8008354C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 73D50 80083550 1000B0AF */  sw         $s0, 0x10($sp)
/* 73D54 80083554 21808000 */  addu       $s0, $a0, $zero
/* 73D58 80083558 1400BFAF */  sw         $ra, 0x14($sp)
/* 73D5C 8008355C 3800058E */  lw         $a1, 0x38($s0)
/* 73D60 80083560 400D020C */  jal        MON_ValidUnit
/* 73D64 80083564 00000000 */   nop
/* 73D68 80083568 03004014 */  bnez       $v0, .L80083578
/* 73D6C 8008356C 01000224 */   addiu     $v0, $zero, 0x1
/* 73D70 80083570 650D0208 */  j          .L80083594
/* 73D74 80083574 21100000 */   addu      $v0, $zero, $zero
.L80083578:
/* 73D78 80083578 6C01038E */  lw         $v1, 0x16C($s0)
/* 73D7C 8008357C 5F00068A */  lwl        $a2, 0x5F($s0)
/* 73D80 80083580 5C00069A */  lwr        $a2, 0x5C($s0)
/* 73D84 80083584 60000786 */  lh         $a3, 0x60($s0)
/* 73D88 80083588 2F0166A8 */  swl        $a2, 0x12F($v1)
/* 73D8C 8008358C 2C0166B8 */  swr        $a2, 0x12C($v1)
/* 73D90 80083590 300167A4 */  sh         $a3, 0x130($v1)
.L80083594:
/* 73D94 80083594 1400BF8F */  lw         $ra, 0x14($sp)
/* 73D98 80083598 1000B08F */  lw         $s0, 0x10($sp)
/* 73D9C 8008359C 0800E003 */  jr         $ra
/* 73DA0 800835A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_ValidPosition, . - MON_ValidPosition
