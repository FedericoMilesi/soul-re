.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetTempoFromSequence
/* 468E0 800560E0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 468E4 800560E4 2000B2AF */  sw         $s2, 0x20($sp)
/* 468E8 800560E8 2190A000 */  addu       $s2, $a1, $zero
/* 468EC 800560EC 2400BFAF */  sw         $ra, 0x24($sp)
/* 468F0 800560F0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 468F4 800560F4 1800B0AF */  sw         $s0, 0x18($sp)
/* 468F8 800560F8 5805508E */  lw         $s0, 0x558($s2)
/* 468FC 800560FC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 46900 80056100 06009190 */  lbu        $s1, 0x6($a0)
/* 46904 80056104 80181000 */  sll        $v1, $s0, 2
/* 46908 80056108 21104300 */  addu       $v0, $v0, $v1
/* 4690C 8005610C 0005428C */  lw         $v0, 0x500($v0)
/* 46910 80056110 02000324 */  addiu      $v1, $zero, 0x2
/* 46914 80056114 0C004314 */  bne        $v0, $v1, .L80056148
/* 46918 80056118 00000000 */   nop
/* 4691C 8005611C 7051010C */  jal        aadGetNumDynamicSequences
/* 46920 80056120 21200002 */   addu      $a0, $s0, $zero
/* 46924 80056124 2A102202 */  slt        $v0, $s1, $v0
/* 46928 80056128 07004010 */  beqz       $v0, .L80056148
/* 4692C 8005612C 21200002 */   addu      $a0, $s0, $zero
/* 46930 80056130 21282002 */  addu       $a1, $s1, $zero
/* 46934 80056134 B351010C */  jal        aadGetTempoFromDynamicSequence
/* 46938 80056138 1000A627 */   addiu     $a2, $sp, 0x10
/* 4693C 8005613C 3C054492 */  lbu        $a0, 0x53C($s2)
/* 46940 80056140 C751010C */  jal        aadSetSlotTempo
/* 46944 80056144 1000A527 */   addiu     $a1, $sp, 0x10
.L80056148:
/* 46948 80056148 2400BF8F */  lw         $ra, 0x24($sp)
/* 4694C 8005614C 2000B28F */  lw         $s2, 0x20($sp)
/* 46950 80056150 1C00B18F */  lw         $s1, 0x1C($sp)
/* 46954 80056154 1800B08F */  lw         $s0, 0x18($sp)
/* 46958 80056158 0800E003 */  jr         $ra
/* 4695C 8005615C 2800BD27 */   addiu     $sp, $sp, 0x28
.size metaCmdSetTempoFromSequence, . - metaCmdSetTempoFromSequence
