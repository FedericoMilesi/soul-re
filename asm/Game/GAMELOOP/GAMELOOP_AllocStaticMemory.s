.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_AllocStaticMemory
/* 1E328 8002DB28 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1E32C 8002DB2C 0C010424 */  addiu      $a0, $zero, 0x10C
/* 1E330 8002DB30 1000BFAF */  sw         $ra, 0x10($sp)
/* 1E334 8002DB34 8140010C */  jal        MEMPACK_Malloc
/* 1E338 8002DB38 06000524 */   addiu     $a1, $zero, 0x6
/* 1E33C 8002DB3C 9C9C0434 */  ori        $a0, $zero, 0x9C9C
/* 1E340 8002DB40 20BA82AF */  sw         $v0, %gp_rel(instanceList)($gp)
/* 1E344 8002DB44 8140010C */  jal        MEMPACK_Malloc
/* 1E348 8002DB48 06000524 */   addiu     $a1, $zero, 0x6
/* 1E34C 8002DB4C 0300043C */  lui        $a0, (0x34E18 >> 16)
/* 1E350 8002DB50 184E8434 */  ori        $a0, $a0, (0x34E18 & 0xFFFF)
/* 1E354 8002DB54 24BA82AF */  sw         $v0, %gp_rel(instancePool)($gp)
/* 1E358 8002DB58 8140010C */  jal        MEMPACK_Malloc
/* 1E35C 8002DB5C 06000524 */   addiu     $a1, $zero, 0x6
/* 1E360 8002DB60 0100063C */  lui        $a2, (0x1D70C >> 16)
/* 1E364 8002DB64 0CD7C634 */  ori        $a2, $a2, (0x1D70C & 0xFFFF)
/* 1E368 8002DB68 7C040424 */  addiu      $a0, $zero, 0x47C
/* 1E36C 8002DB6C 00304324 */  addiu      $v1, $v0, 0x3000
/* 1E370 8002DB70 10BA83AF */  sw         $v1, %gp_rel(gOt + 0x4)($gp)
/* 1E374 8002DB74 00604324 */  addiu      $v1, $v0, 0x6000
/* 1E378 8002DB78 5CBA82AF */  sw         $v0, %gp_rel(primBase)($gp)
/* 1E37C 8002DB7C 0CBA82AF */  sw         $v0, %gp_rel(gOt)($gp)
/* 1E380 8002DB80 21104600 */  addu       $v0, $v0, $a2
/* 1E384 8002DB84 14BA83AF */  sw         $v1, %gp_rel(primPool)($gp)
/* 1E388 8002DB88 18BA82AF */  sw         $v0, %gp_rel(primPool + 0x4)($gp)
/* 1E38C 8002DB8C 8140010C */  jal        MEMPACK_Malloc
/* 1E390 8002DB90 06000524 */   addiu     $a1, $zero, 0x6
/* 1E394 8002DB94 21204000 */  addu       $a0, $v0, $zero
/* 1E398 8002DB98 21280000 */  addu       $a1, $zero, $zero
/* 1E39C 8002DB9C 2CBA84AF */  sw         $a0, %gp_rel(gLightInfo)($gp)
/* 1E3A0 8002DBA0 2EF2020C */  jal        memset
/* 1E3A4 8002DBA4 7C040624 */   addiu     $a2, $zero, 0x47C
/* 1E3A8 8002DBA8 C0180424 */  addiu      $a0, $zero, 0x18C0
/* 1E3AC 8002DBAC 8140010C */  jal        MEMPACK_Malloc
/* 1E3B0 8002DBB0 06000524 */   addiu     $a1, $zero, 0x6
/* 1E3B4 8002DBB4 A86D0424 */  addiu      $a0, $zero, 0x6DA8
/* 1E3B8 8002DBB8 28BA82AF */  sw         $v0, %gp_rel(gVertexPool)($gp)
/* 1E3BC 8002DBBC 1CBA82AF */  sw         $v0, %gp_rel(gPolytopeList)($gp)
/* 1E3C0 8002DBC0 8140010C */  jal        MEMPACK_Malloc
/* 1E3C4 8002DBC4 06000524 */   addiu     $a1, $zero, 0x6
/* 1E3C8 8002DBC8 B80B0424 */  addiu      $a0, $zero, 0xBB8
/* 1E3CC 8002DBCC 58BA82AF */  sw         $v0, %gp_rel(fxTracker)($gp)
/* 1E3D0 8002DBD0 44BA82AF */  sw         $v0, %gp_rel(gFXT)($gp)
/* 1E3D4 8002DBD4 8140010C */  jal        MEMPACK_Malloc
/* 1E3D8 8002DBD8 06000524 */   addiu     $a1, $zero, 0x6
/* 1E3DC 8002DBDC E8030424 */  addiu      $a0, $zero, 0x3E8
/* 1E3E0 8002DBE0 34BA82AF */  sw         $v0, %gp_rel(planningPool)($gp)
/* 1E3E4 8002DBE4 8140010C */  jal        MEMPACK_Malloc
/* 1E3E8 8002DBE8 06000524 */   addiu     $a1, $zero, 0x6
/* 1E3EC 8002DBEC C0060424 */  addiu      $a0, $zero, 0x6C0
/* 1E3F0 8002DBF0 30BA82AF */  sw         $v0, %gp_rel(enemyPlanPool)($gp)
/* 1E3F4 8002DBF4 8140010C */  jal        MEMPACK_Malloc
/* 1E3F8 8002DBF8 06000524 */   addiu     $a1, $zero, 0x6
/* 1E3FC 8002DBFC 38BA82AF */  sw         $v0, %gp_rel(GlobalObjects)($gp)
/* 1E400 8002DC00 B94A020C */  jal        G2Anim_Install
/* 1E404 8002DC04 00000000 */   nop
/* 1E408 8002DC08 1000BF8F */  lw         $ra, 0x10($sp)
/* 1E40C 8002DC0C 00000000 */  nop
/* 1E410 8002DC10 0800E003 */  jr         $ra
/* 1E414 8002DC14 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_AllocStaticMemory, . - GAMELOOP_AllocStaticMemory
