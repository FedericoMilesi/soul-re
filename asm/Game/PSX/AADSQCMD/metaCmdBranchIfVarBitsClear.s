.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarBitsClear
/* 475D4 80056DD4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 475D8 80056DD8 21388000 */  addu       $a3, $a0, $zero
/* 475DC 80056DDC 1000BFAF */  sw         $ra, 0x10($sp)
/* 475E0 80056DE0 0600E390 */  lbu        $v1, 0x6($a3)
/* 475E4 80056DE4 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 475E8 80056DE8 00000000 */  nop
/* 475EC 80056DEC 21104300 */  addu       $v0, $v0, $v1
/* 475F0 80056DF0 0700E390 */  lbu        $v1, 0x7($a3)
/* 475F4 80056DF4 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 475F8 80056DF8 0800E690 */  lbu        $a2, 0x8($a3)
/* 475FC 80056DFC 24104300 */  and        $v0, $v0, $v1
/* 47600 80056E00 04004014 */  bnez       $v0, .L80056E14
/* 47604 80056E04 2120A000 */   addu      $a0, $a1, $zero
/* 47608 80056E08 0400E590 */  lbu        $a1, 0x4($a3)
/* 4760C 80056E0C 615A010C */  jal        aadGotoSequenceLabel
/* 47610 80056E10 00000000 */   nop
.L80056E14:
/* 47614 80056E14 1000BF8F */  lw         $ra, 0x10($sp)
/* 47618 80056E18 00000000 */  nop
/* 4761C 80056E1C 0800E003 */  jr         $ra
/* 47620 80056E20 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarBitsClear, . - metaCmdBranchIfVarBitsClear
