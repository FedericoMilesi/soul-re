.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_ProcessGenerator
/* 6FB8C 8007F38C 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* 6FB90 8007F390 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6FB94 8007F394 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6FB98 8007F398 1800B2AF */  sw         $s2, 0x18($sp)
/* 6FB9C 8007F39C 1400B1AF */  sw         $s1, 0x14($sp)
/* 6FBA0 8007F3A0 1000B0AF */  sw         $s0, 0x10($sp)
/* 6FBA4 8007F3A4 04006294 */  lhu        $v0, 0x4($v1)
/* 6FBA8 8007F3A8 00000000 */  nop
/* 6FBAC 8007F3AC 01004230 */  andi       $v0, $v0, 0x1
/* 6FBB0 8007F3B0 40004014 */  bnez       $v0, .L8007F4B4
/* 6FBB4 8007F3B4 10007024 */   addiu     $s0, $v1, 0x10
/* 6FBB8 8007F3B8 0E006280 */  lb         $v0, 0xE($v1)
/* 6FBBC 8007F3BC 00000000 */  nop
/* 6FBC0 8007F3C0 3C004018 */  blez       $v0, .L8007F4B4
/* 6FBC4 8007F3C4 21900000 */   addu      $s2, $zero, $zero
/* 6FBC8 8007F3C8 16007124 */  addiu      $s1, $v1, 0x16
.L8007F3CC:
/* 6FBCC 8007F3CC D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 6FBD0 8007F3D0 00000000 */  nop
/* 6FBD4 8007F3D4 04004010 */  beqz       $v0, .L8007F3E8
/* 6FBD8 8007F3D8 00000000 */   nop
/* 6FBDC 8007F3DC FCBF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x234)($gp)
/* 6FBE0 8007F3E0 FBFC0108 */  j          .L8007F3EC
/* 6FBE4 8007F3E4 00000000 */   nop
.L8007F3E8:
/* 6FBE8 8007F3E8 F8BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x230)($gp)
.L8007F3EC:
/* 6FBEC 8007F3EC 0000028E */  lw         $v0, 0x0($s0)
/* 6FBF0 8007F3F0 00000000 */  nop
/* 6FBF4 8007F3F4 2B104300 */  sltu       $v0, $v0, $v1
/* 6FBF8 8007F3F8 24004010 */  beqz       $v0, .L8007F48C
/* 6FBFC 8007F3FC 00000000 */   nop
/* 6FC00 8007F400 00002486 */  lh         $a0, 0x0($s1)
/* 6FC04 8007F404 1C66010C */  jal        STREAM_GetLevelWithID
/* 6FC08 8007F408 00000000 */   nop
/* 6FC0C 8007F40C 1B004010 */  beqz       $v0, .L8007F47C
/* 6FC10 8007F410 00000000 */   nop
/* 6FC14 8007F414 7800458C */  lw         $a1, 0x78($v0)
/* 6FC18 8007F418 7C00448C */  lw         $a0, 0x7C($v0)
/* 6FC1C 8007F41C FEFF2686 */  lh         $a2, -0x2($s1)
/* 6FC20 8007F420 1D00A010 */  beqz       $a1, .L8007F498
/* 6FC24 8007F424 2C008324 */   addiu     $v1, $a0, 0x2C
.L8007F428:
/* 6FC28 8007F428 E8FF628C */  lw         $v0, -0x18($v1)
/* 6FC2C 8007F42C 00000000 */  nop
/* 6FC30 8007F430 0D004614 */  bne        $v0, $a2, .L8007F468
/* 6FC34 8007F434 FFFFA524 */   addiu     $a1, $a1, -0x1
/* 6FC38 8007F438 0000628C */  lw         $v0, 0x0($v1)
/* 6FC3C 8007F43C 00000000 */  nop
/* 6FC40 8007F440 00044230 */  andi       $v0, $v0, 0x400
/* 6FC44 8007F444 0D004014 */  bnez       $v0, .L8007F47C
/* 6FC48 8007F448 00000000 */   nop
/* 6FC4C 8007F44C 00002586 */  lh         $a1, 0x0($s1)
/* 6FC50 8007F450 6ACB000C */  jal        INSTANCE_IntroduceInstance
/* 6FC54 8007F454 00000000 */   nop
/* 6FC58 8007F458 0F004014 */  bnez       $v0, .L8007F498
/* 6FC5C 8007F45C 00000000 */   nop
/* 6FC60 8007F460 1FFD0108 */  j          .L8007F47C
/* 6FC64 8007F464 00000000 */   nop
.L8007F468:
/* 6FC68 8007F468 4C006324 */  addiu      $v1, $v1, 0x4C
/* 6FC6C 8007F46C EEFFA014 */  bnez       $a1, .L8007F428
/* 6FC70 8007F470 4C008424 */   addiu     $a0, $a0, 0x4C
/* 6FC74 8007F474 26FD0108 */  j          .L8007F498
/* 6FC78 8007F478 00000000 */   nop
.L8007F47C:
/* 6FC7C 8007F47C D0FC010C */  jal        MONAPI_DeleteRegen
/* 6FC80 8007F480 21200002 */   addu      $a0, $s0, $zero
/* 6FC84 8007F484 26FD0108 */  j          .L8007F498
/* 6FC88 8007F488 00000000 */   nop
.L8007F48C:
/* 6FC8C 8007F48C 01005226 */  addiu      $s2, $s2, 0x1
/* 6FC90 8007F490 08003126 */  addiu      $s1, $s1, 0x8
/* 6FC94 8007F494 08001026 */  addiu      $s0, $s0, 0x8
.L8007F498:
/* 6FC98 8007F498 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 6FC9C 8007F49C 00000000 */  nop
/* 6FCA0 8007F4A0 0E004280 */  lb         $v0, 0xE($v0)
/* 6FCA4 8007F4A4 00000000 */  nop
/* 6FCA8 8007F4A8 2A104202 */  slt        $v0, $s2, $v0
/* 6FCAC 8007F4AC C7FF4014 */  bnez       $v0, .L8007F3CC
/* 6FCB0 8007F4B0 00000000 */   nop
.L8007F4B4:
/* 6FCB4 8007F4B4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6FCB8 8007F4B8 1800B28F */  lw         $s2, 0x18($sp)
/* 6FCBC 8007F4BC 1400B18F */  lw         $s1, 0x14($sp)
/* 6FCC0 8007F4C0 1000B08F */  lw         $s0, 0x10($sp)
/* 6FCC4 8007F4C4 0800E003 */  jr         $ra
/* 6FCC8 8007F4C8 2000BD27 */   addiu     $sp, $sp, 0x20
.size MONAPI_ProcessGenerator, . - MONAPI_ProcessGenerator
