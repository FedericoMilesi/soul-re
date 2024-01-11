.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsWallCrawlData
/* 61BC8 800713C8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61BCC 800713CC 1000B0AF */  sw         $s0, 0x10($sp)
/* 61BD0 800713D0 21808000 */  addu       $s0, $a0, $zero
/* 61BD4 800713D4 1400B1AF */  sw         $s1, 0x14($sp)
/* 61BD8 800713D8 2188A000 */  addu       $s1, $a1, $zero
/* 61BDC 800713DC 1800B2AF */  sw         $s2, 0x18($sp)
/* 61BE0 800713E0 2190C000 */  addu       $s2, $a2, $zero
/* 61BE4 800713E4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61BE8 800713E8 2198E000 */  addu       $s3, $a3, $zero
/* 61BEC 800713EC 2000BFAF */  sw         $ra, 0x20($sp)
/* 61BF0 800713F0 6DC3010C */  jal        CIRC_Alloc
/* 61BF4 800713F4 2C000424 */   addiu     $a0, $zero, 0x2C
/* 61BF8 800713F8 000050A4 */  sh         $s0, 0x0($v0)
/* 61BFC 800713FC 020051A4 */  sh         $s1, 0x2($v0)
/* 61C00 80071400 040052A4 */  sh         $s2, 0x4($v0)
/* 61C04 80071404 060053A4 */  sh         $s3, 0x6($v0)
/* 61C08 80071408 2000BF8F */  lw         $ra, 0x20($sp)
/* 61C0C 8007140C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61C10 80071410 1800B28F */  lw         $s2, 0x18($sp)
/* 61C14 80071414 1400B18F */  lw         $s1, 0x14($sp)
/* 61C18 80071418 1000B08F */  lw         $s0, 0x10($sp)
/* 61C1C 8007141C 0800E003 */  jr         $ra
/* 61C20 80071420 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetPhysicsWallCrawlData, . - SetPhysicsWallCrawlData
