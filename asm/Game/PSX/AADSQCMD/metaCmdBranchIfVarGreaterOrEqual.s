.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarGreaterOrEqual
/* 47534 80056D34 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47538 80056D38 21388000 */  addu       $a3, $a0, $zero
/* 4753C 80056D3C 1000BFAF */  sw         $ra, 0x10($sp)
/* 47540 80056D40 0600E390 */  lbu        $v1, 0x6($a3)
/* 47544 80056D44 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47548 80056D48 00000000 */  nop
/* 4754C 80056D4C 21104300 */  addu       $v0, $v0, $v1
/* 47550 80056D50 0700E390 */  lbu        $v1, 0x7($a3)
/* 47554 80056D54 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 47558 80056D58 0800E690 */  lbu        $a2, 0x8($a3)
/* 4755C 80056D5C 2A104300 */  slt        $v0, $v0, $v1
/* 47560 80056D60 04004014 */  bnez       $v0, .L80056D74
/* 47564 80056D64 2120A000 */   addu      $a0, $a1, $zero
/* 47568 80056D68 0400E590 */  lbu        $a1, 0x4($a3)
/* 4756C 80056D6C 615A010C */  jal        aadGotoSequenceLabel
/* 47570 80056D70 00000000 */   nop
.L80056D74:
/* 47574 80056D74 1000BF8F */  lw         $ra, 0x10($sp)
/* 47578 80056D78 00000000 */  nop
/* 4757C 80056D7C 0800E003 */  jr         $ra
/* 47580 80056D80 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarGreaterOrEqual, . - metaCmdBranchIfVarGreaterOrEqual
