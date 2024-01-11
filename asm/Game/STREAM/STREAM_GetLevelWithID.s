.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_GetLevelWithID
/* 4A070 80059870 21300000 */  addu       $a2, $zero, $zero
/* 4A074 80059874 2128C000 */  addu       $a1, $a2, $zero
/* 4A078 80059878 02000724 */  addiu      $a3, $zero, 0x2
/* 4A07C 8005987C 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L80059880:
/* 4A080 80059880 04006284 */  lh         $v0, 0x4($v1)
/* 4A084 80059884 00000000 */  nop
/* 4A088 80059888 08004714 */  bne        $v0, $a3, .L800598AC
/* 4A08C 8005988C 00000000 */   nop
/* 4A090 80059890 0000628C */  lw         $v0, 0x0($v1)
/* 4A094 80059894 00000000 */  nop
/* 4A098 80059898 05004414 */  bne        $v0, $a0, .L800598B0
/* 4A09C 8005989C 0100A524 */   addiu     $a1, $a1, 0x1
/* 4A0A0 800598A0 0800668C */  lw         $a2, 0x8($v1)
/* 4A0A4 800598A4 0800E003 */  jr         $ra
/* 4A0A8 800598A8 2110C000 */   addu      $v0, $a2, $zero
.L800598AC:
/* 4A0AC 800598AC 0100A524 */  addiu      $a1, $a1, 0x1
.L800598B0:
/* 4A0B0 800598B0 1000A228 */  slti       $v0, $a1, 0x10
/* 4A0B4 800598B4 F2FF4014 */  bnez       $v0, .L80059880
/* 4A0B8 800598B8 40006324 */   addiu     $v1, $v1, 0x40
/* 4A0BC 800598BC 2110C000 */  addu       $v0, $a2, $zero
/* 4A0C0 800598C0 0800E003 */  jr         $ra
/* 4A0C4 800598C4 00000000 */   nop
.size STREAM_GetLevelWithID, . - STREAM_GetLevelWithID
