.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetControlInitHangData
/* 620F0 800718F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 620F4 800718F4 1000B0AF */  sw         $s0, 0x10($sp)
/* 620F8 800718F8 21808000 */  addu       $s0, $a0, $zero
/* 620FC 800718FC 1400B1AF */  sw         $s1, 0x14($sp)
/* 62100 80071900 2188A000 */  addu       $s1, $a1, $zero
/* 62104 80071904 1800B2AF */  sw         $s2, 0x18($sp)
/* 62108 80071908 2190C000 */  addu       $s2, $a2, $zero
/* 6210C 8007190C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 62110 80071910 6DC3010C */  jal        CIRC_Alloc
/* 62114 80071914 0C000424 */   addiu     $a0, $zero, 0xC
/* 62118 80071918 000050AC */  sw         $s0, 0x0($v0)
/* 6211C 8007191C 040051AC */  sw         $s1, 0x4($v0)
/* 62120 80071920 080052AC */  sw         $s2, 0x8($v0)
/* 62124 80071924 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 62128 80071928 1800B28F */  lw         $s2, 0x18($sp)
/* 6212C 8007192C 1400B18F */  lw         $s1, 0x14($sp)
/* 62130 80071930 1000B08F */  lw         $s0, 0x10($sp)
/* 62134 80071934 0800E003 */  jr         $ra
/* 62138 80071938 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetControlInitHangData, . - SetControlInitHangData
