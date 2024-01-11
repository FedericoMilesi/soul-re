.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WCBEGG_Process
/* 7FA84 8008F284 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 7FA88 8008F288 2400B1AF */  sw         $s1, 0x24($sp)
/* 7FA8C 8008F28C 21888000 */  addu       $s1, $a0, $zero
/* 7FA90 8008F290 3800B6AF */  sw         $s6, 0x38($sp)
/* 7FA94 8008F294 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 7FA98 8008F298 3400B5AF */  sw         $s5, 0x34($sp)
/* 7FA9C 8008F29C 3000B4AF */  sw         $s4, 0x30($sp)
/* 7FAA0 8008F2A0 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 7FAA4 8008F2A4 2800B2AF */  sw         $s2, 0x28($sp)
/* 7FAA8 8008F2A8 2000B0AF */  sw         $s0, 0x20($sp)
/* 7FAAC 8008F2AC 6C01358E */  lw         $s5, 0x16C($s1)
/* 7FAB0 8008F2B0 9006020C */  jal        MON_GetTime
/* 7FAB4 8008F2B4 21B0A000 */   addu      $s6, $a1, $zero
/* 7FAB8 8008F2B8 21904000 */  addu       $s2, $v0, $zero
/* 7FABC 8008F2BC 04C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 7FAC0 8008F2C0 0980023C */  lui        $v0, %hi(WCBEGG_Collide)
/* 7FAC4 8008F2C4 23A04302 */  subu       $s4, $s2, $v1
/* 7FAC8 8008F2C8 0C01238E */  lw         $v1, 0x10C($s1)
/* 7FACC 8008F2CC 3CF94224 */  addiu      $v0, $v0, %lo(WCBEGG_Collide)
/* 7FAD0 8008F2D0 09006214 */  bne        $v1, $v0, .L8008F2F8
/* 7FAD4 8008F2D4 0D80043C */   lui       $a0, %hi(WORSHIP_FunctionTable + 0x2C)
/* 7FAD8 8008F2D8 4801238E */  lw         $v1, 0x148($s1)
/* 7FADC 8008F2DC F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 7FAE0 8008F2E0 00000000 */  nop
/* 7FAE4 8008F2E4 04006214 */  bne        $v1, $v0, .L8008F2F8
/* 7FAE8 8008F2E8 0980023C */   lui       $v0, %hi(WCBEGG_ExplodeCollide)
/* 7FAEC 8008F2EC B8F74224 */  addiu      $v0, $v0, %lo(WCBEGG_ExplodeCollide)
/* 7FAF0 8008F2F0 0C0122AE */  sw         $v0, 0x10C($s1)
/* 7FAF4 8008F2F4 0D80043C */  lui        $a0, %hi(WORSHIP_FunctionTable + 0x2C)
.L8008F2F8:
/* 7FAF8 8008F2F8 14F9000C */  jal        OBTABLE_FindObject
/* 7FAFC 8008F2FC FC1B8424 */   addiu     $a0, $a0, %lo(WORSHIP_FunctionTable + 0x2C)
/* 7FB00 8008F300 4F004010 */  beqz       $v0, .L8008F440
/* 7FB04 8008F304 00000000 */   nop
/* 7FB08 8008F308 1C00428C */  lw         $v0, 0x1C($v0)
/* 7FB0C 8008F30C 00000000 */  nop
/* 7FB10 8008F310 0400538C */  lw         $s3, 0x4($v0)
/* 7FB14 8008F314 00000000 */  nop
/* 7FB18 8008F318 0E006386 */  lh         $v1, 0xE($s3)
/* 7FB1C 8008F31C 2800A48E */  lw         $a0, 0x28($s5)
/* 7FB20 8008F320 40110300 */  sll        $v0, $v1, 5
/* 7FB24 8008F324 21104300 */  addu       $v0, $v0, $v1
/* 7FB28 8008F328 21808200 */  addu       $s0, $a0, $v0
/* 7FB2C 8008F32C 2A109002 */  slt        $v0, $s4, $s0
/* 7FB30 8008F330 0B004010 */  beqz       $v0, .L8008F360
/* 7FB34 8008F334 2A105002 */   slt       $v0, $s2, $s0
/* 7FB38 8008F338 09004014 */  bnez       $v0, .L8008F360
/* 7FB3C 8008F33C 21202002 */   addu      $a0, $s1, $zero
/* 7FB40 8008F340 21280000 */  addu       $a1, $zero, $zero
/* 7FB44 8008F344 02000624 */  addiu      $a2, $zero, 0x2
/* 7FB48 8008F348 2138A000 */  addu       $a3, $a1, $zero
/* 7FB4C 8008F34C 2110C000 */  addu       $v0, $a2, $zero
/* 7FB50 8008F350 1000A0AF */  sw         $zero, 0x10($sp)
/* 7FB54 8008F354 1400A2AF */  sw         $v0, 0x14($sp)
/* 7FB58 8008F358 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 7FB5C 8008F35C 1800A0AF */   sw        $zero, 0x18($sp)
.L8008F360:
/* 7FB60 8008F360 10006286 */  lh         $v0, 0x10($s3)
/* 7FB64 8008F364 00000000 */  nop
/* 7FB68 8008F368 40190200 */  sll        $v1, $v0, 5
/* 7FB6C 8008F36C 21186200 */  addu       $v1, $v1, $v0
/* 7FB70 8008F370 21800302 */  addu       $s0, $s0, $v1
/* 7FB74 8008F374 2A109002 */  slt        $v0, $s4, $s0
/* 7FB78 8008F378 23004010 */  beqz       $v0, .L8008F408
/* 7FB7C 8008F37C 2A105002 */   slt       $v0, $s2, $s0
/* 7FB80 8008F380 22004014 */  bnez       $v0, .L8008F40C
/* 7FB84 8008F384 21202002 */   addu      $a0, $s1, $zero
/* 7FB88 8008F388 92D1000C */  jal        INSTANCE_Query
/* 7FB8C 8008F38C 03000524 */   addiu     $a1, $zero, 0x3
/* 7FB90 8008F390 0100033C */  lui        $v1, (0x10000 >> 16)
/* 7FB94 8008F394 24104300 */  and        $v0, $v0, $v1
/* 7FB98 8008F398 0C004010 */  beqz       $v0, .L8008F3CC
/* 7FB9C 8008F39C 04000624 */   addiu     $a2, $zero, 0x4
/* 7FBA0 8008F3A0 21202002 */  addu       $a0, $s1, $zero
/* 7FBA4 8008F3A4 21280000 */  addu       $a1, $zero, $zero
/* 7FBA8 8008F3A8 2138A000 */  addu       $a3, $a1, $zero
/* 7FBAC 8008F3AC 01000224 */  addiu      $v0, $zero, 0x1
/* 7FBB0 8008F3B0 1000A0AF */  sw         $zero, 0x10($sp)
/* 7FBB4 8008F3B4 1400A2AF */  sw         $v0, 0x14($sp)
/* 7FBB8 8008F3B8 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 7FBBC 8008F3BC 1800A0AF */   sw        $zero, 0x18($sp)
/* 7FBC0 8008F3C0 0980023C */  lui        $v0, %hi(WCBEGG_ExplodeProcess)
/* 7FBC4 8008F3C4 FE3C0208 */  j          .L8008F3F8
/* 7FBC8 8008F3C8 78F44224 */   addiu     $v0, $v0, %lo(WCBEGG_ExplodeProcess)
.L8008F3CC:
/* 7FBCC 8008F3CC 21202002 */  addu       $a0, $s1, $zero
/* 7FBD0 8008F3D0 21280000 */  addu       $a1, $zero, $zero
/* 7FBD4 8008F3D4 03000624 */  addiu      $a2, $zero, 0x3
/* 7FBD8 8008F3D8 2138A000 */  addu       $a3, $a1, $zero
/* 7FBDC 8008F3DC 01000224 */  addiu      $v0, $zero, 0x1
/* 7FBE0 8008F3E0 1000A0AF */  sw         $zero, 0x10($sp)
/* 7FBE4 8008F3E4 1400A2AF */  sw         $v0, 0x14($sp)
/* 7FBE8 8008F3E8 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 7FBEC 8008F3EC 1800A0AF */   sw        $zero, 0x18($sp)
/* 7FBF0 8008F3F0 0980023C */  lui        $v0, %hi(WCBEGG_SplitProcess)
/* 7FBF4 8008F3F4 B8F54224 */  addiu      $v0, $v0, %lo(WCBEGG_SplitProcess)
.L8008F3F8:
/* 7FBF8 8008F3F8 080122AE */  sw         $v0, 0x108($s1)
/* 7FBFC 8008F3FC 9006020C */  jal        MON_GetTime
/* 7FC00 8008F400 21202002 */   addu      $a0, $s1, $zero
/* 7FC04 8008F404 2800A2AE */  sw         $v0, 0x28($s5)
.L8008F408:
/* 7FC08 8008F408 21202002 */  addu       $a0, $s1, $zero
.L8008F40C:
/* 7FC0C 8008F40C 633C020C */  jal        WCBEGG_ShouldIgniteEgg
/* 7FC10 8008F410 21286002 */   addu      $a1, $s3, $zero
/* 7FC14 8008F414 05004010 */  beqz       $v0, .L8008F42C
/* 7FC18 8008F418 21202002 */   addu      $a0, $s1, $zero
/* 7FC1C 8008F41C 8000053C */  lui        $a1, (0x800029 >> 16)
/* 7FC20 8008F420 2900A534 */  ori        $a1, $a1, (0x800029 & 0xFFFF)
/* 7FC24 8008F424 A1D1000C */  jal        INSTANCE_Post
/* 7FC28 8008F428 01000624 */   addiu     $a2, $zero, 0x1
.L8008F42C:
/* 7FC2C 8008F42C 21202002 */  addu       $a0, $s1, $zero
/* 7FC30 8008F430 09AE010C */  jal        ProcessPhysicalObject
/* 7FC34 8008F434 2128C002 */   addu      $a1, $s6, $zero
/* 7FC38 8008F438 143D0208 */  j          .L8008F450
/* 7FC3C 8008F43C 00000000 */   nop
.L8008F440:
/* 7FC40 8008F440 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 7FC44 8008F444 21202002 */   addu      $a0, $s1, $zero
/* 7FC48 8008F448 85D1000C */  jal        INSTANCE_KillInstance
/* 7FC4C 8008F44C 21202002 */   addu      $a0, $s1, $zero
.L8008F450:
/* 7FC50 8008F450 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 7FC54 8008F454 3800B68F */  lw         $s6, 0x38($sp)
/* 7FC58 8008F458 3400B58F */  lw         $s5, 0x34($sp)
/* 7FC5C 8008F45C 3000B48F */  lw         $s4, 0x30($sp)
/* 7FC60 8008F460 2C00B38F */  lw         $s3, 0x2C($sp)
/* 7FC64 8008F464 2800B28F */  lw         $s2, 0x28($sp)
/* 7FC68 8008F468 2400B18F */  lw         $s1, 0x24($sp)
/* 7FC6C 8008F46C 2000B08F */  lw         $s0, 0x20($sp)
/* 7FC70 8008F470 0800E003 */  jr         $ra
/* 7FC74 8008F474 4000BD27 */   addiu     $sp, $sp, 0x40
.size WCBEGG_Process, . - WCBEGG_Process
