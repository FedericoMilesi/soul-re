.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarEqual
/* 473AC 80056BAC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 473B0 80056BB0 21388000 */  addu       $a3, $a0, $zero
/* 473B4 80056BB4 1000BFAF */  sw         $ra, 0x10($sp)
/* 473B8 80056BB8 0600E390 */  lbu        $v1, 0x6($a3)
/* 473BC 80056BBC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 473C0 80056BC0 00000000 */  nop
/* 473C4 80056BC4 21104300 */  addu       $v0, $v0, $v1
/* 473C8 80056BC8 0700E390 */  lbu        $v1, 0x7($a3)
/* 473CC 80056BCC 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 473D0 80056BD0 0800E690 */  lbu        $a2, 0x8($a3)
/* 473D4 80056BD4 04004314 */  bne        $v0, $v1, .L80056BE8
/* 473D8 80056BD8 2120A000 */   addu      $a0, $a1, $zero
/* 473DC 80056BDC 0400E590 */  lbu        $a1, 0x4($a3)
/* 473E0 80056BE0 615A010C */  jal        aadGotoSequenceLabel
/* 473E4 80056BE4 00000000 */   nop
.L80056BE8:
/* 473E8 80056BE8 1000BF8F */  lw         $ra, 0x10($sp)
/* 473EC 80056BEC 00000000 */  nop
/* 473F0 80056BF0 0800E003 */  jr         $ra
/* 473F4 80056BF4 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarEqual, . - metaCmdBranchIfVarEqual
