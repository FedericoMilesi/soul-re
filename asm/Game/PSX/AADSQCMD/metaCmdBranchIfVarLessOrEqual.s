.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarLessOrEqual
/* 474E4 80056CE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 474E8 80056CE8 21388000 */  addu       $a3, $a0, $zero
/* 474EC 80056CEC 1000BFAF */  sw         $ra, 0x10($sp)
/* 474F0 80056CF0 0600E390 */  lbu        $v1, 0x6($a3)
/* 474F4 80056CF4 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 474F8 80056CF8 00000000 */  nop
/* 474FC 80056CFC 21104300 */  addu       $v0, $v0, $v1
/* 47500 80056D00 0700E390 */  lbu        $v1, 0x7($a3)
/* 47504 80056D04 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 47508 80056D08 0800E690 */  lbu        $a2, 0x8($a3)
/* 4750C 80056D0C 2A186200 */  slt        $v1, $v1, $v0
/* 47510 80056D10 04006014 */  bnez       $v1, .L80056D24
/* 47514 80056D14 2120A000 */   addu      $a0, $a1, $zero
/* 47518 80056D18 0400E590 */  lbu        $a1, 0x4($a3)
/* 4751C 80056D1C 615A010C */  jal        aadGotoSequenceLabel
/* 47520 80056D20 00000000 */   nop
.L80056D24:
/* 47524 80056D24 1000BF8F */  lw         $ra, 0x10($sp)
/* 47528 80056D28 00000000 */  nop
/* 4752C 80056D2C 0800E003 */  jr         $ra
/* 47530 80056D30 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarLessOrEqual, . - metaCmdBranchIfVarLessOrEqual
