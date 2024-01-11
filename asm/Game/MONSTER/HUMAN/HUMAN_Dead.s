.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_Dead
/* 6D934 8007D134 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6D938 8007D138 1400B1AF */  sw         $s1, 0x14($sp)
/* 6D93C 8007D13C 21888000 */  addu       $s1, $a0, $zero
/* 6D940 8007D140 1800BFAF */  sw         $ra, 0x18($sp)
/* 6D944 8007D144 1000B0AF */  sw         $s0, 0x10($sp)
/* 6D948 8007D148 6C01308E */  lw         $s0, 0x16C($s1)
/* 6D94C 8007D14C 9006020C */  jal        MON_GetTime
/* 6D950 8007D150 00000000 */   nop
/* 6D954 8007D154 0C010396 */  lhu        $v1, 0x10C($s0)
/* 6D958 8007D158 00000000 */  nop
/* 6D95C 8007D15C 23204300 */  subu       $a0, $v0, $v1
/* 6D960 8007D160 040124A6 */  sh         $a0, 0x104($s1)
/* 6D964 8007D164 58010392 */  lbu        $v1, 0x158($s0)
/* 6D968 8007D168 06000224 */  addiu      $v0, $zero, 0x6
/* 6D96C 8007D16C 05006214 */  bne        $v1, $v0, .L8007D184
/* 6D970 8007D170 00140400 */   sll       $v0, $a0, 16
/* 6D974 8007D174 631E020C */  jal        MON_Dead
/* 6D978 8007D178 21202002 */   addu      $a0, $s1, $zero
/* 6D97C 8007D17C 82F40108 */  j          .L8007D208
/* 6D980 8007D180 00000000 */   nop
.L8007D184:
/* 6D984 8007D184 03140200 */  sra        $v0, $v0, 16
/* 6D988 8007D188 00104228 */  slti       $v0, $v0, 0x1000
/* 6D98C 8007D18C 03004014 */  bnez       $v0, .L8007D19C
/* 6D990 8007D190 00000000 */   nop
/* 6D994 8007D194 D00B020C */  jal        MON_KillMonster
/* 6D998 8007D198 21202002 */   addu      $a0, $s1, $zero
.L8007D19C:
/* 6D99C 8007D19C 0000028E */  lw         $v0, 0x0($s0)
/* 6D9A0 8007D1A0 4000033C */  lui        $v1, (0x400000 >> 16)
/* 6D9A4 8007D1A4 24104300 */  and        $v0, $v0, $v1
/* 6D9A8 8007D1A8 0C004010 */  beqz       $v0, .L8007D1DC
/* 6D9AC 8007D1AC 00000000 */   nop
/* 6D9B0 8007D1B0 9006020C */  jal        MON_GetTime
/* 6D9B4 8007D1B4 21202002 */   addu      $a0, $s1, $zero
/* 6D9B8 8007D1B8 1C01038E */  lw         $v1, 0x11C($s0)
/* 6D9BC 8007D1BC 00000000 */  nop
/* 6D9C0 8007D1C0 2B186200 */  sltu       $v1, $v1, $v0
/* 6D9C4 8007D1C4 05006010 */  beqz       $v1, .L8007D1DC
/* 6D9C8 8007D1C8 BFFF033C */   lui       $v1, (0xFFBFFFFF >> 16)
/* 6D9CC 8007D1CC 0000028E */  lw         $v0, 0x0($s0)
/* 6D9D0 8007D1D0 FFFF6334 */  ori        $v1, $v1, (0xFFBFFFFF & 0xFFFF)
/* 6D9D4 8007D1D4 24104300 */  and        $v0, $v0, $v1
/* 6D9D8 8007D1D8 000002AE */  sw         $v0, 0x0($s0)
.L8007D1DC:
/* 6D9DC 8007D1DC 0000028E */  lw         $v0, 0x0($s0)
/* 6D9E0 8007D1E0 00000000 */  nop
/* 6D9E4 8007D1E4 02004230 */  andi       $v0, $v0, 0x2
/* 6D9E8 8007D1E8 03004014 */  bnez       $v0, .L8007D1F8
/* 6D9EC 8007D1EC 00000000 */   nop
/* 6D9F0 8007D1F0 CF04020C */  jal        MON_ApplyPhysics
/* 6D9F4 8007D1F4 21202002 */   addu      $a0, $s1, $zero
.L8007D1F8:
/* 6D9F8 8007D1F8 27C3010C */  jal        DeMessageQueue
/* 6D9FC 8007D1FC 08000426 */   addiu     $a0, $s0, 0x8
/* 6DA00 8007D200 FDFF4014 */  bnez       $v0, .L8007D1F8
/* 6DA04 8007D204 00000000 */   nop
.L8007D208:
/* 6DA08 8007D208 1800BF8F */  lw         $ra, 0x18($sp)
/* 6DA0C 8007D20C 1400B18F */  lw         $s1, 0x14($sp)
/* 6DA10 8007D210 1000B08F */  lw         $s0, 0x10($sp)
/* 6DA14 8007D214 0800E003 */  jr         $ra
/* 6DA18 8007D218 2000BD27 */   addiu     $sp, $sp, 0x20
.size HUMAN_Dead, . - HUMAN_Dead
