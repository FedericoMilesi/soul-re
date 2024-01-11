.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FindObjectInTracker
/* 493A0 80058BA0 0CBE858F */  lw         $a1, %gp_rel(gameTrackerX + 0x44)($gp)
/* 493A4 80058BA4 21300000 */  addu       $a2, $zero, $zero
/* 493A8 80058BA8 1000A324 */  addiu      $v1, $a1, 0x10
.L80058BAC:
/* 493AC 80058BAC 04006284 */  lh         $v0, 0x4($v1)
/* 493B0 80058BB0 00000000 */  nop
/* 493B4 80058BB4 07004010 */  beqz       $v0, .L80058BD4
/* 493B8 80058BB8 00000000 */   nop
/* 493BC 80058BBC 0000628C */  lw         $v0, 0x0($v1)
/* 493C0 80058BC0 00000000 */  nop
/* 493C4 80058BC4 04004414 */  bne        $v0, $a0, .L80058BD8
/* 493C8 80058BC8 0100C624 */   addiu     $a2, $a2, 0x1
/* 493CC 80058BCC 0800E003 */  jr         $ra
/* 493D0 80058BD0 2110A000 */   addu      $v0, $a1, $zero
.L80058BD4:
/* 493D4 80058BD4 0100C624 */  addiu      $a2, $a2, 0x1
.L80058BD8:
/* 493D8 80058BD8 24006324 */  addiu      $v1, $v1, 0x24
/* 493DC 80058BDC 3000C228 */  slti       $v0, $a2, 0x30
/* 493E0 80058BE0 F2FF4014 */  bnez       $v0, .L80058BAC
/* 493E4 80058BE4 2400A524 */   addiu     $a1, $a1, 0x24
/* 493E8 80058BE8 0800E003 */  jr         $ra
/* 493EC 80058BEC 21100000 */   addu      $v0, $zero, $zero
.size FindObjectInTracker, . - FindObjectInTracker
