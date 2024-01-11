.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_IntersectLineAndBox
/* F9D8 8001F1D8 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* F9DC 8001F1DC 7000A38F */  lw         $v1, 0x70($sp)
/* F9E0 8001F1E0 3800B0AF */  sw         $s0, 0x38($sp)
/* F9E4 8001F1E4 7400B08F */  lw         $s0, 0x74($sp)
/* F9E8 8001F1E8 5400B7AF */  sw         $s7, 0x54($sp)
/* F9EC 8001F1EC 01101724 */  addiu      $s7, $zero, 0x1001
/* F9F0 8001F1F0 4400B3AF */  sw         $s3, 0x44($sp)
/* F9F4 8001F1F4 2800B327 */  addiu      $s3, $sp, 0x28
/* F9F8 8001F1F8 4C00B5AF */  sw         $s5, 0x4C($sp)
/* F9FC 8001F1FC 00F01524 */  addiu      $s5, $zero, -0x1000
/* FA00 8001F200 3C00B1AF */  sw         $s1, 0x3C($sp)
/* FA04 8001F204 0280113C */  lui        $s1, %hi(COLLIDE_WithinYZBounds)
/* FA08 8001F208 4000B2AF */  sw         $s2, 0x40($sp)
/* FA0C 8001F20C 7800B28F */  lw         $s2, 0x78($sp)
/* FA10 8001F210 18EF3126 */  addiu      $s1, $s1, %lo(COLLIDE_WithinYZBounds)
/* FA14 8001F214 4800B4AF */  sw         $s4, 0x48($sp)
/* FA18 8001F218 2000B427 */  addiu      $s4, $sp, 0x20
/* FA1C 8001F21C 5800BFAF */  sw         $ra, 0x58($sp)
/* FA20 8001F220 5000B6AF */  sw         $s6, 0x50($sp)
/* FA24 8001F224 68B197AF */  sw         $s7, %gp_rel(collide_t0)($gp)
/* FA28 8001F228 6CB197AF */  sw         $s7, %gp_rel(collide_t1)($gp)
/* FA2C 8001F22C 60B184AF */  sw         $a0, %gp_rel(collide_point0)($gp)
/* FA30 8001F230 64B186AF */  sw         $a2, %gp_rel(collide_point1)($gp)
/* FA34 8001F234 7CB185AF */  sw         $a1, %gp_rel(collide_normal0)($gp)
/* FA38 8001F238 80B187AF */  sw         $a3, %gp_rel(collide_normal1)($gp)
/* FA3C 8001F23C 21380002 */  addu       $a3, $s0, $zero
/* FA40 8001F240 00006584 */  lh         $a1, 0x0($v1)
/* FA44 8001F244 02006684 */  lh         $a2, 0x2($v1)
/* FA48 8001F248 00000286 */  lh         $v0, 0x0($s0)
/* FA4C 8001F24C 04006484 */  lh         $a0, 0x4($v1)
/* FA50 8001F250 04000386 */  lh         $v1, 0x4($s0)
/* FA54 8001F254 2328A200 */  subu       $a1, $a1, $v0
/* FA58 8001F258 02000286 */  lh         $v0, 0x2($s0)
/* FA5C 8001F25C 23208300 */  subu       $a0, $a0, $v1
/* FA60 8001F260 2800A5AF */  sw         $a1, 0x28($sp)
/* FA64 8001F264 080064AE */  sw         $a0, 0x8($s3)
/* FA68 8001F268 2330C200 */  subu       $a2, $a2, $v0
/* FA6C 8001F26C 040066AE */  sw         $a2, 0x4($s3)
/* FA70 8001F270 2000B5A7 */  sh         $s5, 0x20($sp)
/* FA74 8001F274 2200A0A7 */  sh         $zero, 0x22($sp)
/* FA78 8001F278 2400A0A7 */  sh         $zero, 0x24($sp)
/* FA7C 8001F27C 00000496 */  lhu        $a0, 0x0($s0)
/* FA80 8001F280 04004696 */  lhu        $a2, 0x4($s2)
/* FA84 8001F284 23280500 */  negu       $a1, $a1
/* FA88 8001F288 1000B3AF */  sw         $s3, 0x10($sp)
/* FA8C 8001F28C 1400B2AF */  sw         $s2, 0x14($sp)
/* FA90 8001F290 1800B1AF */  sw         $s1, 0x18($sp)
/* FA94 8001F294 1C00B4AF */  sw         $s4, 0x1C($sp)
/* FA98 8001F298 23200400 */  negu       $a0, $a0
/* FA9C 8001F29C 00240400 */  sll        $a0, $a0, 16
/* FAA0 8001F2A0 03240400 */  sra        $a0, $a0, 16
/* FAA4 8001F2A4 23300600 */  negu       $a2, $a2
/* FAA8 8001F2A8 00340600 */  sll        $a2, $a2, 16
/* FAAC 8001F2AC 0B7C000C */  jal        COLLIDE_LineWithBoxFace
/* FAB0 8001F2B0 03340600 */   sra       $a2, $a2, 16
/* FAB4 8001F2B4 00101624 */  addiu      $s6, $zero, 0x1000
/* FAB8 8001F2B8 2000B6A7 */  sh         $s6, 0x20($sp)
/* FABC 8001F2BC 2200A0A7 */  sh         $zero, 0x22($sp)
/* FAC0 8001F2C0 2400A0A7 */  sh         $zero, 0x24($sp)
/* FAC4 8001F2C4 00000486 */  lh         $a0, 0x0($s0)
/* FAC8 8001F2C8 0A004686 */  lh         $a2, 0xA($s2)
/* FACC 8001F2CC 1000B3AF */  sw         $s3, 0x10($sp)
/* FAD0 8001F2D0 1400B2AF */  sw         $s2, 0x14($sp)
/* FAD4 8001F2D4 1800B1AF */  sw         $s1, 0x18($sp)
/* FAD8 8001F2D8 1C00B4AF */  sw         $s4, 0x1C($sp)
/* FADC 8001F2DC 2800A58F */  lw         $a1, 0x28($sp)
/* FAE0 8001F2E0 0B7C000C */  jal        COLLIDE_LineWithBoxFace
/* FAE4 8001F2E4 21380002 */   addu      $a3, $s0, $zero
/* FAE8 8001F2E8 21380002 */  addu       $a3, $s0, $zero
/* FAEC 8001F2EC 0280113C */  lui        $s1, %hi(COLLIDE_WithinXZBounds)
/* FAF0 8001F2F0 2000A0A7 */  sh         $zero, 0x20($sp)
/* FAF4 8001F2F4 2200B5A7 */  sh         $s5, 0x22($sp)
/* FAF8 8001F2F8 2400A0A7 */  sh         $zero, 0x24($sp)
/* FAFC 8001F2FC 02000496 */  lhu        $a0, 0x2($s0)
/* FB00 8001F300 2C00A597 */  lhu        $a1, 0x2C($sp)
/* FB04 8001F304 06004696 */  lhu        $a2, 0x6($s2)
/* FB08 8001F308 74EF3126 */  addiu      $s1, $s1, %lo(COLLIDE_WithinXZBounds)
/* FB0C 8001F30C 1000B3AF */  sw         $s3, 0x10($sp)
/* FB10 8001F310 1400B2AF */  sw         $s2, 0x14($sp)
/* FB14 8001F314 1800B1AF */  sw         $s1, 0x18($sp)
/* FB18 8001F318 1C00B4AF */  sw         $s4, 0x1C($sp)
/* FB1C 8001F31C 23200400 */  negu       $a0, $a0
/* FB20 8001F320 00240400 */  sll        $a0, $a0, 16
/* FB24 8001F324 03240400 */  sra        $a0, $a0, 16
/* FB28 8001F328 23280500 */  negu       $a1, $a1
/* FB2C 8001F32C 002C0500 */  sll        $a1, $a1, 16
/* FB30 8001F330 032C0500 */  sra        $a1, $a1, 16
/* FB34 8001F334 23300600 */  negu       $a2, $a2
/* FB38 8001F338 00340600 */  sll        $a2, $a2, 16
/* FB3C 8001F33C 0B7C000C */  jal        COLLIDE_LineWithBoxFace
/* FB40 8001F340 03340600 */   sra       $a2, $a2, 16
/* FB44 8001F344 2000A0A7 */  sh         $zero, 0x20($sp)
/* FB48 8001F348 2200B6A7 */  sh         $s6, 0x22($sp)
/* FB4C 8001F34C 2400A0A7 */  sh         $zero, 0x24($sp)
/* FB50 8001F350 02000486 */  lh         $a0, 0x2($s0)
/* FB54 8001F354 0C004686 */  lh         $a2, 0xC($s2)
/* FB58 8001F358 1000B3AF */  sw         $s3, 0x10($sp)
/* FB5C 8001F35C 1400B2AF */  sw         $s2, 0x14($sp)
/* FB60 8001F360 1800B1AF */  sw         $s1, 0x18($sp)
/* FB64 8001F364 1C00B4AF */  sw         $s4, 0x1C($sp)
/* FB68 8001F368 2C00A58F */  lw         $a1, 0x2C($sp)
/* FB6C 8001F36C 0B7C000C */  jal        COLLIDE_LineWithBoxFace
/* FB70 8001F370 21380002 */   addu      $a3, $s0, $zero
/* FB74 8001F374 21380002 */  addu       $a3, $s0, $zero
/* FB78 8001F378 0280113C */  lui        $s1, %hi(COLLIDE_WithinXYBounds)
/* FB7C 8001F37C 2000A0A7 */  sh         $zero, 0x20($sp)
/* FB80 8001F380 2200A0A7 */  sh         $zero, 0x22($sp)
/* FB84 8001F384 2400B5A7 */  sh         $s5, 0x24($sp)
/* FB88 8001F388 04000496 */  lhu        $a0, 0x4($s0)
/* FB8C 8001F38C 3000A597 */  lhu        $a1, 0x30($sp)
/* FB90 8001F390 08004696 */  lhu        $a2, 0x8($s2)
/* FB94 8001F394 D0EF3126 */  addiu      $s1, $s1, %lo(COLLIDE_WithinXYBounds)
/* FB98 8001F398 1000B3AF */  sw         $s3, 0x10($sp)
/* FB9C 8001F39C 1400B2AF */  sw         $s2, 0x14($sp)
/* FBA0 8001F3A0 1800B1AF */  sw         $s1, 0x18($sp)
/* FBA4 8001F3A4 1C00B4AF */  sw         $s4, 0x1C($sp)
/* FBA8 8001F3A8 23200400 */  negu       $a0, $a0
/* FBAC 8001F3AC 00240400 */  sll        $a0, $a0, 16
/* FBB0 8001F3B0 03240400 */  sra        $a0, $a0, 16
/* FBB4 8001F3B4 23280500 */  negu       $a1, $a1
/* FBB8 8001F3B8 002C0500 */  sll        $a1, $a1, 16
/* FBBC 8001F3BC 032C0500 */  sra        $a1, $a1, 16
/* FBC0 8001F3C0 23300600 */  negu       $a2, $a2
/* FBC4 8001F3C4 00340600 */  sll        $a2, $a2, 16
/* FBC8 8001F3C8 0B7C000C */  jal        COLLIDE_LineWithBoxFace
/* FBCC 8001F3CC 03340600 */   sra       $a2, $a2, 16
/* FBD0 8001F3D0 2000A0A7 */  sh         $zero, 0x20($sp)
/* FBD4 8001F3D4 2200A0A7 */  sh         $zero, 0x22($sp)
/* FBD8 8001F3D8 2400B6A7 */  sh         $s6, 0x24($sp)
/* FBDC 8001F3DC 04000486 */  lh         $a0, 0x4($s0)
/* FBE0 8001F3E0 0E004686 */  lh         $a2, 0xE($s2)
/* FBE4 8001F3E4 1000B3AF */  sw         $s3, 0x10($sp)
/* FBE8 8001F3E8 1400B2AF */  sw         $s2, 0x14($sp)
/* FBEC 8001F3EC 1800B1AF */  sw         $s1, 0x18($sp)
/* FBF0 8001F3F0 1C00B4AF */  sw         $s4, 0x1C($sp)
/* FBF4 8001F3F4 3000A58F */  lw         $a1, 0x30($sp)
/* FBF8 8001F3F8 0B7C000C */  jal        COLLIDE_LineWithBoxFace
/* FBFC 8001F3FC 21380002 */   addu      $a3, $s0, $zero
/* FC00 8001F400 6CB1828F */  lw         $v0, %gp_rel(collide_t1)($gp)
/* FC04 8001F404 00000000 */  nop
/* FC08 8001F408 06005714 */  bne        $v0, $s7, .L8001F424
/* FC0C 8001F40C 00000000 */   nop
/* FC10 8001F410 68B1828F */  lw         $v0, %gp_rel(collide_t0)($gp)
/* FC14 8001F414 00000000 */  nop
/* FC18 8001F418 26105700 */  xor        $v0, $v0, $s7
/* FC1C 8001F41C 0A7D0008 */  j          .L8001F428
/* FC20 8001F420 2B100200 */   sltu      $v0, $zero, $v0
.L8001F424:
/* FC24 8001F424 02000224 */  addiu      $v0, $zero, 0x2
.L8001F428:
/* FC28 8001F428 5800BF8F */  lw         $ra, 0x58($sp)
/* FC2C 8001F42C 5400B78F */  lw         $s7, 0x54($sp)
/* FC30 8001F430 5000B68F */  lw         $s6, 0x50($sp)
/* FC34 8001F434 4C00B58F */  lw         $s5, 0x4C($sp)
/* FC38 8001F438 4800B48F */  lw         $s4, 0x48($sp)
/* FC3C 8001F43C 4400B38F */  lw         $s3, 0x44($sp)
/* FC40 8001F440 4000B28F */  lw         $s2, 0x40($sp)
/* FC44 8001F444 3C00B18F */  lw         $s1, 0x3C($sp)
/* FC48 8001F448 3800B08F */  lw         $s0, 0x38($sp)
/* FC4C 8001F44C 0800E003 */  jr         $ra
/* FC50 8001F450 6000BD27 */   addiu     $sp, $sp, 0x60
.size COLLIDE_IntersectLineAndBox, . - COLLIDE_IntersectLineAndBox
