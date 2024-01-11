.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SLUAGH_Init
/* 7DC90 8008D490 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 7DC94 8008D494 3000B2AF */  sw         $s2, 0x30($sp)
/* 7DC98 8008D498 21908000 */  addu       $s2, $a0, $zero
/* 7DC9C 8008D49C 3400BFAF */  sw         $ra, 0x34($sp)
/* 7DCA0 8008D4A0 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 7DCA4 8008D4A4 2800B0AF */  sw         $s0, 0x28($sp)
/* 7DCA8 8008D4A8 6C01508E */  lw         $s0, 0x16C($s2)
/* 7DCAC 8008D4AC 00000000 */  nop
/* 7DCB0 8008D4B0 44010486 */  lh         $a0, 0x144($s0)
/* 7DCB4 8008D4B4 2400518E */  lw         $s1, 0x24($s2)
/* 7DCB8 8008D4B8 02008104 */  bgez       $a0, .L8008D4C4
/* 7DCBC 8008D4BC 00000000 */   nop
/* 7DCC0 8008D4C0 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8008D4C4:
/* 7DCC4 8008D4C4 3434010C */  jal        FX_GetHealthColor
/* 7DCC8 8008D4C8 03230400 */   sra       $a0, $a0, 12
/* 7DCCC 8008D4CC 21204002 */  addu       $a0, $s2, $zero
/* 7DCD0 8008D4D0 2000A2AF */  sw         $v0, 0x20($sp)
/* 7DCD4 8008D4D4 19002592 */  lbu        $a1, 0x19($s1)
/* 7DCD8 8008D4D8 B0040224 */  addiu      $v0, $zero, 0x4B0
/* 7DCDC 8008D4DC 1000A2AF */  sw         $v0, 0x10($sp)
/* 7DCE0 8008D4E0 68000224 */  addiu      $v0, $zero, 0x68
/* 7DCE4 8008D4E4 1400A2AF */  sw         $v0, 0x14($sp)
/* 7DCE8 8008D4E8 70000224 */  addiu      $v0, $zero, 0x70
/* 7DCEC 8008D4EC 2000A627 */  addiu      $a2, $sp, 0x20
/* 7DCF0 8008D4F0 01000724 */  addiu      $a3, $zero, 0x1
/* 7DCF4 8008D4F4 462D010C */  jal        FX_DoInstanceOneSegmentGlow
/* 7DCF8 8008D4F8 1800A2AF */   sw        $v0, 0x18($sp)
/* 7DCFC 8008D4FC 21204002 */  addu       $a0, $s2, $zero
/* 7DD00 8008D500 3933020C */  jal        MON_DefaultInit
/* 7DD04 8008D504 DC0002AE */   sw        $v0, 0xDC($s0)
/* 7DD08 8008D508 0002053C */  lui        $a1, (0x2002000 >> 16)
/* 7DD0C 8008D50C 0020A534 */  ori        $a1, $a1, (0x2002000 & 0xFFFF)
/* 7DD10 8008D510 00200224 */  addiu      $v0, $zero, 0x2000
/* 7DD14 8008D514 FEFF0424 */  addiu      $a0, $zero, -0x2
/* 7DD18 8008D518 480102A6 */  sh         $v0, 0x148($s0)
/* 7DD1C 8008D51C 0400028E */  lw         $v0, 0x4($s0)
/* 7DD20 8008D520 0000038E */  lw         $v1, 0x0($s0)
/* 7DD24 8008D524 24104400 */  and        $v0, $v0, $a0
/* 7DD28 8008D528 25186500 */  or         $v1, $v1, $a1
/* 7DD2C 8008D52C 040002AE */  sw         $v0, 0x4($s0)
/* 7DD30 8008D530 000003AE */  sw         $v1, 0x0($s0)
/* 7DD34 8008D534 3400BF8F */  lw         $ra, 0x34($sp)
/* 7DD38 8008D538 3000B28F */  lw         $s2, 0x30($sp)
/* 7DD3C 8008D53C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 7DD40 8008D540 2800B08F */  lw         $s0, 0x28($sp)
/* 7DD44 8008D544 0800E003 */  jr         $ra
/* 7DD48 8008D548 3800BD27 */   addiu     $sp, $sp, 0x38
.size SLUAGH_Init, . - SLUAGH_Init
