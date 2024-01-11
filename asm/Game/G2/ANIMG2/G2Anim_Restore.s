.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_Restore
/* 83590 80092D90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 83594 80092D94 1800B2AF */  sw         $s2, 0x18($sp)
/* 83598 80092D98 21908000 */  addu       $s2, $a0, $zero
/* 8359C 80092D9C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 835A0 80092DA0 1400B1AF */  sw         $s1, 0x14($sp)
/* 835A4 80092DA4 1000B0AF */  sw         $s0, 0x10($sp)
/* 835A8 80092DA8 00004292 */  lbu        $v0, 0x0($s2)
/* 835AC 80092DAC 00000000 */  nop
/* 835B0 80092DB0 11004010 */  beqz       $v0, .L80092DF8
/* 835B4 80092DB4 21800000 */   addu      $s0, $zero, $zero
/* 835B8 80092DB8 24001124 */  addiu      $s1, $zero, 0x24
.L80092DBC:
/* 835BC 80092DBC 21205102 */  addu       $a0, $s2, $s1
/* 835C0 80092DC0 2400828C */  lw         $v0, 0x24($a0)
/* 835C4 80092DC4 00000000 */  nop
/* 835C8 80092DC8 06004010 */  beqz       $v0, .L80092DE4
/* 835CC 80092DCC 00000000 */   nop
/* 835D0 80092DD0 06004294 */  lhu        $v0, 0x6($v0)
/* 835D4 80092DD4 04008584 */  lh         $a1, 0x4($a0)
/* 835D8 80092DD8 23100200 */  negu       $v0, $v0
/* 835DC 80092DDC D04D020C */  jal        G2AnimSection_JumpToTime
/* 835E0 80092DE0 060082A4 */   sh        $v0, 0x6($a0)
.L80092DE4:
/* 835E4 80092DE4 00004292 */  lbu        $v0, 0x0($s2)
/* 835E8 80092DE8 01001026 */  addiu      $s0, $s0, 0x1
/* 835EC 80092DEC 2A100202 */  slt        $v0, $s0, $v0
/* 835F0 80092DF0 F2FF4014 */  bnez       $v0, .L80092DBC
/* 835F4 80092DF4 30003126 */   addiu     $s1, $s1, 0x30
.L80092DF8:
/* 835F8 80092DF8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 835FC 80092DFC 1800B28F */  lw         $s2, 0x18($sp)
/* 83600 80092E00 1400B18F */  lw         $s1, 0x14($sp)
/* 83604 80092E04 1000B08F */  lw         $s0, 0x10($sp)
/* 83608 80092E08 0800E003 */  jr         $ra
/* 8360C 80092E0C 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2Anim_Restore, . - G2Anim_Restore
