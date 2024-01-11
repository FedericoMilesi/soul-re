.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarNotEqual
/* 473F8 80056BF8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 473FC 80056BFC 21388000 */  addu       $a3, $a0, $zero
/* 47400 80056C00 1000BFAF */  sw         $ra, 0x10($sp)
/* 47404 80056C04 0600E390 */  lbu        $v1, 0x6($a3)
/* 47408 80056C08 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4740C 80056C0C 00000000 */  nop
/* 47410 80056C10 21104300 */  addu       $v0, $v0, $v1
/* 47414 80056C14 0700E390 */  lbu        $v1, 0x7($a3)
/* 47418 80056C18 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 4741C 80056C1C 0800E690 */  lbu        $a2, 0x8($a3)
/* 47420 80056C20 04004310 */  beq        $v0, $v1, .L80056C34
/* 47424 80056C24 2120A000 */   addu      $a0, $a1, $zero
/* 47428 80056C28 0400E590 */  lbu        $a1, 0x4($a3)
/* 4742C 80056C2C 615A010C */  jal        aadGotoSequenceLabel
/* 47430 80056C30 00000000 */   nop
.L80056C34:
/* 47434 80056C34 1000BF8F */  lw         $ra, 0x10($sp)
/* 47438 80056C38 00000000 */  nop
/* 4743C 80056C3C 0800E003 */  jr         $ra
/* 47440 80056C40 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarNotEqual, . - metaCmdBranchIfVarNotEqual
