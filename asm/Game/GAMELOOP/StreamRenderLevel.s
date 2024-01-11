.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StreamRenderLevel
/* 1F95C 8002F15C 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1F960 8002F160 6400B7AF */  sw         $s7, 0x64($sp)
/* 1F964 8002F164 21B88000 */  addu       $s7, $a0, $zero
/* 1F968 8002F168 6000B6AF */  sw         $s6, 0x60($sp)
/* 1F96C 8002F16C 21B0C000 */  addu       $s6, $a2, $zero
/* 1F970 8002F170 4800B0AF */  sw         $s0, 0x48($sp)
/* 1F974 8002F174 2180E000 */  addu       $s0, $a3, $zero
/* 1F978 8002F178 21200000 */  addu       $a0, $zero, $zero
/* 1F97C 8002F17C 21288000 */  addu       $a1, $a0, $zero
/* 1F980 8002F180 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 1F984 8002F184 6800BEAF */  sw         $fp, 0x68($sp)
/* 1F988 8002F188 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 1F98C 8002F18C 5800B4AF */  sw         $s4, 0x58($sp)
/* 1F990 8002F190 5400B3AF */  sw         $s3, 0x54($sp)
/* 1F994 8002F194 5000B2AF */  sw         $s2, 0x50($sp)
/* 1F998 8002F198 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 1F99C 8002F19C 0800F18E */  lw         $s1, 0x8($s7)
/* 1F9A0 8002F1A0 F4AC9E8F */  lw         $fp, %gp_rel(theCamera + 0x64)($gp)
/* 1F9A4 8002F1A4 0000328E */  lw         $s2, 0x0($s1)
/* 1F9A8 8002F1A8 BCF4020C */  jal        SetFarColor
/* 1F9AC 8002F1AC 21308000 */   addu      $a2, $a0, $zero
/* 1F9B0 8002F1B0 2120E002 */  addu       $a0, $s7, $zero
/* 1F9B4 8002F1B4 6EBA000C */  jal        UpdateFogSettings
/* 1F9B8 8002F1B8 21282002 */   addu      $a1, $s1, $zero
/* 1F9BC 8002F1BC 54908427 */  addiu      $a0, $gp, %gp_rel(depthQBackColor)
/* 1F9C0 8002F1C0 44002296 */  lhu        $v0, 0x44($s1)
/* 1F9C4 8002F1C4 46002396 */  lhu        $v1, 0x46($s1)
/* 1F9C8 8002F1C8 C8BD9427 */  addiu      $s4, $gp, %gp_rel(gameTrackerX)
/* 1F9CC 8002F1CC 549090AF */  sw         $s0, %gp_rel(depthQBackColor)($gp)
/* 1F9D0 8002F1D0 3000F0AE */  sw         $s0, 0x30($s7)
/* 1F9D4 8002F1D4 509082AF */  sw         $v0, %gp_rel(depthQFogFar)($gp)
/* 1F9D8 8002F1D8 4C9083AF */  sw         $v1, %gp_rel(depthQFogStart)($gp)
/* 1F9DC 8002F1DC F4AC82AF */  sw         $v0, %gp_rel(theCamera + 0x64)($gp)
/* 1F9E0 8002F1E0 B8BA000C */  jal        CheckForNoBlend
/* 1F9E4 8002F1E4 00000000 */   nop
/* 1F9E8 8002F1E8 02004014 */  bnez       $v0, .L8002F1F4
/* 1F9EC 8002F1EC FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 1F9F0 8002F1F0 4C90828F */  lw         $v0, %gp_rel(depthQFogStart)($gp)
.L8002F1F4:
/* 1F9F4 8002F1F4 00000000 */  nop
/* 1F9F8 8002F1F8 489082AF */  sw         $v0, %gp_rel(depthQBlendStart)($gp)
/* 1F9FC 8002F1FC 4C90848F */  lw         $a0, %gp_rel(depthQFogStart)($gp)
/* 1FA00 8002F200 5090858F */  lw         $a1, %gp_rel(depthQFogFar)($gp)
/* 1FA04 8002F204 C8F3020C */  jal        SetFogNearFar
/* 1FA08 8002F208 40010624 */   addiu     $a2, $zero, 0x140
/* 1FA0C 8002F20C 2800448E */  lw         $a0, 0x28($s2)
/* 1FA10 8002F210 2C01858E */  lw         $a1, 0x12C($s4)
/* 1FA14 8002F214 4000868E */  lw         $a2, 0x40($s4)
/* 1FA18 8002F218 B2F0000C */  jal        PIPE3D_AnimateTerrainTextures
/* 1FA1C 8002F21C 2138C002 */   addu      $a3, $s6, $zero
/* 1FA20 8002F220 8000248E */  lw         $a0, 0x80($s1)
/* 1FA24 8002F224 2C01858E */  lw         $a1, 0x12C($s4)
/* 1FA28 8002F228 4000868E */  lw         $a2, 0x40($s4)
/* 1FA2C 8002F22C B2F0000C */  jal        PIPE3D_AnimateTerrainTextures
/* 1FA30 8002F230 2138C002 */   addu      $a3, $s6, $zero
/* 1FA34 8002F234 2120E002 */  addu       $a0, $s7, $zero
/* 1FA38 8002F238 21288002 */  addu       $a1, $s4, $zero
/* 1FA3C 8002F23C 90AC8727 */  addiu      $a3, $gp, %gp_rel(theCamera)
/* 1FA40 8002F240 CBED000C */  jal        PIPE3D_InstanceListTransformAndDraw
/* 1FA44 8002F244 2130C002 */   addu      $a2, $s6, $zero
/* 1FA48 8002F248 F0AC828F */  lw         $v0, %gp_rel(theCamera + 0x60)($gp)
/* 1FA4C 8002F24C 90AC8C27 */  addiu      $t4, $gp, %gp_rel(theCamera)
/* 1FA50 8002F250 03008989 */  lwl        $t1, 0x3($t4)
/* 1FA54 8002F254 00008999 */  lwr        $t1, 0x0($t4)
/* 1FA58 8002F258 04008A85 */  lh         $t2, 0x4($t4)
/* 1FA5C 8002F25C 1B00A9AB */  swl        $t1, 0x1B($sp)
/* 1FA60 8002F260 1800A9BB */  swr        $t1, 0x18($sp)
/* 1FA64 8002F264 1C00AAA7 */  sh         $t2, 0x1C($sp)
/* 1FA68 8002F268 0000498C */  lw         $t1, 0x0($v0)
/* 1FA6C 8002F26C 04004A8C */  lw         $t2, 0x4($v0)
/* 1FA70 8002F270 08004B8C */  lw         $t3, 0x8($v0)
/* 1FA74 8002F274 0C004C8C */  lw         $t4, 0xC($v0)
/* 1FA78 8002F278 2000A9AF */  sw         $t1, 0x20($sp)
/* 1FA7C 8002F27C 2400AAAF */  sw         $t2, 0x24($sp)
/* 1FA80 8002F280 2800ABAF */  sw         $t3, 0x28($sp)
/* 1FA84 8002F284 2C00ACAF */  sw         $t4, 0x2C($sp)
/* 1FA88 8002F288 1000498C */  lw         $t1, 0x10($v0)
/* 1FA8C 8002F28C 14004A8C */  lw         $t2, 0x14($v0)
/* 1FA90 8002F290 18004B8C */  lw         $t3, 0x18($v0)
/* 1FA94 8002F294 1C004C8C */  lw         $t4, 0x1C($v0)
/* 1FA98 8002F298 3000A9AF */  sw         $t1, 0x30($sp)
/* 1FA9C 8002F29C 3400AAAF */  sw         $t2, 0x34($sp)
/* 1FAA0 8002F2A0 3800ABAF */  sw         $t3, 0x38($sp)
/* 1FAA4 8002F2A4 3C00ACAF */  sw         $t4, 0x3C($sp)
/* 1FAA8 8002F2A8 4400428E */  lw         $v0, 0x44($s2)
/* 1FAAC 8002F2AC 00000000 */  nop
/* 1FAB0 8002F2B0 3B004018 */  blez       $v0, .L8002F3A0
/* 1FAB4 8002F2B4 21880000 */   addu      $s1, $zero, $zero
/* 1FAB8 8002F2B8 90AC9527 */  addiu      $s5, $gp, %gp_rel(theCamera)
/* 1FABC 8002F2BC 21982002 */  addu       $s3, $s1, $zero
.L8002F2C0:
/* 1FAC0 8002F2C0 4800428E */  lw         $v0, 0x48($s2)
/* 1FAC4 8002F2C4 00000000 */  nop
/* 1FAC8 8002F2C8 21805300 */  addu       $s0, $v0, $s3
/* 1FACC 8002F2CC 1A000286 */  lh         $v0, 0x1A($s0)
/* 1FAD0 8002F2D0 00000000 */  nop
/* 1FAD4 8002F2D4 2D004004 */  bltz       $v0, .L8002F38C
/* 1FAD8 8002F2D8 00000000 */   nop
/* 1FADC 8002F2DC 12000296 */  lhu        $v0, 0x12($s0)
/* 1FAE0 8002F2E0 00000000 */  nop
/* 1FAE4 8002F2E4 01004230 */  andi       $v0, $v0, 0x1
/* 1FAE8 8002F2E8 28004014 */  bnez       $v0, .L8002F38C
/* 1FAEC 8002F2EC 2000A427 */   addiu     $a0, $sp, 0x20
/* 1FAF0 8002F2F0 4000A527 */  addiu      $a1, $sp, 0x40
/* 1FAF4 8002F2F4 1800A797 */  lhu        $a3, 0x18($sp)
/* 1FAF8 8002F2F8 0C000296 */  lhu        $v0, 0xC($s0)
/* 1FAFC 8002F2FC 1A00A397 */  lhu        $v1, 0x1A($sp)
/* 1FB00 8002F300 F0AC868F */  lw         $a2, %gp_rel(theCamera + 0x60)($gp)
/* 1FB04 8002F304 2338E200 */  subu       $a3, $a3, $v0
/* 1FB08 8002F308 1400C624 */  addiu      $a2, $a2, 0x14
/* 1FB0C 8002F30C 90AC87A7 */  sh         $a3, %gp_rel(theCamera)($gp)
/* 1FB10 8002F310 0E000296 */  lhu        $v0, 0xE($s0)
/* 1FB14 8002F314 23380700 */  negu       $a3, $a3
/* 1FB18 8002F318 23186200 */  subu       $v1, $v1, $v0
/* 1FB1C 8002F31C 92AC83A7 */  sh         $v1, %gp_rel(theCamera + 0x2)($gp)
/* 1FB20 8002F320 10000896 */  lhu        $t0, 0x10($s0)
/* 1FB24 8002F324 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 1FB28 8002F328 23180300 */  negu       $v1, $v1
/* 1FB2C 8002F32C 4000A7A7 */  sh         $a3, 0x40($sp)
/* 1FB30 8002F330 4200A3A7 */  sh         $v1, 0x42($sp)
/* 1FB34 8002F334 23104800 */  subu       $v0, $v0, $t0
/* 1FB38 8002F338 94AC82A7 */  sh         $v0, %gp_rel(theCamera + 0x4)($gp)
/* 1FB3C 8002F33C 23100200 */  negu       $v0, $v0
/* 1FB40 8002F340 1AF2020C */  jal        ApplyMatrix
/* 1FB44 8002F344 4400A2A7 */   sh        $v0, 0x44($sp)
/* 1FB48 8002F348 21200002 */  addu       $a0, $s0, $zero
/* 1FB4C 8002F34C 1CBA868F */  lw         $a2, %gp_rel(gPolytopeList)($gp)
/* 1FB50 8002F350 30E5010C */  jal        BSP_MarkVisibleLeaves_S
/* 1FB54 8002F354 2128A002 */   addu      $a1, $s5, $zero
/* 1FB58 8002F358 21284002 */  addu       $a1, $s2, $zero
/* 1FB5C 8002F35C 4000878E */  lw         $a3, 0x40($s4)
/* 1FB60 8002F360 1CBA848F */  lw         $a0, %gp_rel(gPolytopeList)($gp)
/* 1FB64 8002F364 0C000226 */  addiu      $v0, $s0, 0xC
/* 1FB68 8002F368 1000B6AF */  sw         $s6, 0x10($sp)
/* 1FB6C 8002F36C 1400A2AF */  sw         $v0, 0x14($sp)
/* 1FB70 8002F370 5001828E */  lw         $v0, 0x150($s4)
/* 1FB74 8002F374 00000000 */  nop
/* 1FB78 8002F378 09F84000 */  jalr       $v0
/* 1FB7C 8002F37C 2130A002 */   addu      $a2, $s5, $zero
/* 1FB80 8002F380 4000838E */  lw         $v1, 0x40($s4)
/* 1FB84 8002F384 00000000 */  nop
/* 1FB88 8002F388 040062AC */  sw         $v0, 0x4($v1)
.L8002F38C:
/* 1FB8C 8002F38C 4400428E */  lw         $v0, 0x44($s2)
/* 1FB90 8002F390 01003126 */  addiu      $s1, $s1, 0x1
/* 1FB94 8002F394 2A102202 */  slt        $v0, $s1, $v0
/* 1FB98 8002F398 C9FF4014 */  bnez       $v0, .L8002F2C0
/* 1FB9C 8002F39C 24007326 */   addiu     $s3, $s3, 0x24
.L8002F3A0:
/* 1FBA0 8002F3A0 2CBA868F */  lw         $a2, %gp_rel(gLightInfo)($gp)
/* 1FBA4 8002F3A4 4CBA8787 */  lh         $a3, %gp_rel(D_800D2FE4)($gp)
/* 1FBA8 8002F3A8 90AC8527 */  addiu      $a1, $gp, %gp_rel(theCamera)
/* 1FBAC 8002F3AC 90AC8C27 */  addiu      $t4, $gp, %gp_rel(theCamera)
/* 1FBB0 8002F3B0 1B00A98B */  lwl        $t1, 0x1B($sp)
/* 1FBB4 8002F3B4 1800A99B */  lwr        $t1, 0x18($sp)
/* 1FBB8 8002F3B8 1C00AA87 */  lh         $t2, 0x1C($sp)
/* 1FBBC 8002F3BC 030089A9 */  swl        $t1, 0x3($t4)
/* 1FBC0 8002F3C0 000089B9 */  swr        $t1, 0x0($t4)
/* 1FBC4 8002F3C4 04008AA5 */  sh         $t2, 0x4($t4)
/* 1FBC8 8002F3C8 F0AC838F */  lw         $v1, %gp_rel(theCamera + 0x60)($gp)
/* 1FBCC 8002F3CC 01000224 */  addiu      $v0, $zero, 0x1
/* 1FBD0 8002F3D0 48BA82AF */  sw         $v0, %gp_rel(InStreamUnit)($gp)
/* 1FBD4 8002F3D4 2000A98F */  lw         $t1, 0x20($sp)
/* 1FBD8 8002F3D8 2400AA8F */  lw         $t2, 0x24($sp)
/* 1FBDC 8002F3DC 2800AB8F */  lw         $t3, 0x28($sp)
/* 1FBE0 8002F3E0 2C00AC8F */  lw         $t4, 0x2C($sp)
/* 1FBE4 8002F3E4 000069AC */  sw         $t1, 0x0($v1)
/* 1FBE8 8002F3E8 04006AAC */  sw         $t2, 0x4($v1)
/* 1FBEC 8002F3EC 08006BAC */  sw         $t3, 0x8($v1)
/* 1FBF0 8002F3F0 0C006CAC */  sw         $t4, 0xC($v1)
/* 1FBF4 8002F3F4 3000A98F */  lw         $t1, 0x30($sp)
/* 1FBF8 8002F3F8 3400AA8F */  lw         $t2, 0x34($sp)
/* 1FBFC 8002F3FC 3800AB8F */  lw         $t3, 0x38($sp)
/* 1FC00 8002F400 3C00AC8F */  lw         $t4, 0x3C($sp)
/* 1FC04 8002F404 100069AC */  sw         $t1, 0x10($v1)
/* 1FC08 8002F408 14006AAC */  sw         $t2, 0x14($v1)
/* 1FC0C 8002F40C 18006BAC */  sw         $t3, 0x18($v1)
/* 1FC10 8002F410 1C006CAC */  sw         $t4, 0x1C($v1)
/* 1FC14 8002F414 E6F7000C */  jal        SBSP_IntroduceInstancesAndLights
/* 1FC18 8002F418 21204002 */   addu      $a0, $s2, $zero
/* 1FC1C 8002F41C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 1FC20 8002F420 F4AC9EAF */  sw         $fp, %gp_rel(theCamera + 0x64)($gp)
/* 1FC24 8002F424 3800438C */  lw         $v1, 0x38($v0)
/* 1FC28 8002F428 0000E28E */  lw         $v0, 0x0($s7)
/* 1FC2C 8002F42C 48BA80AF */  sw         $zero, %gp_rel(InStreamUnit)($gp)
/* 1FC30 8002F430 0E006214 */  bne        $v1, $v0, .L8002F46C
/* 1FC34 8002F434 00000000 */   nop
/* 1FC38 8002F438 54BA8927 */  addiu      $t1, $gp, %gp_rel(StackSave)
/* 1FC3C 8002F43C 50BA96AF */  sw         $s6, %gp_rel(hackOT)($gp)
/* 1FC40 8002F440 00003DAD */  sw         $sp, 0x0($t1)
/* 1FC44 8002F444 801F0C3C */  lui        $t4, (0x1F8003F0 >> 16)
/* 1FC48 8002F448 F0038C35 */  ori        $t4, $t4, (0x1F8003F0 & 0xFFFF)
/* 1FC4C 8002F44C 21E88001 */  addu       $sp, $t4, $zero
/* 1FC50 8002F450 08BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1FC54 8002F454 50BA858F */  lw         $a1, %gp_rel(hackOT)($gp)
/* 1FC58 8002F458 F0AC868F */  lw         $a2, %gp_rel(theCamera + 0x60)($gp)
/* 1FC5C 8002F45C C613010C */  jal        FX_DrawReaver
/* 1FC60 8002F460 00000000 */   nop
/* 1FC64 8002F464 54BA8A27 */  addiu      $t2, $gp, %gp_rel(StackSave)
/* 1FC68 8002F468 00005D8D */  lw         $sp, 0x0($t2)
.L8002F46C:
/* 1FC6C 8002F46C 00000000 */  nop
/* 1FC70 8002F470 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 1FC74 8002F474 6800BE8F */  lw         $fp, 0x68($sp)
/* 1FC78 8002F478 6400B78F */  lw         $s7, 0x64($sp)
/* 1FC7C 8002F47C 6000B68F */  lw         $s6, 0x60($sp)
/* 1FC80 8002F480 5C00B58F */  lw         $s5, 0x5C($sp)
/* 1FC84 8002F484 5800B48F */  lw         $s4, 0x58($sp)
/* 1FC88 8002F488 5400B38F */  lw         $s3, 0x54($sp)
/* 1FC8C 8002F48C 5000B28F */  lw         $s2, 0x50($sp)
/* 1FC90 8002F490 4C00B18F */  lw         $s1, 0x4C($sp)
/* 1FC94 8002F494 4800B08F */  lw         $s0, 0x48($sp)
/* 1FC98 8002F498 21100000 */  addu       $v0, $zero, $zero
/* 1FC9C 8002F49C 0800E003 */  jr         $ra
/* 1FCA0 8002F4A0 7000BD27 */   addiu     $sp, $sp, 0x70
.size StreamRenderLevel, . - StreamRenderLevel
