.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjectBirthProjectileData
/* 62334 80071B34 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62338 80071B38 1000B0AF */  sw         $s0, 0x10($sp)
/* 6233C 80071B3C 21808000 */  addu       $s0, $a0, $zero
/* 62340 80071B40 1400B1AF */  sw         $s1, 0x14($sp)
/* 62344 80071B44 2188A000 */  addu       $s1, $a1, $zero
/* 62348 80071B48 1800B2AF */  sw         $s2, 0x18($sp)
/* 6234C 80071B4C 2190C000 */  addu       $s2, $a2, $zero
/* 62350 80071B50 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 62354 80071B54 6DC3010C */  jal        CIRC_Alloc
/* 62358 80071B58 10000424 */   addiu     $a0, $zero, 0x10
/* 6235C 80071B5C 000050AC */  sw         $s0, 0x0($v0)
/* 62360 80071B60 040051AC */  sw         $s1, 0x4($v0)
/* 62364 80071B64 080052AC */  sw         $s2, 0x8($v0)
/* 62368 80071B68 0C0040AC */  sw         $zero, 0xC($v0)
/* 6236C 80071B6C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 62370 80071B70 1800B28F */  lw         $s2, 0x18($sp)
/* 62374 80071B74 1400B18F */  lw         $s1, 0x14($sp)
/* 62378 80071B78 1000B08F */  lw         $s0, 0x10($sp)
/* 6237C 80071B7C 0800E003 */  jr         $ra
/* 62380 80071B80 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetObjectBirthProjectileData, . - SetObjectBirthProjectileData
