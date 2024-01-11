.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPositionData
/* 618F0 800710F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 618F4 800710F4 1000B0AF */  sw         $s0, 0x10($sp)
/* 618F8 800710F8 21808000 */  addu       $s0, $a0, $zero
/* 618FC 800710FC 1400B1AF */  sw         $s1, 0x14($sp)
/* 61900 80071100 2188A000 */  addu       $s1, $a1, $zero
/* 61904 80071104 1800B2AF */  sw         $s2, 0x18($sp)
/* 61908 80071108 2190C000 */  addu       $s2, $a2, $zero
/* 6190C 8007110C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 61910 80071110 6DC3010C */  jal        CIRC_Alloc
/* 61914 80071114 08000424 */   addiu     $a0, $zero, 0x8
/* 61918 80071118 000050A4 */  sh         $s0, 0x0($v0)
/* 6191C 8007111C 020051A4 */  sh         $s1, 0x2($v0)
/* 61920 80071120 040052A4 */  sh         $s2, 0x4($v0)
/* 61924 80071124 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 61928 80071128 1800B28F */  lw         $s2, 0x18($sp)
/* 6192C 8007112C 1400B18F */  lw         $s1, 0x14($sp)
/* 61930 80071130 1000B08F */  lw         $s0, 0x10($sp)
/* 61934 80071134 0800E003 */  jr         $ra
/* 61938 80071138 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetPositionData, . - SetPositionData
