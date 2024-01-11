.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_GetStreamUnitWithID
/* 4A0C8 800598C8 21300000 */  addu       $a2, $zero, $zero
/* 4A0CC 800598CC 2128C000 */  addu       $a1, $a2, $zero
/* 4A0D0 800598D0 02000724 */  addiu      $a3, $zero, 0x2
/* 4A0D4 800598D4 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L800598D8:
/* 4A0D8 800598D8 04006284 */  lh         $v0, 0x4($v1)
/* 4A0DC 800598DC 00000000 */  nop
/* 4A0E0 800598E0 07004714 */  bne        $v0, $a3, .L80059900
/* 4A0E4 800598E4 00000000 */   nop
/* 4A0E8 800598E8 0000628C */  lw         $v0, 0x0($v1)
/* 4A0EC 800598EC 00000000 */  nop
/* 4A0F0 800598F0 04004414 */  bne        $v0, $a0, .L80059904
/* 4A0F4 800598F4 0100A524 */   addiu     $a1, $a1, 0x1
/* 4A0F8 800598F8 44660108 */  j          .L80059910
/* 4A0FC 800598FC 21306000 */   addu      $a2, $v1, $zero
.L80059900:
/* 4A100 80059900 0100A524 */  addiu      $a1, $a1, 0x1
.L80059904:
/* 4A104 80059904 1000A228 */  slti       $v0, $a1, 0x10
/* 4A108 80059908 F3FF4014 */  bnez       $v0, .L800598D8
/* 4A10C 8005990C 40006324 */   addiu     $v1, $v1, 0x40
.L80059910:
/* 4A110 80059910 0800E003 */  jr         $ra
/* 4A114 80059914 2110C000 */   addu      $v0, $a2, $zero
.size STREAM_GetStreamUnitWithID, . - STREAM_GetStreamUnitWithID
