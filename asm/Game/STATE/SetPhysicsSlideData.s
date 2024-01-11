.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsSlideData
/* 61B3C 8007133C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 61B40 80071340 1000B0AF */  sw         $s0, 0x10($sp)
/* 61B44 80071344 4000B08F */  lw         $s0, 0x40($sp)
/* 61B48 80071348 1400B1AF */  sw         $s1, 0x14($sp)
/* 61B4C 8007134C 4400B18F */  lw         $s1, 0x44($sp)
/* 61B50 80071350 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61B54 80071354 21988000 */  addu       $s3, $a0, $zero
/* 61B58 80071358 2000B4AF */  sw         $s4, 0x20($sp)
/* 61B5C 8007135C 21A0A000 */  addu       $s4, $a1, $zero
/* 61B60 80071360 2400B5AF */  sw         $s5, 0x24($sp)
/* 61B64 80071364 21A8C000 */  addu       $s5, $a2, $zero
/* 61B68 80071368 2800B6AF */  sw         $s6, 0x28($sp)
/* 61B6C 8007136C 21B0E000 */  addu       $s6, $a3, $zero
/* 61B70 80071370 1800B2AF */  sw         $s2, 0x18($sp)
/* 61B74 80071374 4800B28F */  lw         $s2, 0x48($sp)
/* 61B78 80071378 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 61B7C 8007137C 6DC3010C */  jal        CIRC_Alloc
/* 61B80 80071380 28000424 */   addiu     $a0, $zero, 0x28
/* 61B84 80071384 180053A4 */  sh         $s3, 0x18($v0)
/* 61B88 80071388 000054A4 */  sh         $s4, 0x0($v0)
/* 61B8C 8007138C 020055A4 */  sh         $s5, 0x2($v0)
/* 61B90 80071390 040056A4 */  sh         $s6, 0x4($v0)
/* 61B94 80071394 1A0050A4 */  sh         $s0, 0x1A($v0)
/* 61B98 80071398 1C0051A4 */  sh         $s1, 0x1C($v0)
/* 61B9C 8007139C 1E0052A4 */  sh         $s2, 0x1E($v0)
/* 61BA0 800713A0 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 61BA4 800713A4 2800B68F */  lw         $s6, 0x28($sp)
/* 61BA8 800713A8 2400B58F */  lw         $s5, 0x24($sp)
/* 61BAC 800713AC 2000B48F */  lw         $s4, 0x20($sp)
/* 61BB0 800713B0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61BB4 800713B4 1800B28F */  lw         $s2, 0x18($sp)
/* 61BB8 800713B8 1400B18F */  lw         $s1, 0x14($sp)
/* 61BBC 800713BC 1000B08F */  lw         $s0, 0x10($sp)
/* 61BC0 800713C0 0800E003 */  jr         $ra
/* 61BC4 800713C4 3000BD27 */   addiu     $sp, $sp, 0x30
.size SetPhysicsSlideData, . - SetPhysicsSlideData
