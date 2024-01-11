.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_LengthXYZ
/* 2A2DC 80039ADC 02008104 */  bgez       $a0, .L80039AE8
/* 2A2E0 80039AE0 00000000 */   nop
/* 2A2E4 80039AE4 23200400 */  negu       $a0, $a0
.L80039AE8:
/* 2A2E8 80039AE8 0200A104 */  bgez       $a1, .L80039AF4
/* 2A2EC 80039AEC 00000000 */   nop
/* 2A2F0 80039AF0 23280500 */  negu       $a1, $a1
.L80039AF4:
/* 2A2F4 80039AF4 0200C104 */  bgez       $a2, .L80039B00
/* 2A2F8 80039AF8 00000000 */   nop
/* 2A2FC 80039AFC 23300600 */  negu       $a2, $a2
.L80039B00:
/* 2A300 80039B00 2A108500 */  slt        $v0, $a0, $a1
/* 2A304 80039B04 0B004010 */  beqz       $v0, .L80039B34
/* 2A308 80039B08 2A10C400 */   slt       $v0, $a2, $a0
/* 2A30C 80039B0C 04004010 */  beqz       $v0, .L80039B20
/* 2A310 80039B10 21108000 */   addu      $v0, $a0, $zero
/* 2A314 80039B14 2120C000 */  addu       $a0, $a2, $zero
/* 2A318 80039B18 DBE60008 */  j          .L80039B6C
/* 2A31C 80039B1C 2130A000 */   addu      $a2, $a1, $zero
.L80039B20:
/* 2A320 80039B20 2A10C500 */  slt        $v0, $a2, $a1
/* 2A324 80039B24 12004010 */  beqz       $v0, .L80039B70
/* 2A328 80039B28 2110A000 */   addu      $v0, $a1, $zero
/* 2A32C 80039B2C D8E60008 */  j          .L80039B60
/* 2A330 80039B30 2128C000 */   addu      $a1, $a2, $zero
.L80039B34:
/* 2A334 80039B34 2A10C500 */  slt        $v0, $a2, $a1
/* 2A338 80039B38 04004010 */  beqz       $v0, .L80039B4C
/* 2A33C 80039B3C 21108000 */   addu      $v0, $a0, $zero
/* 2A340 80039B40 2120C000 */  addu       $a0, $a2, $zero
/* 2A344 80039B44 DCE60008 */  j          .L80039B70
/* 2A348 80039B48 21304000 */   addu      $a2, $v0, $zero
.L80039B4C:
/* 2A34C 80039B4C 2A10C400 */  slt        $v0, $a2, $a0
/* 2A350 80039B50 05004010 */  beqz       $v0, .L80039B68
/* 2A354 80039B54 21108000 */   addu      $v0, $a0, $zero
/* 2A358 80039B58 2120A000 */  addu       $a0, $a1, $zero
/* 2A35C 80039B5C 2128C000 */  addu       $a1, $a2, $zero
.L80039B60:
/* 2A360 80039B60 DCE60008 */  j          .L80039B70
/* 2A364 80039B64 21304000 */   addu      $a2, $v0, $zero
.L80039B68:
/* 2A368 80039B68 2120A000 */  addu       $a0, $a1, $zero
.L80039B6C:
/* 2A36C 80039B6C 21284000 */  addu       $a1, $v0, $zero
.L80039B70:
/* 2A370 80039B70 00110600 */  sll        $v0, $a2, 4
/* 2A374 80039B74 23104600 */  subu       $v0, $v0, $a2
/* 2A378 80039B78 40100200 */  sll        $v0, $v0, 1
/* 2A37C 80039B7C 40180500 */  sll        $v1, $a1, 1
/* 2A380 80039B80 21186500 */  addu       $v1, $v1, $a1
/* 2A384 80039B84 80180300 */  sll        $v1, $v1, 2
/* 2A388 80039B88 21104300 */  addu       $v0, $v0, $v1
/* 2A38C 80039B8C C0180400 */  sll        $v1, $a0, 3
/* 2A390 80039B90 21186400 */  addu       $v1, $v1, $a0
/* 2A394 80039B94 21104300 */  addu       $v0, $v0, $v1
/* 2A398 80039B98 02004104 */  bgez       $v0, .L80039BA4
/* 2A39C 80039B9C 00000000 */   nop
/* 2A3A0 80039BA0 1F004224 */  addiu      $v0, $v0, 0x1F
.L80039BA4:
/* 2A3A4 80039BA4 0800E003 */  jr         $ra
/* 2A3A8 80039BA8 43110200 */   sra       $v0, $v0, 5
.size MATH3D_LengthXYZ, . - MATH3D_LengthXYZ
