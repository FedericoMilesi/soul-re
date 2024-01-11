.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_AdjustMultiSpline
/* 4C978 8005C178 21388000 */  addu       $a3, $a0, $zero
/* 4C97C 8005C17C 0000E48C */  lw         $a0, 0x0($a3)
/* 4C980 8005C180 00000000 */  nop
/* 4C984 8005C184 26008010 */  beqz       $a0, .L8005C220
/* 4C988 8005C188 2140A000 */   addu      $t0, $a1, $zero
/* 4C98C 8005C18C 04008284 */  lh         $v0, 0x4($a0)
/* 4C990 8005C190 00000000 */  nop
/* 4C994 8005C194 22004018 */  blez       $v0, .L8005C220
/* 4C998 8005C198 21300000 */   addu      $a2, $zero, $zero
/* 4C99C 8005C19C 40290600 */  sll        $a1, $a2, 5
.L8005C1A0:
/* 4C9A0 8005C1A0 0000848C */  lw         $a0, 0x0($a0)
/* 4C9A4 8005C1A4 00000395 */  lhu        $v1, 0x0($t0)
/* 4C9A8 8005C1A8 2120A400 */  addu       $a0, $a1, $a0
/* 4C9AC 8005C1AC 02008294 */  lhu        $v0, 0x2($a0)
/* 4C9B0 8005C1B0 00000000 */  nop
/* 4C9B4 8005C1B4 21104300 */  addu       $v0, $v0, $v1
/* 4C9B8 8005C1B8 020082A4 */  sh         $v0, 0x2($a0)
/* 4C9BC 8005C1BC 0000E28C */  lw         $v0, 0x0($a3)
/* 4C9C0 8005C1C0 00000000 */  nop
/* 4C9C4 8005C1C4 0000448C */  lw         $a0, 0x0($v0)
/* 4C9C8 8005C1C8 02000395 */  lhu        $v1, 0x2($t0)
/* 4C9CC 8005C1CC 2120A400 */  addu       $a0, $a1, $a0
/* 4C9D0 8005C1D0 04008294 */  lhu        $v0, 0x4($a0)
/* 4C9D4 8005C1D4 00000000 */  nop
/* 4C9D8 8005C1D8 21104300 */  addu       $v0, $v0, $v1
/* 4C9DC 8005C1DC 040082A4 */  sh         $v0, 0x4($a0)
/* 4C9E0 8005C1E0 0000E28C */  lw         $v0, 0x0($a3)
/* 4C9E4 8005C1E4 00000000 */  nop
/* 4C9E8 8005C1E8 0000428C */  lw         $v0, 0x0($v0)
/* 4C9EC 8005C1EC 04000395 */  lhu        $v1, 0x4($t0)
/* 4C9F0 8005C1F0 2128A200 */  addu       $a1, $a1, $v0
/* 4C9F4 8005C1F4 0600A294 */  lhu        $v0, 0x6($a1)
/* 4C9F8 8005C1F8 00000000 */  nop
/* 4C9FC 8005C1FC 21104300 */  addu       $v0, $v0, $v1
/* 4CA00 8005C200 0600A2A4 */  sh         $v0, 0x6($a1)
/* 4CA04 8005C204 0000E48C */  lw         $a0, 0x0($a3)
/* 4CA08 8005C208 00000000 */  nop
/* 4CA0C 8005C20C 04008284 */  lh         $v0, 0x4($a0)
/* 4CA10 8005C210 0100C624 */  addiu      $a2, $a2, 0x1
/* 4CA14 8005C214 2A10C200 */  slt        $v0, $a2, $v0
/* 4CA18 8005C218 E1FF4014 */  bnez       $v0, .L8005C1A0
/* 4CA1C 8005C21C 40290600 */   sll       $a1, $a2, 5
.L8005C220:
/* 4CA20 8005C220 0800E003 */  jr         $ra
/* 4CA24 8005C224 00000000 */   nop
.size STREAM_AdjustMultiSpline, . - STREAM_AdjustMultiSpline
