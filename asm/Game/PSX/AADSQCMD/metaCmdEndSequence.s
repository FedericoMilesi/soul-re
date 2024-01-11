.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdEndSequence
/* 47684 80056E84 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47688 80056E88 1000B0AF */  sw         $s0, 0x10($sp)
/* 4768C 80056E8C 2180A000 */  addu       $s0, $a1, $zero
/* 47690 80056E90 1400BFAF */  sw         $ra, 0x14($sp)
/* 47694 80056E94 DE50010C */  jal        aadInitSequenceSlot
/* 47698 80056E98 21200002 */   addu      $a0, $s0, $zero
/* 4769C 80056E9C 3F050492 */  lbu        $a0, 0x53F($s0)
/* 476A0 80056EA0 AE52010C */  jal        aadAllNotesOff
/* 476A4 80056EA4 00000000 */   nop
/* 476A8 80056EA8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 476AC 80056EAC 00000000 */  nop
/* 476B0 80056EB0 FC1B438C */  lw         $v1, 0x1BFC($v0)
/* 476B4 80056EB4 00000000 */  nop
/* 476B8 80056EB8 05006010 */  beqz       $v1, .L80056ED0
/* 476BC 80056EBC 00000000 */   nop
/* 476C0 80056EC0 041C448C */  lw         $a0, 0x1C04($v0)
/* 476C4 80056EC4 3F050592 */  lbu        $a1, 0x53F($s0)
/* 476C8 80056EC8 09F86000 */  jalr       $v1
/* 476CC 80056ECC 21300000 */   addu      $a2, $zero, $zero
.L80056ED0:
/* 476D0 80056ED0 1400BF8F */  lw         $ra, 0x14($sp)
/* 476D4 80056ED4 1000B08F */  lw         $s0, 0x10($sp)
/* 476D8 80056ED8 0800E003 */  jr         $ra
/* 476DC 80056EDC 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdEndSequence, . - metaCmdEndSequence
