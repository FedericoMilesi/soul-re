.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_NoticeEntry
/* 7BEE0 8008B6E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7BEE4 8008B6E4 1400B1AF */  sw         $s1, 0x14($sp)
/* 7BEE8 8008B6E8 21888000 */  addu       $s1, $a0, $zero
/* 7BEEC 8008B6EC 1800BFAF */  sw         $ra, 0x18($sp)
/* 7BEF0 8008B6F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 7BEF4 8008B6F4 6C01308E */  lw         $s0, 0x16C($s1)
/* 7BEF8 8008B6F8 00000000 */  nop
/* 7BEFC 8008B6FC 0400028E */  lw         $v0, 0x4($s0)
/* 7BF00 8008B700 00000000 */  nop
/* 7BF04 8008B704 1B004104 */  bgez       $v0, .L8008B774
/* 7BF08 8008B708 00000000 */   nop
/* 7BF0C 8008B70C 6801028E */  lw         $v0, 0x168($s0)
/* 7BF10 8008B710 00000000 */  nop
/* 7BF14 8008B714 0C00428C */  lw         $v0, 0xC($v0)
/* 7BF18 8008B718 00000000 */  nop
/* 7BF1C 8008B71C 0400428C */  lw         $v0, 0x4($v0)
/* 7BF20 8008B720 00000000 */  nop
/* 7BF24 8008B724 13004010 */  beqz       $v0, .L8008B774
/* 7BF28 8008B728 2A000524 */   addiu     $a1, $zero, 0x2A
/* 7BF2C 8008B72C B6FF010C */  jal        MON_PlayAnim
/* 7BF30 8008B730 01000624 */   addiu     $a2, $zero, 0x1
/* 7BF34 8008B734 C400028E */  lw         $v0, 0xC4($s0)
/* 7BF38 8008B738 00000000 */  nop
/* 7BF3C 8008B73C 0400448C */  lw         $a0, 0x4($v0)
/* 7BF40 8008B740 02000624 */  addiu      $a2, $zero, 0x2
/* 7BF44 8008B744 CAC3010C */  jal        SetMonsterAlarmData
/* 7BF48 8008B748 5C008524 */   addiu     $a1, $a0, 0x5C
/* 7BF4C 8008B74C 21202002 */  addu       $a0, $s1, $zero
/* 7BF50 8008B750 6801038E */  lw         $v1, 0x168($s0)
/* 7BF54 8008B754 0001063C */  lui        $a2, (0x1000011 >> 16)
/* 7BF58 8008B758 0C00638C */  lw         $v1, 0xC($v1)
/* 7BF5C 8008B75C 1100C634 */  ori        $a2, $a2, (0x1000011 & 0xFFFF)
/* 7BF60 8008B760 0400658C */  lw         $a1, 0x4($v1)
/* 7BF64 8008B764 BAD1000C */  jal        INSTANCE_Broadcast
/* 7BF68 8008B768 21384000 */   addu      $a3, $v0, $zero
/* 7BF6C 8008B76C E12D0208 */  j          .L8008B784
/* 7BF70 8008B770 00000000 */   nop
.L8008B774:
/* 7BF74 8008B774 21202002 */  addu       $a0, $s1, $zero
/* 7BF78 8008B778 1D000524 */  addiu      $a1, $zero, 0x1D
/* 7BF7C 8008B77C B6FF010C */  jal        MON_PlayAnim
/* 7BF80 8008B780 01000624 */   addiu     $a2, $zero, 0x1
.L8008B784:
/* 7BF84 8008B784 1800BF8F */  lw         $ra, 0x18($sp)
/* 7BF88 8008B788 1400B18F */  lw         $s1, 0x14($sp)
/* 7BF8C 8008B78C 1000B08F */  lw         $s0, 0x10($sp)
/* 7BF90 8008B790 0800E003 */  jr         $ra
/* 7BF94 8008B794 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_NoticeEntry, . - MON_NoticeEntry
