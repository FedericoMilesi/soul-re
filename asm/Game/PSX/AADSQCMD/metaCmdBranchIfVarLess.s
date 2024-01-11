.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarLess
/* 47444 80056C44 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47448 80056C48 21388000 */  addu       $a3, $a0, $zero
/* 4744C 80056C4C 1000BFAF */  sw         $ra, 0x10($sp)
/* 47450 80056C50 0600E390 */  lbu        $v1, 0x6($a3)
/* 47454 80056C54 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47458 80056C58 00000000 */  nop
/* 4745C 80056C5C 21104300 */  addu       $v0, $v0, $v1
/* 47460 80056C60 0700E390 */  lbu        $v1, 0x7($a3)
/* 47464 80056C64 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 47468 80056C68 0800E690 */  lbu        $a2, 0x8($a3)
/* 4746C 80056C6C 2A104300 */  slt        $v0, $v0, $v1
/* 47470 80056C70 04004010 */  beqz       $v0, .L80056C84
/* 47474 80056C74 2120A000 */   addu      $a0, $a1, $zero
/* 47478 80056C78 0400E590 */  lbu        $a1, 0x4($a3)
/* 4747C 80056C7C 615A010C */  jal        aadGotoSequenceLabel
/* 47480 80056C80 00000000 */   nop
.L80056C84:
/* 47484 80056C84 1000BF8F */  lw         $ra, 0x10($sp)
/* 47488 80056C88 00000000 */  nop
/* 4748C 80056C8C 0800E003 */  jr         $ra
/* 47490 80056C90 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarLess, . - metaCmdBranchIfVarLess
