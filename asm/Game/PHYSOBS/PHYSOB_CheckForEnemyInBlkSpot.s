.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckForEnemyInBlkSpot
/* 5FB54 8006F354 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5FB58 8006F358 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 5FB5C 8006F35C 2800B6AF */  sw         $s6, 0x28($sp)
/* 5FB60 8006F360 2400B5AF */  sw         $s5, 0x24($sp)
/* 5FB64 8006F364 2000B4AF */  sw         $s4, 0x20($sp)
/* 5FB68 8006F368 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 5FB6C 8006F36C 1800B2AF */  sw         $s2, 0x18($sp)
/* 5FB70 8006F370 1400B1AF */  sw         $s1, 0x14($sp)
/* 5FB74 8006F374 1000B0AF */  sw         $s0, 0x10($sp)
/* 5FB78 8006F378 5E008384 */  lh         $v1, 0x5E($a0)
/* 5FB7C 8006F37C FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 5FB80 8006F380 21186600 */  addu       $v1, $v1, $a2
/* 5FB84 8006F384 0400508C */  lw         $s0, 0x4($v0)
/* 5FB88 8006F388 5C008284 */  lh         $v0, 0x5C($a0)
/* 5FB8C 8006F38C C0FE7424 */  addiu      $s4, $v1, -0x140
/* 5FB90 8006F390 21104500 */  addu       $v0, $v0, $a1
/* 5FB94 8006F394 C0FE5624 */  addiu      $s6, $v0, -0x140
/* 5FB98 8006F398 40015524 */  addiu      $s5, $v0, 0x140
/* 5FB9C 8006F39C 60008284 */  lh         $v0, 0x60($a0)
/* 5FBA0 8006F3A0 40017324 */  addiu      $s3, $v1, 0x140
/* 5FBA4 8006F3A4 C0FE5224 */  addiu      $s2, $v0, -0x140
/* 5FBA8 8006F3A8 2C000012 */  beqz       $s0, .L8006F45C
/* 5FBAC 8006F3AC 40015124 */   addiu     $s1, $v0, 0x140
.L8006F3B0:
/* 5FBB0 8006F3B0 1C00028E */  lw         $v0, 0x1C($s0)
/* 5FBB4 8006F3B4 00000000 */  nop
/* 5FBB8 8006F3B8 2C00428C */  lw         $v0, 0x2C($v0)
/* 5FBBC 8006F3BC 0800033C */  lui        $v1, (0x80000 >> 16)
/* 5FBC0 8006F3C0 24104300 */  and        $v0, $v0, $v1
/* 5FBC4 8006F3C4 21004010 */  beqz       $v0, .L8006F44C
/* 5FBC8 8006F3C8 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 5FBCC 8006F3CC 1800028E */  lw         $v0, 0x18($s0)
/* 5FBD0 8006F3D0 00000000 */  nop
/* 5FBD4 8006F3D4 24104300 */  and        $v0, $v0, $v1
/* 5FBD8 8006F3D8 1C004014 */  bnez       $v0, .L8006F44C
/* 5FBDC 8006F3DC 21200002 */   addu      $a0, $s0, $zero
/* 5FBE0 8006F3E0 92D1000C */  jal        INSTANCE_Query
/* 5FBE4 8006F3E4 21280000 */   addu      $a1, $zero, $zero
/* 5FBE8 8006F3E8 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 5FBEC 8006F3EC 24104300 */  and        $v0, $v0, $v1
/* 5FBF0 8006F3F0 16004014 */  bnez       $v0, .L8006F44C
/* 5FBF4 8006F3F4 00000000 */   nop
/* 5FBF8 8006F3F8 5C000386 */  lh         $v1, 0x5C($s0)
/* 5FBFC 8006F3FC 00000000 */  nop
/* 5FC00 8006F400 2A107600 */  slt        $v0, $v1, $s6
/* 5FC04 8006F404 11004014 */  bnez       $v0, .L8006F44C
/* 5FC08 8006F408 2A10A302 */   slt       $v0, $s5, $v1
/* 5FC0C 8006F40C 0F004014 */  bnez       $v0, .L8006F44C
/* 5FC10 8006F410 00000000 */   nop
/* 5FC14 8006F414 5E000386 */  lh         $v1, 0x5E($s0)
/* 5FC18 8006F418 00000000 */  nop
/* 5FC1C 8006F41C 2A107400 */  slt        $v0, $v1, $s4
/* 5FC20 8006F420 0A004014 */  bnez       $v0, .L8006F44C
/* 5FC24 8006F424 2A106302 */   slt       $v0, $s3, $v1
/* 5FC28 8006F428 08004014 */  bnez       $v0, .L8006F44C
/* 5FC2C 8006F42C 00000000 */   nop
/* 5FC30 8006F430 60000386 */  lh         $v1, 0x60($s0)
/* 5FC34 8006F434 00000000 */  nop
/* 5FC38 8006F438 2A107200 */  slt        $v0, $v1, $s2
/* 5FC3C 8006F43C 03004014 */  bnez       $v0, .L8006F44C
/* 5FC40 8006F440 2A102302 */   slt       $v0, $s1, $v1
/* 5FC44 8006F444 06004010 */  beqz       $v0, .L8006F460
/* 5FC48 8006F448 01000224 */   addiu     $v0, $zero, 0x1
.L8006F44C:
/* 5FC4C 8006F44C 0800108E */  lw         $s0, 0x8($s0)
/* 5FC50 8006F450 00000000 */  nop
/* 5FC54 8006F454 D6FF0016 */  bnez       $s0, .L8006F3B0
/* 5FC58 8006F458 00000000 */   nop
.L8006F45C:
/* 5FC5C 8006F45C 21100000 */  addu       $v0, $zero, $zero
.L8006F460:
/* 5FC60 8006F460 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 5FC64 8006F464 2800B68F */  lw         $s6, 0x28($sp)
/* 5FC68 8006F468 2400B58F */  lw         $s5, 0x24($sp)
/* 5FC6C 8006F46C 2000B48F */  lw         $s4, 0x20($sp)
/* 5FC70 8006F470 1C00B38F */  lw         $s3, 0x1C($sp)
/* 5FC74 8006F474 1800B28F */  lw         $s2, 0x18($sp)
/* 5FC78 8006F478 1400B18F */  lw         $s1, 0x14($sp)
/* 5FC7C 8006F47C 1000B08F */  lw         $s0, 0x10($sp)
/* 5FC80 8006F480 0800E003 */  jr         $ra
/* 5FC84 8006F484 3000BD27 */   addiu     $sp, $sp, 0x30
.size PHYSOB_CheckForEnemyInBlkSpot, . - PHYSOB_CheckForEnemyInBlkSpot
