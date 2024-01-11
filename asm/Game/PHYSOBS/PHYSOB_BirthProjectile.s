.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_BirthProjectile
/* 5B1DC 8006A9DC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B1E0 8006A9E0 1000B0AF */  sw         $s0, 0x10($sp)
/* 5B1E4 8006A9E4 21808000 */  addu       $s0, $a0, $zero
/* 5B1E8 8006A9E8 1400B1AF */  sw         $s1, 0x14($sp)
/* 5B1EC 8006A9EC 2188A000 */  addu       $s1, $a1, $zero
/* 5B1F0 8006A9F0 1800B2AF */  sw         $s2, 0x18($sp)
/* 5B1F4 8006A9F4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5B1F8 8006A9F8 CDC6010C */  jal        SetObjectBirthProjectileData
/* 5B1FC 8006A9FC 2190C000 */   addu      $s2, $a2, $zero
/* 5B200 8006AA00 21200002 */  addu       $a0, $s0, $zero
/* 5B204 8006AA04 21282002 */  addu       $a1, $s1, $zero
/* 5B208 8006AA08 21304002 */  addu       $a2, $s2, $zero
/* 5B20C 8006AA0C 8DAA010C */  jal        BirthProjectilePhysOb
/* 5B210 8006AA10 21804000 */   addu      $s0, $v0, $zero
/* 5B214 8006AA14 0C0002AE */  sw         $v0, 0xC($s0)
/* 5B218 8006AA18 21100002 */  addu       $v0, $s0, $zero
/* 5B21C 8006AA1C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5B220 8006AA20 1800B28F */  lw         $s2, 0x18($sp)
/* 5B224 8006AA24 1400B18F */  lw         $s1, 0x14($sp)
/* 5B228 8006AA28 1000B08F */  lw         $s0, 0x10($sp)
/* 5B22C 8006AA2C 0800E003 */  jr         $ra
/* 5B230 8006AA30 2000BD27 */   addiu     $sp, $sp, 0x20
.size PHYSOB_BirthProjectile, . - PHYSOB_BirthProjectile
