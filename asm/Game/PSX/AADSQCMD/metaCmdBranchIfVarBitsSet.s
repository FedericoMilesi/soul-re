.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarBitsSet
/* 47584 80056D84 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47588 80056D88 21388000 */  addu       $a3, $a0, $zero
/* 4758C 80056D8C 1000BFAF */  sw         $ra, 0x10($sp)
/* 47590 80056D90 0600E390 */  lbu        $v1, 0x6($a3)
/* 47594 80056D94 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47598 80056D98 00000000 */  nop
/* 4759C 80056D9C 21104300 */  addu       $v0, $v0, $v1
/* 475A0 80056DA0 0700E390 */  lbu        $v1, 0x7($a3)
/* 475A4 80056DA4 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 475A8 80056DA8 0800E690 */  lbu        $a2, 0x8($a3)
/* 475AC 80056DAC 24104300 */  and        $v0, $v0, $v1
/* 475B0 80056DB0 04004010 */  beqz       $v0, .L80056DC4
/* 475B4 80056DB4 2120A000 */   addu      $a0, $a1, $zero
/* 475B8 80056DB8 0400E590 */  lbu        $a1, 0x4($a3)
/* 475BC 80056DBC 615A010C */  jal        aadGotoSequenceLabel
/* 475C0 80056DC0 00000000 */   nop
.L80056DC4:
/* 475C4 80056DC4 1000BF8F */  lw         $ra, 0x10($sp)
/* 475C8 80056DC8 00000000 */  nop
/* 475CC 80056DCC 0800E003 */  jr         $ra
/* 475D0 80056DD0 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarBitsSet, . - metaCmdBranchIfVarBitsSet
