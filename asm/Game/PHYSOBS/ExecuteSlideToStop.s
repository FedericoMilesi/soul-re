.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExecuteSlideToStop
/* 5ED28 8006E528 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5ED2C 8006E52C 1400B1AF */  sw         $s1, 0x14($sp)
/* 5ED30 8006E530 21888000 */  addu       $s1, $a0, $zero
/* 5ED34 8006E534 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5ED38 8006E538 1800B2AF */  sw         $s2, 0x18($sp)
/* 5ED3C 8006E53C 1000B0AF */  sw         $s0, 0x10($sp)
/* 5ED40 8006E540 6C01308E */  lw         $s0, 0x16C($s1)
/* 5ED44 8006E544 00000000 */  nop
/* 5ED48 8006E548 0000038E */  lw         $v1, 0x0($s0)
/* 5ED4C 8006E54C 1000023C */  lui        $v0, (0x100000 >> 16)
/* 5ED50 8006E550 24106200 */  and        $v0, $v1, $v0
/* 5ED54 8006E554 1C004010 */  beqz       $v0, .L8006E5C8
/* 5ED58 8006E558 0004123C */   lui       $s2, (0x4000000 >> 16)
/* 5ED5C 8006E55C 24107200 */  and        $v0, $v1, $s2
/* 5ED60 8006E560 09004010 */  beqz       $v0, .L8006E588
/* 5ED64 8006E564 EFFB023C */   lui       $v0, (0xFBEFEEB5 >> 16)
/* 5ED68 8006E568 B5EE4234 */  ori        $v0, $v0, (0xFBEFEEB5 & 0xFFFF)
/* 5ED6C 8006E56C 24206200 */  and        $a0, $v1, $v0
/* 5ED70 8006E570 04006230 */  andi       $v0, $v1, 0x4
/* 5ED74 8006E574 16004014 */  bnez       $v0, .L8006E5D0
/* 5ED78 8006E578 000004AE */   sw        $a0, 0x0($s0)
/* 5ED7C 8006E57C 01008234 */  ori        $v0, $a0, 0x1
/* 5ED80 8006E580 74B90108 */  j          .L8006E5D0
/* 5ED84 8006E584 000002AE */   sw        $v0, 0x0($s0)
.L8006E588:
/* 5ED88 8006E588 21202002 */  addu       $a0, $s1, $zero
/* 5ED8C 8006E58C F0A8010C */  jal        FinishPush
/* 5ED90 8006E590 080000AE */   sw        $zero, 0x8($s0)
/* 5ED94 8006E594 0000028E */  lw         $v0, 0x0($s0)
/* 5ED98 8006E598 FFEF0324 */  addiu      $v1, $zero, -0x1001
/* 5ED9C 8006E59C 24104300 */  and        $v0, $v0, $v1
/* 5EDA0 8006E5A0 25105200 */  or         $v0, $v0, $s2
/* 5EDA4 8006E5A4 000002AE */  sw         $v0, 0x0($s0)
/* 5EDA8 8006E5A8 5F00258A */  lwl        $a1, 0x5F($s1)
/* 5EDAC 8006E5AC 5C00259A */  lwr        $a1, 0x5C($s1)
/* 5EDB0 8006E5B0 60002686 */  lh         $a2, 0x60($s1)
/* 5EDB4 8006E5B4 710025AA */  swl        $a1, 0x71($s1)
/* 5EDB8 8006E5B8 6E0025BA */  swr        $a1, 0x6E($s1)
/* 5EDBC 8006E5BC 720026A6 */  sh         $a2, 0x72($s1)
/* 5EDC0 8006E5C0 74B90108 */  j          .L8006E5D0
/* 5EDC4 8006E5C4 00000000 */   nop
.L8006E5C8:
/* 5EDC8 8006E5C8 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 5EDCC 8006E5CC 21202002 */   addu      $a0, $s1, $zero
.L8006E5D0:
/* 5EDD0 8006E5D0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5EDD4 8006E5D4 1800B28F */  lw         $s2, 0x18($sp)
/* 5EDD8 8006E5D8 1400B18F */  lw         $s1, 0x14($sp)
/* 5EDDC 8006E5DC 1000B08F */  lw         $s0, 0x10($sp)
/* 5EDE0 8006E5E0 0800E003 */  jr         $ra
/* 5EDE4 8006E5E4 2000BD27 */   addiu     $sp, $sp, 0x20
.size ExecuteSlideToStop, . - ExecuteSlideToStop
