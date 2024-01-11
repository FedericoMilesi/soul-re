.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_Init
/* 7F28C 8008EA8C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 7F290 8008EA90 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 7F294 8008EA94 21888000 */  addu       $s1, $a0, $zero
/* 7F298 8008EA98 3000BFAF */  sw         $ra, 0x30($sp)
/* 7F29C 8008EA9C 2800B0AF */  sw         $s0, 0x28($sp)
/* 7F2A0 8008EAA0 6C01308E */  lw         $s0, 0x16C($s1)
/* 7F2A4 8008EAA4 00000000 */  nop
/* 7F2A8 8008EAA8 44010486 */  lh         $a0, 0x144($s0)
/* 7F2AC 8008EAAC 00000000 */  nop
/* 7F2B0 8008EAB0 02008104 */  bgez       $a0, .L8008EABC
/* 7F2B4 8008EAB4 00000000 */   nop
/* 7F2B8 8008EAB8 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8008EABC:
/* 7F2BC 8008EABC 3434010C */  jal        FX_GetHealthColor
/* 7F2C0 8008EAC0 03230400 */   sra       $a0, $a0, 12
/* 7F2C4 8008EAC4 21202002 */  addu       $a0, $s1, $zero
/* 7F2C8 8008EAC8 2000A2AF */  sw         $v0, 0x20($sp)
/* 7F2CC 8008EACC 01000224 */  addiu      $v0, $zero, 0x1
/* 7F2D0 8008EAD0 1000A2AF */  sw         $v0, 0x10($sp)
/* 7F2D4 8008EAD4 B0040224 */  addiu      $v0, $zero, 0x4B0
/* 7F2D8 8008EAD8 1400A2AF */  sw         $v0, 0x14($sp)
/* 7F2DC 8008EADC 9C000224 */  addiu      $v0, $zero, 0x9C
/* 7F2E0 8008EAE0 15000524 */  addiu      $a1, $zero, 0x15
/* 7F2E4 8008EAE4 17000624 */  addiu      $a2, $zero, 0x17
/* 7F2E8 8008EAE8 2000A727 */  addiu      $a3, $sp, 0x20
/* 7F2EC 8008EAEC A52D010C */  jal        FX_DoInstanceTwoSegmentGlow
/* 7F2F0 8008EAF0 1800A2AF */   sw        $v0, 0x18($sp)
/* 7F2F4 8008EAF4 21202002 */  addu       $a0, $s1, $zero
/* 7F2F8 8008EAF8 3933020C */  jal        MON_DefaultInit
/* 7F2FC 8008EAFC DC0002AE */   sw        $v0, 0xDC($s0)
/* 7F300 8008EB00 0010053C */  lui        $a1, (0x10002800 >> 16)
/* 7F304 8008EB04 0028A534 */  ori        $a1, $a1, (0x10002800 & 0xFFFF)
/* 7F308 8008EB08 00300224 */  addiu      $v0, $zero, 0x3000
/* 7F30C 8008EB0C FEFF0424 */  addiu      $a0, $zero, -0x2
/* 7F310 8008EB10 480102A6 */  sh         $v0, 0x148($s0)
/* 7F314 8008EB14 0400028E */  lw         $v0, 0x4($s0)
/* 7F318 8008EB18 0000038E */  lw         $v1, 0x0($s0)
/* 7F31C 8008EB1C 24104400 */  and        $v0, $v0, $a0
/* 7F320 8008EB20 25186500 */  or         $v1, $v1, $a1
/* 7F324 8008EB24 040002AE */  sw         $v0, 0x4($s0)
/* 7F328 8008EB28 000003AE */  sw         $v1, 0x0($s0)
/* 7F32C 8008EB2C 3000BF8F */  lw         $ra, 0x30($sp)
/* 7F330 8008EB30 2C00B18F */  lw         $s1, 0x2C($sp)
/* 7F334 8008EB34 2800B08F */  lw         $s0, 0x28($sp)
/* 7F338 8008EB38 0800E003 */  jr         $ra
/* 7F33C 8008EB3C 3800BD27 */   addiu     $sp, $sp, 0x38
.size VWRAITH_Init, . - VWRAITH_Init
