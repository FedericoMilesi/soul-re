.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdBranchIfVarGreater
/* 47494 80056C94 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47498 80056C98 21388000 */  addu       $a3, $a0, $zero
/* 4749C 80056C9C 1000BFAF */  sw         $ra, 0x10($sp)
/* 474A0 80056CA0 0600E390 */  lbu        $v1, 0x6($a3)
/* 474A4 80056CA4 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 474A8 80056CA8 00000000 */  nop
/* 474AC 80056CAC 21104300 */  addu       $v0, $v0, $v1
/* 474B0 80056CB0 0700E390 */  lbu        $v1, 0x7($a3)
/* 474B4 80056CB4 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 474B8 80056CB8 0800E690 */  lbu        $a2, 0x8($a3)
/* 474BC 80056CBC 2A186200 */  slt        $v1, $v1, $v0
/* 474C0 80056CC0 04006010 */  beqz       $v1, .L80056CD4
/* 474C4 80056CC4 2120A000 */   addu      $a0, $a1, $zero
/* 474C8 80056CC8 0400E590 */  lbu        $a1, 0x4($a3)
/* 474CC 80056CCC 615A010C */  jal        aadGotoSequenceLabel
/* 474D0 80056CD0 00000000 */   nop
.L80056CD4:
/* 474D4 80056CD4 1000BF8F */  lw         $ra, 0x10($sp)
/* 474D8 80056CD8 00000000 */  nop
/* 474DC 80056CDC 0800E003 */  jr         $ra
/* 474E0 80056CE0 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdBranchIfVarGreater, . - metaCmdBranchIfVarGreater
