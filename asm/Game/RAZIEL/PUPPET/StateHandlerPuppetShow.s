.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerPuppetShow
/* 8B10C 8009A90C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8B110 8009A910 2000B2AF */  sw         $s2, 0x20($sp)
/* 8B114 8009A914 21908000 */  addu       $s2, $a0, $zero
/* 8B118 8009A918 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8B11C 8009A91C 2188A000 */  addu       $s1, $a1, $zero
/* 8B120 8009A920 2800B4AF */  sw         $s4, 0x28($sp)
/* 8B124 8009A924 21A0C000 */  addu       $s4, $a2, $zero
/* 8B128 8009A928 C0101100 */  sll        $v0, $s1, 3
/* 8B12C 8009A92C 21105100 */  addu       $v0, $v0, $s1
/* 8B130 8009A930 C0100200 */  sll        $v0, $v0, 3
/* 8B134 8009A934 23105100 */  subu       $v0, $v0, $s1
/* 8B138 8009A938 80100200 */  sll        $v0, $v0, 2
/* 8B13C 8009A93C 08004224 */  addiu      $v0, $v0, 0x8
/* 8B140 8009A940 2400B3AF */  sw         $s3, 0x24($sp)
/* 8B144 8009A944 21984202 */  addu       $s3, $s2, $v0
/* 8B148 8009A948 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 8B14C 8009A94C 1800B0AF */  sw         $s0, 0x18($sp)
.L8009A950:
/* 8B150 8009A950 39C3010C */  jal        PeekMessageQueue
/* 8B154 8009A954 04006426 */   addiu     $a0, $s3, 0x4
/* 8B158 8009A958 21804000 */  addu       $s0, $v0, $zero
/* 8B15C 8009A95C C7000012 */  beqz       $s0, .L8009AC7C
/* 8B160 8009A960 0400023C */   lui       $v0, (0x40016 >> 16)
/* 8B164 8009A964 0000038E */  lw         $v1, 0x0($s0)
/* 8B168 8009A968 16004234 */  ori        $v0, $v0, (0x40016 & 0xFFFF)
/* 8B16C 8009A96C 80006210 */  beq        $v1, $v0, .L8009AB70
/* 8B170 8009A970 2A104300 */   slt       $v0, $v0, $v1
/* 8B174 8009A974 17004014 */  bnez       $v0, .L8009A9D4
/* 8B178 8009A978 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8B17C 8009A97C 0400023C */  lui        $v0, (0x4000D >> 16)
/* 8B180 8009A980 0D004234 */  ori        $v0, $v0, (0x4000D & 0xFFFF)
/* 8B184 8009A984 8B006210 */  beq        $v1, $v0, .L8009ABB4
/* 8B188 8009A988 2A104300 */   slt       $v0, $v0, $v1
/* 8B18C 8009A98C 09004014 */  bnez       $v0, .L8009A9B4
/* 8B190 8009A990 0400023C */   lui       $v0, (0x40003 >> 16)
/* 8B194 8009A994 03004234 */  ori        $v0, $v0, (0x40003 & 0xFFFF)
/* 8B198 8009A998 4B006210 */  beq        $v1, $v0, .L8009AAC8
/* 8B19C 8009A99C 0400023C */   lui       $v0, (0x4000C >> 16)
/* 8B1A0 8009A9A0 0C004234 */  ori        $v0, $v0, (0x4000C & 0xFFFF)
/* 8B1A4 8009A9A4 7B006210 */  beq        $v1, $v0, .L8009AB94
/* 8B1A8 8009A9A8 21204002 */   addu      $a0, $s2, $zero
/* 8B1AC 8009A9AC 196B0208 */  j          .L8009AC64
/* 8B1B0 8009A9B0 21282002 */   addu      $a1, $s1, $zero
.L8009A9B4:
/* 8B1B4 8009A9B4 10004234 */  ori        $v0, $v0, (0x40010 & 0xFFFF)
/* 8B1B8 8009A9B8 9F006210 */  beq        $v1, $v0, .L8009AC38
/* 8B1BC 8009A9BC 0400023C */   lui       $v0, (0x40014 >> 16)
/* 8B1C0 8009A9C0 14004234 */  ori        $v0, $v0, (0x40014 & 0xFFFF)
/* 8B1C4 8009A9C4 52006210 */  beq        $v1, $v0, .L8009AB10
/* 8B1C8 8009A9C8 21204002 */   addu      $a0, $s2, $zero
/* 8B1CC 8009A9CC 196B0208 */  j          .L8009AC64
/* 8B1D0 8009A9D0 21282002 */   addu      $a1, $s1, $zero
.L8009A9D4:
/* 8B1D4 8009A9D4 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8B1D8 8009A9D8 1C006210 */  beq        $v1, $v0, .L8009AA4C
/* 8B1DC 8009A9DC 2A104300 */   slt       $v0, $v0, $v1
/* 8B1E0 8009A9E0 0A004014 */  bnez       $v0, .L8009AA0C
/* 8B1E4 8009A9E4 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 8B1E8 8009A9E8 0400023C */  lui        $v0, (0x40018 >> 16)
/* 8B1EC 8009A9EC 18004234 */  ori        $v0, $v0, (0x40018 & 0xFFFF)
/* 8B1F0 8009A9F0 81006210 */  beq        $v1, $v0, .L8009ABF8
/* 8B1F4 8009A9F4 0400023C */   lui       $v0, (0x40021 >> 16)
/* 8B1F8 8009A9F8 21004234 */  ori        $v0, $v0, (0x40021 & 0xFFFF)
/* 8B1FC 8009A9FC 79006210 */  beq        $v1, $v0, .L8009ABE4
/* 8B200 8009AA00 21204002 */   addu      $a0, $s2, $zero
/* 8B204 8009AA04 196B0208 */  j          .L8009AC64
/* 8B208 8009AA08 21282002 */   addu      $a1, $s1, $zero
.L8009AA0C:
/* 8B20C 8009AA0C 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 8B210 8009AA10 96006210 */  beq        $v1, $v0, .L8009AC6C
/* 8B214 8009AA14 2A104300 */   slt       $v0, $v0, $v1
/* 8B218 8009AA18 07004014 */  bnez       $v0, .L8009AA38
/* 8B21C 8009AA1C 0008023C */   lui       $v0, (0x8000008 >> 16)
/* 8B220 8009AA20 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 8B224 8009AA24 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8B228 8009AA28 90006210 */  beq        $v1, $v0, .L8009AC6C
/* 8B22C 8009AA2C 21204002 */   addu      $a0, $s2, $zero
/* 8B230 8009AA30 196B0208 */  j          .L8009AC64
/* 8B234 8009AA34 21282002 */   addu      $a1, $s1, $zero
.L8009AA38:
/* 8B238 8009AA38 08004234 */  ori        $v0, $v0, (0x8000008 & 0xFFFF)
/* 8B23C 8009AA3C 3E006210 */  beq        $v1, $v0, .L8009AB38
/* 8B240 8009AA40 21204002 */   addu      $a0, $s2, $zero
/* 8B244 8009AA44 196B0208 */  j          .L8009AC64
/* 8B248 8009AA48 21282002 */   addu      $a1, $s1, $zero
.L8009AA4C:
/* 8B24C 8009AA4C 0400028E */  lw         $v0, 0x4($s0)
/* 8B250 8009AA50 00000000 */  nop
/* 8B254 8009AA54 09004010 */  beqz       $v0, .L8009AA7C
/* 8B258 8009AA58 21204002 */   addu      $a0, $s2, $zero
/* 8B25C 8009AA5C 21282002 */  addu       $a1, $s1, $zero
/* 8B260 8009AA60 21300000 */  addu       $a2, $zero, $zero
/* 8B264 8009AA64 2138C000 */  addu       $a3, $a2, $zero
/* 8B268 8009AA68 03000224 */  addiu      $v0, $zero, 0x3
/* 8B26C 8009AA6C 1000A2AF */  sw         $v0, 0x10($sp)
/* 8B270 8009AA70 02000224 */  addiu      $v0, $zero, 0x2
/* 8B274 8009AA74 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8B278 8009AA78 1400A2AF */   sw        $v0, 0x14($sp)
.L8009AA7C:
/* 8B27C 8009AA7C 0201033C */  lui        $v1, (0x1020008 >> 16)
/* 8B280 8009AA80 08006334 */  ori        $v1, $v1, (0x1020008 & 0xFFFF)
/* 8B284 8009AA84 01000224 */  addiu      $v0, $zero, 0x1
/* 8B288 8009AA88 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8B28C 8009AA8C 70FA80AF */  sw         $zero, %gp_rel(Raziel + 0x440)($gp)
/* 8B290 8009AA90 0000448E */  lw         $a0, 0x0($s2)
/* 8B294 8009AA94 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 8B298 8009AA98 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 8B29C 8009AA9C 938B020C */  jal        SteerSwitchMode
/* 8B2A0 8009AAA0 21280000 */   addu      $a1, $zero, $zero
/* 8B2A4 8009AAA4 0000448E */  lw         $a0, 0x0($s2)
/* 8B2A8 8009AAA8 6B68020C */  jal        ResetPhysics
/* 8B2AC 8009AAAC F0FF0524 */   addiu     $a1, $zero, -0x10
/* 8B2B0 8009AAB0 C4F980A7 */  sh         $zero, %gp_rel(Raziel + 0x394)($gp)
/* 8B2B4 8009AAB4 6D002016 */  bnez       $s1, .L8009AC6C
/* 8B2B8 8009AAB8 00000000 */   nop
/* 8B2BC 8009AABC 56FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x426)($gp)
/* 8B2C0 8009AAC0 1B6B0208 */  j          .L8009AC6C
/* 8B2C4 8009AAC4 00000000 */   nop
.L8009AAC8:
/* 8B2C8 8009AAC8 68002016 */  bnez       $s1, .L8009AC6C
/* 8B2CC 8009AACC 00000000 */   nop
/* 8B2D0 8009AAD0 0400028E */  lw         $v0, 0x4($s0)
/* 8B2D4 8009AAD4 00000000 */  nop
/* 8B2D8 8009AAD8 1000438C */  lw         $v1, 0x10($v0)
/* 8B2DC 8009AADC 00000000 */  nop
/* 8B2E0 8009AAE0 1000A3AF */  sw         $v1, 0x10($sp)
/* 8B2E4 8009AAE4 1400438C */  lw         $v1, 0x14($v0)
/* 8B2E8 8009AAE8 00000000 */  nop
/* 8B2EC 8009AAEC 1400A3AF */  sw         $v1, 0x14($sp)
/* 8B2F0 8009AAF0 0000448C */  lw         $a0, 0x0($v0)
/* 8B2F4 8009AAF4 0400458C */  lw         $a1, 0x4($v0)
/* 8B2F8 8009AAF8 0800468C */  lw         $a2, 0x8($v0)
/* 8B2FC 8009AAFC 0C00478C */  lw         $a3, 0xC($v0)
/* 8B300 8009AB00 C1C8010C */  jal        G2EmulationInstanceToInstanceSwitchAnimationCharacter
/* 8B304 8009AB04 00000000 */   nop
/* 8B308 8009AB08 1B6B0208 */  j          .L8009AC6C
/* 8B30C 8009AB0C 00000000 */   nop
.L8009AB10:
/* 8B310 8009AB10 21282002 */  addu       $a1, $s1, $zero
/* 8B314 8009AB14 21300000 */  addu       $a2, $zero, $zero
/* 8B318 8009AB18 2138C000 */  addu       $a3, $a2, $zero
/* 8B31C 8009AB1C 03000224 */  addiu      $v0, $zero, 0x3
/* 8B320 8009AB20 1000A2AF */  sw         $v0, 0x10($sp)
/* 8B324 8009AB24 02000224 */  addiu      $v0, $zero, 0x2
/* 8B328 8009AB28 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8B32C 8009AB2C 1400A2AF */   sw        $v0, 0x14($sp)
/* 8B330 8009AB30 1B6B0208 */  j          .L8009AC6C
/* 8B334 8009AB34 00000000 */   nop
.L8009AB38:
/* 8B338 8009AB38 4C002016 */  bnez       $s1, .L8009AC6C
/* 8B33C 8009AB3C 00000000 */   nop
/* 8B340 8009AB40 0400038E */  lw         $v1, 0x4($s0)
/* 8B344 8009AB44 00000000 */  nop
/* 8B348 8009AB48 1000628C */  lw         $v0, 0x10($v1)
/* 8B34C 8009AB4C 00000000 */  nop
/* 8B350 8009AB50 1000A2AF */  sw         $v0, 0x10($sp)
/* 8B354 8009AB54 0400658C */  lw         $a1, 0x4($v1)
/* 8B358 8009AB58 0800668C */  lw         $a2, 0x8($v1)
/* 8B35C 8009AB5C 0C00678C */  lw         $a3, 0xC($v1)
/* 8B360 8009AB60 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 8B364 8009AB64 21204002 */   addu      $a0, $s2, $zero
/* 8B368 8009AB68 1B6B0208 */  j          .L8009AC6C
/* 8B36C 8009AB6C 00000000 */   nop
.L8009AB70:
/* 8B370 8009AB70 21204002 */  addu       $a0, $s2, $zero
/* 8B374 8009AB74 21282002 */  addu       $a1, $s1, $zero
/* 8B378 8009AB78 7B000624 */  addiu      $a2, $zero, 0x7B
/* 8B37C 8009AB7C 21380000 */  addu       $a3, $zero, $zero
/* 8B380 8009AB80 04000224 */  addiu      $v0, $zero, 0x4
/* 8B384 8009AB84 1000A2AF */  sw         $v0, 0x10($sp)
/* 8B388 8009AB88 02000224 */  addiu      $v0, $zero, 0x2
/* 8B38C 8009AB8C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8B390 8009AB90 1400A2AF */   sw        $v0, 0x14($sp)
.L8009AB94:
/* 8B394 8009AB94 21204002 */  addu       $a0, $s2, $zero
/* 8B398 8009AB98 21282002 */  addu       $a1, $s1, $zero
/* 8B39C 8009AB9C 0400078E */  lw         $a3, 0x4($s0)
/* 8B3A0 8009ABA0 0A80063C */  lui        $a2, %hi(StateHandlerMoveToPosition)
/* 8B3A4 8009ABA4 C1CA010C */  jal        StateSwitchStateData
/* 8B3A8 8009ABA8 A8ACC624 */   addiu     $a2, $a2, %lo(StateHandlerMoveToPosition)
/* 8B3AC 8009ABAC 1B6B0208 */  j          .L8009AC6C
/* 8B3B0 8009ABB0 00000000 */   nop
.L8009ABB4:
/* 8B3B4 8009ABB4 2D002016 */  bnez       $s1, .L8009AC6C
/* 8B3B8 8009ABB8 00000000 */   nop
/* 8B3BC 8009ABBC 0400028E */  lw         $v0, 0x4($s0)
/* 8B3C0 8009ABC0 00000000 */  nop
/* 8B3C4 8009ABC4 04004294 */  lhu        $v0, 0x4($v0)
/* 8B3C8 8009ABC8 00000000 */  nop
/* 8B3CC 8009ABCC 86FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x556)($gp)
/* 8B3D0 8009ABD0 0000448E */  lw         $a0, 0x0($s2)
/* 8B3D4 8009ABD4 938B020C */  jal        SteerSwitchMode
/* 8B3D8 8009ABD8 0D000524 */   addiu     $a1, $zero, 0xD
/* 8B3DC 8009ABDC 1B6B0208 */  j          .L8009AC6C
/* 8B3E0 8009ABE0 00000000 */   nop
.L8009ABE4:
/* 8B3E4 8009ABE4 04000296 */  lhu        $v0, 0x4($s0)
/* 8B3E8 8009ABE8 00000000 */  nop
/* 8B3EC 8009ABEC BCF982A7 */  sh         $v0, %gp_rel(Raziel + 0x38C)($gp)
/* 8B3F0 8009ABF0 1B6B0208 */  j          .L8009AC6C
/* 8B3F4 8009ABF4 00000000 */   nop
.L8009ABF8:
/* 8B3F8 8009ABF8 1C002016 */  bnez       $s1, .L8009AC6C
/* 8B3FC 8009ABFC 00000000 */   nop
/* 8B400 8009AC00 0400028E */  lw         $v0, 0x4($s0)
/* 8B404 8009AC04 00000000 */  nop
/* 8B408 8009AC08 00004394 */  lhu        $v1, 0x0($v0)
/* 8B40C 8009AC0C 02004494 */  lhu        $a0, 0x2($v0)
/* 8B410 8009AC10 04004594 */  lhu        $a1, 0x4($v0)
/* 8B414 8009AC14 82FB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x552)
/* 8B418 8009AC18 82FB83A7 */  sh         $v1, %gp_rel(Raziel + 0x552)($gp)
/* 8B41C 8009AC1C 020044A4 */  sh         $a0, 0x2($v0)
/* 8B420 8009AC20 040045A4 */  sh         $a1, 0x4($v0)
/* 8B424 8009AC24 0000448E */  lw         $a0, 0x0($s2)
/* 8B428 8009AC28 938B020C */  jal        SteerSwitchMode
/* 8B42C 8009AC2C 0C000524 */   addiu     $a1, $zero, 0xC
/* 8B430 8009AC30 1B6B0208 */  j          .L8009AC6C
/* 8B434 8009AC34 00000000 */   nop
.L8009AC38:
/* 8B438 8009AC38 FDFF053C */  lui        $a1, (0xFFFDFFFF >> 16)
/* 8B43C 8009AC3C FFFFA534 */  ori        $a1, $a1, (0xFFFDFFFF & 0xFFFF)
/* 8B440 8009AC40 EFFF0424 */  addiu      $a0, $zero, -0x11
/* 8B444 8009AC44 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 8B448 8009AC48 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 8B44C 8009AC4C 24104400 */  and        $v0, $v0, $a0
/* 8B450 8009AC50 24186500 */  and        $v1, $v1, $a1
/* 8B454 8009AC54 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 8B458 8009AC58 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 8B45C 8009AC5C 1B6B0208 */  j          .L8009AC6C
/* 8B460 8009AC60 00000000 */   nop
.L8009AC64:
/* 8B464 8009AC64 D46B020C */  jal        DefaultPuppetStateHandler
/* 8B468 8009AC68 21308002 */   addu      $a2, $s4, $zero
.L8009AC6C:
/* 8B46C 8009AC6C 27C3010C */  jal        DeMessageQueue
/* 8B470 8009AC70 04006426 */   addiu     $a0, $s3, 0x4
/* 8B474 8009AC74 546A0208 */  j          .L8009A950
/* 8B478 8009AC78 00000000 */   nop
.L8009AC7C:
/* 8B47C 8009AC7C 21204002 */  addu       $a0, $s2, $zero
/* 8B480 8009AC80 AF9A020C */  jal        razApplyMotion
/* 8B484 8009AC84 21282002 */   addu      $a1, $s1, $zero
/* 8B488 8009AC88 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 8B48C 8009AC8C 2800B48F */  lw         $s4, 0x28($sp)
/* 8B490 8009AC90 2400B38F */  lw         $s3, 0x24($sp)
/* 8B494 8009AC94 2000B28F */  lw         $s2, 0x20($sp)
/* 8B498 8009AC98 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8B49C 8009AC9C 1800B08F */  lw         $s0, 0x18($sp)
/* 8B4A0 8009ACA0 0800E003 */  jr         $ra
/* 8B4A4 8009ACA4 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerPuppetShow, . - StateHandlerPuppetShow
