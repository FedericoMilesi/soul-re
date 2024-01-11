.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerStumble
/* 8D944 8009D144 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8D948 8009D148 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8D94C 8009D14C 21888000 */  addu       $s1, $a0, $zero
/* 8D950 8009D150 2400B3AF */  sw         $s3, 0x24($sp)
/* 8D954 8009D154 2198A000 */  addu       $s3, $a1, $zero
/* 8D958 8009D158 3400B7AF */  sw         $s7, 0x34($sp)
/* 8D95C 8009D15C 21B8C000 */  addu       $s7, $a2, $zero
/* 8D960 8009D160 C0101300 */  sll        $v0, $s3, 3
/* 8D964 8009D164 21105300 */  addu       $v0, $v0, $s3
/* 8D968 8009D168 C0100200 */  sll        $v0, $v0, 3
/* 8D96C 8009D16C 23105300 */  subu       $v0, $v0, $s3
/* 8D970 8009D170 2000B2AF */  sw         $s2, 0x20($sp)
/* 8D974 8009D174 80900200 */  sll        $s2, $v0, 2
/* 8D978 8009D178 08004226 */  addiu      $v0, $s2, 0x8
/* 8D97C 8009D17C 2800B4AF */  sw         $s4, 0x28($sp)
/* 8D980 8009D180 21A02202 */  addu       $s4, $s1, $v0
/* 8D984 8009D184 3000B6AF */  sw         $s6, 0x30($sp)
/* 8D988 8009D188 0B80163C */  lui        $s6, %hi(StateHandlerIdle)
/* 8D98C 8009D18C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 8D990 8009D190 E084D526 */  addiu      $s5, $s6, %lo(StateHandlerIdle)
/* 8D994 8009D194 3800BFAF */  sw         $ra, 0x38($sp)
/* 8D998 8009D198 1800B0AF */  sw         $s0, 0x18($sp)
.L8009D19C:
/* 8D99C 8009D19C 39C3010C */  jal        PeekMessageQueue
/* 8D9A0 8009D1A0 04008426 */   addiu     $a0, $s4, 0x4
/* 8D9A4 8009D1A4 21804000 */  addu       $s0, $v0, $zero
/* 8D9A8 8009D1A8 E4000012 */  beqz       $s0, .L8009D53C
/* 8D9AC 8009D1AC 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8D9B0 8009D1B0 0000038E */  lw         $v1, 0x0($s0)
/* 8D9B4 8009D1B4 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8D9B8 8009D1B8 4A006210 */  beq        $v1, $v0, .L8009D2E4
/* 8D9BC 8009D1BC 2A104300 */   slt       $v0, $v0, $v1
/* 8D9C0 8009D1C0 23004014 */  bnez       $v0, .L8009D250
/* 8D9C4 8009D1C4 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 8D9C8 8009D1C8 A7006010 */  beqz       $v1, .L8009D468
/* 8D9CC 8009D1CC 01000224 */   addiu     $v0, $zero, 0x1
/* 8D9D0 8009D1D0 1000601C */  bgtz       $v1, .L8009D214
/* 8D9D4 8009D1D4 0400023C */   lui       $v0, (0x40005 >> 16)
/* 8D9D8 8009D1D8 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 8D9DC 8009D1DC 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8D9E0 8009D1E0 D2006210 */  beq        $v1, $v0, .L8009D52C
/* 8D9E4 8009D1E4 2A104300 */   slt       $v0, $v0, $v1
/* 8D9E8 8009D1E8 05004014 */  bnez       $v0, .L8009D200
/* 8D9EC 8009D1EC 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 8D9F0 8009D1F0 CE006210 */  beq        $v1, $v0, .L8009D52C
/* 8D9F4 8009D1F4 21202002 */   addu      $a0, $s1, $zero
/* 8D9F8 8009D1F8 49750208 */  j          .L8009D524
/* 8D9FC 8009D1FC 21286002 */   addu      $a1, $s3, $zero
.L8009D200:
/* 8DA00 8009D200 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8DA04 8009D204 C9006210 */  beq        $v1, $v0, .L8009D52C
/* 8DA08 8009D208 21202002 */   addu      $a0, $s1, $zero
/* 8DA0C 8009D20C 49750208 */  j          .L8009D524
/* 8DA10 8009D210 21286002 */   addu      $a1, $s3, $zero
.L8009D214:
/* 8DA14 8009D214 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* 8DA18 8009D218 C4006210 */  beq        $v1, $v0, .L8009D52C
/* 8DA1C 8009D21C 2A104300 */   slt       $v0, $v0, $v1
/* 8DA20 8009D220 07004014 */  bnez       $v0, .L8009D240
/* 8DA24 8009D224 1000023C */   lui       $v0, (0x100000 >> 16)
/* 8DA28 8009D228 0400023C */  lui        $v0, (0x40003 >> 16)
/* 8DA2C 8009D22C 03004234 */  ori        $v0, $v0, (0x40003 & 0xFFFF)
/* 8DA30 8009D230 90006210 */  beq        $v1, $v0, .L8009D474
/* 8DA34 8009D234 21202002 */   addu      $a0, $s1, $zero
/* 8DA38 8009D238 49750208 */  j          .L8009D524
/* 8DA3C 8009D23C 21286002 */   addu      $a1, $s3, $zero
.L8009D240:
/* 8DA40 8009D240 5B006210 */  beq        $v1, $v0, .L8009D3B0
/* 8DA44 8009D244 21202002 */   addu      $a0, $s1, $zero
/* 8DA48 8009D248 49750208 */  j          .L8009D524
/* 8DA4C 8009D24C 21286002 */   addu      $a1, $s3, $zero
.L8009D250:
/* 8DA50 8009D250 9A006210 */  beq        $v1, $v0, .L8009D4BC
/* 8DA54 8009D254 2A104300 */   slt       $v0, $v0, $v1
/* 8DA58 8009D258 11004014 */  bnez       $v0, .L8009D2A0
/* 8DA5C 8009D25C 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 8DA60 8009D260 1000023C */  lui        $v0, (0x100009 >> 16)
/* 8DA64 8009D264 09004234 */  ori        $v0, $v0, (0x100009 & 0xFFFF)
/* 8DA68 8009D268 B0006210 */  beq        $v1, $v0, .L8009D52C
/* 8DA6C 8009D26C 2A104300 */   slt       $v0, $v0, $v1
/* 8DA70 8009D270 06004014 */  bnez       $v0, .L8009D28C
/* 8DA74 8009D274 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8DA78 8009D278 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8DA7C 8009D27C 46006210 */  beq        $v1, $v0, .L8009D398
/* 8DA80 8009D280 21202002 */   addu      $a0, $s1, $zero
/* 8DA84 8009D284 49750208 */  j          .L8009D524
/* 8DA88 8009D288 21286002 */   addu      $a1, $s3, $zero
.L8009D28C:
/* 8DA8C 8009D28C 15004234 */  ori        $v0, $v0, (0x100015 & 0xFFFF)
/* 8DA90 8009D290 96006210 */  beq        $v1, $v0, .L8009D4EC
/* 8DA94 8009D294 21202002 */   addu      $a0, $s1, $zero
/* 8DA98 8009D298 49750208 */  j          .L8009D524
/* 8DA9C 8009D29C 21286002 */   addu      $a1, $s3, $zero
.L8009D2A0:
/* 8DAA0 8009D2A0 A2006210 */  beq        $v1, $v0, .L8009D52C
/* 8DAA4 8009D2A4 2A104300 */   slt       $v0, $v0, $v1
/* 8DAA8 8009D2A8 07004014 */  bnez       $v0, .L8009D2C8
/* 8DAAC 8009D2AC 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 8DAB0 8009D2B0 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 8DAB4 8009D2B4 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8DAB8 8009D2B8 9C006210 */  beq        $v1, $v0, .L8009D52C
/* 8DABC 8009D2BC 21202002 */   addu      $a0, $s1, $zero
/* 8DAC0 8009D2C0 49750208 */  j          .L8009D524
/* 8DAC4 8009D2C4 21286002 */   addu      $a1, $s3, $zero
.L8009D2C8:
/* 8DAC8 8009D2C8 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 8DACC 8009D2CC 97006210 */  beq        $v1, $v0, .L8009D52C
/* 8DAD0 8009D2D0 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 8DAD4 8009D2D4 5A006210 */  beq        $v1, $v0, .L8009D440
/* 8DAD8 8009D2D8 21202002 */   addu      $a0, $s1, $zero
/* 8DADC 8009D2DC 49750208 */  j          .L8009D524
/* 8DAE0 8009D2E0 21286002 */   addu      $a1, $s3, $zero
.L8009D2E4:
/* 8DAE4 8009D2E4 1D006016 */  bnez       $s3, .L8009D35C
/* 8DAE8 8009D2E8 F0FF0524 */   addiu     $a1, $zero, -0x10
/* 8DAEC 8009D2EC 21300000 */  addu       $a2, $zero, $zero
/* 8DAF0 8009D2F0 1000A0AF */  sw         $zero, 0x10($sp)
/* 8DAF4 8009D2F4 0000248E */  lw         $a0, 0x0($s1)
/* 8DAF8 8009D2F8 08000224 */  addiu      $v0, $zero, 0x8
/* 8DAFC 8009D2FC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8DB00 8009D300 4E68020C */  jal        SetPhysics
/* 8DB04 8009D304 2138C000 */   addu      $a3, $a2, $zero
/* 8DB08 8009D308 0000248E */  lw         $a0, 0x0($s1)
/* 8DB0C 8009D30C 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 8DB10 8009D310 938B020C */  jal        SteerSwitchMode
/* 8DB14 8009D314 21280000 */   addu      $a1, $zero, $zero
/* 8DB18 8009D318 0000248E */  lw         $a0, 0x0($s1)
/* 8DB1C 8009D31C 139B020C */  jal        razResetMotion
/* 8DB20 8009D320 00000000 */   nop
/* 8DB24 8009D324 0400038E */  lw         $v1, 0x4($s0)
/* 8DB28 8009D328 00000000 */  nop
/* 8DB2C 8009D32C 08006010 */  beqz       $v1, .L8009D350
/* 8DB30 8009D330 00110300 */   sll       $v0, $v1, 4
/* 8DB34 8009D334 23104300 */  subu       $v0, $v0, $v1
/* 8DB38 8009D338 40100200 */  sll        $v0, $v0, 1
/* 8DB3C 8009D33C 02004104 */  bgez       $v0, .L8009D348
/* 8DB40 8009D340 00000000 */   nop
/* 8DB44 8009D344 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8009D348:
/* 8DB48 8009D348 D5740208 */  j          .L8009D354
/* 8DB4C 8009D34C 03230200 */   sra       $a0, $v0, 12
.L8009D350:
/* 8DB50 8009D350 01000424 */  addiu      $a0, $zero, 0x1
.L8009D354:
/* 8DB54 8009D354 31CC020C */  jal        SetTimer
/* 8DB58 8009D358 00000000 */   nop
.L8009D35C:
/* 8DB5C 8009D35C 0000248E */  lw         $a0, 0x0($s1)
/* 8DB60 8009D360 00080524 */  addiu      $a1, $zero, 0x800
/* 8DB64 8009D364 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 8DB68 8009D368 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 8DB6C 8009D36C 21202002 */  addu       $a0, $s1, $zero
/* 8DB70 8009D370 21286002 */  addu       $a1, $s3, $zero
/* 8DB74 8009D374 80000624 */  addiu      $a2, $zero, 0x80
/* 8DB78 8009D378 21380000 */  addu       $a3, $zero, $zero
/* 8DB7C 8009D37C 03000224 */  addiu      $v0, $zero, 0x3
/* 8DB80 8009D380 1000A2AF */  sw         $v0, 0x10($sp)
/* 8DB84 8009D384 02000224 */  addiu      $v0, $zero, 0x2
/* 8DB88 8009D388 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8DB8C 8009D38C 1400A2AF */   sw        $v0, 0x14($sp)
/* 8DB90 8009D390 4B750208 */  j          .L8009D52C
/* 8DB94 8009D394 00000000 */   nop
.L8009D398:
/* 8DB98 8009D398 0000248E */  lw         $a0, 0x0($s1)
/* 8DB9C 8009D39C 00100524 */  addiu      $a1, $zero, 0x1000
/* 8DBA0 8009D3A0 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 8DBA4 8009D3A4 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 8DBA8 8009D3A8 4B750208 */  j          .L8009D52C
/* 8DBAC 8009D3AC 00000000 */   nop
.L8009D3B0:
/* 8DBB0 8009D3B0 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8DBB4 8009D3B4 00000000 */  nop
/* 8DBB8 8009D3B8 0000438C */  lw         $v1, 0x0($v0)
/* 8DBBC 8009D3BC 98A4828F */  lw         $v0, %gp_rel(RazielCommands + 0x14)($gp)
/* 8DBC0 8009D3C0 00000000 */  nop
/* 8DBC4 8009D3C4 24106200 */  and        $v0, $v1, $v0
/* 8DBC8 8009D3C8 14004010 */  beqz       $v0, .L8009D41C
/* 8DBCC 8009D3CC 21200000 */   addu      $a0, $zero, $zero
/* 8DBD0 8009D3D0 94A4828F */  lw         $v0, %gp_rel(RazielCommands + 0x10)($gp)
/* 8DBD4 8009D3D4 00000000 */  nop
/* 8DBD8 8009D3D8 24106200 */  and        $v0, $v1, $v0
/* 8DBDC 8009D3DC 0F004010 */  beqz       $v0, .L8009D41C
/* 8DBE0 8009D3E0 21288000 */   addu      $a1, $a0, $zero
/* 8DBE4 8009D3E4 38FB95AF */  sw         $s5, %gp_rel(Raziel + 0x508)($gp)
/* 8DBE8 8009D3E8 4FC6010C */  jal        SetControlInitIdleData
/* 8DBEC 8009D3EC 0C000624 */   addiu     $a2, $zero, 0xC
/* 8DBF0 8009D3F0 21202002 */  addu       $a0, $s1, $zero
/* 8DBF4 8009D3F4 2128A002 */  addu       $a1, $s5, $zero
/* 8DBF8 8009D3F8 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8DBFC 8009D3FC 21304000 */   addu      $a2, $v0, $zero
/* 8DC00 8009D400 21202002 */  addu       $a0, $s1, $zero
/* 8DC04 8009D404 0B80053C */  lui        $a1, %hi(StateHandlerLookAround)
/* 8DC08 8009D408 A08DA524 */  addiu      $a1, $a1, %lo(StateHandlerLookAround)
/* 8DC0C 8009D40C F4CA010C */  jal        StateSwitchStateCharacterData
/* 8DC10 8009D410 21300000 */   addu      $a2, $zero, $zero
/* 8DC14 8009D414 4B750208 */  j          .L8009D52C
/* 8DC18 8009D418 00000000 */   nop
.L8009D41C:
/* 8DC1C 8009D41C 21288000 */  addu       $a1, $a0, $zero
/* 8DC20 8009D420 4FC6010C */  jal        SetControlInitIdleData
/* 8DC24 8009D424 0C000624 */   addiu     $a2, $zero, 0xC
/* 8DC28 8009D428 21202002 */  addu       $a0, $s1, $zero
/* 8DC2C 8009D42C E084C526 */  addiu      $a1, $s6, %lo(StateHandlerIdle)
/* 8DC30 8009D430 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8DC34 8009D434 21304000 */   addu      $a2, $v0, $zero
/* 8DC38 8009D438 4B750208 */  j          .L8009D52C
/* 8DC3C 8009D43C 00000000 */   nop
.L8009D440:
/* 8DC40 8009D440 21203202 */  addu       $a0, $s1, $s2
/* 8DC44 8009D444 2001838C */  lw         $v1, 0x120($a0)
/* 8DC48 8009D448 01000224 */  addiu      $v0, $zero, 0x1
/* 8DC4C 8009D44C 37006214 */  bne        $v1, $v0, .L8009D52C
/* 8DC50 8009D450 00000000 */   nop
/* 8DC54 8009D454 1C01828C */  lw         $v0, 0x11C($a0)
/* 8DC58 8009D458 200180AC */  sw         $zero, 0x120($a0)
/* 8DC5C 8009D45C 00FE4224 */  addiu      $v0, $v0, -0x200
/* 8DC60 8009D460 4B750208 */  j          .L8009D52C
/* 8DC64 8009D464 1C0182AC */   sw        $v0, 0x11C($a0)
.L8009D468:
/* 8DC68 8009D468 21183202 */  addu       $v1, $s1, $s2
/* 8DC6C 8009D46C 4B750208 */  j          .L8009D52C
/* 8DC70 8009D470 200162AC */   sw        $v0, 0x120($v1)
.L8009D474:
/* 8DC74 8009D474 2D006016 */  bnez       $s3, .L8009D52C
/* 8DC78 8009D478 00000000 */   nop
/* 8DC7C 8009D47C 0400028E */  lw         $v0, 0x4($s0)
/* 8DC80 8009D480 00000000 */  nop
/* 8DC84 8009D484 1000438C */  lw         $v1, 0x10($v0)
/* 8DC88 8009D488 00000000 */  nop
/* 8DC8C 8009D48C 1000A3AF */  sw         $v1, 0x10($sp)
/* 8DC90 8009D490 1400438C */  lw         $v1, 0x14($v0)
/* 8DC94 8009D494 00000000 */  nop
/* 8DC98 8009D498 1400A3AF */  sw         $v1, 0x14($sp)
/* 8DC9C 8009D49C 0000448C */  lw         $a0, 0x0($v0)
/* 8DCA0 8009D4A0 0400458C */  lw         $a1, 0x4($v0)
/* 8DCA4 8009D4A4 0800468C */  lw         $a2, 0x8($v0)
/* 8DCA8 8009D4A8 0C00478C */  lw         $a3, 0xC($v0)
/* 8DCAC 8009D4AC C1C8010C */  jal        G2EmulationInstanceToInstanceSwitchAnimationCharacter
/* 8DCB0 8009D4B0 00000000 */   nop
/* 8DCB4 8009D4B4 4B750208 */  j          .L8009D52C
/* 8DCB8 8009D4B8 00000000 */   nop
.L8009D4BC:
/* 8DCBC 8009D4BC 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 8DCC0 8009D4C0 00000000 */  nop
/* 8DCC4 8009D4C4 00084230 */  andi       $v0, $v0, 0x800
/* 8DCC8 8009D4C8 18004010 */  beqz       $v0, .L8009D52C
/* 8DCCC 8009D4CC 00000000 */   nop
/* 8DCD0 8009D4D0 0400028E */  lw         $v0, 0x4($s0)
/* 8DCD4 8009D4D4 00000000 */  nop
/* 8DCD8 8009D4D8 0C00448C */  lw         $a0, 0xC($v0)
/* 8DCDC 8009D4DC 7391020C */  jal        LoseHealth
/* 8DCE0 8009D4E0 00000000 */   nop
/* 8DCE4 8009D4E4 4B750208 */  j          .L8009D52C
/* 8DCE8 8009D4E8 00000000 */   nop
.L8009D4EC:
/* 8DCEC 8009D4EC 9266010C */  jal        STREAM_IsMorphInProgress
/* 8DCF0 8009D4F0 00000000 */   nop
/* 8DCF4 8009D4F4 04004014 */  bnez       $v0, .L8009D508
/* 8DCF8 8009D4F8 1000053C */   lui       $a1, (0x100015 >> 16)
/* 8DCFC 8009D4FC C8F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x98)
/* 8DD00 8009D500 45750208 */  j          .L8009D514
/* 8DD04 8009D504 21204402 */   addu      $a0, $s2, $a0
.L8009D508:
/* 8DD08 8009D508 C8F68427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x98)
/* 8DD0C 8009D50C 21204402 */  addu       $a0, $s2, $a0
/* 8DD10 8009D510 1500A534 */  ori        $a1, $a1, (0x100015 & 0xFFFF)
.L8009D514:
/* 8DD14 8009D514 4EC3010C */  jal        EnMessageQueueData
/* 8DD18 8009D518 21300000 */   addu      $a2, $zero, $zero
/* 8DD1C 8009D51C 4B750208 */  j          .L8009D52C
/* 8DD20 8009D520 00000000 */   nop
.L8009D524:
/* 8DD24 8009D524 B9BF020C */  jal        DefaultStateHandler
/* 8DD28 8009D528 2130E002 */   addu      $a2, $s7, $zero
.L8009D52C:
/* 8DD2C 8009D52C 27C3010C */  jal        DeMessageQueue
/* 8DD30 8009D530 04008426 */   addiu     $a0, $s4, 0x4
/* 8DD34 8009D534 67740208 */  j          .L8009D19C
/* 8DD38 8009D538 00000000 */   nop
.L8009D53C:
/* 8DD3C 8009D53C 3800BF8F */  lw         $ra, 0x38($sp)
/* 8DD40 8009D540 3400B78F */  lw         $s7, 0x34($sp)
/* 8DD44 8009D544 3000B68F */  lw         $s6, 0x30($sp)
/* 8DD48 8009D548 2C00B58F */  lw         $s5, 0x2C($sp)
/* 8DD4C 8009D54C 2800B48F */  lw         $s4, 0x28($sp)
/* 8DD50 8009D550 2400B38F */  lw         $s3, 0x24($sp)
/* 8DD54 8009D554 2000B28F */  lw         $s2, 0x20($sp)
/* 8DD58 8009D558 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8DD5C 8009D55C 1800B08F */  lw         $s0, 0x18($sp)
/* 8DD60 8009D560 0800E003 */  jr         $ra
/* 8DD64 8009D564 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerStumble, . - StateHandlerStumble
