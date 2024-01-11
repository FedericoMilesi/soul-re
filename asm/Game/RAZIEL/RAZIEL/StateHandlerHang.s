.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerHang
/* 9DAF4 800AD2F4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9DAF8 800AD2F8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9DAFC 800AD2FC 21888000 */  addu       $s1, $a0, $zero
/* 9DB00 800AD300 2000B2AF */  sw         $s2, 0x20($sp)
/* 9DB04 800AD304 2190A000 */  addu       $s2, $a1, $zero
/* 9DB08 800AD308 3800BEAF */  sw         $fp, 0x38($sp)
/* 9DB0C 800AD30C 21F0C000 */  addu       $fp, $a2, $zero
/* 9DB10 800AD310 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 9DB14 800AD314 3400B7AF */  sw         $s7, 0x34($sp)
/* 9DB18 800AD318 3000B6AF */  sw         $s6, 0x30($sp)
/* 9DB1C 800AD31C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 9DB20 800AD320 2800B4AF */  sw         $s4, 0x28($sp)
/* 9DB24 800AD324 2400B3AF */  sw         $s3, 0x24($sp)
/* 9DB28 800AD328 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9DB2C 800AD32C 1800B0AF */   sw        $s0, 0x18($sp)
/* 9DB30 800AD330 21B84000 */  addu       $s7, $v0, $zero
/* 9DB34 800AD334 C0101200 */  sll        $v0, $s2, 3
/* 9DB38 800AD338 21105200 */  addu       $v0, $v0, $s2
/* 9DB3C 800AD33C C0100200 */  sll        $v0, $v0, 3
/* 9DB40 800AD340 23105200 */  subu       $v0, $v0, $s2
/* 9DB44 800AD344 80100200 */  sll        $v0, $v0, 2
/* 9DB48 800AD348 08004324 */  addiu      $v1, $v0, 0x8
/* 9DB4C 800AD34C 21B02302 */  addu       $s6, $s1, $v1
/* 9DB50 800AD350 0400D526 */  addiu      $s5, $s6, 0x4
/* 9DB54 800AD354 01001424 */  addiu      $s4, $zero, 0x1
/* 9DB58 800AD358 21982202 */  addu       $s3, $s1, $v0
.L800AD35C:
/* 9DB5C 800AD35C 39C3010C */  jal        PeekMessageQueue
/* 9DB60 800AD360 2120A002 */   addu      $a0, $s5, $zero
/* 9DB64 800AD364 21204000 */  addu       $a0, $v0, $zero
/* 9DB68 800AD368 3F018010 */  beqz       $a0, .L800AD868
/* 9DB6C 800AD36C 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 9DB70 800AD370 0000838C */  lw         $v1, 0x0($a0)
/* 9DB74 800AD374 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 9DB78 800AD378 2A104300 */  slt        $v0, $v0, $v1
/* 9DB7C 800AD37C 27004014 */  bnez       $v0, .L800AD41C
/* 9DB80 800AD380 0104023C */   lui       $v0, (0x4010200 >> 16)
/* 9DB84 800AD384 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 9DB88 800AD388 2A106200 */  slt        $v0, $v1, $v0
/* 9DB8C 800AD38C 32014010 */  beqz       $v0, .L800AD858
/* 9DB90 800AD390 1000023C */   lui       $v0, (0x100000 >> 16)
/* 9DB94 800AD394 F8006210 */  beq        $v1, $v0, .L800AD778
/* 9DB98 800AD398 2A104300 */   slt       $v0, $v0, $v1
/* 9DB9C 800AD39C 10004014 */  bnez       $v0, .L800AD3E0
/* 9DBA0 800AD3A0 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9DBA4 800AD3A4 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 9DBA8 800AD3A8 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9DBAC 800AD3AC 2A016210 */  beq        $v1, $v0, .L800AD858
/* 9DBB0 800AD3B0 2A104300 */   slt       $v0, $v0, $v1
/* 9DBB4 800AD3B4 05004014 */  bnez       $v0, .L800AD3CC
/* 9DBB8 800AD3B8 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 9DBBC 800AD3BC 26016210 */  beq        $v1, $v0, .L800AD858
/* 9DBC0 800AD3C0 21202002 */   addu      $a0, $s1, $zero
/* 9DBC4 800AD3C4 14B60208 */  j          .L800AD850
/* 9DBC8 800AD3C8 21284002 */   addu      $a1, $s2, $zero
.L800AD3CC:
/* 9DBCC 800AD3CC 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9DBD0 800AD3D0 21016210 */  beq        $v1, $v0, .L800AD858
/* 9DBD4 800AD3D4 21202002 */   addu      $a0, $s1, $zero
/* 9DBD8 800AD3D8 14B60208 */  j          .L800AD850
/* 9DBDC 800AD3DC 21284002 */   addu      $a1, $s2, $zero
.L800AD3E0:
/* 9DBE0 800AD3E0 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9DBE4 800AD3E4 78006210 */  beq        $v1, $v0, .L800AD5C8
/* 9DBE8 800AD3E8 2A104300 */   slt       $v0, $v0, $v1
/* 9DBEC 800AD3EC 06004014 */  bnez       $v0, .L800AD408
/* 9DBF0 800AD3F0 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9DBF4 800AD3F4 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9DBF8 800AD3F8 2E006210 */  beq        $v1, $v0, .L800AD4B4
/* 9DBFC 800AD3FC 00000000 */   nop
/* 9DC00 800AD400 13B60208 */  j          .L800AD84C
/* 9DC04 800AD404 21202002 */   addu      $a0, $s1, $zero
.L800AD408:
/* 9DC08 800AD408 14004234 */  ori        $v0, $v0, (0x100014 & 0xFFFF)
/* 9DC0C 800AD40C F5006210 */  beq        $v1, $v0, .L800AD7E4
/* 9DC10 800AD410 21202002 */   addu      $a0, $s1, $zero
/* 9DC14 800AD414 14B60208 */  j          .L800AD850
/* 9DC18 800AD418 21284002 */   addu      $a1, $s2, $zero
.L800AD41C:
/* 9DC1C 800AD41C 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* 9DC20 800AD420 0D016210 */  beq        $v1, $v0, .L800AD858
/* 9DC24 800AD424 2A104300 */   slt       $v0, $v0, $v1
/* 9DC28 800AD428 12004014 */  bnez       $v0, .L800AD474
/* 9DC2C 800AD42C 0008023C */   lui       $v0, (0x8000001 >> 16)
/* 9DC30 800AD430 0004023C */  lui        $v0, (0x4000011 >> 16)
/* 9DC34 800AD434 11004234 */  ori        $v0, $v0, (0x4000011 & 0xFFFF)
/* 9DC38 800AD438 07016210 */  beq        $v1, $v0, .L800AD858
/* 9DC3C 800AD43C 2A104300 */   slt       $v0, $v0, $v1
/* 9DC40 800AD440 07004014 */  bnez       $v0, .L800AD460
/* 9DC44 800AD444 0104023C */   lui       $v0, (0x4010010 >> 16)
/* 9DC48 800AD448 0004023C */  lui        $v0, (0x4000001 >> 16)
/* 9DC4C 800AD44C 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 9DC50 800AD450 01016210 */  beq        $v1, $v0, .L800AD858
/* 9DC54 800AD454 21202002 */   addu      $a0, $s1, $zero
/* 9DC58 800AD458 14B60208 */  j          .L800AD850
/* 9DC5C 800AD45C 21284002 */   addu      $a1, $s2, $zero
.L800AD460:
/* 9DC60 800AD460 10004234 */  ori        $v0, $v0, (0x4010010 & 0xFFFF)
/* 9DC64 800AD464 FC006210 */  beq        $v1, $v0, .L800AD858
/* 9DC68 800AD468 21202002 */   addu      $a0, $s1, $zero
/* 9DC6C 800AD46C 14B60208 */  j          .L800AD850
/* 9DC70 800AD470 21284002 */   addu      $a1, $s2, $zero
.L800AD474:
/* 9DC74 800AD474 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9DC78 800AD478 83006210 */  beq        $v1, $v0, .L800AD688
/* 9DC7C 800AD47C 2A104300 */   slt       $v0, $v0, $v1
/* 9DC80 800AD480 05004014 */  bnez       $v0, .L800AD498
/* 9DC84 800AD484 0008023C */   lui       $v0, (0x8000003 >> 16)
/* 9DC88 800AD488 94006210 */  beq        $v1, $v0, .L800AD6DC
/* 9DC8C 800AD48C 21202002 */   addu      $a0, $s1, $zero
/* 9DC90 800AD490 14B60208 */  j          .L800AD850
/* 9DC94 800AD494 21284002 */   addu      $a1, $s2, $zero
.L800AD498:
/* 9DC98 800AD498 03004234 */  ori        $v0, $v0, (0x8000003 & 0xFFFF)
/* 9DC9C 800AD49C 83006210 */  beq        $v1, $v0, .L800AD6AC
/* 9DCA0 800AD4A0 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9DCA4 800AD4A4 57006210 */  beq        $v1, $v0, .L800AD604
/* 9DCA8 800AD4A8 0010033C */   lui       $v1, (0x10000003 >> 16)
/* 9DCAC 800AD4AC 13B60208 */  j          .L800AD84C
/* 9DCB0 800AD4B0 21202002 */   addu      $a0, $s1, $zero
.L800AD4B4:
/* 9DCB4 800AD4B4 0400908C */  lw         $s0, 0x4($a0)
/* 9DCB8 800AD4B8 23004016 */  bnez       $s2, .L800AD548
/* 9DCBC 800AD4BC 0400033C */   lui       $v1, (0x40000 >> 16)
/* 9DCC0 800AD4C0 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9DCC4 800AD4C4 00000000 */  nop
/* 9DCC8 800AD4C8 24104300 */  and        $v0, $v0, $v1
/* 9DCCC 800AD4CC 05004010 */  beqz       $v0, .L800AD4E4
/* 9DCD0 800AD4D0 00000000 */   nop
/* 9DCD4 800AD4D4 0000258E */  lw         $a1, 0x0($s1)
/* 9DCD8 800AD4D8 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 9DCDC 800AD4DC F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 9DCE0 800AD4E0 00000000 */   nop
.L800AD4E4:
/* 9DCE4 800AD4E4 0000228E */  lw         $v0, 0x0($s1)
/* 9DCE8 800AD4E8 0000238E */  lw         $v1, 0x0($s1)
/* 9DCEC 800AD4EC 8C00428C */  lw         $v0, 0x8C($v0)
/* 9DCF0 800AD4F0 0008043C */  lui        $a0, (0x8001501 >> 16)
/* 9DCF4 800AD4F4 200122AE */  sw         $v0, 0x120($s1)
/* 9DCF8 800AD4F8 8C00628C */  lw         $v0, 0x8C($v1)
/* 9DCFC 800AD4FC 01158434 */  ori        $a0, $a0, (0x8001501 & 0xFFFF)
/* 9DD00 800AD500 C8FD84AF */  sw         $a0, %gp_rel(ControlFlag)($gp)
/* 9DD04 800AD504 03004014 */  bnez       $v0, .L800AD514
/* 9DD08 800AD508 000C023C */   lui       $v0, (0xC001501 >> 16)
/* 9DD0C 800AD50C 01154234 */  ori        $v0, $v0, (0xC001501 & 0xFFFF)
/* 9DD10 800AD510 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800AD514:
/* 9DD14 800AD514 0000228E */  lw         $v0, 0x0($s1)
/* 9DD18 800AD518 00000000 */  nop
/* 9DD1C 800AD51C 8C0040AC */  sw         $zero, 0x8C($v0)
/* 9DD20 800AD520 00010224 */  addiu      $v0, $zero, 0x100
/* 9DD24 800AD524 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9DD28 800AD528 0000028E */  lw         $v0, 0x0($s0)
/* 9DD2C 800AD52C 00000000 */  nop
/* 9DD30 800AD530 02004010 */  beqz       $v0, .L800AD53C
/* 9DD34 800AD534 00000000 */   nop
/* 9DD38 800AD538 20FA82AF */  sw         $v0, %gp_rel(Raziel + 0x3F0)($gp)
.L800AD53C:
/* 9DD3C 800AD53C 0000248E */  lw         $a0, 0x0($s1)
/* 9DD40 800AD540 938B020C */  jal        SteerSwitchMode
/* 9DD44 800AD544 21280000 */   addu      $a1, $zero, $zero
.L800AD548:
/* 9DD48 800AD548 A0F98287 */  lh         $v0, %gp_rel(Raziel + 0x370)($gp)
/* 9DD4C 800AD54C 00000000 */  nop
/* 9DD50 800AD550 06004104 */  bgez       $v0, .L800AD56C
/* 9DD54 800AD554 21284002 */   addu      $a1, $s2, $zero
/* 9DD58 800AD558 21202002 */  addu       $a0, $s1, $zero
/* 9DD5C 800AD55C 07000624 */  addiu      $a2, $zero, 0x7
/* 9DD60 800AD560 0800028E */  lw         $v0, 0x8($s0)
/* 9DD64 800AD564 5FB50208 */  j          .L800AD57C
/* 9DD68 800AD568 04000724 */   addiu     $a3, $zero, 0x4
.L800AD56C:
/* 9DD6C 800AD56C 21202002 */  addu       $a0, $s1, $zero
/* 9DD70 800AD570 07000624 */  addiu      $a2, $zero, 0x7
/* 9DD74 800AD574 0800028E */  lw         $v0, 0x8($s0)
/* 9DD78 800AD578 21380000 */  addu       $a3, $zero, $zero
.L800AD57C:
/* 9DD7C 800AD57C 1400B4AF */  sw         $s4, 0x14($sp)
/* 9DD80 800AD580 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9DD84 800AD584 1000A2AF */   sw        $v0, 0x10($sp)
/* 9DD88 800AD588 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 9DD8C 800AD58C 21300000 */  addu       $a2, $zero, $zero
/* 9DD90 800AD590 1C0160AE */  sw         $zero, 0x11C($s3)
/* 9DD94 800AD594 1000A0AF */  sw         $zero, 0x10($sp)
/* 9DD98 800AD598 0000248E */  lw         $a0, 0x0($s1)
/* 9DD9C 800AD59C 03000224 */  addiu      $v0, $zero, 0x3
/* 9DDA0 800AD5A0 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9DDA4 800AD5A4 4E68020C */  jal        SetPhysics
/* 9DDA8 800AD5A8 2138C000 */   addu      $a3, $a2, $zero
/* 9DDAC 800AD5AC 0000248E */  lw         $a0, 0x0($s1)
/* 9DDB0 800AD5B0 00000000 */  nop
/* 9DDB4 800AD5B4 1800828C */  lw         $v0, 0x18($a0)
/* 9DDB8 800AD5B8 BFFF0324 */  addiu      $v1, $zero, -0x41
/* 9DDBC 800AD5BC 24104300 */  and        $v0, $v0, $v1
/* 9DDC0 800AD5C0 16B60208 */  j          .L800AD858
/* 9DDC4 800AD5C4 180082AC */   sw        $v0, 0x18($a0)
.L800AD5C8:
/* 9DDC8 800AD5C8 07004016 */  bnez       $s2, .L800AD5E8
/* 9DDCC 800AD5CC FFFB0224 */   addiu     $v0, $zero, -0x401
/* 9DDD0 800AD5D0 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 9DDD4 800AD5D4 20FA80AF */  sw         $zero, %gp_rel(Raziel + 0x3F0)($gp)
/* 9DDD8 800AD5D8 0000248E */  lw         $a0, 0x0($s1)
/* 9DDDC 800AD5DC 24186200 */  and        $v1, $v1, $v0
/* 9DDE0 800AD5E0 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 9DDE4 800AD5E4 8C0080AC */  sw         $zero, 0x8C($a0)
.L800AD5E8:
/* 9DDE8 800AD5E8 0000238E */  lw         $v1, 0x0($s1)
/* 9DDEC 800AD5EC 00000000 */  nop
/* 9DDF0 800AD5F0 1800628C */  lw         $v0, 0x18($v1)
/* 9DDF4 800AD5F4 00000000 */  nop
/* 9DDF8 800AD5F8 40004234 */  ori        $v0, $v0, 0x40
/* 9DDFC 800AD5FC 16B60208 */  j          .L800AD858
/* 9DE00 800AD600 180062AC */   sw        $v0, 0x18($v1)
.L800AD604:
/* 9DE04 800AD604 0400828C */  lw         $v0, 0x4($a0)
/* 9DE08 800AD608 03006334 */  ori        $v1, $v1, (0x10000003 & 0xFFFF)
/* 9DE0C 800AD60C 05004314 */  bne        $v0, $v1, .L800AD624
/* 9DE10 800AD610 0010033C */   lui       $v1, (0x10000001 >> 16)
/* 9DE14 800AD614 06000224 */  addiu      $v0, $zero, 0x6
/* 9DE18 800AD618 7200E212 */  beq        $s7, $v0, .L800AD7E4
/* 9DE1C 800AD61C 00000000 */   nop
/* 9DE20 800AD620 0400828C */  lw         $v0, 0x4($a0)
.L800AD624:
/* 9DE24 800AD624 01006334 */  ori        $v1, $v1, (0x10000001 & 0xFFFF)
/* 9DE28 800AD628 08004310 */  beq        $v0, $v1, .L800AD64C
/* 9DE2C 800AD62C 00000000 */   nop
/* 9DE30 800AD630 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9DE34 800AD634 00000000 */  nop
/* 9DE38 800AD638 0000428C */  lw         $v0, 0x0($v0)
/* 9DE3C 800AD63C 00000000 */  nop
/* 9DE40 800AD640 01004230 */  andi       $v0, $v0, 0x1
/* 9DE44 800AD644 84004010 */  beqz       $v0, .L800AD858
/* 9DE48 800AD648 00000000 */   nop
.L800AD64C:
/* 9DE4C 800AD64C 1C01628E */  lw         $v0, 0x11C($s3)
/* 9DE50 800AD650 00000000 */  nop
/* 9DE54 800AD654 0A004014 */  bnez       $v0, .L800AD680
/* 9DE58 800AD658 21202002 */   addu      $a0, $s1, $zero
/* 9DE5C 800AD65C 21284002 */  addu       $a1, $s2, $zero
/* 9DE60 800AD660 08000624 */  addiu      $a2, $zero, 0x8
/* 9DE64 800AD664 21380000 */  addu       $a3, $zero, $zero
/* 9DE68 800AD668 02000224 */  addiu      $v0, $zero, 0x2
/* 9DE6C 800AD66C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9DE70 800AD670 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9DE74 800AD674 1400B4AF */   sw        $s4, 0x14($sp)
/* 9DE78 800AD678 36C3010C */  jal        PurgeMessageQueue
/* 9DE7C 800AD67C 0400C426 */   addiu     $a0, $s6, 0x4
.L800AD680:
/* 9DE80 800AD680 16B60208 */  j          .L800AD858
/* 9DE84 800AD684 1C0174AE */   sw        $s4, 0x11C($s3)
.L800AD688:
/* 9DE88 800AD688 1C01628E */  lw         $v0, 0x11C($s3)
/* 9DE8C 800AD68C 00000000 */  nop
/* 9DE90 800AD690 71005414 */  bne        $v0, $s4, .L800AD858
/* 9DE94 800AD694 2120A002 */   addu      $a0, $s5, $zero
/* 9DE98 800AD698 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9DE9C 800AD69C 4EC3010C */  jal        EnMessageQueueData
/* 9DEA0 800AD6A0 21300000 */   addu      $a2, $zero, $zero
/* 9DEA4 800AD6A4 16B60208 */  j          .L800AD858
/* 9DEA8 800AD6A8 00000000 */   nop
.L800AD6AC:
/* 9DEAC 800AD6AC 6A004016 */  bnez       $s2, .L800AD858
/* 9DEB0 800AD6B0 FFFB0224 */   addiu     $v0, $zero, -0x401
/* 9DEB4 800AD6B4 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 9DEB8 800AD6B8 2001248E */  lw         $a0, 0x120($s1)
/* 9DEBC 800AD6BC 24186200 */  and        $v1, $v1, $v0
/* 9DEC0 800AD6C0 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 9DEC4 800AD6C4 64008010 */  beqz       $a0, .L800AD858
/* 9DEC8 800AD6C8 0004023C */   lui       $v0, (0x4000000 >> 16)
/* 9DECC 800AD6CC 25106200 */  or         $v0, $v1, $v0
/* 9DED0 800AD6D0 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9DED4 800AD6D4 16B60208 */  j          .L800AD858
/* 9DED8 800AD6D8 00000000 */   nop
.L800AD6DC:
/* 9DEDC 800AD6DC 1C01628E */  lw         $v0, 0x11C($s3)
/* 9DEE0 800AD6E0 00000000 */  nop
/* 9DEE4 800AD6E4 0B005414 */  bne        $v0, $s4, .L800AD714
/* 9DEE8 800AD6E8 02000224 */   addiu     $v0, $zero, 0x2
/* 9DEEC 800AD6EC 2120A002 */  addu       $a0, $s5, $zero
/* 9DEF0 800AD6F0 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9DEF4 800AD6F4 4EC3010C */  jal        EnMessageQueueData
/* 9DEF8 800AD6F8 21300000 */   addu      $a2, $zero, $zero
/* 9DEFC 800AD6FC 0000228E */  lw         $v0, 0x0($s1)
/* 9DF00 800AD700 00000000 */  nop
/* 9DF04 800AD704 740040A4 */  sh         $zero, 0x74($v0)
/* 9DF08 800AD708 0000228E */  lw         $v0, 0x0($s1)
/* 9DF0C 800AD70C D6B50208 */  j          .L800AD758
/* 9DF10 800AD710 760040A4 */   sh        $zero, 0x76($v0)
.L800AD714:
/* 9DF14 800AD714 08004216 */  bne        $s2, $v0, .L800AD738
/* 9DF18 800AD718 21202002 */   addu      $a0, $s1, $zero
/* 9DF1C 800AD71C 21284000 */  addu       $a1, $v0, $zero
/* 9DF20 800AD720 21300000 */  addu       $a2, $zero, $zero
/* 9DF24 800AD724 2138C000 */  addu       $a3, $a2, $zero
/* 9DF28 800AD728 03000224 */  addiu      $v0, $zero, 0x3
/* 9DF2C 800AD72C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9DF30 800AD730 D4B50208 */  j          .L800AD750
/* 9DF34 800AD734 1400B2AF */   sw        $s2, 0x14($sp)
.L800AD738:
/* 9DF38 800AD738 21284002 */  addu       $a1, $s2, $zero
/* 9DF3C 800AD73C 06000624 */  addiu      $a2, $zero, 0x6
/* 9DF40 800AD740 21380000 */  addu       $a3, $zero, $zero
/* 9DF44 800AD744 03000224 */  addiu      $v0, $zero, 0x3
/* 9DF48 800AD748 1000A2AF */  sw         $v0, 0x10($sp)
/* 9DF4C 800AD74C 1400A0AF */  sw         $zero, 0x14($sp)
.L800AD750:
/* 9DF50 800AD750 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9DF54 800AD754 00000000 */   nop
.L800AD758:
/* 9DF58 800AD758 3F004016 */  bnez       $s2, .L800AD858
/* 9DF5C 800AD75C FFFB0324 */   addiu     $v1, $zero, -0x401
/* 9DF60 800AD760 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9DF64 800AD764 00000000 */  nop
/* 9DF68 800AD768 24104300 */  and        $v0, $v0, $v1
/* 9DF6C 800AD76C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9DF70 800AD770 16B60208 */  j          .L800AD858
/* 9DF74 800AD774 00000000 */   nop
.L800AD778:
/* 9DF78 800AD778 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9DF7C 800AD77C 0080033C */  lui        $v1, (0x8000000F >> 16)
/* 9DF80 800AD780 0000428C */  lw         $v0, 0x0($v0)
/* 9DF84 800AD784 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 9DF88 800AD788 24104300 */  and        $v0, $v0, $v1
/* 9DF8C 800AD78C 08004010 */  beqz       $v0, .L800AD7B0
/* 9DF90 800AD790 21202002 */   addu      $a0, $s1, $zero
/* 9DF94 800AD794 21284002 */  addu       $a1, $s2, $zero
/* 9DF98 800AD798 0B80063C */  lui        $a2, %hi(StateHandlerStartMove)
/* 9DF9C 800AD79C C4A2C624 */  addiu      $a2, $a2, %lo(StateHandlerStartMove)
/* 9DFA0 800AD7A0 C1CA010C */  jal        StateSwitchStateData
/* 9DFA4 800AD7A4 0A000724 */   addiu     $a3, $zero, 0xA
/* 9DFA8 800AD7A8 16B60208 */  j          .L800AD858
/* 9DFAC 800AD7AC 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AD7B0:
/* 9DFB0 800AD7B0 21200000 */  addu       $a0, $zero, $zero
/* 9DFB4 800AD7B4 21288000 */  addu       $a1, $a0, $zero
/* 9DFB8 800AD7B8 4FC6010C */  jal        SetControlInitIdleData
/* 9DFBC 800AD7BC 03000624 */   addiu     $a2, $zero, 0x3
/* 9DFC0 800AD7C0 21202002 */  addu       $a0, $s1, $zero
/* 9DFC4 800AD7C4 21284002 */  addu       $a1, $s2, $zero
/* 9DFC8 800AD7C8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9DFCC 800AD7CC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9DFD0 800AD7D0 C1CA010C */  jal        StateSwitchStateData
/* 9DFD4 800AD7D4 21384000 */   addu      $a3, $v0, $zero
/* 9DFD8 800AD7D8 90F994AF */  sw         $s4, %gp_rel(Raziel + 0x360)($gp)
/* 9DFDC 800AD7DC 16B60208 */  j          .L800AD858
/* 9DFE0 800AD7E0 1C0160AE */   sw        $zero, 0x11C($s3)
.L800AD7E4:
/* 9DFE4 800AD7E4 1C005416 */  bne        $s2, $s4, .L800AD858
/* 9DFE8 800AD7E8 F0FF0524 */   addiu     $a1, $zero, -0x10
/* 9DFEC 800AD7EC 21300000 */  addu       $a2, $zero, $zero
/* 9DFF0 800AD7F0 1000A0AF */  sw         $zero, 0x10($sp)
/* 9DFF4 800AD7F4 0000248E */  lw         $a0, 0x0($s1)
/* 9DFF8 800AD7F8 4E68020C */  jal        SetPhysics
/* 9DFFC 800AD7FC 2138C000 */   addu      $a3, $a2, $zero
/* 9E000 800AD800 18000524 */  addiu      $a1, $zero, 0x18
/* 9E004 800AD804 21300000 */  addu       $a2, $zero, $zero
/* 9E008 800AD808 0000248E */  lw         $a0, 0x0($s1)
/* 9E00C 800AD80C 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9E010 800AD810 2138C000 */   addu      $a3, $a2, $zero
/* 9E014 800AD814 06004010 */  beqz       $v0, .L800AD830
/* 9E018 800AD818 21202002 */   addu      $a0, $s1, $zero
/* 9E01C 800AD81C 1000B2AF */  sw         $s2, 0x10($sp)
/* 9E020 800AD820 24000524 */  addiu      $a1, $zero, 0x24
/* 9E024 800AD824 21300000 */  addu       $a2, $zero, $zero
/* 9E028 800AD828 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9E02C 800AD82C 04000724 */   addiu     $a3, $zero, 0x4
.L800AD830:
/* 9E030 800AD830 21202002 */  addu       $a0, $s1, $zero
/* 9E034 800AD834 0B80053C */  lui        $a1, %hi(StateHandlerFall)
/* 9E038 800AD838 A8BDA524 */  addiu      $a1, $a1, %lo(StateHandlerFall)
/* 9E03C 800AD83C F4CA010C */  jal        StateSwitchStateCharacterData
/* 9E040 800AD840 21300000 */   addu      $a2, $zero, $zero
/* 9E044 800AD844 16B60208 */  j          .L800AD858
/* 9E048 800AD848 00000000 */   nop
.L800AD84C:
/* 9E04C 800AD84C 21284002 */  addu       $a1, $s2, $zero
.L800AD850:
/* 9E050 800AD850 B9BF020C */  jal        DefaultStateHandler
/* 9E054 800AD854 2130C003 */   addu      $a2, $fp, $zero
.L800AD858:
/* 9E058 800AD858 27C3010C */  jal        DeMessageQueue
/* 9E05C 800AD85C 0400C426 */   addiu     $a0, $s6, 0x4
/* 9E060 800AD860 D7B40208 */  j          .L800AD35C
/* 9E064 800AD864 00000000 */   nop
.L800AD868:
/* 9E068 800AD868 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 9E06C 800AD86C 3800BE8F */  lw         $fp, 0x38($sp)
/* 9E070 800AD870 3400B78F */  lw         $s7, 0x34($sp)
/* 9E074 800AD874 3000B68F */  lw         $s6, 0x30($sp)
/* 9E078 800AD878 2C00B58F */  lw         $s5, 0x2C($sp)
/* 9E07C 800AD87C 2800B48F */  lw         $s4, 0x28($sp)
/* 9E080 800AD880 2400B38F */  lw         $s3, 0x24($sp)
/* 9E084 800AD884 2000B28F */  lw         $s2, 0x20($sp)
/* 9E088 800AD888 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9E08C 800AD88C 1800B08F */  lw         $s0, 0x18($sp)
/* 9E090 800AD890 0800E003 */  jr         $ra
/* 9E094 800AD894 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerHang, . - StateHandlerHang
