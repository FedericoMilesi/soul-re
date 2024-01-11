.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadIsSfxTypePlaying
/* 478F0 800570F0 21280000 */  addu       $a1, $zero, $zero
/* 478F4 800570F4 D89B878F */  lw         $a3, %gp_rel(aadMem)($gp)
/* 478F8 800570F8 D0000924 */  addiu      $t1, $zero, 0xD0
/* 478FC 800570FC FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* 47900 80057100 02000824 */  addiu      $t0, $zero, 0x2
/* 47904 80057104 DC010624 */  addiu      $a2, $zero, 0x1DC
.L80057108:
/* 47908 80057108 2118E600 */  addu       $v1, $a3, $a2
/* 4790C 8005710C 08006290 */  lbu        $v0, 0x8($v1)
/* 47910 80057110 00000000 */  nop
/* 47914 80057114 0D004914 */  bne        $v0, $t1, .L8005714C
/* 47918 80057118 00000000 */   nop
/* 4791C 8005711C 04006294 */  lhu        $v0, 0x4($v1)
/* 47920 80057120 00000000 */  nop
/* 47924 80057124 09004414 */  bne        $v0, $a0, .L8005714C
/* 47928 80057128 2110E500 */   addu      $v0, $a3, $a1
/* 4792C 8005712C 7C044290 */  lbu        $v0, 0x47C($v0)
/* 47930 80057130 00000000 */  nop
/* 47934 80057134 05004010 */  beqz       $v0, .L8005714C
/* 47938 80057138 00000000 */   nop
/* 4793C 8005713C 04004810 */  beq        $v0, $t0, .L80057150
/* 47940 80057140 0100A524 */   addiu     $a1, $a1, 0x1
/* 47944 80057144 0800E003 */  jr         $ra
/* 47948 80057148 01000224 */   addiu     $v0, $zero, 0x1
.L8005714C:
/* 4794C 8005714C 0100A524 */  addiu      $a1, $a1, 0x1
.L80057150:
/* 47950 80057150 1800A228 */  slti       $v0, $a1, 0x18
/* 47954 80057154 ECFF4014 */  bnez       $v0, .L80057108
/* 47958 80057158 1C00C624 */   addiu     $a2, $a2, 0x1C
/* 4795C 8005715C 0800E003 */  jr         $ra
/* 47960 80057160 21100000 */   addu      $v0, $zero, $zero
.size aadIsSfxTypePlaying, . - aadIsSfxTypePlaying
