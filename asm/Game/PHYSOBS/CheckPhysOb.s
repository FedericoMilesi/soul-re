.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckPhysOb
/* 59694 80068E94 2400828C */  lw         $v0, 0x24($a0)
/* 59698 80068E98 00000000 */  nop
/* 5969C 80068E9C 03004014 */  bnez       $v0, .L80068EAC
/* 596A0 80068EA0 00000000 */   nop
/* 596A4 80068EA4 0800E003 */  jr         $ra
/* 596A8 80068EA8 21100000 */   addu      $v0, $zero, $zero
.L80068EAC:
/* 596AC 80068EAC 04004294 */  lhu        $v0, 0x4($v0)
/* 596B0 80068EB0 00000000 */  nop
/* 596B4 80068EB4 0BB04238 */  xori       $v0, $v0, 0xB00B
/* 596B8 80068EB8 0800E003 */  jr         $ra
/* 596BC 80068EBC 0100422C */   sltiu     $v0, $v0, 0x1
.size CheckPhysOb, . - CheckPhysOb
