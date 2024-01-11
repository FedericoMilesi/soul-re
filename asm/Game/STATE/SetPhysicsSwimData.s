.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsSwimData
/* 61A64 80071264 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61A68 80071268 1400B1AF */  sw         $s1, 0x14($sp)
/* 61A6C 8007126C 21888000 */  addu       $s1, $a0, $zero
/* 61A70 80071270 1800B2AF */  sw         $s2, 0x18($sp)
/* 61A74 80071274 2190A000 */  addu       $s2, $a1, $zero
/* 61A78 80071278 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61A7C 8007127C 2198C000 */  addu       $s3, $a2, $zero
/* 61A80 80071280 2000B4AF */  sw         $s4, 0x20($sp)
/* 61A84 80071284 21A0E000 */  addu       $s4, $a3, $zero
/* 61A88 80071288 1000B0AF */  sw         $s0, 0x10($sp)
/* 61A8C 8007128C 3800B08F */  lw         $s0, 0x38($sp)
/* 61A90 80071290 2400BFAF */  sw         $ra, 0x24($sp)
/* 61A94 80071294 6DC3010C */  jal        CIRC_Alloc
/* 61A98 80071298 18000424 */   addiu     $a0, $zero, 0x18
/* 61A9C 8007129C 000051A4 */  sh         $s1, 0x0($v0)
/* 61AA0 800712A0 080052AC */  sw         $s2, 0x8($v0)
/* 61AA4 800712A4 020053A4 */  sh         $s3, 0x2($v0)
/* 61AA8 800712A8 040054A4 */  sh         $s4, 0x4($v0)
/* 61AAC 800712AC 060050A4 */  sh         $s0, 0x6($v0)
/* 61AB0 800712B0 2400BF8F */  lw         $ra, 0x24($sp)
/* 61AB4 800712B4 2000B48F */  lw         $s4, 0x20($sp)
/* 61AB8 800712B8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61ABC 800712BC 1800B28F */  lw         $s2, 0x18($sp)
/* 61AC0 800712C0 1400B18F */  lw         $s1, 0x14($sp)
/* 61AC4 800712C4 1000B08F */  lw         $s0, 0x10($sp)
/* 61AC8 800712C8 0800E003 */  jr         $ra
/* 61ACC 800712CC 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetPhysicsSwimData, . - SetPhysicsSwimData
