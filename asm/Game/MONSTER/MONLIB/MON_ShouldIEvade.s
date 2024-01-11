.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ShouldIEvade
/* 70EDC 800806DC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 70EE0 800806E0 1400B1AF */  sw         $s1, 0x14($sp)
/* 70EE4 800806E4 21888000 */  addu       $s1, $a0, $zero
/* 70EE8 800806E8 2000BFAF */  sw         $ra, 0x20($sp)
/* 70EEC 800806EC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 70EF0 800806F0 1800B2AF */  sw         $s2, 0x18($sp)
/* 70EF4 800806F4 1000B0AF */  sw         $s0, 0x10($sp)
/* 70EF8 800806F8 6C01308E */  lw         $s0, 0x16C($s1)
/* 70EFC 800806FC 00000000 */  nop
/* 70F00 80080700 0000028E */  lw         $v0, 0x0($s0)
/* 70F04 80080704 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 70F08 80080708 24104300 */  and        $v0, $v0, $v1
/* 70F0C 8008070C 16004014 */  bnez       $v0, .L80080768
/* 70F10 80080710 21980000 */   addu      $s3, $zero, $zero
/* 70F14 80080714 C400128E */  lw         $s2, 0xC4($s0)
/* 70F18 80080718 00000000 */  nop
/* 70F1C 8008071C 0400458E */  lw         $a1, 0x4($s2)
/* 70F20 80080720 6700020C */  jal        MON_FacingOffset
/* 70F24 80080724 00000000 */   nop
/* 70F28 80080728 A9024224 */  addiu      $v0, $v0, 0x2A9
/* 70F2C 8008072C FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 70F30 80080730 5305422C */  sltiu      $v0, $v0, 0x553
/* 70F34 80080734 0C004010 */  beqz       $v0, .L80080768
/* 70F38 80080738 21202002 */   addu      $a0, $s1, $zero
/* 70F3C 8008073C 6801028E */  lw         $v0, 0x168($s0)
/* 70F40 80080740 00000000 */  nop
/* 70F44 80080744 0800468C */  lw         $a2, 0x8($v0)
/* 70F48 80080748 21284002 */  addu       $a1, $s2, $zero
/* 70F4C 8008074C 7600020C */  jal        MON_CheckConditions
/* 70F50 80080750 2000C624 */   addiu     $a2, $a2, 0x20
/* 70F54 80080754 05004010 */  beqz       $v0, .L8008076C
/* 70F58 80080758 21106002 */   addu      $v0, $s3, $zero
/* 70F5C 8008075C C400028E */  lw         $v0, 0xC4($s0)
/* 70F60 80080760 01001324 */  addiu      $s3, $zero, 0x1
/* 70F64 80080764 180040A4 */  sh         $zero, 0x18($v0)
.L80080768:
/* 70F68 80080768 21106002 */  addu       $v0, $s3, $zero
.L8008076C:
/* 70F6C 8008076C 2000BF8F */  lw         $ra, 0x20($sp)
/* 70F70 80080770 1C00B38F */  lw         $s3, 0x1C($sp)
/* 70F74 80080774 1800B28F */  lw         $s2, 0x18($sp)
/* 70F78 80080778 1400B18F */  lw         $s1, 0x14($sp)
/* 70F7C 8008077C 1000B08F */  lw         $s0, 0x10($sp)
/* 70F80 80080780 0800E003 */  jr         $ra
/* 70F84 80080784 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_ShouldIEvade, . - MON_ShouldIEvade
