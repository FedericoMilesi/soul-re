.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterCollide
/* 6E8C4 8007E0C4 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 6E8C8 8007E0C8 5800B4AF */  sw         $s4, 0x58($sp)
/* 6E8CC 8007E0CC 21A08000 */  addu       $s4, $a0, $zero
/* 6E8D0 8007E0D0 6800BFAF */  sw         $ra, 0x68($sp)
/* 6E8D4 8007E0D4 6400B7AF */  sw         $s7, 0x64($sp)
/* 6E8D8 8007E0D8 6000B6AF */  sw         $s6, 0x60($sp)
/* 6E8DC 8007E0DC 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 6E8E0 8007E0E0 5400B3AF */  sw         $s3, 0x54($sp)
/* 6E8E4 8007E0E4 5000B2AF */  sw         $s2, 0x50($sp)
/* 6E8E8 8007E0E8 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 6E8EC 8007E0EC 4800B0AF */  sw         $s0, 0x48($sp)
/* 6E8F0 8007E0F0 C000918E */  lw         $s1, 0xC0($s4)
/* 6E8F4 8007E0F4 2400828E */  lw         $v0, 0x24($s4)
/* 6E8F8 8007E0F8 6C01968E */  lw         $s6, 0x16C($s4)
/* 6E8FC 8007E0FC 27014010 */  beqz       $v0, .L8007E59C
/* 6E900 8007E100 01000224 */   addiu     $v0, $zero, 0x1
/* 6E904 8007E104 06002492 */  lbu        $a0, 0x6($s1)
/* 6E908 8007E108 00000000 */  nop
/* 6E90C 8007E10C 23018214 */  bne        $a0, $v0, .L8007E59C
/* 6E910 8007E110 00000000 */   nop
/* 6E914 8007E114 0800228E */  lw         $v0, 0x8($s1)
/* 6E918 8007E118 00000000 */  nop
/* 6E91C 8007E11C 04004390 */  lbu        $v1, 0x4($v0)
/* 6E920 8007E120 09000224 */  addiu      $v0, $zero, 0x9
/* 6E924 8007E124 46006214 */  bne        $v1, $v0, .L8007E240
/* 6E928 8007E128 00000000 */   nop
/* 6E92C 8007E12C B800D28E */  lw         $s2, 0xB8($s6)
/* 6E930 8007E130 00000000 */  nop
/* 6E934 8007E134 19014012 */  beqz       $s2, .L8007E59C
/* 6E938 8007E138 00000000 */   nop
/* 6E93C 8007E13C 07002292 */  lbu        $v0, 0x7($s1)
/* 6E940 8007E140 00000000 */  nop
/* 6E944 8007E144 15014414 */  bne        $v0, $a0, .L8007E59C
/* 6E948 8007E148 00000000 */   nop
/* 6E94C 8007E14C 0C00228E */  lw         $v0, 0xC($s1)
/* 6E950 8007E150 00000000 */  nop
/* 6E954 8007E154 04004390 */  lbu        $v1, 0x4($v0)
/* 6E958 8007E158 08000224 */  addiu      $v0, $zero, 0x8
/* 6E95C 8007E15C 0F016214 */  bne        $v1, $v0, .L8007E59C
/* 6E960 8007E160 0020033C */   lui       $v1, (0x20000000 >> 16)
/* 6E964 8007E164 07005082 */  lb         $s0, 0x7($s2)
/* 6E968 8007E168 0000C28E */  lw         $v0, 0x0($s6)
/* 6E96C 8007E16C 1400338E */  lw         $s3, 0x14($s1)
/* 6E970 8007E170 24104300 */  and        $v0, $v0, $v1
/* 6E974 8007E174 02004010 */  beqz       $v0, .L8007E180
/* 6E978 8007E178 00000000 */   nop
/* 6E97C 8007E17C 40801000 */  sll        $s0, $s0, 1
.L8007E180:
/* 6E980 8007E180 76FD010C */  jal        MON_TurnOffWeaponSpheres
/* 6E984 8007E184 21208002 */   addu      $a0, $s4, $zero
/* 6E988 8007E188 00821000 */  sll        $s0, $s0, 8
/* 6E98C 8007E18C 05002592 */  lbu        $a1, 0x5($s1)
/* 6E990 8007E190 02000106 */  bgez       $s0, .L8007E19C
/* 6E994 8007E194 21300002 */   addu      $a2, $s0, $zero
/* 6E998 8007E198 7F000626 */  addiu      $a2, $s0, 0x7F
.L8007E19C:
/* 6E99C 8007E19C 21208002 */  addu       $a0, $s4, $zero
/* 6E9A0 8007E1A0 C3310600 */  sra        $a2, $a2, 7
/* 6E9A4 8007E1A4 7FC5010C */  jal        SetFXHitData
/* 6E9A8 8007E1A8 00010724 */   addiu     $a3, $zero, 0x100
/* 6E9AC 8007E1AC 21206002 */  addu       $a0, $s3, $zero
/* 6E9B0 8007E1B0 4000053C */  lui        $a1, (0x400000 >> 16)
/* 6E9B4 8007E1B4 A1D1000C */  jal        INSTANCE_Post
/* 6E9B8 8007E1B8 21304000 */   addu      $a2, $v0, $zero
/* 6E9BC 8007E1BC 21208002 */  addu       $a0, $s4, $zero
/* 6E9C0 8007E1C0 21280000 */  addu       $a1, $zero, $zero
/* 6E9C4 8007E1C4 04004786 */  lh         $a3, 0x4($s2)
/* 6E9C8 8007E1C8 06004282 */  lb         $v0, 0x6($s2)
/* 6E9CC 8007E1CC 21300002 */  addu       $a2, $s0, $zero
/* 6E9D0 8007E1D0 95C3010C */  jal        SetMonsterHitData
/* 6E9D4 8007E1D4 1000A2AF */   sw        $v0, 0x10($sp)
/* 6E9D8 8007E1D8 21206002 */  addu       $a0, $s3, $zero
/* 6E9DC 8007E1DC 0001053C */  lui        $a1, (0x1000000 >> 16)
/* 6E9E0 8007E1E0 A1D1000C */  jal        INSTANCE_Post
/* 6E9E4 8007E1E4 21304000 */   addu      $a2, $v0, $zero
/* 6E9E8 8007E1E8 C400C48E */  lw         $a0, 0xC4($s6)
/* 6E9EC 8007E1EC 00000000 */  nop
/* 6E9F0 8007E1F0 0400828C */  lw         $v0, 0x4($a0)
/* 6E9F4 8007E1F4 00000000 */  nop
/* 6E9F8 8007E1F8 E8006216 */  bne        $s3, $v0, .L8007E59C
/* 6E9FC 8007E1FC 0010033C */   lui       $v1, (0x10000000 >> 16)
/* 6EA00 8007E200 0000C28E */  lw         $v0, 0x0($s6)
/* 6EA04 8007E204 00000000 */  nop
/* 6EA08 8007E208 24104300 */  and        $v0, $v0, $v1
/* 6EA0C 8007E20C 05004010 */  beqz       $v0, .L8007E224
/* 6EA10 8007E210 00000000 */   nop
/* 6EA14 8007E214 16008294 */  lhu        $v0, 0x16($a0)
/* 6EA18 8007E218 00000000 */  nop
/* 6EA1C 8007E21C 00104234 */  ori        $v0, $v0, 0x1000
/* 6EA20 8007E220 160082A4 */  sh         $v0, 0x16($a0)
.L8007E224:
/* 6EA24 8007E224 C400C38E */  lw         $v1, 0xC4($s6)
/* 6EA28 8007E228 00000000 */  nop
/* 6EA2C 8007E22C 18006294 */  lhu        $v0, 0x18($v1)
/* 6EA30 8007E230 00000000 */  nop
/* 6EA34 8007E234 00014234 */  ori        $v0, $v0, 0x100
/* 6EA38 8007E238 67F90108 */  j          .L8007E59C
/* 6EA3C 8007E23C 180062A4 */   sh        $v0, 0x18($v1)
.L8007E240:
/* 6EA40 8007E240 07002292 */  lbu        $v0, 0x7($s1)
/* 6EA44 8007E244 00000000 */  nop
/* 6EA48 8007E248 FFFF4324 */  addiu      $v1, $v0, -0x1
/* 6EA4C 8007E24C 0500622C */  sltiu      $v0, $v1, 0x5
/* 6EA50 8007E250 C0004010 */  beqz       $v0, .L8007E554
/* 6EA54 8007E254 01001724 */   addiu     $s7, $zero, 0x1
/* 6EA58 8007E258 0180023C */  lui        $v0, %hi(jtbl_80011E84)
/* 6EA5C 8007E25C 841E4224 */  addiu      $v0, $v0, %lo(jtbl_80011E84)
/* 6EA60 8007E260 80180300 */  sll        $v1, $v1, 2
/* 6EA64 8007E264 21186200 */  addu       $v1, $v1, $v0
/* 6EA68 8007E268 0000628C */  lw         $v0, 0x0($v1)
/* 6EA6C 8007E26C 00000000 */  nop
/* 6EA70 8007E270 08004000 */  jr         $v0
/* 6EA74 8007E274 00000000 */   nop
jlabel .L8007E278
/* 6EA78 8007E278 21208002 */  addu       $a0, $s4, $zero
/* 6EA7C 8007E27C 1400258E */  lw         $a1, 0x14($s1)
/* 6EA80 8007E280 0C00308E */  lw         $s0, 0xC($s1)
/* 6EA84 8007E284 FCF7010C */  jal        SendHitObject
/* 6EA88 8007E288 01000624 */   addiu     $a2, $zero, 0x1
/* 6EA8C 8007E28C 04000392 */  lbu        $v1, 0x4($s0)
/* 6EA90 8007E290 09000224 */  addiu      $v0, $zero, 0x9
/* 6EA94 8007E294 AE006210 */  beq        $v1, $v0, .L8007E550
/* 6EA98 8007E298 00000000 */   nop
/* 6EA9C 8007E29C 5C00838E */  lw         $v1, 0x5C($s4)
/* 6EAA0 8007E2A0 6400828E */  lw         $v0, 0x64($s4)
/* 6EAA4 8007E2A4 00000000 */  nop
/* 6EAA8 8007E2A8 AA006214 */  bne        $v1, $v0, .L8007E554
/* 6EAAC 8007E2AC 00000000 */   nop
/* 6EAB0 8007E2B0 60008386 */  lh         $v1, 0x60($s4)
/* 6EAB4 8007E2B4 68008286 */  lh         $v0, 0x68($s4)
/* 6EAB8 8007E2B8 00000000 */  nop
/* 6EABC 8007E2BC A5006214 */  bne        $v1, $v0, .L8007E554
/* 6EAC0 8007E2C0 00000000 */   nop
/* 6EAC4 8007E2C4 55F90108 */  j          .L8007E554
/* 6EAC8 8007E2C8 21B80000 */   addu      $s7, $zero, $zero
jlabel .L8007E2CC
/* 6EACC 8007E2CC 21208002 */  addu       $a0, $s4, $zero
/* 6EAD0 8007E2D0 1400258E */  lw         $a1, 0x14($s1)
/* 6EAD4 8007E2D4 FCF7010C */  jal        SendHitObject
/* 6EAD8 8007E2D8 02000624 */   addiu     $a2, $zero, 0x2
/* 6EADC 8007E2DC 55F90108 */  j          .L8007E554
/* 6EAE0 8007E2E0 00000000 */   nop
jlabel .L8007E2E4
/* 6EAE4 8007E2E4 2C002286 */  lh         $v0, 0x2C($s1)
/* 6EAE8 8007E2E8 00000000 */  nop
/* 6EAEC 8007E2EC CEFF4228 */  slti       $v0, $v0, -0x32
/* 6EAF0 8007E2F0 0C004010 */  beqz       $v0, .L8007E324
/* 6EAF4 8007E2F4 0100033C */   lui       $v1, (0x10004 >> 16)
/* 6EAF8 8007E2F8 2400828E */  lw         $v0, 0x24($s4)
/* 6EAFC 8007E2FC 00000000 */  nop
/* 6EB00 8007E300 1000428C */  lw         $v0, 0x10($v0)
/* 6EB04 8007E304 04006334 */  ori        $v1, $v1, (0x10004 & 0xFFFF)
/* 6EB08 8007E308 24104300 */  and        $v0, $v0, $v1
/* 6EB0C 8007E30C 06004014 */  bnez       $v0, .L8007E328
/* 6EB10 8007E310 21208002 */   addu      $a0, $s4, $zero
/* 6EB14 8007E314 0400053C */  lui        $a1, (0x40017 >> 16)
/* 6EB18 8007E318 1700A534 */  ori        $a1, $a1, (0x40017 & 0xFFFF)
/* 6EB1C 8007E31C A1D1000C */  jal        INSTANCE_Post
/* 6EB20 8007E320 06000624 */   addiu     $a2, $zero, 0x6
.L8007E324:
/* 6EB24 8007E324 21208002 */  addu       $a0, $s4, $zero
.L8007E328:
/* 6EB28 8007E328 1400258E */  lw         $a1, 0x14($s1)
/* 6EB2C 8007E32C FCF7010C */  jal        SendHitObject
/* 6EB30 8007E330 05000624 */   addiu     $a2, $zero, 0x5
/* 6EB34 8007E334 55F90108 */  j          .L8007E554
/* 6EB38 8007E338 00000000 */   nop
jlabel .L8007E33C
/* 6EB3C 8007E33C 1400338E */  lw         $s3, 0x14($s1)
/* 6EB40 8007E340 00000000 */  nop
/* 6EB44 8007E344 12006296 */  lhu        $v0, 0x12($s3)
/* 6EB48 8007E348 00000000 */  nop
/* 6EB4C 8007E34C E0004230 */  andi       $v0, $v0, 0xE0
/* 6EB50 8007E350 04004010 */  beqz       $v0, .L8007E364
/* 6EB54 8007E354 21208002 */   addu      $a0, $s4, $zero
/* 6EB58 8007E358 0C00268E */  lw         $a2, 0xC($s1)
/* 6EB5C 8007E35C 0906020C */  jal        MON_CheckTerrainAndRespond
/* 6EB60 8007E360 21286002 */   addu      $a1, $s3, $zero
.L8007E364:
/* 6EB64 8007E364 12006296 */  lhu        $v0, 0x12($s3)
/* 6EB68 8007E368 00000000 */  nop
/* 6EB6C 8007E36C 02014230 */  andi       $v0, $v0, 0x102
/* 6EB70 8007E370 77004014 */  bnez       $v0, .L8007E550
/* 6EB74 8007E374 00000000 */   nop
/* 6EB78 8007E378 6DC3010C */  jal        CIRC_Alloc
/* 6EB7C 8007E37C 10000424 */   addiu     $a0, $zero, 0x10
/* 6EB80 8007E380 21804000 */  addu       $s0, $v0, $zero
/* 6EB84 8007E384 0C00328E */  lw         $s2, 0xC($s1)
/* 6EB88 8007E388 FFFF0334 */  ori        $v1, $zero, 0xFFFF
/* 6EB8C 8007E38C 0A004296 */  lhu        $v0, 0xA($s2)
/* 6EB90 8007E390 0000358E */  lw         $s5, 0x0($s1)
/* 6EB94 8007E394 09004310 */  beq        $v0, $v1, .L8007E3BC
/* 6EB98 8007E398 21208002 */   addu      $a0, $s4, $zero
/* 6EB9C 8007E39C 0000A28E */  lw         $v0, 0x0($s5)
/* 6EBA0 8007E3A0 0A004396 */  lhu        $v1, 0xA($s2)
/* 6EBA4 8007E3A4 3400428C */  lw         $v0, 0x34($v0)
/* 6EBA8 8007E3A8 00000000 */  nop
/* 6EBAC 8007E3AC 21104300 */  addu       $v0, $v0, $v1
/* 6EBB0 8007E3B0 0A004294 */  lhu        $v0, 0xA($v0)
/* 6EBB4 8007E3B4 F1F80108 */  j          .L8007E3C4
/* 6EBB8 8007E3B8 0C0002A6 */   sh        $v0, 0xC($s0)
.L8007E3BC:
/* 6EBBC 8007E3BC 21100000 */  addu       $v0, $zero, $zero
/* 6EBC0 8007E3C0 0C0002A6 */  sh         $v0, 0xC($s0)
.L8007E3C4:
/* 6EBC4 8007E3C4 000012AE */  sw         $s2, 0x0($s0)
/* 6EBC8 8007E3C8 12006296 */  lhu        $v0, 0x12($s3)
/* 6EBCC 8007E3CC 01000524 */  addiu      $a1, $zero, 0x1
/* 6EBD0 8007E3D0 92D1000C */  jal        INSTANCE_Query
/* 6EBD4 8007E3D4 0E0002A6 */   sh        $v0, 0xE($s0)
/* 6EBD8 8007E3D8 04004230 */  andi       $v0, $v0, 0x4
/* 6EBDC 8007E3DC 0F004010 */  beqz       $v0, .L8007E41C
/* 6EBE0 8007E3E0 FFFF0234 */   ori       $v0, $zero, 0xFFFF
/* 6EBE4 8007E3E4 0A004396 */  lhu        $v1, 0xA($s2)
/* 6EBE8 8007E3E8 00000000 */  nop
/* 6EBEC 8007E3EC 0B006210 */  beq        $v1, $v0, .L8007E41C
/* 6EBF0 8007E3F0 00000000 */   nop
/* 6EBF4 8007E3F4 0000A28E */  lw         $v0, 0x0($s5)
/* 6EBF8 8007E3F8 00000000 */  nop
/* 6EBFC 8007E3FC 3400428C */  lw         $v0, 0x34($v0)
/* 6EC00 8007E400 00000000 */  nop
/* 6EC04 8007E404 21104300 */  addu       $v0, $v0, $v1
/* 6EC08 8007E408 0A004294 */  lhu        $v0, 0xA($v0)
/* 6EC0C 8007E40C 00000000 */  nop
/* 6EC10 8007E410 00104230 */  andi       $v0, $v0, 0x1000
/* 6EC14 8007E414 4E004014 */  bnez       $v0, .L8007E550
/* 6EC18 8007E418 00000000 */   nop
.L8007E41C:
/* 6EC1C 8007E41C 0000A58E */  lw         $a1, 0x0($s5)
/* 6EC20 8007E420 F40D020C */  jal        MON_TestForTerrainImpale
/* 6EC24 8007E424 21208002 */   addu      $a0, $s4, $zero
/* 6EC28 8007E428 08004010 */  beqz       $v0, .L8007E44C
/* 6EC2C 8007E42C 21208002 */   addu      $a0, $s4, $zero
/* 6EC30 8007E430 0001053C */  lui        $a1, (0x100001C >> 16)
/* 6EC34 8007E434 1400468C */  lw         $a2, 0x14($v0)
/* 6EC38 8007E438 A1D1000C */  jal        INSTANCE_Post
/* 6EC3C 8007E43C 1C00A534 */   ori       $a1, $a1, (0x100001C & 0xFFFF)
/* 6EC40 8007E440 280020A6 */  sh         $zero, 0x28($s1)
/* 6EC44 8007E444 28F90108 */  j          .L8007E4A0
/* 6EC48 8007E448 2A0020A6 */   sh        $zero, 0x2A($s1)
.L8007E44C:
/* 6EC4C 8007E44C 21202002 */  addu       $a0, $s1, $zero
/* 6EC50 8007E450 3193000C */  jal        COLLIDE_FindCollisionFaceNormal
/* 6EC54 8007E454 04000526 */   addiu     $a1, $s0, 0x4
/* 6EC58 8007E458 11004010 */  beqz       $v0, .L8007E4A0
/* 6EC5C 8007E45C 21208002 */   addu      $a0, $s4, $zero
/* 6EC60 8007E460 0001053C */  lui        $a1, (0x1000007 >> 16)
/* 6EC64 8007E464 0700A534 */  ori        $a1, $a1, (0x1000007 & 0xFFFF)
/* 6EC68 8007E468 21300002 */  addu       $a2, $s0, $zero
/* 6EC6C 8007E46C 04000396 */  lhu        $v1, 0x4($s0)
/* 6EC70 8007E470 28002296 */  lhu        $v0, 0x28($s1)
/* 6EC74 8007E474 001C0300 */  sll        $v1, $v1, 16
/* 6EC78 8007E478 831E0300 */  sra        $v1, $v1, 26
/* 6EC7C 8007E47C 21104300 */  addu       $v0, $v0, $v1
/* 6EC80 8007E480 280022A6 */  sh         $v0, 0x28($s1)
/* 6EC84 8007E484 06000396 */  lhu        $v1, 0x6($s0)
/* 6EC88 8007E488 2A002296 */  lhu        $v0, 0x2A($s1)
/* 6EC8C 8007E48C 001C0300 */  sll        $v1, $v1, 16
/* 6EC90 8007E490 831E0300 */  sra        $v1, $v1, 26
/* 6EC94 8007E494 21104300 */  addu       $v0, $v0, $v1
/* 6EC98 8007E498 A1D1000C */  jal        INSTANCE_Post
/* 6EC9C 8007E49C 2A0022A6 */   sh        $v0, 0x2A($s1)
.L8007E4A0:
/* 6ECA0 8007E4A0 0000C28E */  lw         $v0, 0x0($s6)
/* 6ECA4 8007E4A4 00000000 */  nop
/* 6ECA8 8007E4A8 08004234 */  ori        $v0, $v0, 0x8
/* 6ECAC 8007E4AC 0000C2AE */  sw         $v0, 0x0($s6)
/* 6ECB0 8007E4B0 4801828E */  lw         $v0, 0x148($s4)
/* 6ECB4 8007E4B4 00000000 */  nop
/* 6ECB8 8007E4B8 26004010 */  beqz       $v0, .L8007E554
/* 6ECBC 8007E4BC 1800A327 */   addiu     $v1, $sp, 0x18
/* 6ECC0 8007E4C0 21102002 */  addu       $v0, $s1, $zero
/* 6ECC4 8007E4C4 30002426 */  addiu      $a0, $s1, 0x30
.L8007E4C8:
/* 6ECC8 8007E4C8 0000488C */  lw         $t0, 0x0($v0)
/* 6ECCC 8007E4CC 0400498C */  lw         $t1, 0x4($v0)
/* 6ECD0 8007E4D0 08004A8C */  lw         $t2, 0x8($v0)
/* 6ECD4 8007E4D4 0C004B8C */  lw         $t3, 0xC($v0)
/* 6ECD8 8007E4D8 000068AC */  sw         $t0, 0x0($v1)
/* 6ECDC 8007E4DC 040069AC */  sw         $t1, 0x4($v1)
/* 6ECE0 8007E4E0 08006AAC */  sw         $t2, 0x8($v1)
/* 6ECE4 8007E4E4 0C006BAC */  sw         $t3, 0xC($v1)
/* 6ECE8 8007E4E8 10004224 */  addiu      $v0, $v0, 0x10
/* 6ECEC 8007E4EC F6FF4414 */  bne        $v0, $a0, .L8007E4C8
/* 6ECF0 8007E4F0 10006324 */   addiu     $v1, $v1, 0x10
/* 6ECF4 8007E4F4 2800A28F */  lw         $v0, 0x28($sp)
/* 6ECF8 8007E4F8 00000000 */  nop
/* 6ECFC 8007E4FC 04005414 */  bne        $v0, $s4, .L8007E510
/* 6ED00 8007E500 00000000 */   nop
/* 6ED04 8007E504 4801828E */  lw         $v0, 0x148($s4)
/* 6ED08 8007E508 00000000 */  nop
/* 6ED0C 8007E50C 2800A2AF */  sw         $v0, 0x28($sp)
.L8007E510:
/* 6ED10 8007E510 2C00A28F */  lw         $v0, 0x2C($sp)
/* 6ED14 8007E514 00000000 */  nop
/* 6ED18 8007E518 04005414 */  bne        $v0, $s4, .L8007E52C
/* 6ED1C 8007E51C 00000000 */   nop
/* 6ED20 8007E520 4801828E */  lw         $v0, 0x148($s4)
/* 6ED24 8007E524 00000000 */  nop
/* 6ED28 8007E528 2C00A2AF */  sw         $v0, 0x2C($sp)
.L8007E52C:
/* 6ED2C 8007E52C 7EC3010C */  jal        SetCollideInfoData
/* 6ED30 8007E530 1800A427 */   addiu     $a0, $sp, 0x18
/* 6ED34 8007E534 4801848E */  lw         $a0, 0x148($s4)
/* 6ED38 8007E538 2000053C */  lui        $a1, (0x200004 >> 16)
/* 6ED3C 8007E53C 0400A534 */  ori        $a1, $a1, (0x200004 & 0xFFFF)
/* 6ED40 8007E540 A1D1000C */  jal        INSTANCE_Post
/* 6ED44 8007E544 21304000 */   addu      $a2, $v0, $zero
/* 6ED48 8007E548 55F90108 */  j          .L8007E554
/* 6ED4C 8007E54C 00000000 */   nop
.L8007E550:
/* 6ED50 8007E550 21B80000 */  addu       $s7, $zero, $zero
jlabel .L8007E554
/* 6ED54 8007E554 1100E012 */  beqz       $s7, .L8007E59C
/* 6ED58 8007E558 21208002 */   addu      $a0, $s4, $zero
/* 6ED5C 8007E55C 5C008296 */  lhu        $v0, 0x5C($s4)
/* 6ED60 8007E560 28002396 */  lhu        $v1, 0x28($s1)
/* 6ED64 8007E564 00000000 */  nop
/* 6ED68 8007E568 21104300 */  addu       $v0, $v0, $v1
/* 6ED6C 8007E56C 5C0082A6 */  sh         $v0, 0x5C($s4)
/* 6ED70 8007E570 5E008296 */  lhu        $v0, 0x5E($s4)
/* 6ED74 8007E574 2A002396 */  lhu        $v1, 0x2A($s1)
/* 6ED78 8007E578 00000000 */  nop
/* 6ED7C 8007E57C 21104300 */  addu       $v0, $v0, $v1
/* 6ED80 8007E580 5E0082A4 */  sh         $v0, 0x5E($a0)
/* 6ED84 8007E584 60008294 */  lhu        $v0, 0x60($a0)
/* 6ED88 8007E588 2C002396 */  lhu        $v1, 0x2C($s1)
/* 6ED8C 8007E58C 28002526 */  addiu      $a1, $s1, 0x28
/* 6ED90 8007E590 21104300 */  addu       $v0, $v0, $v1
/* 6ED94 8007E594 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 6ED98 8007E598 600082A4 */   sh        $v0, 0x60($a0)
.L8007E59C:
/* 6ED9C 8007E59C 6800BF8F */  lw         $ra, 0x68($sp)
/* 6EDA0 8007E5A0 6400B78F */  lw         $s7, 0x64($sp)
/* 6EDA4 8007E5A4 6000B68F */  lw         $s6, 0x60($sp)
/* 6EDA8 8007E5A8 5C00B58F */  lw         $s5, 0x5C($sp)
/* 6EDAC 8007E5AC 5800B48F */  lw         $s4, 0x58($sp)
/* 6EDB0 8007E5B0 5400B38F */  lw         $s3, 0x54($sp)
/* 6EDB4 8007E5B4 5000B28F */  lw         $s2, 0x50($sp)
/* 6EDB8 8007E5B8 4C00B18F */  lw         $s1, 0x4C($sp)
/* 6EDBC 8007E5BC 4800B08F */  lw         $s0, 0x48($sp)
/* 6EDC0 8007E5C0 0800E003 */  jr         $ra
/* 6EDC4 8007E5C4 7000BD27 */   addiu     $sp, $sp, 0x70
.size MonsterCollide, . - MonsterCollide
