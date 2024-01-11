.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_SoulReaverWinding
/* 3B434 8004AC34 68FFBD27 */  addiu      $sp, $sp, -0x98
/* 3B438 8004AC38 9400BFAF */  sw         $ra, 0x94($sp)
/* 3B43C 8004AC3C 9000BEAF */  sw         $fp, 0x90($sp)
/* 3B440 8004AC40 8C00B7AF */  sw         $s7, 0x8C($sp)
/* 3B444 8004AC44 8800B6AF */  sw         $s6, 0x88($sp)
/* 3B448 8004AC48 8400B5AF */  sw         $s5, 0x84($sp)
/* 3B44C 8004AC4C 8000B4AF */  sw         $s4, 0x80($sp)
/* 3B450 8004AC50 7C00B3AF */  sw         $s3, 0x7C($sp)
/* 3B454 8004AC54 7800B2AF */  sw         $s2, 0x78($sp)
/* 3B458 8004AC58 7400B1AF */  sw         $s1, 0x74($sp)
/* 3B45C 8004AC5C 7000B0AF */  sw         $s0, 0x70($sp)
/* 3B460 8004AC60 9800A4AF */  sw         $a0, 0x98($sp)
/* 3B464 8004AC64 A000A6AF */  sw         $a2, 0xA0($sp)
/* 3B468 8004AC68 A400A7AF */  sw         $a3, 0xA4($sp)
/* 3B46C 8004AC6C 6C01948C */  lw         $s4, 0x16C($a0)
/* 3B470 8004AC70 00000000 */  nop
/* 3B474 8004AC74 00008292 */  lbu        $v0, 0x0($s4)
/* 3B478 8004AC78 00000000 */  nop
/* 3B47C 8004AC7C 75004010 */  beqz       $v0, .L8004AE54
/* 3B480 8004AC80 00000000 */   nop
/* 3B484 8004AC84 01008292 */  lbu        $v0, 0x1($s4)
/* 3B488 8004AC88 00000000 */  nop
/* 3B48C 8004AC8C 71004010 */  beqz       $v0, .L8004AE54
/* 3B490 8004AC90 2120E000 */   addu      $a0, $a3, $zero
/* 3B494 8004AC94 3800A627 */  addiu      $a2, $sp, 0x38
/* 3B498 8004AC98 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 3B49C 8004AC9C 06009096 */  lhu        $s0, 0x6($s4)
/* 3B4A0 8004ACA0 4000458C */  lw         $a1, 0x40($v0)
/* 3B4A4 8004ACA4 23801000 */  negu       $s0, $s0
/* 3B4A8 8004ACA8 59FD020C */  jal        CompMatrix
/* 3B4AC 8004ACAC 0005A524 */   addiu     $a1, $a1, 0x500
/* 3B4B0 8004ACB0 3800A627 */  addiu      $a2, $sp, 0x38
/* 3B4B4 8004ACB4 00841000 */  sll        $s0, $s0, 16
/* 3B4B8 8004ACB8 03F41000 */  sra        $fp, $s0, 16
/* 3B4BC 8004ACBC 2138C003 */  addu       $a3, $fp, $zero
/* 3B4C0 8004ACC0 80FF0224 */  addiu      $v0, $zero, -0x80
/* 3B4C4 8004ACC4 5800B727 */  addiu      $s7, $sp, 0x58
/* 3B4C8 8004ACC8 6000B627 */  addiu      $s6, $sp, 0x60
/* 3B4CC 8004ACCC 1E001324 */  addiu      $s3, $zero, 0x1E
/* 3B4D0 8004ACD0 0A001224 */  addiu      $s2, $zero, 0xA
/* 3B4D4 8004ACD4 A400A48F */  lw         $a0, 0xA4($sp)
/* 3B4D8 8004ACD8 A000A58F */  lw         $a1, 0xA0($sp)
/* 3B4DC 8004ACDC 10001124 */  addiu      $s1, $zero, 0x10
/* 3B4E0 8004ACE0 5C00A0A7 */  sh         $zero, 0x5C($sp)
/* 3B4E4 8004ACE4 5A00A0A7 */  sh         $zero, 0x5A($sp)
/* 3B4E8 8004ACE8 5800A0A7 */  sh         $zero, 0x58($sp)
/* 3B4EC 8004ACEC 6200A0A7 */  sh         $zero, 0x62($sp)
/* 3B4F0 8004ACF0 6000A0A7 */  sh         $zero, 0x60($sp)
/* 3B4F4 8004ACF4 6400A2A7 */  sh         $v0, 0x64($sp)
/* 3B4F8 8004ACF8 1400958E */  lw         $s5, 0x14($s4)
/* 3B4FC 8004ACFC 1800888E */  lw         $t0, 0x18($s4)
/* 3B500 8004AD00 20001024 */  addiu      $s0, $zero, 0x20
/* 3B504 8004AD04 1000B7AF */  sw         $s7, 0x10($sp)
/* 3B508 8004AD08 1400B6AF */  sw         $s6, 0x14($sp)
/* 3B50C 8004AD0C 1800B3AF */  sw         $s3, 0x18($sp)
/* 3B510 8004AD10 1C00B2AF */  sw         $s2, 0x1C($sp)
/* 3B514 8004AD14 2000B1AF */  sw         $s1, 0x20($sp)
/* 3B518 8004AD18 2400B0AF */  sw         $s0, 0x24($sp)
/* 3B51C 8004AD1C 2800A0AF */  sw         $zero, 0x28($sp)
/* 3B520 8004AD20 6800A8AF */  sw         $t0, 0x68($sp)
/* 3B524 8004AD24 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 3B528 8004AD28 3B3C010C */  jal        FX_Lightning
/* 3B52C 8004AD2C 3000A8AF */   sw        $t0, 0x30($sp)
/* 3B530 8004AD30 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 3B534 8004AD34 3800A627 */  addiu      $a2, $sp, 0x38
/* 3B538 8004AD38 4000458C */  lw         $a1, 0x40($v0)
/* 3B53C 8004AD3C A400A48F */  lw         $a0, 0xA4($sp)
/* 3B540 8004AD40 59FD020C */  jal        CompMatrix
/* 3B544 8004AD44 E004A524 */   addiu     $a1, $a1, 0x4E0
/* 3B548 8004AD48 3800A627 */  addiu      $a2, $sp, 0x38
/* 3B54C 8004AD4C 2138C003 */  addu       $a3, $fp, $zero
/* 3B550 8004AD50 A400A48F */  lw         $a0, 0xA4($sp)
/* 3B554 8004AD54 A000A58F */  lw         $a1, 0xA0($sp)
/* 3B558 8004AD58 6800A88F */  lw         $t0, 0x68($sp)
/* 3B55C 8004AD5C A0FF0224 */  addiu      $v0, $zero, -0x60
/* 3B560 8004AD60 6400A2A7 */  sh         $v0, 0x64($sp)
/* 3B564 8004AD64 1000B7AF */  sw         $s7, 0x10($sp)
/* 3B568 8004AD68 1400B6AF */  sw         $s6, 0x14($sp)
/* 3B56C 8004AD6C 1800B3AF */  sw         $s3, 0x18($sp)
/* 3B570 8004AD70 1C00B2AF */  sw         $s2, 0x1C($sp)
/* 3B574 8004AD74 2000B1AF */  sw         $s1, 0x20($sp)
/* 3B578 8004AD78 2400B0AF */  sw         $s0, 0x24($sp)
/* 3B57C 8004AD7C 2800A0AF */  sw         $zero, 0x28($sp)
/* 3B580 8004AD80 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 3B584 8004AD84 3B3C010C */  jal        FX_Lightning
/* 3B588 8004AD88 3000A8AF */   sw        $t0, 0x30($sp)
/* 3B58C 8004AD8C 02008386 */  lh         $v1, 0x2($s4)
/* 3B590 8004AD90 1C008286 */  lh         $v0, 0x1C($s4)
/* 3B594 8004AD94 00000000 */  nop
/* 3B598 8004AD98 18006200 */  mult       $v1, $v0
/* 3B59C 8004AD9C 9800A88F */  lw         $t0, 0x98($sp)
/* 3B5A0 8004ADA0 00000000 */  nop
/* 3B5A4 8004ADA4 4000028D */  lw         $v0, 0x40($t0)
/* 3B5A8 8004ADA8 12180000 */  mflo       $v1
/* 3B5AC 8004ADAC 02006104 */  bgez       $v1, .L8004ADB8
/* 3B5B0 8004ADB0 21285000 */   addu      $a1, $v0, $s0
/* 3B5B4 8004ADB4 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004ADB8:
/* 3B5B8 8004ADB8 031B0300 */  sra        $v1, $v1, 12
/* 3B5BC 8004ADBC 40100300 */  sll        $v0, $v1, 1
/* 3B5C0 8004ADC0 21104300 */  addu       $v0, $v0, $v1
/* 3B5C4 8004ADC4 40110200 */  sll        $v0, $v0, 5
/* 3B5C8 8004ADC8 23104300 */  subu       $v0, $v0, $v1
/* 3B5CC 8004ADCC 80100200 */  sll        $v0, $v0, 2
/* 3B5D0 8004ADD0 23100200 */  negu       $v0, $v0
/* 3B5D4 8004ADD4 02004104 */  bgez       $v0, .L8004ADE0
/* 3B5D8 8004ADD8 00000000 */   nop
/* 3B5DC 8004ADDC FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004ADE0:
/* 3B5E0 8004ADE0 03130200 */  sra        $v0, $v0, 12
/* 3B5E4 8004ADE4 6400A2A7 */  sh         $v0, 0x64($sp)
/* 3B5E8 8004ADE8 04008386 */  lh         $v1, 0x4($s4)
/* 3B5EC 8004ADEC 01000224 */  addiu      $v0, $zero, 0x1
/* 3B5F0 8004ADF0 03006214 */  bne        $v1, $v0, .L8004AE00
/* 3B5F4 8004ADF4 00000000 */   nop
/* 3B5F8 8004ADF8 FC00153C */  lui        $s5, (0xFCFFD3 >> 16)
/* 3B5FC 8004ADFC D3FFB536 */  ori        $s5, $s5, (0xFCFFD3 & 0xFFFF)
.L8004AE00:
/* 3B600 8004AE00 A400A48F */  lw         $a0, 0xA4($sp)
/* 3B604 8004AE04 59FD020C */  jal        CompMatrix
/* 3B608 8004AE08 3800A627 */   addiu     $a2, $sp, 0x38
/* 3B60C 8004AE0C 3800A627 */  addiu      $a2, $sp, 0x38
/* 3B610 8004AE10 2138C003 */  addu       $a3, $fp, $zero
/* 3B614 8004AE14 A400A48F */  lw         $a0, 0xA4($sp)
/* 3B618 8004AE18 A000A58F */  lw         $a1, 0xA0($sp)
/* 3B61C 8004AE1C 6800A88F */  lw         $t0, 0x68($sp)
/* 3B620 8004AE20 19000224 */  addiu      $v0, $zero, 0x19
/* 3B624 8004AE24 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3B628 8004AE28 04000224 */  addiu      $v0, $zero, 0x4
/* 3B62C 8004AE2C 2000A2AF */  sw         $v0, 0x20($sp)
/* 3B630 8004AE30 08000224 */  addiu      $v0, $zero, 0x8
/* 3B634 8004AE34 1000B7AF */  sw         $s7, 0x10($sp)
/* 3B638 8004AE38 1400B6AF */  sw         $s6, 0x14($sp)
/* 3B63C 8004AE3C 1800A0AF */  sw         $zero, 0x18($sp)
/* 3B640 8004AE40 2400A2AF */  sw         $v0, 0x24($sp)
/* 3B644 8004AE44 2800A0AF */  sw         $zero, 0x28($sp)
/* 3B648 8004AE48 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 3B64C 8004AE4C 3B3C010C */  jal        FX_Lightning
/* 3B650 8004AE50 3000A8AF */   sw        $t0, 0x30($sp)
.L8004AE54:
/* 3B654 8004AE54 9400BF8F */  lw         $ra, 0x94($sp)
/* 3B658 8004AE58 9000BE8F */  lw         $fp, 0x90($sp)
/* 3B65C 8004AE5C 8C00B78F */  lw         $s7, 0x8C($sp)
/* 3B660 8004AE60 8800B68F */  lw         $s6, 0x88($sp)
/* 3B664 8004AE64 8400B58F */  lw         $s5, 0x84($sp)
/* 3B668 8004AE68 8000B48F */  lw         $s4, 0x80($sp)
/* 3B66C 8004AE6C 7C00B38F */  lw         $s3, 0x7C($sp)
/* 3B670 8004AE70 7800B28F */  lw         $s2, 0x78($sp)
/* 3B674 8004AE74 7400B18F */  lw         $s1, 0x74($sp)
/* 3B678 8004AE78 7000B08F */  lw         $s0, 0x70($sp)
/* 3B67C 8004AE7C 0800E003 */  jr         $ra
/* 3B680 8004AE80 9800BD27 */   addiu     $sp, $sp, 0x98
.size FX_SoulReaverWinding, . - FX_SoulReaverWinding
