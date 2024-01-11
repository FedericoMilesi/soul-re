.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetActionPlayHostAnimationData
/* 622B8 80071AB8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 622BC 80071ABC 1000B0AF */  sw         $s0, 0x10($sp)
/* 622C0 80071AC0 4000B08F */  lw         $s0, 0x40($sp)
/* 622C4 80071AC4 1800B2AF */  sw         $s2, 0x18($sp)
/* 622C8 80071AC8 21908000 */  addu       $s2, $a0, $zero
/* 622CC 80071ACC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 622D0 80071AD0 2198A000 */  addu       $s3, $a1, $zero
/* 622D4 80071AD4 2000B4AF */  sw         $s4, 0x20($sp)
/* 622D8 80071AD8 21A0C000 */  addu       $s4, $a2, $zero
/* 622DC 80071ADC 2400B5AF */  sw         $s5, 0x24($sp)
/* 622E0 80071AE0 21A8E000 */  addu       $s5, $a3, $zero
/* 622E4 80071AE4 1400B1AF */  sw         $s1, 0x14($sp)
/* 622E8 80071AE8 4400B18F */  lw         $s1, 0x44($sp)
/* 622EC 80071AEC 2800BFAF */  sw         $ra, 0x28($sp)
/* 622F0 80071AF0 6DC3010C */  jal        CIRC_Alloc
/* 622F4 80071AF4 18000424 */   addiu     $a0, $zero, 0x18
/* 622F8 80071AF8 000052AC */  sw         $s2, 0x0($v0)
/* 622FC 80071AFC 040053AC */  sw         $s3, 0x4($v0)
/* 62300 80071B00 080054AC */  sw         $s4, 0x8($v0)
/* 62304 80071B04 0C0055AC */  sw         $s5, 0xC($v0)
/* 62308 80071B08 100050AC */  sw         $s0, 0x10($v0)
/* 6230C 80071B0C 140051AC */  sw         $s1, 0x14($v0)
/* 62310 80071B10 2800BF8F */  lw         $ra, 0x28($sp)
/* 62314 80071B14 2400B58F */  lw         $s5, 0x24($sp)
/* 62318 80071B18 2000B48F */  lw         $s4, 0x20($sp)
/* 6231C 80071B1C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 62320 80071B20 1800B28F */  lw         $s2, 0x18($sp)
/* 62324 80071B24 1400B18F */  lw         $s1, 0x14($sp)
/* 62328 80071B28 1000B08F */  lw         $s0, 0x10($sp)
/* 6232C 80071B2C 0800E003 */  jr         $ra
/* 62330 80071B30 3000BD27 */   addiu     $sp, $sp, 0x30
.size SetActionPlayHostAnimationData, . - SetActionPlayHostAnimationData
