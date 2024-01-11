.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerWarpGate
/* 8BA04 8009B204 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8BA08 8009B208 1800B0AF */  sw         $s0, 0x18($sp)
/* 8BA0C 8009B20C 21808000 */  addu       $s0, $a0, $zero
/* 8BA10 8009B210 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8BA14 8009B214 2188A000 */  addu       $s1, $a1, $zero
/* 8BA18 8009B218 2800B4AF */  sw         $s4, 0x28($sp)
/* 8BA1C 8009B21C 21A0C000 */  addu       $s4, $a2, $zero
/* 8BA20 8009B220 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 8BA24 8009B224 2400B3AF */  sw         $s3, 0x24($sp)
/* 8BA28 8009B228 A9C9010C */  jal        G2EmulationQueryAnimation
/* 8BA2C 8009B22C 2000B2AF */   sw        $s2, 0x20($sp)
/* 8BA30 8009B230 21984000 */  addu       $s3, $v0, $zero
/* 8BA34 8009B234 C0101100 */  sll        $v0, $s1, 3
/* 8BA38 8009B238 21105100 */  addu       $v0, $v0, $s1
/* 8BA3C 8009B23C C0100200 */  sll        $v0, $v0, 3
/* 8BA40 8009B240 23105100 */  subu       $v0, $v0, $s1
/* 8BA44 8009B244 80100200 */  sll        $v0, $v0, 2
/* 8BA48 8009B248 08004224 */  addiu      $v0, $v0, 0x8
/* 8BA4C 8009B24C 21900202 */  addu       $s2, $s0, $v0
.L8009B250:
/* 8BA50 8009B250 39C3010C */  jal        PeekMessageQueue
/* 8BA54 8009B254 04004426 */   addiu     $a0, $s2, 0x4
/* 8BA58 8009B258 00014010 */  beqz       $v0, .L8009B65C
/* 8BA5C 8009B25C 1000043C */   lui       $a0, (0x100004 >> 16)
/* 8BA60 8009B260 0000438C */  lw         $v1, 0x0($v0)
/* 8BA64 8009B264 04008434 */  ori        $a0, $a0, (0x100004 & 0xFFFF)
/* 8BA68 8009B268 F8006410 */  beq        $v1, $a0, .L8009B64C
/* 8BA6C 8009B26C 2A108300 */   slt       $v0, $a0, $v1
/* 8BA70 8009B270 25004014 */  bnez       $v0, .L8009B308
/* 8BA74 8009B274 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 8BA78 8009B278 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 8BA7C 8009B27C 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8BA80 8009B280 F2006210 */  beq        $v1, $v0, .L8009B64C
/* 8BA84 8009B284 2A104300 */   slt       $v0, $v0, $v1
/* 8BA88 8009B288 10004014 */  bnez       $v0, .L8009B2CC
/* 8BA8C 8009B28C 1000023C */   lui       $v0, (0x100000 >> 16)
/* 8BA90 8009B290 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 8BA94 8009B294 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8BA98 8009B298 EC006210 */  beq        $v1, $v0, .L8009B64C
/* 8BA9C 8009B29C 2A104300 */   slt       $v0, $v0, $v1
/* 8BAA0 8009B2A0 05004014 */  bnez       $v0, .L8009B2B8
/* 8BAA4 8009B2A4 0080023C */   lui       $v0, (0x80000010 >> 16)
/* 8BAA8 8009B2A8 6C006210 */  beq        $v1, $v0, .L8009B45C
/* 8BAAC 8009B2AC 21200002 */   addu      $a0, $s0, $zero
/* 8BAB0 8009B2B0 916D0208 */  j          .L8009B644
/* 8BAB4 8009B2B4 21282002 */   addu      $a1, $s1, $zero
.L8009B2B8:
/* 8BAB8 8009B2B8 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 8BABC 8009B2BC E3006210 */  beq        $v1, $v0, .L8009B64C
/* 8BAC0 8009B2C0 21200002 */   addu      $a0, $s0, $zero
/* 8BAC4 8009B2C4 916D0208 */  j          .L8009B644
/* 8BAC8 8009B2C8 21282002 */   addu      $a1, $s1, $zero
.L8009B2CC:
/* 8BACC 8009B2CC B6006210 */  beq        $v1, $v0, .L8009B5A8
/* 8BAD0 8009B2D0 2A104300 */   slt       $v0, $v0, $v1
/* 8BAD4 8009B2D4 07004014 */  bnez       $v0, .L8009B2F4
/* 8BAD8 8009B2D8 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8BADC 8009B2DC 0400023C */  lui        $v0, (0x40005 >> 16)
/* 8BAE0 8009B2E0 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* 8BAE4 8009B2E4 D9006210 */  beq        $v1, $v0, .L8009B64C
/* 8BAE8 8009B2E8 21200002 */   addu      $a0, $s0, $zero
/* 8BAEC 8009B2EC 916D0208 */  j          .L8009B644
/* 8BAF0 8009B2F0 21282002 */   addu      $a1, $s1, $zero
.L8009B2F4:
/* 8BAF4 8009B2F4 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8BAF8 8009B2F8 2C006210 */  beq        $v1, $v0, .L8009B3AC
/* 8BAFC 8009B2FC 21200002 */   addu      $a0, $s0, $zero
/* 8BB00 8009B300 916D0208 */  j          .L8009B644
/* 8BB04 8009B304 21282002 */   addu      $a1, $s1, $zero
.L8009B308:
/* 8BB08 8009B308 54006210 */  beq        $v1, $v0, .L8009B45C
/* 8BB0C 8009B30C 2A104300 */   slt       $v0, $v0, $v1
/* 8BB10 8009B310 12004014 */  bnez       $v0, .L8009B35C
/* 8BB14 8009B314 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 8BB18 8009B318 1000023C */  lui        $v0, (0x100015 >> 16)
/* 8BB1C 8009B31C 15004234 */  ori        $v0, $v0, (0x100015 & 0xFFFF)
/* 8BB20 8009B320 B5006210 */  beq        $v1, $v0, .L8009B5F8
/* 8BB24 8009B324 2A104300 */   slt       $v0, $v0, $v1
/* 8BB28 8009B328 07004014 */  bnez       $v0, .L8009B348
/* 8BB2C 8009B32C 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 8BB30 8009B330 1000023C */  lui        $v0, (0x100014 >> 16)
/* 8BB34 8009B334 14004234 */  ori        $v0, $v0, (0x100014 & 0xFFFF)
/* 8BB38 8009B338 C4006210 */  beq        $v1, $v0, .L8009B64C
/* 8BB3C 8009B33C 21200002 */   addu      $a0, $s0, $zero
/* 8BB40 8009B340 916D0208 */  j          .L8009B644
/* 8BB44 8009B344 21282002 */   addu      $a1, $s1, $zero
.L8009B348:
/* 8BB48 8009B348 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8BB4C 8009B34C BF006210 */  beq        $v1, $v0, .L8009B64C
/* 8BB50 8009B350 21200002 */   addu      $a0, $s0, $zero
/* 8BB54 8009B354 916D0208 */  j          .L8009B644
/* 8BB58 8009B358 21282002 */   addu      $a1, $s1, $zero
.L8009B35C:
/* 8BB5C 8009B35C 49006210 */  beq        $v1, $v0, .L8009B484
/* 8BB60 8009B360 2A104300 */   slt       $v0, $v0, $v1
/* 8BB64 8009B364 06004014 */  bnez       $v0, .L8009B380
/* 8BB68 8009B368 0010023C */   lui       $v0, (0x10002002 >> 16)
/* 8BB6C 8009B36C 0008023C */  lui        $v0, (0x8002002 >> 16)
/* 8BB70 8009B370 B6006210 */  beq        $v1, $v0, .L8009B64C
/* 8BB74 8009B374 21200002 */   addu      $a0, $s0, $zero
/* 8BB78 8009B378 916D0208 */  j          .L8009B644
/* 8BB7C 8009B37C 21282002 */   addu      $a1, $s1, $zero
.L8009B380:
/* 8BB80 8009B380 02204234 */  ori        $v0, $v0, (0x8002002 & 0xFFFF)
/* 8BB84 8009B384 2A104300 */  slt        $v0, $v0, $v1
/* 8BB88 8009B388 AD004014 */  bnez       $v0, .L8009B640
/* 8BB8C 8009B38C 21200002 */   addu      $a0, $s0, $zero
/* 8BB90 8009B390 0010023C */  lui        $v0, (0x10002001 >> 16)
/* 8BB94 8009B394 01204234 */  ori        $v0, $v0, (0x10002001 & 0xFFFF)
/* 8BB98 8009B398 2A106200 */  slt        $v0, $v1, $v0
/* 8BB9C 8009B39C A9004014 */  bnez       $v0, .L8009B644
/* 8BBA0 8009B3A0 21282002 */   addu      $a1, $s1, $zero
/* 8BBA4 8009B3A4 936D0208 */  j          .L8009B64C
/* 8BBA8 8009B3A8 00000000 */   nop
.L8009B3AC:
/* 8BBAC 8009B3AC 21200000 */  addu       $a0, $zero, $zero
/* 8BBB0 8009B3B0 21288000 */  addu       $a1, $a0, $zero
/* 8BBB4 8009B3B4 4FC6010C */  jal        SetControlInitIdleData
/* 8BBB8 8009B3B8 03000624 */   addiu     $a2, $zero, 0x3
/* 8BBBC 8009B3BC 21200002 */  addu       $a0, $s0, $zero
/* 8BBC0 8009B3C0 21282002 */  addu       $a1, $s1, $zero
/* 8BBC4 8009B3C4 8FA0020C */  jal        StateInitIdle
/* 8BBC8 8009B3C8 21304000 */   addu      $a2, $v0, $zero
/* 8BBCC 8009B3CC 0200023C */  lui        $v0, (0x20008 >> 16)
/* 8BBD0 8009B3D0 08004234 */  ori        $v0, $v0, (0x20008 & 0xFFFF)
/* 8BBD4 8009B3D4 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8BBD8 8009B3D8 0080023C */  lui        $v0, (0x80000000 >> 16)
/* 8BBDC 8009B3DC 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8BBE0 8009B3E0 03000224 */  addiu      $v0, $zero, 0x3
/* 8BBE4 8009B3E4 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 8BBE8 8009B3E8 70FA80AF */  sw         $zero, %gp_rel(Raziel + 0x440)($gp)
/* 8BBEC 8009B3EC 97002016 */  bnez       $s1, .L8009B64C
/* 8BBF0 8009B3F0 00000000 */   nop
/* 8BBF4 8009B3F4 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8BBF8 8009B3F8 00000000 */  nop
/* 8BBFC 8009B3FC 7000428C */  lw         $v0, 0x70($v0)
/* 8BC00 8009B400 00000000 */  nop
/* 8BC04 8009B404 78004294 */  lhu        $v0, 0x78($v0)
/* 8BC08 8009B408 00000000 */  nop
/* 8BC0C 8009B40C 86FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x556)($gp)
/* 8BC10 8009B410 0000048E */  lw         $a0, 0x0($s0)
/* 8BC14 8009B414 938B020C */  jal        SteerSwitchMode
/* 8BC18 8009B418 0D000524 */   addiu     $a1, $zero, 0xD
/* 8BC1C 8009B41C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8BC20 8009B420 0000038E */  lw         $v1, 0x0($s0)
/* 8BC24 8009B424 7000428C */  lw         $v0, 0x70($v0)
/* 8BC28 8009B428 00000000 */  nop
/* 8BC2C 8009B42C 5F004888 */  lwl        $t0, 0x5F($v0)
/* 8BC30 8009B430 5C004898 */  lwr        $t0, 0x5C($v0)
/* 8BC34 8009B434 60004984 */  lh         $t1, 0x60($v0)
/* 8BC38 8009B438 5F0068A8 */  swl        $t0, 0x5F($v1)
/* 8BC3C 8009B43C 5C0068B8 */  swr        $t0, 0x5C($v1)
/* 8BC40 8009B440 600069A4 */  sh         $t1, 0x60($v1)
/* 8BC44 8009B444 C89E020C */  jal        razSetPlayerEventHistory
/* 8BC48 8009B448 00080424 */   addiu     $a0, $zero, 0x800
/* 8BC4C 8009B44C FB6C010C */  jal        WARPGATE_StartUsingWarpgate
/* 8BC50 8009B450 00000000 */   nop
/* 8BC54 8009B454 936D0208 */  j          .L8009B64C
/* 8BC58 8009B458 00000000 */   nop
.L8009B45C:
/* 8BC5C 8009B45C 7B000224 */  addiu      $v0, $zero, 0x7B
/* 8BC60 8009B460 7A006212 */  beq        $s3, $v0, .L8009B64C
/* 8BC64 8009B464 8C004426 */   addiu     $a0, $s2, 0x8C
/* 8BC68 8009B468 1000053C */  lui        $a1, (0x100000 >> 16)
/* 8BC6C 8009B46C 4EC3010C */  jal        EnMessageQueueData
/* 8BC70 8009B470 21300000 */   addu      $a2, $zero, $zero
/* 8BC74 8009B474 096D010C */  jal        WARPGATE_EndUsingWarpgate
/* 8BC78 8009B478 00000000 */   nop
/* 8BC7C 8009B47C 936D0208 */  j          .L8009B64C
/* 8BC80 8009B480 00000000 */   nop
.L8009B484:
/* 8BC84 8009B484 71002016 */  bnez       $s1, .L8009B64C
/* 8BC88 8009B488 7B000224 */   addiu     $v0, $zero, 0x7B
/* 8BC8C 8009B48C 6F006212 */  beq        $s3, $v0, .L8009B64C
/* 8BC90 8009B490 00000000 */   nop
/* 8BC94 8009B494 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8BC98 8009B498 00000000 */  nop
/* 8BC9C 8009B49C 0000428C */  lw         $v0, 0x0($v0)
/* 8BCA0 8009B4A0 00000000 */  nop
/* 8BCA4 8009B4A4 04004230 */  andi       $v0, $v0, 0x4
/* 8BCA8 8009B4A8 03004010 */  beqz       $v0, .L8009B4B8
/* 8BCAC 8009B4AC 00000000 */   nop
/* 8BCB0 8009B4B0 B46D010C */  jal        WARPGATE_IncrementIndex
/* 8BCB4 8009B4B4 00000000 */   nop
.L8009B4B8:
/* 8BCB8 8009B4B8 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8BCBC 8009B4BC 00000000 */  nop
/* 8BCC0 8009B4C0 0000428C */  lw         $v0, 0x0($v0)
/* 8BCC4 8009B4C4 00000000 */  nop
/* 8BCC8 8009B4C8 08004230 */  andi       $v0, $v0, 0x8
/* 8BCCC 8009B4CC 03004010 */  beqz       $v0, .L8009B4DC
/* 8BCD0 8009B4D0 00000000 */   nop
/* 8BCD4 8009B4D4 166E010C */  jal        WARPGATE_DecrementIndex
/* 8BCD8 8009B4D8 00000000 */   nop
.L8009B4DC:
/* 8BCDC 8009B4DC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8BCE0 8009B4E0 00000000 */  nop
/* 8BCE4 8009B4E4 0000428C */  lw         $v0, 0x0($v0)
/* 8BCE8 8009B4E8 00000000 */  nop
/* 8BCEC 8009B4EC 01004230 */  andi       $v0, $v0, 0x1
/* 8BCF0 8009B4F0 56004010 */  beqz       $v0, .L8009B64C
/* 8BCF4 8009B4F4 00000000 */   nop
/* 8BCF8 8009B4F8 1D6D010C */  jal        WARPGATE_IsWarpgateUsable
/* 8BCFC 8009B4FC 00000000 */   nop
/* 8BD00 8009B500 1A004010 */  beqz       $v0, .L8009B56C
/* 8BD04 8009B504 0200033C */   lui       $v1, (0x20000 >> 16)
/* 8BD08 8009B508 31CC020C */  jal        SetTimer
/* 8BD0C 8009B50C 4B000424 */   addiu     $a0, $zero, 0x4B
/* 8BD10 8009B510 2197020C */  jal        razGetHeldItem
/* 8BD14 8009B514 00000000 */   nop
/* 8BD18 8009B518 05004010 */  beqz       $v0, .L8009B530
/* 8BD1C 8009B51C 21204000 */   addu      $a0, $v0, $zero
/* 8BD20 8009B520 8000053C */  lui        $a1, (0x800008 >> 16)
/* 8BD24 8009B524 0800A534 */  ori        $a1, $a1, (0x800008 & 0xFFFF)
/* 8BD28 8009B528 A1D1000C */  jal        INSTANCE_Post
/* 8BD2C 8009B52C 21300000 */   addu      $a2, $zero, $zero
.L8009B530:
/* 8BD30 8009B530 02000224 */  addiu      $v0, $zero, 0x2
/* 8BD34 8009B534 1000A2AF */  sw         $v0, 0x10($sp)
/* 8BD38 8009B538 21200002 */  addu       $a0, $s0, $zero
/* 8BD3C 8009B53C 7B000524 */  addiu      $a1, $zero, 0x7B
/* 8BD40 8009B540 21300000 */  addu       $a2, $zero, $zero
/* 8BD44 8009B544 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 8BD48 8009B548 06000724 */   addiu     $a3, $zero, 0x6
/* 8BD4C 8009B54C 276D010C */  jal        WARPGATE_IsWarpgateSpectral
/* 8BD50 8009B550 00000000 */   nop
/* 8BD54 8009B554 3D004010 */  beqz       $v0, .L8009B64C
/* 8BD58 8009B558 00000000 */   nop
/* 8BD5C 8009B55C 9F95020C */  jal        razSpectralShift
/* 8BD60 8009B560 00000000 */   nop
/* 8BD64 8009B564 936D0208 */  j          .L8009B64C
/* 8BD68 8009B568 00000000 */   nop
.L8009B56C:
/* 8BD6C 8009B56C E0FB828F */  lw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* 8BD70 8009B570 00000000 */  nop
/* 8BD74 8009B574 24104300 */  and        $v0, $v0, $v1
/* 8BD78 8009B578 34004014 */  bnez       $v0, .L8009B64C
/* 8BD7C 8009B57C 00000000 */   nop
/* 8BD80 8009B580 226D010C */  jal        WARPGATE_IsWarpgateReady
/* 8BD84 8009B584 00000000 */   nop
/* 8BD88 8009B588 30004010 */  beqz       $v0, .L8009B64C
/* 8BD8C 8009B58C 00000000 */   nop
/* 8BD90 8009B590 2C82010C */  jal        LOAD_PlayXA
/* 8BD94 8009B594 EF000424 */   addiu     $a0, $zero, 0xEF
/* 8BD98 8009B598 C89E020C */  jal        razSetPlayerEventHistory
/* 8BD9C 8009B59C 0200043C */   lui       $a0, (0x20000 >> 16)
/* 8BDA0 8009B5A0 936D0208 */  j          .L8009B64C
/* 8BDA4 8009B5A4 00000000 */   nop
.L8009B5A8:
/* 8BDA8 8009B5A8 1A6D010C */  jal        WARPGATE_IsWarpgateActive
/* 8BDAC 8009B5AC 00000000 */   nop
/* 8BDB0 8009B5B0 06004010 */  beqz       $v0, .L8009B5CC
/* 8BDB4 8009B5B4 8C004426 */   addiu     $a0, $s2, 0x8C
/* 8BDB8 8009B5B8 1000053C */  lui        $a1, (0x100000 >> 16)
/* 8BDBC 8009B5BC 4EC3010C */  jal        EnMessageQueueData
/* 8BDC0 8009B5C0 21300000 */   addu      $a2, $zero, $zero
/* 8BDC4 8009B5C4 936D0208 */  j          .L8009B64C
/* 8BDC8 8009B5C8 00000000 */   nop
.L8009B5CC:
/* 8BDCC 8009B5CC 21200000 */  addu       $a0, $zero, $zero
/* 8BDD0 8009B5D0 21288000 */  addu       $a1, $a0, $zero
/* 8BDD4 8009B5D4 4FC6010C */  jal        SetControlInitIdleData
/* 8BDD8 8009B5D8 03000624 */   addiu     $a2, $zero, 0x3
/* 8BDDC 8009B5DC 21200002 */  addu       $a0, $s0, $zero
/* 8BDE0 8009B5E0 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 8BDE4 8009B5E4 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 8BDE8 8009B5E8 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8BDEC 8009B5EC 21304000 */   addu      $a2, $v0, $zero
/* 8BDF0 8009B5F0 936D0208 */  j          .L8009B64C
/* 8BDF4 8009B5F4 00000000 */   nop
.L8009B5F8:
/* 8BDF8 8009B5F8 08002016 */  bnez       $s1, .L8009B61C
/* 8BDFC 8009B5FC 21200000 */   addu      $a0, $zero, $zero
/* 8BE00 8009B600 94000426 */  addiu      $a0, $s0, 0x94
/* 8BE04 8009B604 1000053C */  lui        $a1, (0x100000 >> 16)
/* 8BE08 8009B608 4EC3010C */  jal        EnMessageQueueData
/* 8BE0C 8009B60C 21300000 */   addu      $a2, $zero, $zero
/* 8BE10 8009B610 096D010C */  jal        WARPGATE_EndUsingWarpgate
/* 8BE14 8009B614 00000000 */   nop
/* 8BE18 8009B618 21200000 */  addu       $a0, $zero, $zero
.L8009B61C:
/* 8BE1C 8009B61C 21288000 */  addu       $a1, $a0, $zero
/* 8BE20 8009B620 4FC6010C */  jal        SetControlInitIdleData
/* 8BE24 8009B624 03000624 */   addiu     $a2, $zero, 0x3
/* 8BE28 8009B628 21200002 */  addu       $a0, $s0, $zero
/* 8BE2C 8009B62C 21282002 */  addu       $a1, $s1, $zero
/* 8BE30 8009B630 8FA0020C */  jal        StateInitIdle
/* 8BE34 8009B634 21304000 */   addu      $a2, $v0, $zero
/* 8BE38 8009B638 936D0208 */  j          .L8009B64C
/* 8BE3C 8009B63C 00000000 */   nop
.L8009B640:
/* 8BE40 8009B640 21282002 */  addu       $a1, $s1, $zero
.L8009B644:
/* 8BE44 8009B644 B9BF020C */  jal        DefaultStateHandler
/* 8BE48 8009B648 21308002 */   addu      $a2, $s4, $zero
.L8009B64C:
/* 8BE4C 8009B64C 27C3010C */  jal        DeMessageQueue
/* 8BE50 8009B650 04004426 */   addiu     $a0, $s2, 0x4
/* 8BE54 8009B654 946C0208 */  j          .L8009B250
/* 8BE58 8009B658 00000000 */   nop
.L8009B65C:
/* 8BE5C 8009B65C 03002016 */  bnez       $s1, .L8009B66C
/* 8BE60 8009B660 21200002 */   addu      $a0, $s0, $zero
/* 8BE64 8009B664 AF9A020C */  jal        razApplyMotion
/* 8BE68 8009B668 21280000 */   addu      $a1, $zero, $zero
.L8009B66C:
/* 8BE6C 8009B66C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 8BE70 8009B670 2800B48F */  lw         $s4, 0x28($sp)
/* 8BE74 8009B674 2400B38F */  lw         $s3, 0x24($sp)
/* 8BE78 8009B678 2000B28F */  lw         $s2, 0x20($sp)
/* 8BE7C 8009B67C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8BE80 8009B680 1800B08F */  lw         $s0, 0x18($sp)
/* 8BE84 8009B684 0800E003 */  jr         $ra
/* 8BE88 8009B688 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerWarpGate, . - StateHandlerWarpGate
