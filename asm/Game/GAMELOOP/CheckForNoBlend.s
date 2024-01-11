.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckForNoBlend
/* 1F2E0 8002EAE0 00008290 */  lbu        $v0, 0x0($a0)
/* 1F2E4 8002EAE4 00000000 */  nop
/* 1F2E8 8002EAE8 0500422C */  sltiu      $v0, $v0, 0x5
/* 1F2EC 8002EAEC 0C004010 */  beqz       $v0, .L8002EB20
/* 1F2F0 8002EAF0 21100000 */   addu      $v0, $zero, $zero
/* 1F2F4 8002EAF4 01008290 */  lbu        $v0, 0x1($a0)
/* 1F2F8 8002EAF8 00000000 */  nop
/* 1F2FC 8002EAFC 0500422C */  sltiu      $v0, $v0, 0x5
/* 1F300 8002EB00 07004010 */  beqz       $v0, .L8002EB20
/* 1F304 8002EB04 21100000 */   addu      $v0, $zero, $zero
/* 1F308 8002EB08 02008390 */  lbu        $v1, 0x2($a0)
/* 1F30C 8002EB0C 00000000 */  nop
/* 1F310 8002EB10 0500632C */  sltiu      $v1, $v1, 0x5
/* 1F314 8002EB14 02006014 */  bnez       $v1, .L8002EB20
/* 1F318 8002EB18 01000224 */   addiu     $v0, $zero, 0x1
/* 1F31C 8002EB1C 21100000 */  addu       $v0, $zero, $zero
.L8002EB20:
/* 1F320 8002EB20 0800E003 */  jr         $ra
/* 1F324 8002EB24 00000000 */   nop
.size CheckForNoBlend, . - CheckForNoBlend
