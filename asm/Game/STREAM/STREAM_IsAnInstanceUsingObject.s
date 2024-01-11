.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_IsAnInstanceUsingObject
/* 49AE0 800592E0 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 49AE4 800592E4 00000000 */  nop
/* 49AE8 800592E8 0400438C */  lw         $v1, 0x4($v0)
/* 49AEC 800592EC 00000000 */  nop
/* 49AF0 800592F0 09006010 */  beqz       $v1, .L80059318
/* 49AF4 800592F4 21280000 */   addu      $a1, $zero, $zero
.L800592F8:
/* 49AF8 800592F8 1C00628C */  lw         $v0, 0x1C($v1)
/* 49AFC 800592FC 0800638C */  lw         $v1, 0x8($v1)
/* 49B00 80059300 03004414 */  bne        $v0, $a0, .L80059310
/* 49B04 80059304 00000000 */   nop
/* 49B08 80059308 C6640108 */  j          .L80059318
/* 49B0C 8005930C 01000524 */   addiu     $a1, $zero, 0x1
.L80059310:
/* 49B10 80059310 F9FF6014 */  bnez       $v1, .L800592F8
/* 49B14 80059314 00000000 */   nop
.L80059318:
/* 49B18 80059318 0800E003 */  jr         $ra
/* 49B1C 8005931C 2110A000 */   addu      $v0, $a1, $zero
.size STREAM_IsAnInstanceUsingObject, . - STREAM_IsAnInstanceUsingObject
