.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateSwitchStateCharacterDataDefault
/* 6328C 80072A8C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 63290 80072A90 1400B1AF */  sw         $s1, 0x14($sp)
/* 63294 80072A94 21888000 */  addu       $s1, $a0, $zero
/* 63298 80072A98 1800B2AF */  sw         $s2, 0x18($sp)
/* 6329C 80072A9C 2190A000 */  addu       $s2, $a1, $zero
/* 632A0 80072AA0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 632A4 80072AA4 2198C000 */  addu       $s3, $a2, $zero
/* 632A8 80072AA8 2000BFAF */  sw         $ra, 0x20($sp)
/* 632AC 80072AAC 1000B0AF */  sw         $s0, 0x10($sp)
/* 632B0 80072AB0 0400228E */  lw         $v0, 0x4($s1)
/* 632B4 80072AB4 00000000 */  nop
/* 632B8 80072AB8 0B004018 */  blez       $v0, .L80072AE8
/* 632BC 80072ABC 21800000 */   addu      $s0, $zero, $zero
/* 632C0 80072AC0 21202002 */  addu       $a0, $s1, $zero
.L80072AC4:
/* 632C4 80072AC4 21280002 */  addu       $a1, $s0, $zero
/* 632C8 80072AC8 21304002 */  addu       $a2, $s2, $zero
/* 632CC 80072ACC 89CA010C */  jal        StateSwitchStateDataDefault
/* 632D0 80072AD0 21386002 */   addu      $a3, $s3, $zero
/* 632D4 80072AD4 0400228E */  lw         $v0, 0x4($s1)
/* 632D8 80072AD8 01001026 */  addiu      $s0, $s0, 0x1
/* 632DC 80072ADC 2A100202 */  slt        $v0, $s0, $v0
/* 632E0 80072AE0 F8FF4014 */  bnez       $v0, .L80072AC4
/* 632E4 80072AE4 21202002 */   addu      $a0, $s1, $zero
.L80072AE8:
/* 632E8 80072AE8 2000BF8F */  lw         $ra, 0x20($sp)
/* 632EC 80072AEC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 632F0 80072AF0 1800B28F */  lw         $s2, 0x18($sp)
/* 632F4 80072AF4 1400B18F */  lw         $s1, 0x14($sp)
/* 632F8 80072AF8 1000B08F */  lw         $s0, 0x10($sp)
/* 632FC 80072AFC 0800E003 */  jr         $ra
/* 63300 80072B00 2800BD27 */   addiu     $sp, $sp, 0x28
.size StateSwitchStateCharacterDataDefault, . - StateSwitchStateCharacterDataDefault
