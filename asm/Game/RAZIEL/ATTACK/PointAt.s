.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PointAt
/* 8EAF0 8009E2F0 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8EAF4 8009E2F4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8EAF8 8009E2F8 3000B0AF */  sw         $s0, 0x30($sp)
/* 8EAFC 8009E2FC 21808000 */  addu       $s0, $a0, $zero
/* 8EB00 8009E300 3400B1AF */  sw         $s1, 0x34($sp)
/* 8EB04 8009E304 2188A000 */  addu       $s1, $a1, $zero
/* 8EB08 8009E308 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 8EB0C 8009E30C 3800B2AF */  sw         $s2, 0x38($sp)
/* 8EB10 8009E310 4000048E */  lw         $a0, 0x40($s0)
/* 8EB14 8009E314 0A004394 */  lhu        $v1, 0xA($v0)
/* 8EB18 8009E318 2190C000 */  addu       $s2, $a2, $zero
/* 8EB1C 8009E31C 1800A3A7 */  sh         $v1, 0x18($sp)
/* 8EB20 8009E320 0C004394 */  lhu        $v1, 0xC($v0)
/* 8EB24 8009E324 1800A527 */  addiu      $a1, $sp, 0x18
/* 8EB28 8009E328 1A00A3A7 */  sh         $v1, 0x1A($sp)
/* 8EB2C 8009E32C 0E004294 */  lhu        $v0, 0xE($v0)
/* 8EB30 8009E330 2000A627 */  addiu      $a2, $sp, 0x20
/* 8EB34 8009E334 1AF2020C */  jal        ApplyMatrix
/* 8EB38 8009E338 1C00A2A7 */   sh        $v0, 0x1C($sp)
/* 8EB3C 8009E33C 5C000386 */  lh         $v1, 0x5C($s0)
/* 8EB40 8009E340 2000A28F */  lw         $v0, 0x20($sp)
/* 8EB44 8009E344 00000000 */  nop
/* 8EB48 8009E348 21104300 */  addu       $v0, $v0, $v1
/* 8EB4C 8009E34C 2000A2AF */  sw         $v0, 0x20($sp)
/* 8EB50 8009E350 5E000386 */  lh         $v1, 0x5E($s0)
/* 8EB54 8009E354 2400A28F */  lw         $v0, 0x24($sp)
/* 8EB58 8009E358 1000A427 */  addiu      $a0, $sp, 0x10
/* 8EB5C 8009E35C 21104300 */  addu       $v0, $v0, $v1
/* 8EB60 8009E360 2400A2AF */  sw         $v0, 0x24($sp)
/* 8EB64 8009E364 60000386 */  lh         $v1, 0x60($s0)
/* 8EB68 8009E368 2800A28F */  lw         $v0, 0x28($sp)
/* 8EB6C 8009E36C 21282002 */  addu       $a1, $s1, $zero
/* 8EB70 8009E370 21104300 */  addu       $v0, $v0, $v1
/* 8EB74 8009E374 2800A2AF */  sw         $v0, 0x28($sp)
/* 8EB78 8009E378 2000A297 */  lhu        $v0, 0x20($sp)
/* 8EB7C 8009E37C 2400A397 */  lhu        $v1, 0x24($sp)
/* 8EB80 8009E380 2800A797 */  lhu        $a3, 0x28($sp)
/* 8EB84 8009E384 21304002 */  addu       $a2, $s2, $zero
/* 8EB88 8009E388 1000A2A7 */  sh         $v0, 0x10($sp)
/* 8EB8C 8009E38C 1200A3A7 */  sh         $v1, 0x12($sp)
/* 8EB90 8009E390 CDE8000C */  jal        MATH3D_RotationFromPosToPos
/* 8EB94 8009E394 1400A7A7 */   sh        $a3, 0x14($sp)
/* 8EB98 8009E398 04004296 */  lhu        $v0, 0x4($s2)
/* 8EB9C 8009E39C 78000396 */  lhu        $v1, 0x78($s0)
/* 8EBA0 8009E3A0 21204002 */  addu       $a0, $s2, $zero
/* 8EBA4 8009E3A4 020040A6 */  sh         $zero, 0x2($s2)
/* 8EBA8 8009E3A8 23104300 */  subu       $v0, $v0, $v1
/* 8EBAC 8009E3AC 5479020C */  jal        LimitRotation
/* 8EBB0 8009E3B0 040042A6 */   sh        $v0, 0x4($s2)
/* 8EBB4 8009E3B4 C8011026 */  addiu      $s0, $s0, 0x1C8
/* 8EBB8 8009E3B8 21200002 */  addu       $a0, $s0, $zero
/* 8EBBC 8009E3BC 0E000524 */  addiu      $a1, $zero, 0xE
/* 8EBC0 8009E3C0 E541020C */  jal        G2Anim_IsControllerActive
/* 8EBC4 8009E3C4 2130A000 */   addu      $a2, $a1, $zero
/* 8EBC8 8009E3C8 04004014 */  bnez       $v0, .L8009E3DC
/* 8EBCC 8009E3CC 21200002 */   addu      $a0, $s0, $zero
/* 8EBD0 8009E3D0 0E000524 */  addiu      $a1, $zero, 0xE
/* 8EBD4 8009E3D4 5641020C */  jal        G2Anim_EnableController
/* 8EBD8 8009E3D8 2130A000 */   addu      $a2, $a1, $zero
.L8009E3DC:
/* 8EBDC 8009E3DC 95E8000C */  jal        MATH3D_ZYXtoXYZ
/* 8EBE0 8009E3E0 21204002 */   addu      $a0, $s2, $zero
/* 8EBE4 8009E3E4 21200002 */  addu       $a0, $s0, $zero
/* 8EBE8 8009E3E8 0E000524 */  addiu      $a1, $zero, 0xE
/* 8EBEC 8009E3EC 2130A000 */  addu       $a2, $a1, $zero
/* 8EBF0 8009E3F0 7D42020C */  jal        G2Anim_SetController_Vector
/* 8EBF4 8009E3F4 21384002 */   addu      $a3, $s2, $zero
/* 8EBF8 8009E3F8 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 8EBFC 8009E3FC 3800B28F */  lw         $s2, 0x38($sp)
/* 8EC00 8009E400 3400B18F */  lw         $s1, 0x34($sp)
/* 8EC04 8009E404 3000B08F */  lw         $s0, 0x30($sp)
/* 8EC08 8009E408 0800E003 */  jr         $ra
/* 8EC0C 8009E40C 4000BD27 */   addiu     $sp, $sp, 0x40
.size PointAt, . - PointAt
