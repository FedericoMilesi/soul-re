.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_MarkUnitNeeded
/* 4B650 8005AE50 21280000 */  addu       $a1, $zero, $zero
/* 4B654 8005AE54 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L8005AE58:
/* 4B658 8005AE58 04006284 */  lh         $v0, 0x4($v1)
/* 4B65C 8005AE5C 00000000 */  nop
/* 4B660 8005AE60 08004010 */  beqz       $v0, .L8005AE84
/* 4B664 8005AE64 00000000 */   nop
/* 4B668 8005AE68 0000628C */  lw         $v0, 0x0($v1)
/* 4B66C 8005AE6C 00000000 */  nop
/* 4B670 8005AE70 05008214 */  bne        $a0, $v0, .L8005AE88
/* 4B674 8005AE74 0100A524 */   addiu     $a1, $a1, 0x1
/* 4B678 8005AE78 F0BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x128)($gp)
/* 4B67C 8005AE7C 0800E003 */  jr         $ra
/* 4B680 8005AE80 200062AC */   sw        $v0, 0x20($v1)
.L8005AE84:
/* 4B684 8005AE84 0100A524 */  addiu      $a1, $a1, 0x1
.L8005AE88:
/* 4B688 8005AE88 1000A228 */  slti       $v0, $a1, 0x10
/* 4B68C 8005AE8C F2FF4014 */  bnez       $v0, .L8005AE58
/* 4B690 8005AE90 40006324 */   addiu     $v1, $v1, 0x40
/* 4B694 8005AE94 0800E003 */  jr         $ra
/* 4B698 8005AE98 00000000 */   nop
.size STREAM_MarkUnitNeeded, . - STREAM_MarkUnitNeeded
