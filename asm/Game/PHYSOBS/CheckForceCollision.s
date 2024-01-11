.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckForceCollision
/* 5DADC 8006D2DC C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 5DAE0 8006D2E0 2000B2AF */  sw         $s2, 0x20($sp)
/* 5DAE4 8006D2E4 21908000 */  addu       $s2, $a0, $zero
/* 5DAE8 8006D2E8 2800B4AF */  sw         $s4, 0x28($sp)
/* 5DAEC 8006D2EC 21A0A000 */  addu       $s4, $a1, $zero
/* 5DAF0 8006D2F0 3400B7AF */  sw         $s7, 0x34($sp)
/* 5DAF4 8006D2F4 21B8C000 */  addu       $s7, $a2, $zero
/* 5DAF8 8006D2F8 3800BEAF */  sw         $fp, 0x38($sp)
/* 5DAFC 8006D2FC 21F0E000 */  addu       $fp, $a3, $zero
/* 5DB00 8006D300 3000B6AF */  sw         $s6, 0x30($sp)
/* 5DB04 8006D304 5000B68F */  lw         $s6, 0x50($sp)
/* 5DB08 8006D308 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 5DB0C 8006D30C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 5DB10 8006D310 2400B3AF */  sw         $s3, 0x24($sp)
/* 5DB14 8006D314 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5DB18 8006D318 1800B0AF */  sw         $s0, 0x18($sp)
/* 5DB1C 8006D31C 6C01538E */  lw         $s3, 0x16C($s2)
/* 5DB20 8006D320 CFA3010C */  jal        CheckPhysObFamily
/* 5DB24 8006D324 07000524 */   addiu     $a1, $zero, 0x7
/* 5DB28 8006D328 7B004010 */  beqz       $v0, .L8006D518
/* 5DB2C 8006D32C 01001524 */   addiu     $s5, $zero, 0x1
/* 5DB30 8006D330 21204002 */  addu       $a0, $s2, $zero
/* 5DB34 8006D334 2400518E */  lw         $s1, 0x24($s2)
/* 5DB38 8006D338 6C01508E */  lw         $s0, 0x16C($s2)
/* 5DB3C 8006D33C 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 5DB40 8006D340 21280000 */   addu      $a1, $zero, $zero
/* 5DB44 8006D344 0400038E */  lw         $v1, 0x4($s0)
/* 5DB48 8006D348 00000000 */  nop
/* 5DB4C 8006D34C 0410A302 */  sllv       $v0, $v1, $s5
/* 5DB50 8006D350 21104300 */  addu       $v0, $v0, $v1
/* 5DB54 8006D354 0C00238E */  lw         $v1, 0xC($s1)
/* 5DB58 8006D358 80100200 */  sll        $v0, $v0, 2
/* 5DB5C 8006D35C 21886200 */  addu       $s1, $v1, $v0
/* 5DB60 8006D360 03002382 */  lb         $v1, 0x3($s1)
/* 5DB64 8006D364 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5DB68 8006D368 28006210 */  beq        $v1, $v0, .L8006D40C
/* 5DB6C 8006D36C 04001026 */   addiu     $s0, $s0, 0x4
/* 5DB70 8006D370 BFFF033C */  lui        $v1, (0xFFBFFFFB >> 16)
/* 5DB74 8006D374 0000628E */  lw         $v0, 0x0($s3)
/* 5DB78 8006D378 FBFF6334 */  ori        $v1, $v1, (0xFFBFFFFB & 0xFFFF)
/* 5DB7C 8006D37C 24104300 */  and        $v0, $v0, $v1
/* 5DB80 8006D380 01104234 */  ori        $v0, $v0, 0x1001
/* 5DB84 8006D384 000062AE */  sw         $v0, 0x0($s3)
/* 5DB88 8006D388 740140AE */  sw         $zero, 0x174($s2)
/* 5DB8C 8006D38C 780140AE */  sw         $zero, 0x178($s2)
/* 5DB90 8006D390 7C0140AE */  sw         $zero, 0x17C($s2)
/* 5DB94 8006D394 800140AE */  sw         $zero, 0x180($s2)
/* 5DB98 8006D398 840140AE */  sw         $zero, 0x184($s2)
/* 5DB9C 8006D39C 880140AE */  sw         $zero, 0x188($s2)
/* 5DBA0 8006D3A0 0000628E */  lw         $v0, 0x0($s3)
/* 5DBA4 8006D3A4 0800033C */  lui        $v1, (0x80000 >> 16)
/* 5DBA8 8006D3A8 24104300 */  and        $v0, $v0, $v1
/* 5DBAC 8006D3AC 5A004014 */  bnez       $v0, .L8006D518
/* 5DBB0 8006D3B0 00000000 */   nop
/* 5DBB4 8006D3B4 26014286 */  lh         $v0, 0x126($s2)
/* 5DBB8 8006D3B8 00000000 */  nop
/* 5DBBC 8006D3BC 04004014 */  bnez       $v0, .L8006D3D0
/* 5DBC0 8006D3C0 21204002 */   addu      $a0, $s2, $zero
/* 5DBC4 8006D3C4 9635010C */  jal        FX_EndInstanceEffects
/* 5DBC8 8006D3C8 21204002 */   addu      $a0, $s2, $zero
/* 5DBCC 8006D3CC 21204002 */  addu       $a0, $s2, $zero
.L8006D3D0:
/* 5DBD0 8006D3D0 21280000 */  addu       $a1, $zero, $zero
/* 5DBD4 8006D3D4 2138A000 */  addu       $a3, $a1, $zero
/* 5DBD8 8006D3D8 03002682 */  lb         $a2, 0x3($s1)
/* 5DBDC 8006D3DC 21A8A000 */  addu       $s5, $a1, $zero
/* 5DBE0 8006D3E0 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5DBE4 8006D3E4 1000A0AF */   sw        $zero, 0x10($sp)
/* 5DBE8 8006D3E8 21204002 */  addu       $a0, $s2, $zero
/* 5DBEC 8006D3EC 21280000 */  addu       $a1, $zero, $zero
/* 5DBF0 8006D3F0 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5DBF4 8006D3F4 01000624 */   addiu     $a2, $zero, 0x1
/* 5DBF8 8006D3F8 0800033C */  lui        $v1, (0x81001 >> 16)
/* 5DBFC 8006D3FC 0000628E */  lw         $v0, 0x0($s3)
/* 5DC00 8006D400 01106334 */  ori        $v1, $v1, (0x81001 & 0xFFFF)
/* 5DC04 8006D404 25104300 */  or         $v0, $v0, $v1
/* 5DC08 8006D408 000062AE */  sw         $v0, 0x0($s3)
.L8006D40C:
/* 5DC0C 8006D40C 2C00448E */  lw         $a0, 0x2C($s2)
/* 5DC10 8006D410 00000000 */  nop
/* 5DC14 8006D414 3C008010 */  beqz       $a0, .L8006D508
/* 5DC18 8006D418 00000000 */   nop
/* 5DC1C 8006D41C 92D1000C */  jal        INSTANCE_Query
/* 5DC20 8006D420 01000524 */   addiu     $a1, $zero, 0x1
/* 5DC24 8006D424 01004230 */  andi       $v0, $v0, 0x1
/* 5DC28 8006D428 37004010 */  beqz       $v0, .L8006D508
/* 5DC2C 8006D42C 00000000 */   nop
/* 5DC30 8006D430 0900E012 */  beqz       $s7, .L8006D458
/* 5DC34 8006D434 00000000 */   nop
/* 5DC38 8006D438 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 5DC3C 8006D43C 00000000 */  nop
/* 5DC40 8006D440 05004014 */  bnez       $v0, .L8006D458
/* 5DC44 8006D444 2120C003 */   addu      $a0, $fp, $zero
/* 5DC48 8006D448 8A93000C */  jal        COLLIDE_SetBSPTreeFlag
/* 5DC4C 8006D44C 00040524 */   addiu     $a1, $zero, 0x400
/* 5DC50 8006D450 42B50108 */  j          .L8006D508
/* 5DC54 8006D454 00000000 */   nop
.L8006D458:
/* 5DC58 8006D458 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5DC5C 8006D45C 00000000 */  nop
/* 5DC60 8006D460 29008212 */  beq        $s4, $v0, .L8006D508
/* 5DC64 8006D464 00000000 */   nop
/* 5DC68 8006D468 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 5DC6C 8006D46C 00000000 */  nop
/* 5DC70 8006D470 25004014 */  bnez       $v0, .L8006D508
/* 5DC74 8006D474 00000000 */   nop
/* 5DC78 8006D478 A5A3010C */  jal        CheckPhysOb
/* 5DC7C 8006D47C 21208002 */   addu      $a0, $s4, $zero
/* 5DC80 8006D480 14004010 */  beqz       $v0, .L8006D4D4
/* 5DC84 8006D484 00000000 */   nop
/* 5DC88 8006D488 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5DC8C 8006D48C 3C00838E */  lw         $v1, 0x3C($s4)
/* 5DC90 8006D490 8C00428C */  lw         $v0, 0x8C($v0)
/* 5DC94 8006D494 00000000 */  nop
/* 5DC98 8006D498 0E006210 */  beq        $v1, $v0, .L8006D4D4
/* 5DC9C 8006D49C 00000000 */   nop
/* 5DCA0 8006D4A0 5400A88F */  lw         $t0, 0x54($sp)
/* 5DCA4 8006D4A4 00000000 */  nop
/* 5DCA8 8006D4A8 0A000015 */  bnez       $t0, .L8006D4D4
/* 5DCAC 8006D4AC 21380000 */   addu      $a3, $zero, $zero
/* 5DCB0 8006D4B0 06000624 */  addiu      $a2, $zero, 0x6
/* 5DCB4 8006D4B4 0000C486 */  lh         $a0, 0x0($s6)
/* 5DCB8 8006D4B8 0200C586 */  lh         $a1, 0x2($s6)
/* 5DCBC 8006D4BC 21C4010C */  jal        SetObjectData
/* 5DCC0 8006D4C0 1000A0AF */   sw        $zero, 0x10($sp)
/* 5DCC4 8006D4C4 21208002 */  addu       $a0, $s4, $zero
/* 5DCC8 8006D4C8 8000053C */  lui        $a1, (0x800000 >> 16)
/* 5DCCC 8006D4CC A1D1000C */  jal        INSTANCE_Post
/* 5DCD0 8006D4D0 21304000 */   addu      $a2, $v0, $zero
.L8006D4D4:
/* 5DCD4 8006D4D4 0000038E */  lw         $v1, 0x0($s0)
/* 5DCD8 8006D4D8 01000224 */  addiu      $v0, $zero, 0x1
/* 5DCDC 8006D4DC 06006214 */  bne        $v1, $v0, .L8006D4F8
/* 5DCE0 8006D4E0 0080033C */   lui       $v1, (0x80000000 >> 16)
/* 5DCE4 8006D4E4 1800828E */  lw         $v0, 0x18($s4)
/* 5DCE8 8006D4E8 0100033C */  lui        $v1, (0x10000 >> 16)
/* 5DCEC 8006D4EC 25104300 */  or         $v0, $v0, $v1
/* 5DCF0 8006D4F0 42B50108 */  j          .L8006D508
/* 5DCF4 8006D4F4 180082AE */   sw        $v0, 0x18($s4)
.L8006D4F8:
/* 5DCF8 8006D4F8 1400828E */  lw         $v0, 0x14($s4)
/* 5DCFC 8006D4FC 00000000 */  nop
/* 5DD00 8006D500 25104300 */  or         $v0, $v0, $v1
/* 5DD04 8006D504 140082AE */  sw         $v0, 0x14($s4)
.L8006D508:
/* 5DD08 8006D508 0300A012 */  beqz       $s5, .L8006D518
/* 5DD0C 8006D50C 00000000 */   nop
/* 5DD10 8006D510 85D1000C */  jal        INSTANCE_KillInstance
/* 5DD14 8006D514 21204002 */   addu      $a0, $s2, $zero
.L8006D518:
/* 5DD18 8006D518 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 5DD1C 8006D51C 3800BE8F */  lw         $fp, 0x38($sp)
/* 5DD20 8006D520 3400B78F */  lw         $s7, 0x34($sp)
/* 5DD24 8006D524 3000B68F */  lw         $s6, 0x30($sp)
/* 5DD28 8006D528 2C00B58F */  lw         $s5, 0x2C($sp)
/* 5DD2C 8006D52C 2800B48F */  lw         $s4, 0x28($sp)
/* 5DD30 8006D530 2400B38F */  lw         $s3, 0x24($sp)
/* 5DD34 8006D534 2000B28F */  lw         $s2, 0x20($sp)
/* 5DD38 8006D538 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5DD3C 8006D53C 1800B08F */  lw         $s0, 0x18($sp)
/* 5DD40 8006D540 0800E003 */  jr         $ra
/* 5DD44 8006D544 4000BD27 */   addiu     $sp, $sp, 0x40
.size CheckForceCollision, . - CheckForceCollision
