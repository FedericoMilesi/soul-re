.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SplineGetNearestPoint2
/* B540 8001AD40 90FFBD27 */  addiu      $sp, $sp, -0x70
/* B544 8001AD44 6C00BFAF */  sw         $ra, 0x6C($sp)
/* B548 8001AD48 6800BEAF */  sw         $fp, 0x68($sp)
/* B54C 8001AD4C 6400B7AF */  sw         $s7, 0x64($sp)
/* B550 8001AD50 6000B6AF */  sw         $s6, 0x60($sp)
/* B554 8001AD54 5C00B5AF */  sw         $s5, 0x5C($sp)
/* B558 8001AD58 5800B4AF */  sw         $s4, 0x58($sp)
/* B55C 8001AD5C 5400B3AF */  sw         $s3, 0x54($sp)
/* B560 8001AD60 5000B2AF */  sw         $s2, 0x50($sp)
/* B564 8001AD64 4C00B1AF */  sw         $s1, 0x4C($sp)
/* B568 8001AD68 4800B0AF */  sw         $s0, 0x48($sp)
/* B56C 8001AD6C 7000A4AF */  sw         $a0, 0x70($sp)
/* B570 8001AD70 7400A5AF */  sw         $a1, 0x74($sp)
/* B574 8001AD74 7800A6AF */  sw         $a2, 0x78($sp)
/* B578 8001AD78 7C00A7AF */  sw         $a3, 0x7C($sp)
/* B57C 8001AD7C 0000A88C */  lw         $t0, 0x0($a1)
/* B580 8001AD80 8000B58F */  lw         $s5, 0x80($sp)
/* B584 8001AD84 3800A8AF */  sw         $t0, 0x38($sp)
/* B588 8001AD88 00008294 */  lhu        $v0, 0x0($a0)
/* B58C 8001AD8C 02008394 */  lhu        $v1, 0x2($a0)
/* B590 8001AD90 04008494 */  lhu        $a0, 0x4($a0)
/* B594 8001AD94 0000A2A6 */  sh         $v0, 0x0($s5)
/* B598 8001AD98 0200A3A6 */  sh         $v1, 0x2($s5)
/* B59C 8001AD9C 0400A4A6 */  sh         $a0, 0x4($s5)
/* B5A0 8001ADA0 7000A98F */  lw         $t1, 0x70($sp)
/* B5A4 8001ADA4 7400A88F */  lw         $t0, 0x74($sp)
/* B5A8 8001ADA8 A8012985 */  lh         $t1, 0x1A8($t1)
/* B5AC 8001ADAC 00000000 */  nop
/* B5B0 8001ADB0 3C00A9AF */  sw         $t1, 0x3C($sp)
/* B5B4 8001ADB4 04000395 */  lhu        $v1, 0x4($t0)
/* B5B8 8001ADB8 04000285 */  lh         $v0, 0x4($t0)
/* B5BC 8001ADBC 21402001 */  addu       $t0, $t1, $zero
/* B5C0 8001ADC0 18002801 */  mult       $t1, $t0
/* B5C4 8001ADC4 FF7F1E3C */  lui        $fp, (0x7FFFFFFF >> 16)
/* B5C8 8001ADC8 FFFFDE37 */  ori        $fp, $fp, (0x7FFFFFFF & 0xFFFF)
/* B5CC 8001ADCC 21900000 */  addu       $s2, $zero, $zero
/* B5D0 8001ADD0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B5D4 8001ADD4 12400000 */  mflo       $t0
/* B5D8 8001ADD8 47004018 */  blez       $v0, .L8001AEF8
/* B5DC 8001ADDC 3C00A8AF */   sw        $t0, 0x3C($sp)
/* B5E0 8001ADE0 1800B727 */  addiu      $s7, $sp, 0x18
/* B5E4 8001ADE4 2000B627 */  addiu      $s6, $sp, 0x20
/* B5E8 8001ADE8 3800B48F */  lw         $s4, 0x38($sp)
/* B5EC 8001ADEC 2800A927 */  addiu      $t1, $sp, 0x28
/* B5F0 8001ADF0 4000A9AF */  sw         $t1, 0x40($sp)
.L8001ADF4:
/* B5F4 8001ADF4 38004006 */  bltz       $s2, .L8001AED8
/* B5F8 8001ADF8 00140300 */   sll       $v0, $v1, 16
/* B5FC 8001ADFC 03140200 */  sra        $v0, $v0, 16
/* B600 8001AE00 FEFF4224 */  addiu      $v0, $v0, -0x2
/* B604 8001AE04 2A105200 */  slt        $v0, $v0, $s2
/* B608 8001AE08 33004014 */  bnez       $v0, .L8001AED8
/* B60C 8001AE0C 02008226 */   addiu     $v0, $s4, 0x2
/* B610 8001AE10 2128E002 */  addu       $a1, $s7, $zero
/* B614 8001AE14 7000A88F */  lw         $t0, 0x70($sp)
/* B618 8001AE18 02008396 */  lhu        $v1, 0x2($s4)
/* B61C 8001AE1C 02004694 */  lhu        $a2, 0x2($v0)
/* B620 8001AE20 04004294 */  lhu        $v0, 0x4($v0)
/* B624 8001AE24 21880000 */  addu       $s1, $zero, $zero
/* B628 8001AE28 1800A3A7 */  sh         $v1, 0x18($sp)
/* B62C 8001AE2C 0400E2A6 */  sh         $v0, 0x4($s7)
/* B630 8001AE30 40111200 */  sll        $v0, $s2, 5
/* B634 8001AE34 0200E6A6 */  sh         $a2, 0x2($s7)
/* B638 8001AE38 3800A98F */  lw         $t1, 0x38($sp)
/* B63C 8001AE3C 20004224 */  addiu      $v0, $v0, 0x20
/* B640 8001AE40 21102201 */  addu       $v0, $t1, $v0
/* B644 8001AE44 02004324 */  addiu      $v1, $v0, 0x2
/* B648 8001AE48 02004294 */  lhu        $v0, 0x2($v0)
/* B64C 8001AE4C 02006694 */  lhu        $a2, 0x2($v1)
/* B650 8001AE50 04006394 */  lhu        $v1, 0x4($v1)
/* B654 8001AE54 AA010425 */  addiu      $a0, $t0, 0x1AA
/* B658 8001AE58 2000A2A7 */  sh         $v0, 0x20($sp)
/* B65C 8001AE5C 0200C6A6 */  sh         $a2, 0x2($s6)
/* B660 8001AE60 0400C3A6 */  sh         $v1, 0x4($s6)
/* B664 8001AE64 4000A88F */  lw         $t0, 0x40($sp)
/* B668 8001AE68 3C00A78F */  lw         $a3, 0x3C($sp)
/* B66C 8001AE6C 2130C002 */  addu       $a2, $s6, $zero
/* B670 8001AE70 DF6A000C */  jal        CAMERA_FindLinePoint
/* B674 8001AE74 1000A8AF */   sw        $t0, 0x10($sp)
/* B678 8001AE78 21984000 */  addu       $s3, $v0, $zero
/* B67C 8001AE7C 1600601A */  blez       $s3, .L8001AED8
/* B680 8001AE80 00000000 */   nop
/* B684 8001AE84 4000B08F */  lw         $s0, 0x40($sp)
.L8001AE88:
/* B688 8001AE88 7800A48F */  lw         $a0, 0x78($sp)
/* B68C 8001AE8C 406A000C */  jal        CAMERA_GetDistSq
/* B690 8001AE90 21280002 */   addu      $a1, $s0, $zero
/* B694 8001AE94 21284000 */  addu       $a1, $v0, $zero
/* B698 8001AE98 2A10BE00 */  slt        $v0, $a1, $fp
/* B69C 8001AE9C 0A004010 */  beqz       $v0, .L8001AEC8
/* B6A0 8001AEA0 00000000 */   nop
/* B6A4 8001AEA4 00000296 */  lhu        $v0, 0x0($s0)
/* B6A8 8001AEA8 02000396 */  lhu        $v1, 0x2($s0)
/* B6AC 8001AEAC 04000496 */  lhu        $a0, 0x4($s0)
/* B6B0 8001AEB0 0000A2A6 */  sh         $v0, 0x0($s5)
/* B6B4 8001AEB4 0200A3A6 */  sh         $v1, 0x2($s5)
/* B6B8 8001AEB8 0400A4A6 */  sh         $a0, 0x4($s5)
/* B6BC 8001AEBC 7C00A98F */  lw         $t1, 0x7C($sp)
/* B6C0 8001AEC0 21F0A000 */  addu       $fp, $a1, $zero
/* B6C4 8001AEC4 000032AD */  sw         $s2, 0x0($t1)
.L8001AEC8:
/* B6C8 8001AEC8 01003126 */  addiu      $s1, $s1, 0x1
/* B6CC 8001AECC 2A103302 */  slt        $v0, $s1, $s3
/* B6D0 8001AED0 EDFF4014 */  bnez       $v0, .L8001AE88
/* B6D4 8001AED4 08001026 */   addiu     $s0, $s0, 0x8
.L8001AED8:
/* B6D8 8001AED8 7400A88F */  lw         $t0, 0x74($sp)
/* B6DC 8001AEDC 01005226 */  addiu      $s2, $s2, 0x1
/* B6E0 8001AEE0 04000285 */  lh         $v0, 0x4($t0)
/* B6E4 8001AEE4 04000395 */  lhu        $v1, 0x4($t0)
/* B6E8 8001AEE8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B6EC 8001AEEC 2A104202 */  slt        $v0, $s2, $v0
/* B6F0 8001AEF0 C0FF4014 */  bnez       $v0, .L8001ADF4
/* B6F4 8001AEF4 20009426 */   addiu     $s4, $s4, 0x20
.L8001AEF8:
/* B6F8 8001AEF8 6C00BF8F */  lw         $ra, 0x6C($sp)
/* B6FC 8001AEFC 6800BE8F */  lw         $fp, 0x68($sp)
/* B700 8001AF00 6400B78F */  lw         $s7, 0x64($sp)
/* B704 8001AF04 6000B68F */  lw         $s6, 0x60($sp)
/* B708 8001AF08 5C00B58F */  lw         $s5, 0x5C($sp)
/* B70C 8001AF0C 5800B48F */  lw         $s4, 0x58($sp)
/* B710 8001AF10 5400B38F */  lw         $s3, 0x54($sp)
/* B714 8001AF14 5000B28F */  lw         $s2, 0x50($sp)
/* B718 8001AF18 4C00B18F */  lw         $s1, 0x4C($sp)
/* B71C 8001AF1C 4800B08F */  lw         $s0, 0x48($sp)
/* B720 8001AF20 0800E003 */  jr         $ra
/* B724 8001AF24 7000BD27 */   addiu     $sp, $sp, 0x70
.size CAMERA_SplineGetNearestPoint2, . - CAMERA_SplineGetNearestPoint2
