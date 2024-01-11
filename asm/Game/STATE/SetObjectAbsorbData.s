.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjectAbsorbData
/* 621F4 800719F4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 621F8 800719F8 1000B0AF */  sw         $s0, 0x10($sp)
/* 621FC 800719FC 21808000 */  addu       $s0, $a0, $zero
/* 62200 80071A00 1400B1AF */  sw         $s1, 0x14($sp)
/* 62204 80071A04 2188A000 */  addu       $s1, $a1, $zero
/* 62208 80071A08 1800B2AF */  sw         $s2, 0x18($sp)
/* 6220C 80071A0C 2190C000 */  addu       $s2, $a2, $zero
/* 62210 80071A10 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 62214 80071A14 6DC3010C */  jal        CIRC_Alloc
/* 62218 80071A18 08000424 */   addiu     $a0, $zero, 0x8
/* 6221C 80071A1C 000050AC */  sw         $s0, 0x0($v0)
/* 62220 80071A20 040051A4 */  sh         $s1, 0x4($v0)
/* 62224 80071A24 060052A4 */  sh         $s2, 0x6($v0)
/* 62228 80071A28 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6222C 80071A2C 1800B28F */  lw         $s2, 0x18($sp)
/* 62230 80071A30 1400B18F */  lw         $s1, 0x14($sp)
/* 62234 80071A34 1000B08F */  lw         $s0, 0x10($sp)
/* 62238 80071A38 0800E003 */  jr         $ra
/* 6223C 80071A3C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetObjectAbsorbData, . - SetObjectAbsorbData
