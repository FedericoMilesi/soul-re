.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_LevelLoadAndInit
/* 1EA14 8002E214 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1EA18 8002E218 1000B0AF */  sw         $s0, 0x10($sp)
/* 1EA1C 8002E21C 21808000 */  addu       $s0, $a0, $zero
/* 1EA20 8002E220 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1EA24 8002E224 2198A000 */  addu       $s3, $a1, $zero
/* 1EA28 8002E228 2000BFAF */  sw         $ra, 0x20($sp)
/* 1EA2C 8002E22C 1800B2AF */  sw         $s2, 0x18($sp)
/* 1EA30 8002E230 D34A020C */  jal        G2Anim_ResetInternalState
/* 1EA34 8002E234 1400B1AF */   sw        $s1, 0x14($sp)
/* 1EA38 8002E238 20BA848F */  lw         $a0, %gp_rel(instanceList)($gp)
/* 1EA3C 8002E23C 24BA858F */  lw         $a1, %gp_rel(instancePool)($gp)
/* 1EA40 8002E240 70C9000C */  jal        INSTANCE_InitInstanceList
/* 1EA44 8002E244 2C0060AE */   sw        $zero, 0x2C($s3)
/* 1EA48 8002E248 5CB7000C */  jal        GAMELOOP_ClearGameTracker
/* 1EA4C 8002E24C 00000000 */   nop
/* 1EA50 8002E250 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 1EA54 8002E254 BB57000C */  jal        CAMERA_Initialize
/* 1EA58 8002E258 00000000 */   nop
/* 1EA5C 8002E25C 34BA848F */  lw         $a0, %gp_rel(planningPool)($gp)
/* 1EA60 8002E260 6760020C */  jal        PLANAPI_InitPlanning
/* 1EA64 8002E264 00000000 */   nop
/* 1EA68 8002E268 30BA848F */  lw         $a0, %gp_rel(enemyPlanPool)($gp)
/* 1EA6C 8002E26C B959020C */  jal        ENMYPLAN_InitEnemyPlanPool
/* 1EA70 8002E270 00000000 */   nop
/* 1EA74 8002E274 58BA848F */  lw         $a0, %gp_rel(fxTracker)($gp)
/* 1EA78 8002E278 5809010C */  jal        FX_Init
/* 1EA7C 8002E27C 00000000 */   nop
/* 1EA80 8002E280 E96C010C */  jal        WARPGATE_Init
/* 1EA84 8002E284 00000000 */   nop
/* 1EA88 8002E288 63AA000C */  jal        DRAW_InitShadow
/* 1EA8C 8002E28C 00000000 */   nop
/* 1EA90 8002E290 70B8000C */  jal        GAMELOOP_InitStandardObjects
/* 1EA94 8002E294 00000000 */   nop
/* 1EA98 8002E298 21200002 */  addu       $a0, $s0, $zero
/* 1EA9C 8002E29C F0B7000C */  jal        LoadLevels
/* 1EAA0 8002E2A0 21286002 */   addu      $a1, $s3, $zero
/* 1EAA4 8002E2A4 21904000 */  addu       $s2, $v0, $zero
.L8002E2A8:
/* 1EAA8 8002E2A8 7580010C */  jal        STREAM_PollLoadQueue
/* 1EAAC 8002E2AC 00000000 */   nop
/* 1EAB0 8002E2B0 FDFF4014 */  bnez       $v0, .L8002E2A8
/* 1EAB4 8002E2B4 0D80023C */   lui       $v0, %hi(objectAccess)
/* 1EAB8 8002E2B8 3CA24224 */  addiu      $v0, $v0, %lo(objectAccess)
/* 1EABC 8002E2BC 3400438C */  lw         $v1, 0x34($v0)
/* 1EAC0 8002E2C0 1400448C */  lw         $a0, 0x14($v0)
/* 1EAC4 8002E2C4 CC0163AE */  sw         $v1, 0x1CC($s3)
/* 1EAC8 8002E2C8 0800458E */  lw         $a1, 0x8($s2)
/* 1EACC 8002E2CC 78016296 */  lhu        $v0, 0x178($s3)
/* 1EAD0 8002E2D0 7800A38C */  lw         $v1, 0x78($a1)
/* 1EAD4 8002E2D4 7C9184AF */  sw         $a0, %gp_rel(fontsObject)($gp)
/* 1EAD8 8002E2D8 4CBA82A7 */  sh         $v0, %gp_rel(RENDER_currentStreamUnitID)($gp)
/* 1EADC 8002E2DC 18006018 */  blez       $v1, .L8002E340
/* 1EAE0 8002E2E0 21880000 */   addu      $s1, $zero, $zero
/* 1EAE4 8002E2E4 21802002 */  addu       $s0, $s1, $zero
.L8002E2E8:
/* 1EAE8 8002E2E8 7C00A48C */  lw         $a0, 0x7C($a1)
/* 1EAEC 8002E2EC 0D80053C */  lui        $a1, %hi(D_800D0778)
/* 1EAF0 8002E2F0 7807A524 */  addiu      $a1, $a1, %lo(D_800D0778)
/* 1EAF4 8002E2F4 1CD2010C */  jal        strcmpi
/* 1EAF8 8002E2F8 21209000 */   addu      $a0, $a0, $s0
/* 1EAFC 8002E2FC 09004014 */  bnez       $v0, .L8002E324
/* 1EB00 8002E300 00000000 */   nop
/* 1EB04 8002E304 0800428E */  lw         $v0, 0x8($s2)
/* 1EB08 8002E308 00000000 */  nop
/* 1EB0C 8002E30C 7C00448C */  lw         $a0, 0x7C($v0)
/* 1EB10 8002E310 00004586 */  lh         $a1, 0x0($s2)
/* 1EB14 8002E314 6ACB000C */  jal        INSTANCE_IntroduceInstance
/* 1EB18 8002E318 21209000 */   addu      $a0, $a0, $s0
/* 1EB1C 8002E31C D0B80008 */  j          .L8002E340
/* 1EB20 8002E320 00000000 */   nop
.L8002E324:
/* 1EB24 8002E324 0800458E */  lw         $a1, 0x8($s2)
/* 1EB28 8002E328 00000000 */  nop
/* 1EB2C 8002E32C 7800A28C */  lw         $v0, 0x78($a1)
/* 1EB30 8002E330 01003126 */  addiu      $s1, $s1, 0x1
/* 1EB34 8002E334 2A102202 */  slt        $v0, $s1, $v0
/* 1EB38 8002E338 EBFF4014 */  bnez       $v0, .L8002E2E8
/* 1EB3C 8002E33C 4C001026 */   addiu     $s0, $s0, 0x4C
.L8002E340:
/* 1EB40 8002E340 2C00638E */  lw         $v1, 0x2C($s3)
/* 1EB44 8002E344 00000000 */  nop
/* 1EB48 8002E348 1C00628C */  lw         $v0, 0x1C($v1)
/* 1EB4C 8002E34C 00000000 */  nop
/* 1EB50 8002E350 1C00428C */  lw         $v0, 0x1C($v0)
/* 1EB54 8002E354 00000000 */  nop
/* 1EB58 8002E358 240062AC */  sw         $v0, 0x24($v1)
/* 1EB5C 8002E35C 2C00658E */  lw         $a1, 0x2C($s3)
/* 1EB60 8002E360 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 1EB64 8002E364 7B58000C */  jal        CAMERA_SetInstanceFocus
/* 1EB68 8002E368 00000000 */   nop
/* 1EB6C 8002E36C 2C00628E */  lw         $v0, 0x2C($s3)
/* 1EB70 8002E370 00000000 */  nop
/* 1EB74 8002E374 5C004324 */  addiu      $v1, $v0, 0x5C
/* 1EB78 8002E378 5C004294 */  lhu        $v0, 0x5C($v0)
/* 1EB7C 8002E37C 02006494 */  lhu        $a0, 0x2($v1)
/* 1EB80 8002E380 04006394 */  lhu        $v1, 0x4($v1)
/* 1EB84 8002E384 90AC82A7 */  sh         $v0, %gp_rel(theCamera)($gp)
/* 1EB88 8002E388 90AC8227 */  addiu      $v0, $gp, %gp_rel(theCamera)
/* 1EB8C 8002E38C 020044A4 */  sh         $a0, 0x2($v0)
/* 1EB90 8002E390 040043A4 */  sh         $v1, 0x4($v0)
/* 1EB94 8002E394 0800428E */  lw         $v0, 0x8($s2)
/* 1EB98 8002E398 00000000 */  nop
/* 1EB9C 8002E39C 46004494 */  lhu        $a0, 0x46($v0)
/* 1EBA0 8002E3A0 44004594 */  lhu        $a1, 0x44($v0)
/* 1EBA4 8002E3A4 C8F3020C */  jal        SetFogNearFar
/* 1EBA8 8002E3A8 40010624 */   addiu     $a2, $zero, 0x140
/* 1EBAC 8002E3AC 21200000 */  addu       $a0, $zero, $zero
/* 1EBB0 8002E3B0 21288000 */  addu       $a1, $a0, $zero
/* 1EBB4 8002E3B4 BCF4020C */  jal        SetFarColor
/* 1EBB8 8002E3B8 21308000 */   addu      $a2, $a0, $zero
/* 1EBBC 8002E3BC 0800428E */  lw         $v0, 0x8($s2)
/* 1EBC0 8002E3C0 00000000 */  nop
/* 1EBC4 8002E3C4 3C004290 */  lbu        $v0, 0x3C($v0)
/* 1EBC8 8002E3C8 A4BD8327 */  addiu      $v1, $gp, %gp_rel(clearRect)
/* 1EBCC 8002E3CC 040062A0 */  sb         $v0, 0x4($v1)
/* 1EBD0 8002E3D0 0800428E */  lw         $v0, 0x8($s2)
/* 1EBD4 8002E3D4 00000000 */  nop
/* 1EBD8 8002E3D8 3D004290 */  lbu        $v0, 0x3D($v0)
/* 1EBDC 8002E3DC 00000000 */  nop
/* 1EBE0 8002E3E0 050062A0 */  sb         $v0, 0x5($v1)
/* 1EBE4 8002E3E4 0800428E */  lw         $v0, 0x8($s2)
/* 1EBE8 8002E3E8 00000000 */  nop
/* 1EBEC 8002E3EC 3E004290 */  lbu        $v0, 0x3E($v0)
/* 1EBF0 8002E3F0 00000000 */  nop
/* 1EBF4 8002E3F4 060062A0 */  sb         $v0, 0x6($v1)
/* 1EBF8 8002E3F8 0800428E */  lw         $v0, 0x8($s2)
/* 1EBFC 8002E3FC 00000000 */  nop
/* 1EC00 8002E400 3C004290 */  lbu        $v0, 0x3C($v0)
/* 1EC04 8002E404 B4BD8327 */  addiu      $v1, $gp, %gp_rel(clearRect + 0x10)
/* 1EC08 8002E408 040062A0 */  sb         $v0, 0x4($v1)
/* 1EC0C 8002E40C 0800428E */  lw         $v0, 0x8($s2)
/* 1EC10 8002E410 00000000 */  nop
/* 1EC14 8002E414 3D004290 */  lbu        $v0, 0x3D($v0)
/* 1EC18 8002E418 00000000 */  nop
/* 1EC1C 8002E41C 050062A0 */  sb         $v0, 0x5($v1)
/* 1EC20 8002E420 0800428E */  lw         $v0, 0x8($s2)
/* 1EC24 8002E424 00000000 */  nop
/* 1EC28 8002E428 3E004290 */  lbu        $v0, 0x3E($v0)
/* 1EC2C 8002E42C 00000000 */  nop
/* 1EC30 8002E430 060062A0 */  sb         $v0, 0x6($v1)
/* 1EC34 8002E434 0A000224 */  addiu      $v0, $zero, 0xA
/* 1EC38 8002E438 D00062A6 */  sh         $v0, 0xD0($s3)
/* 1EC3C 8002E43C 1E000224 */  addiu      $v0, $zero, 0x1E
/* 1EC40 8002E440 700160A6 */  sh         $zero, 0x170($s3)
/* 1EC44 8002E444 CC0062A6 */  sh         $v0, 0xCC($s3)
/* 1EC48 8002E448 CE0062A6 */  sh         $v0, 0xCE($s3)
/* 1EC4C 8002E44C 0800428E */  lw         $v0, 0x8($s2)
/* 1EC50 8002E450 00000000 */  nop
/* 1EC54 8002E454 7400438C */  lw         $v1, 0x74($v0)
/* 1EC58 8002E458 00000000 */  nop
/* 1EC5C 8002E45C 10006010 */  beqz       $v1, .L8002E4A0
/* 1EC60 8002E460 21300000 */   addu      $a2, $zero, $zero
/* 1EC64 8002E464 06006294 */  lhu        $v0, 0x6($v1)
/* 1EC68 8002E468 00000000 */  nop
/* 1EC6C 8002E46C 01004234 */  ori        $v0, $v0, 0x1
/* 1EC70 8002E470 060062A4 */  sh         $v0, 0x6($v1)
/* 1EC74 8002E474 0800428E */  lw         $v0, 0x8($s2)
/* 1EC78 8002E478 00000000 */  nop
/* 1EC7C 8002E47C 7400458C */  lw         $a1, 0x74($v0)
/* 1EC80 8002E480 2C00648E */  lw         $a0, 0x2C($s3)
/* 1EC84 8002E484 7279000C */  jal        SIGNAL_HandleSignal
/* 1EC88 8002E488 0800A524 */   addiu     $a1, $a1, 0x8
/* 1EC8C 8002E48C 0800428E */  lw         $v0, 0x8($s2)
/* 1EC90 8002E490 00000000 */  nop
/* 1EC94 8002E494 7400448C */  lw         $a0, 0x74($v0)
/* 1EC98 8002E498 3483010C */  jal        EVENT_AddSignalToReset
/* 1EC9C 8002E49C 00000000 */   nop
.L8002E4A0:
/* 1ECA0 8002E4A0 340160AE */  sw         $zero, 0x134($s3)
/* 1ECA4 8002E4A4 0800428E */  lw         $v0, 0x8($s2)
/* 1ECA8 8002E4A8 00000000 */  nop
/* 1ECAC 8002E4AC C000438C */  lw         $v1, 0xC0($v0)
/* 1ECB0 8002E4B0 00000000 */  nop
/* 1ECB4 8002E4B4 14006010 */  beqz       $v1, .L8002E508
/* 1ECB8 8002E4B8 00000000 */   nop
/* 1ECBC 8002E4BC 2C00628E */  lw         $v0, 0x2C($s3)
/* 1ECC0 8002E4C0 00000000 */  nop
/* 1ECC4 8002E4C4 10004010 */  beqz       $v0, .L8002E508
/* 1ECC8 8002E4C8 21300000 */   addu      $a2, $zero, $zero
/* 1ECCC 8002E4CC 06006294 */  lhu        $v0, 0x6($v1)
/* 1ECD0 8002E4D0 00000000 */  nop
/* 1ECD4 8002E4D4 01004234 */  ori        $v0, $v0, 0x1
/* 1ECD8 8002E4D8 060062A4 */  sh         $v0, 0x6($v1)
/* 1ECDC 8002E4DC 0800428E */  lw         $v0, 0x8($s2)
/* 1ECE0 8002E4E0 00000000 */  nop
/* 1ECE4 8002E4E4 C000458C */  lw         $a1, 0xC0($v0)
/* 1ECE8 8002E4E8 2C00648E */  lw         $a0, 0x2C($s3)
/* 1ECEC 8002E4EC 7279000C */  jal        SIGNAL_HandleSignal
/* 1ECF0 8002E4F0 0800A524 */   addiu     $a1, $a1, 0x8
/* 1ECF4 8002E4F4 0800428E */  lw         $v0, 0x8($s2)
/* 1ECF8 8002E4F8 00000000 */  nop
/* 1ECFC 8002E4FC C000448C */  lw         $a0, 0xC0($v0)
/* 1ED00 8002E500 3483010C */  jal        EVENT_AddSignalToReset
/* 1ED04 8002E504 00000000 */   nop
.L8002E508:
/* 1ED08 8002E508 2000BF8F */  lw         $ra, 0x20($sp)
/* 1ED0C 8002E50C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1ED10 8002E510 1800B28F */  lw         $s2, 0x18($sp)
/* 1ED14 8002E514 1400B18F */  lw         $s1, 0x14($sp)
/* 1ED18 8002E518 1000B08F */  lw         $s0, 0x10($sp)
/* 1ED1C 8002E51C 0800E003 */  jr         $ra
/* 1ED20 8002E520 2800BD27 */   addiu     $sp, $sp, 0x28
.size GAMELOOP_LevelLoadAndInit, . - GAMELOOP_LevelLoadAndInit
