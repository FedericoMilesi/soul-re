.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerSwim
/* 90A0C 800A020C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 90A10 800A0210 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 90A14 800A0214 21888000 */  addu       $s1, $a0, $zero
/* 90A18 800A0218 2400B3AF */  sw         $s3, 0x24($sp)
/* 90A1C 800A021C 2198A000 */  addu       $s3, $a1, $zero
/* 90A20 800A0220 3800BEAF */  sw         $fp, 0x38($sp)
/* 90A24 800A0224 01001E24 */  addiu      $fp, $zero, 0x1
/* 90A28 800A0228 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 90A2C 800A022C 3400B7AF */  sw         $s7, 0x34($sp)
/* 90A30 800A0230 3000B6AF */  sw         $s6, 0x30($sp)
/* 90A34 800A0234 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 90A38 800A0238 2800B4AF */  sw         $s4, 0x28($sp)
/* 90A3C 800A023C 2000B2AF */  sw         $s2, 0x20($sp)
/* 90A40 800A0240 1800B0AF */  sw         $s0, 0x18($sp)
/* 90A44 800A0244 23006016 */  bnez       $s3, .L800A02D4
/* 90A48 800A0248 4800A6AF */   sw        $a2, 0x48($sp)
/* 90A4C 800A024C 0000228E */  lw         $v0, 0x0($s1)
/* 90A50 800A0250 00000000 */  nop
/* 90A54 800A0254 7C01428C */  lw         $v0, 0x17C($v0)
/* 90A58 800A0258 00000000 */  nop
/* 90A5C 800A025C 05004018 */  blez       $v0, .L800A0274
/* 90A60 800A0260 00000000 */   nop
/* 90A64 800A0264 2001228E */  lw         $v0, 0x120($s1)
/* 90A68 800A0268 00000000 */  nop
/* 90A6C 800A026C 02004234 */  ori        $v0, $v0, 0x2
/* 90A70 800A0270 200122AE */  sw         $v0, 0x120($s1)
.L800A0274:
/* 90A74 800A0274 A0F98287 */  lh         $v0, %gp_rel(Raziel + 0x370)($gp)
/* 90A78 800A0278 00000000 */  nop
/* 90A7C 800A027C A0FF4228 */  slti       $v0, $v0, -0x60
/* 90A80 800A0280 04004010 */  beqz       $v0, .L800A0294
/* 90A84 800A0284 03000424 */   addiu     $a0, $zero, 0x3
/* 90A88 800A0288 21288000 */  addu       $a1, $a0, $zero
/* 90A8C 800A028C 8B9D020C */  jal        razLaunchBubbles
/* 90A90 800A0290 01000624 */   addiu     $a2, $zero, 0x1
.L800A0294:
/* 90A94 800A0294 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 90A98 800A0298 00000000 */  nop
/* 90A9C 800A029C 01004230 */  andi       $v0, $v0, 0x1
/* 90AA0 800A02A0 04004010 */  beqz       $v0, .L800A02B4
/* 90AA4 800A02A4 02000424 */   addiu     $a0, $zero, 0x2
/* 90AA8 800A02A8 01000524 */  addiu      $a1, $zero, 0x1
/* 90AAC 800A02AC 8B9D020C */  jal        razLaunchBubbles
/* 90AB0 800A02B0 21300000 */   addu      $a2, $zero, $zero
.L800A02B4:
/* 90AB4 800A02B4 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 90AB8 800A02B8 00000000 */  nop
/* 90ABC 800A02BC 02004230 */  andi       $v0, $v0, 0x2
/* 90AC0 800A02C0 04004010 */  beqz       $v0, .L800A02D4
/* 90AC4 800A02C4 02000424 */   addiu     $a0, $zero, 0x2
/* 90AC8 800A02C8 01000524 */  addiu      $a1, $zero, 0x1
/* 90ACC 800A02CC 8B9D020C */  jal        razLaunchBubbles
/* 90AD0 800A02D0 21300000 */   addu      $a2, $zero, $zero
.L800A02D4:
/* 90AD4 800A02D4 01001624 */  addiu      $s6, $zero, 0x1
/* 90AD8 800A02D8 02001424 */  addiu      $s4, $zero, 0x2
/* 90ADC 800A02DC C0101300 */  sll        $v0, $s3, 3
/* 90AE0 800A02E0 21105300 */  addu       $v0, $v0, $s3
/* 90AE4 800A02E4 C0100200 */  sll        $v0, $v0, 3
/* 90AE8 800A02E8 23105300 */  subu       $v0, $v0, $s3
/* 90AEC 800A02EC 04B88202 */  sllv       $s7, $v0, $s4
/* 90AF0 800A02F0 21A83702 */  addu       $s5, $s1, $s7
/* 90AF4 800A02F4 2110F102 */  addu       $v0, $s7, $s1
.L800A02F8:
/* 90AF8 800A02F8 0C005024 */  addiu      $s0, $v0, 0xC
/* 90AFC 800A02FC 39C3010C */  jal        PeekMessageQueue
/* 90B00 800A0300 21200002 */   addu      $a0, $s0, $zero
/* 90B04 800A0304 21204000 */  addu       $a0, $v0, $zero
/* 90B08 800A0308 93028010 */  beqz       $a0, .L800A0D58
/* 90B0C 800A030C 1000023C */   lui       $v0, (0x100014 >> 16)
/* 90B10 800A0310 0000838C */  lw         $v1, 0x0($a0)
/* 90B14 800A0314 14004234 */  ori        $v0, $v0, (0x100014 & 0xFFFF)
/* 90B18 800A0318 69026210 */  beq        $v1, $v0, .L800A0CC0
/* 90B1C 800A031C 2A104300 */   slt       $v0, $v0, $v1
/* 90B20 800A0320 30004014 */  bnez       $v0, .L800A03E4
/* 90B24 800A0324 0104023C */   lui       $v0, (0x4010200 >> 16)
/* 90B28 800A0328 0080023C */  lui        $v0, (0x80000010 >> 16)
/* 90B2C 800A032C 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 90B30 800A0330 3F026210 */  beq        $v1, $v0, .L800A0C30
/* 90B34 800A0334 2A104300 */   slt       $v0, $v0, $v1
/* 90B38 800A0338 15004014 */  bnez       $v0, .L800A0390
/* 90B3C 800A033C 1000023C */   lui       $v0, (0x100001 >> 16)
/* 90B40 800A0340 0080023C */  lui        $v0, (0x80000002 >> 16)
/* 90B44 800A0344 02004234 */  ori        $v0, $v0, (0x80000002 & 0xFFFF)
/* 90B48 800A0348 A3006210 */  beq        $v1, $v0, .L800A05D8
/* 90B4C 800A034C 2A104300 */   slt       $v0, $v0, $v1
/* 90B50 800A0350 07004014 */  bnez       $v0, .L800A0370
/* 90B54 800A0354 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 90B58 800A0358 7A026210 */  beq        $v1, $v0, .L800A0D44
/* 90B5C 800A035C 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 90B60 800A0360 3C016210 */  beq        $v1, $v0, .L800A0854
/* 90B64 800A0364 21202002 */   addu      $a0, $s1, $zero
/* 90B68 800A0368 4E830208 */  j          .L800A0D38
/* 90B6C 800A036C 00000000 */   nop
.L800A0370:
/* 90B70 800A0370 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 90B74 800A0374 22026210 */  beq        $v1, $v0, .L800A0C00
/* 90B78 800A0378 0080023C */   lui       $v0, (0x80000008 >> 16)
/* 90B7C 800A037C 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 90B80 800A0380 1D016210 */  beq        $v1, $v0, .L800A07F8
/* 90B84 800A0384 21202002 */   addu      $a0, $s1, $zero
/* 90B88 800A0388 4E830208 */  j          .L800A0D38
/* 90B8C 800A038C 00000000 */   nop
.L800A0390:
/* 90B90 800A0390 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 90B94 800A0394 49006210 */  beq        $v1, $v0, .L800A04BC
/* 90B98 800A0398 2A104300 */   slt       $v0, $v0, $v1
/* 90B9C 800A039C 09004014 */  bnez       $v0, .L800A03C4
/* 90BA0 800A03A0 1000023C */   lui       $v0, (0x100004 >> 16)
/* 90BA4 800A03A4 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 90BA8 800A03A8 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 90BAC 800A03AC 96006210 */  beq        $v1, $v0, .L800A0608
/* 90BB0 800A03B0 0800023C */   lui       $v0, (0x80004 >> 16)
/* 90BB4 800A03B4 A9006210 */  beq        $v1, $v0, .L800A065C
/* 90BB8 800A03B8 21202002 */   addu      $a0, $s1, $zero
/* 90BBC 800A03BC 4E830208 */  j          .L800A0D38
/* 90BC0 800A03C0 00000000 */   nop
.L800A03C4:
/* 90BC4 800A03C4 04004234 */  ori        $v0, $v0, (0x80004 & 0xFFFF)
/* 90BC8 800A03C8 70006210 */  beq        $v1, $v0, .L800A058C
/* 90BCC 800A03CC 1000023C */   lui       $v0, (0x100009 >> 16)
/* 90BD0 800A03D0 09004234 */  ori        $v0, $v0, (0x100009 & 0xFFFF)
/* 90BD4 800A03D4 51016210 */  beq        $v1, $v0, .L800A091C
/* 90BD8 800A03D8 00000000 */   nop
/* 90BDC 800A03DC 4E830208 */  j          .L800A0D38
/* 90BE0 800A03E0 21202002 */   addu      $a0, $s1, $zero
.L800A03E4:
/* 90BE4 800A03E4 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* 90BE8 800A03E8 56026210 */  beq        $v1, $v0, .L800A0D44
/* 90BEC 800A03EC 2A104300 */   slt       $v0, $v0, $v1
/* 90BF0 800A03F0 16004014 */  bnez       $v0, .L800A044C
/* 90BF4 800A03F4 0008023C */   lui       $v0, (0x8000001 >> 16)
/* 90BF8 800A03F8 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 90BFC 800A03FC 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 90C00 800A0400 50026210 */  beq        $v1, $v0, .L800A0D44
/* 90C04 800A0404 2A104300 */   slt       $v0, $v0, $v1
/* 90C08 800A0408 09004014 */  bnez       $v0, .L800A0430
/* 90C0C 800A040C 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 90C10 800A0410 8000023C */  lui        $v0, (0x800010 >> 16)
/* 90C14 800A0414 10004234 */  ori        $v0, $v0, (0x800010 & 0xFFFF)
/* 90C18 800A0418 8B006210 */  beq        $v1, $v0, .L800A0648
/* 90C1C 800A041C 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 90C20 800A0420 39026210 */  beq        $v1, $v0, .L800A0D08
/* 90C24 800A0424 00000000 */   nop
/* 90C28 800A0428 4E830208 */  j          .L800A0D38
/* 90C2C 800A042C 21202002 */   addu      $a0, $s1, $zero
.L800A0430:
/* 90C30 800A0430 FA016210 */  beq        $v1, $v0, .L800A0C1C
/* 90C34 800A0434 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 90C38 800A0438 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 90C3C 800A043C 41026210 */  beq        $v1, $v0, .L800A0D44
/* 90C40 800A0440 21202002 */   addu      $a0, $s1, $zero
/* 90C44 800A0444 4E830208 */  j          .L800A0D38
/* 90C48 800A0448 00000000 */   nop
.L800A044C:
/* 90C4C 800A044C 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 90C50 800A0450 8B006210 */  beq        $v1, $v0, .L800A0680
/* 90C54 800A0454 2A104300 */   slt       $v0, $v0, $v1
/* 90C58 800A0458 08004014 */  bnez       $v0, .L800A047C
/* 90C5C 800A045C 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 90C60 800A0460 0204023C */  lui        $v0, (0x4020000 >> 16)
/* 90C64 800A0464 42016210 */  beq        $v1, $v0, .L800A0970
/* 90C68 800A0468 0008023C */   lui       $v0, (0x8000001 >> 16)
/* 90C6C 800A046C 35026210 */  beq        $v1, $v0, .L800A0D44
/* 90C70 800A0470 21202002 */   addu      $a0, $s1, $zero
/* 90C74 800A0474 4E830208 */  j          .L800A0D38
/* 90C78 800A0478 00000000 */   nop
.L800A047C:
/* 90C7C 800A047C 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 90C80 800A0480 30026210 */  beq        $v1, $v0, .L800A0D44
/* 90C84 800A0484 2A104300 */   slt       $v0, $v0, $v1
/* 90C88 800A0488 07004014 */  bnez       $v0, .L800A04A8
/* 90C8C 800A048C 0020023C */   lui       $v0, (0x20000004 >> 16)
/* 90C90 800A0490 0008023C */  lui        $v0, (0x8000004 >> 16)
/* 90C94 800A0494 04004234 */  ori        $v0, $v0, (0x8000004 & 0xFFFF)
/* 90C98 800A0498 11016210 */  beq        $v1, $v0, .L800A08E0
/* 90C9C 800A049C 21202002 */   addu      $a0, $s1, $zero
/* 90CA0 800A04A0 4E830208 */  j          .L800A0D38
/* 90CA4 800A04A4 00000000 */   nop
.L800A04A8:
/* 90CA8 800A04A8 04004234 */  ori        $v0, $v0, (0x20000004 & 0xFFFF)
/* 90CAC 800A04AC D1016210 */  beq        $v1, $v0, .L800A0BF4
/* 90CB0 800A04B0 00000000 */   nop
/* 90CB4 800A04B4 4E830208 */  j          .L800A0D38
/* 90CB8 800A04B8 21202002 */   addu      $a0, $s1, $zero
.L800A04BC:
/* 90CBC 800A04BC 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 90CC0 800A04C0 0400103C */  lui        $s0, (0x40000 >> 16)
/* 90CC4 800A04C4 07005010 */  beq        $v0, $s0, .L800A04E4
/* 90CC8 800A04C8 00000000 */   nop
/* 90CCC 800A04CC 16006016 */  bnez       $s3, .L800A0528
/* 90CD0 800A04D0 00000000 */   nop
/* 90CD4 800A04D4 0000258E */  lw         $a1, 0x0($s1)
/* 90CD8 800A04D8 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 90CDC 800A04DC C670000C */  jal        CAMERA_ChangeToUnderWater
/* 90CE0 800A04E0 00000000 */   nop
.L800A04E4:
/* 90CE4 800A04E4 10006016 */  bnez       $s3, .L800A0528
/* 90CE8 800A04E8 90010224 */   addiu     $v0, $zero, 0x190
/* 90CEC 800A04EC 90F990AF */  sw         $s0, %gp_rel(Raziel + 0x360)($gp)
/* 90CF0 800A04F0 98F996AF */  sw         $s6, %gp_rel(Raziel + 0x368)($gp)
/* 90CF4 800A04F4 0000248E */  lw         $a0, 0x0($s1)
/* 90CF8 800A04F8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 90CFC 800A04FC 938B020C */  jal        SteerSwitchMode
/* 90D00 800A0500 06000524 */   addiu     $a1, $zero, 0x6
/* 90D04 800A0504 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90D08 800A0508 0000248E */  lw         $a0, 0x0($s1)
/* 90D0C 800A050C 5000468C */  lw         $a2, 0x50($v0)
/* 90D10 800A0510 DF9B020C */  jal        razSetSwimVelocity
/* 90D14 800A0514 21280000 */   addu      $a1, $zero, $zero
/* 90D18 800A0518 0000248E */  lw         $a0, 0x0($s1)
/* 90D1C 800A051C 00100524 */  addiu      $a1, $zero, 0x1000
/* 90D20 800A0520 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 90D24 800A0524 C8018424 */   addiu     $a0, $a0, 0x1C8
.L800A0528:
/* 90D28 800A0528 09007416 */  bne        $s3, $s4, .L800A0550
/* 90D2C 800A052C 21286002 */   addu      $a1, $s3, $zero
/* 90D30 800A0530 21202002 */  addu       $a0, $s1, $zero
/* 90D34 800A0534 02000524 */  addiu      $a1, $zero, 0x2
/* 90D38 800A0538 3D000624 */  addiu      $a2, $zero, 0x3D
/* 90D3C 800A053C 21380000 */  addu       $a3, $zero, $zero
/* 90D40 800A0540 03000224 */  addiu      $v0, $zero, 0x3
/* 90D44 800A0544 1000A2AF */  sw         $v0, 0x10($sp)
/* 90D48 800A0548 5A810208 */  j          .L800A0568
/* 90D4C 800A054C 1400B3AF */   sw        $s3, 0x14($sp)
.L800A0550:
/* 90D50 800A0550 21202002 */  addu       $a0, $s1, $zero
/* 90D54 800A0554 3F000624 */  addiu      $a2, $zero, 0x3F
/* 90D58 800A0558 21380000 */  addu       $a3, $zero, $zero
/* 90D5C 800A055C 10000224 */  addiu      $v0, $zero, 0x10
/* 90D60 800A0560 1000A2AF */  sw         $v0, 0x10($sp)
/* 90D64 800A0564 1400B4AF */  sw         $s4, 0x14($sp)
.L800A0568:
/* 90D68 800A0568 20C8010C */  jal        G2EmulationSwitchAnimation
/* 90D6C 800A056C 00000000 */   nop
/* 90D70 800A0570 05000224 */  addiu      $v0, $zero, 0x5
/* 90D74 800A0574 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 90D78 800A0578 1C01A0AE */  sw         $zero, 0x11C($s5)
/* 90D7C 800A057C 2001A0AE */  sw         $zero, 0x120($s5)
/* 90D80 800A0580 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 90D84 800A0584 52830208 */  j          .L800A0D48
/* 90D88 800A0588 2120F102 */   addu      $a0, $s7, $s1
.L800A058C:
/* 90D8C 800A058C 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 90D90 800A0590 0400033C */  lui        $v1, (0x40000 >> 16)
/* 90D94 800A0594 24104300 */  and        $v0, $v0, $v1
/* 90D98 800A0598 0A004014 */  bnez       $v0, .L800A05C4
/* 90D9C 800A059C 00000000 */   nop
/* 90DA0 800A05A0 E8016016 */  bnez       $s3, .L800A0D44
/* 90DA4 800A05A4 00100524 */   addiu     $a1, $zero, 0x1000
/* 90DA8 800A05A8 0000248E */  lw         $a0, 0x0($s1)
/* 90DAC 800A05AC 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 90DB0 800A05B0 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 90DB4 800A05B4 0000258E */  lw         $a1, 0x0($s1)
/* 90DB8 800A05B8 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 90DBC 800A05BC F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 90DC0 800A05C0 00000000 */   nop
.L800A05C4:
/* 90DC4 800A05C4 DF016016 */  bnez       $s3, .L800A0D44
/* 90DC8 800A05C8 2120F102 */   addu      $a0, $s7, $s1
/* 90DCC 800A05CC 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 90DD0 800A05D0 52830208 */  j          .L800A0D48
/* 90DD4 800A05D4 00000000 */   nop
.L800A05D8:
/* 90DD8 800A05D8 DA017616 */  bne        $s3, $s6, .L800A0D44
/* 90DDC 800A05DC 21202002 */   addu      $a0, $s1, $zero
/* 90DE0 800A05E0 01000524 */  addiu      $a1, $zero, 0x1
/* 90DE4 800A05E4 0B80063C */  lui        $a2, %hi(StateHandlerSoulSuck)
/* 90DE8 800A05E8 E09AC624 */  addiu      $a2, $a2, %lo(StateHandlerSoulSuck)
/* 90DEC 800A05EC 2401228E */  lw         $v0, 0x124($s1)
/* 90DF0 800A05F0 00000000 */  nop
/* 90DF4 800A05F4 38FB82AF */  sw         $v0, %gp_rel(Raziel + 0x508)($gp)
/* 90DF8 800A05F8 C1CA010C */  jal        StateSwitchStateData
/* 90DFC 800A05FC 21380000 */   addu      $a3, $zero, $zero
/* 90E00 800A0600 52830208 */  j          .L800A0D48
/* 90E04 800A0604 2120F102 */   addu      $a0, $s7, $s1
.L800A0608:
/* 90E08 800A0608 2F97020C */  jal        razGetHeldWeapon
/* 90E0C 800A060C 00000000 */   nop
/* 90E10 800A0610 04004010 */  beqz       $v0, .L800A0624
/* 90E14 800A0614 21200002 */   addu      $a0, $s0, $zero
/* 90E18 800A0618 8000053C */  lui        $a1, (0x800010 >> 16)
/* 90E1C 800A061C 8E810208 */  j          .L800A0638
/* 90E20 800A0620 1000A534 */   ori       $a1, $a1, (0x800010 & 0xFFFF)
.L800A0624:
/* 90E24 800A0624 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 90E28 800A0628 00000000 */  nop
/* 90E2C 800A062C 04004230 */  andi       $v0, $v0, 0x4
/* 90E30 800A0630 C4014010 */  beqz       $v0, .L800A0D44
/* 90E34 800A0634 0800053C */   lui       $a1, (0x80000 >> 16)
.L800A0638:
/* 90E38 800A0638 4EC3010C */  jal        EnMessageQueueData
/* 90E3C 800A063C 01000624 */   addiu     $a2, $zero, 0x1
/* 90E40 800A0640 52830208 */  j          .L800A0D48
/* 90E44 800A0644 2120F102 */   addu      $a0, $s7, $s1
.L800A0648:
/* 90E48 800A0648 BE016016 */  bnez       $s3, .L800A0D44
/* 90E4C 800A064C 21202002 */   addu      $a0, $s1, $zero
/* 90E50 800A0650 0A80053C */  lui        $a1, %hi(StateHandlerThrow2)
/* 90E54 800A0654 08820208 */  j          .L800A0820
/* 90E58 800A0658 E4D7A524 */   addiu     $a1, $a1, %lo(StateHandlerThrow2)
.L800A065C:
/* 90E5C 800A065C B9016016 */  bnez       $s3, .L800A0D44
/* 90E60 800A0660 00000000 */   nop
/* 90E64 800A0664 0000248E */  lw         $a0, 0x0($s1)
/* 90E68 800A0668 FD96020C */  jal        razLaunchForce
/* 90E6C 800A066C 00000000 */   nop
/* 90E70 800A0670 21202002 */  addu       $a0, $s1, $zero
/* 90E74 800A0674 0A80053C */  lui        $a1, %hi(StateHandlerThrow2)
/* 90E78 800A0678 08820208 */  j          .L800A0820
/* 90E7C 800A067C E4D7A524 */   addiu     $a1, $a1, %lo(StateHandlerThrow2)
.L800A0680:
/* 90E80 800A0680 0400838C */  lw         $v1, 0x4($a0)
/* 90E84 800A0684 44000224 */  addiu      $v0, $zero, 0x44
/* 90E88 800A0688 03006210 */  beq        $v1, $v0, .L800A0698
/* 90E8C 800A068C 42000224 */   addiu     $v0, $zero, 0x42
/* 90E90 800A0690 37006214 */  bne        $v1, $v0, .L800A0770
/* 90E94 800A0694 3F000224 */   addiu     $v0, $zero, 0x3F
.L800A0698:
/* 90E98 800A0698 2001A28E */  lw         $v0, 0x120($s5)
/* 90E9C 800A069C 00000000 */  nop
/* 90EA0 800A06A0 01004230 */  andi       $v0, $v0, 0x1
/* 90EA4 800A06A4 27004014 */  bnez       $v0, .L800A0744
/* 90EA8 800A06A8 00000000 */   nop
/* 90EAC 800A06AC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 90EB0 800A06B0 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 90EB4 800A06B4 0000428C */  lw         $v0, 0x0($v0)
/* 90EB8 800A06B8 00000000 */  nop
/* 90EBC 800A06BC 24104300 */  and        $v0, $v0, $v1
/* 90EC0 800A06C0 11004010 */  beqz       $v0, .L800A0708
/* 90EC4 800A06C4 06000224 */   addiu     $v0, $zero, 0x6
/* 90EC8 800A06C8 B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* 90ECC 800A06CC 00000000 */  nop
/* 90ED0 800A06D0 0D006214 */  bne        $v1, $v0, .L800A0708
/* 90ED4 800A06D4 00000000 */   nop
/* 90ED8 800A06D8 05007416 */  bne        $s3, $s4, .L800A06F0
/* 90EDC 800A06DC 21286002 */   addu      $a1, $s3, $zero
/* 90EE0 800A06E0 21202002 */  addu       $a0, $s1, $zero
/* 90EE4 800A06E4 02000524 */  addiu      $a1, $zero, 0x2
/* 90EE8 800A06E8 F1810208 */  j          .L800A07C4
/* 90EEC 800A06EC 21300000 */   addu      $a2, $zero, $zero
.L800A06F0:
/* 90EF0 800A06F0 21202002 */  addu       $a0, $s1, $zero
/* 90EF4 800A06F4 3C000624 */  addiu      $a2, $zero, 0x3C
/* 90EF8 800A06F8 21380000 */  addu       $a3, $zero, $zero
/* 90EFC 800A06FC 0C000224 */  addiu      $v0, $zero, 0xC
/* 90F00 800A0700 2C830208 */  j          .L800A0CB0
/* 90F04 800A0704 1000A2AF */   sw        $v0, 0x10($sp)
.L800A0708:
/* 90F08 800A0708 06006016 */  bnez       $s3, .L800A0724
/* 90F0C 800A070C 00000000 */   nop
/* 90F10 800A0710 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90F14 800A0714 0000248E */  lw         $a0, 0x0($s1)
/* 90F18 800A0718 5000468C */  lw         $a2, 0x50($v0)
/* 90F1C 800A071C DF9B020C */  jal        razSetSwimVelocity
/* 90F20 800A0720 21280000 */   addu      $a1, $zero, $zero
.L800A0724:
/* 90F24 800A0724 24007412 */  beq        $s3, $s4, .L800A07B8
/* 90F28 800A0728 21286002 */   addu      $a1, $s3, $zero
/* 90F2C 800A072C 21202002 */  addu       $a0, $s1, $zero
/* 90F30 800A0730 3F000624 */  addiu      $a2, $zero, 0x3F
/* 90F34 800A0734 21380000 */  addu       $a3, $zero, $zero
/* 90F38 800A0738 08000224 */  addiu      $v0, $zero, 0x8
/* 90F3C 800A073C 2C830208 */  j          .L800A0CB0
/* 90F40 800A0740 1000A2AF */   sw        $v0, 0x10($sp)
.L800A0744:
/* 90F44 800A0744 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90F48 800A0748 0000248E */  lw         $a0, 0x0($s1)
/* 90F4C 800A074C 5400458C */  lw         $a1, 0x54($v0)
/* 90F50 800A0750 5800468C */  lw         $a2, 0x58($v0)
/* 90F54 800A0754 DF9B020C */  jal        razSetSwimVelocity
/* 90F58 800A0758 00000000 */   nop
/* 90F5C 800A075C 2001A28E */  lw         $v0, 0x120($s5)
/* 90F60 800A0760 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 90F64 800A0764 24104300 */  and        $v0, $v0, $v1
/* 90F68 800A0768 51830208 */  j          .L800A0D44
/* 90F6C 800A076C 2001A2AE */   sw        $v0, 0x120($s5)
.L800A0770:
/* 90F70 800A0770 75016210 */  beq        $v1, $v0, .L800A0D48
/* 90F74 800A0774 2120F102 */   addu      $a0, $s7, $s1
/* 90F78 800A0778 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 90F7C 800A077C 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 90F80 800A0780 0000428C */  lw         $v0, 0x0($v0)
/* 90F84 800A0784 00000000 */  nop
/* 90F88 800A0788 24104300 */  and        $v0, $v0, $v1
/* 90F8C 800A078C 6E014014 */  bnez       $v0, .L800A0D48
/* 90F90 800A0790 00000000 */   nop
/* 90F94 800A0794 06006016 */  bnez       $s3, .L800A07B0
/* 90F98 800A0798 00000000 */   nop
/* 90F9C 800A079C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90FA0 800A07A0 0000248E */  lw         $a0, 0x0($s1)
/* 90FA4 800A07A4 5000468C */  lw         $a2, 0x50($v0)
/* 90FA8 800A07A8 DF9B020C */  jal        razSetSwimVelocity
/* 90FAC 800A07AC 21280000 */   addu      $a1, $zero, $zero
.L800A07B0:
/* 90FB0 800A07B0 0B007416 */  bne        $s3, $s4, .L800A07E0
/* 90FB4 800A07B4 21286002 */   addu      $a1, $s3, $zero
.L800A07B8:
/* 90FB8 800A07B8 21202002 */  addu       $a0, $s1, $zero
/* 90FBC 800A07BC 02000524 */  addiu      $a1, $zero, 0x2
/* 90FC0 800A07C0 3D000624 */  addiu      $a2, $zero, 0x3D
.L800A07C4:
/* 90FC4 800A07C4 21380000 */  addu       $a3, $zero, $zero
/* 90FC8 800A07C8 03000224 */  addiu      $v0, $zero, 0x3
/* 90FCC 800A07CC 1000A2AF */  sw         $v0, 0x10($sp)
/* 90FD0 800A07D0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 90FD4 800A07D4 1400B3AF */   sw        $s3, 0x14($sp)
/* 90FD8 800A07D8 52830208 */  j          .L800A0D48
/* 90FDC 800A07DC 2120F102 */   addu      $a0, $s7, $s1
.L800A07E0:
/* 90FE0 800A07E0 21202002 */  addu       $a0, $s1, $zero
/* 90FE4 800A07E4 3F000624 */  addiu      $a2, $zero, 0x3F
/* 90FE8 800A07E8 21380000 */  addu       $a3, $zero, $zero
/* 90FEC 800A07EC 10000224 */  addiu      $v0, $zero, 0x10
/* 90FF0 800A07F0 2C830208 */  j          .L800A0CB0
/* 90FF4 800A07F4 1000A2AF */   sw        $v0, 0x10($sp)
.L800A07F8:
/* 90FF8 800A07F8 53016016 */  bnez       $s3, .L800A0D48
/* 90FFC 800A07FC 2120F102 */   addu      $a0, $s7, $s1
/* 91000 800A0800 21202002 */  addu       $a0, $s1, $zero
/* 91004 800A0804 F6C9010C */  jal        G2EmulationQueryFrame
/* 91008 800A0808 21280000 */   addu      $a1, $zero, $zero
/* 9100C 800A080C 02004228 */  slti       $v0, $v0, 0x2
/* 91010 800A0810 07004014 */  bnez       $v0, .L800A0830
/* 91014 800A0814 21202002 */   addu      $a0, $s1, $zero
/* 91018 800A0818 0A80053C */  lui        $a1, %hi(StateHandlerSwimCoil)
/* 9101C 800A081C 38EFA524 */  addiu      $a1, $a1, %lo(StateHandlerSwimCoil)
.L800A0820:
/* 91020 800A0820 F4CA010C */  jal        StateSwitchStateCharacterData
/* 91024 800A0824 21300000 */   addu      $a2, $zero, $zero
/* 91028 800A0828 52830208 */  j          .L800A0D48
/* 9102C 800A082C 2120F102 */   addu      $a0, $s7, $s1
.L800A0830:
/* 91030 800A0830 4401C013 */  beqz       $fp, .L800A0D44
/* 91034 800A0834 94002426 */   addiu     $a0, $s1, 0x94
/* 91038 800A0838 21F00000 */  addu       $fp, $zero, $zero
/* 9103C 800A083C 0080053C */  lui        $a1, (0x80000008 >> 16)
/* 91040 800A0840 0800A534 */  ori        $a1, $a1, (0x80000008 & 0xFFFF)
/* 91044 800A0844 4EC3010C */  jal        EnMessageQueueData
/* 91048 800A0848 2130C003 */   addu      $a2, $fp, $zero
/* 9104C 800A084C 52830208 */  j          .L800A0D48
/* 91050 800A0850 2120F102 */   addu      $a0, $s7, $s1
.L800A0854:
/* 91054 800A0854 B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* 91058 800A0858 06000224 */  addiu      $v0, $zero, 0x6
/* 9105C 800A085C 3A016214 */  bne        $v1, $v0, .L800A0D48
/* 91060 800A0860 2120F102 */   addu      $a0, $s7, $s1
/* 91064 800A0864 21202002 */  addu       $a0, $s1, $zero
/* 91068 800A0868 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9106C 800A086C 21286002 */   addu      $a1, $s3, $zero
/* 91070 800A0870 44000324 */  addiu      $v1, $zero, 0x44
/* 91074 800A0874 15004310 */  beq        $v0, $v1, .L800A08CC
/* 91078 800A0878 00000000 */   nop
/* 9107C 800A087C 0C006016 */  bnez       $s3, .L800A08B0
/* 91080 800A0880 00000000 */   nop
/* 91084 800A0884 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 91088 800A0888 0000248E */  lw         $a0, 0x0($s1)
/* 9108C 800A088C 5400458C */  lw         $a1, 0x54($v0)
/* 91090 800A0890 5800468C */  lw         $a2, 0x58($v0)
/* 91094 800A0894 DF9B020C */  jal        razSetSwimVelocity
/* 91098 800A0898 00000000 */   nop
/* 9109C 800A089C DC050224 */  addiu      $v0, $zero, 0x5DC
/* 910A0 800A08A0 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 910A4 800A08A4 0000238E */  lw         $v1, 0x0($s1)
/* 910A8 800A08A8 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 910AC 800A08AC F80162AC */  sw         $v0, 0x1F8($v1)
.L800A08B0:
/* 910B0 800A08B0 21202002 */  addu       $a0, $s1, $zero
/* 910B4 800A08B4 21286002 */  addu       $a1, $s3, $zero
/* 910B8 800A08B8 44000624 */  addiu      $a2, $zero, 0x44
/* 910BC 800A08BC 21380000 */  addu       $a3, $zero, $zero
/* 910C0 800A08C0 05000224 */  addiu      $v0, $zero, 0x5
/* 910C4 800A08C4 2C830208 */  j          .L800A0CB0
/* 910C8 800A08C8 1000A2AF */   sw        $v0, 0x10($sp)
.L800A08CC:
/* 910CC 800A08CC 2001A28E */  lw         $v0, 0x120($s5)
/* 910D0 800A08D0 00000000 */  nop
/* 910D4 800A08D4 01004234 */  ori        $v0, $v0, 0x1
/* 910D8 800A08D8 51830208 */  j          .L800A0D44
/* 910DC 800A08DC 2001A2AE */   sw        $v0, 0x120($s5)
.L800A08E0:
/* 910E0 800A08E0 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 910E4 800A08E4 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 910E8 800A08E8 0000428C */  lw         $v0, 0x0($v0)
/* 910EC 800A08EC 00000000 */  nop
/* 910F0 800A08F0 24104300 */  and        $v0, $v0, $v1
/* 910F4 800A08F4 12004010 */  beqz       $v0, .L800A0940
/* 910F8 800A08F8 00000000 */   nop
/* 910FC 800A08FC E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 91100 800A0900 0000248E */  lw         $a0, 0x0($s1)
/* 91104 800A0904 5C00458C */  lw         $a1, 0x5C($v0)
/* 91108 800A0908 6000468C */  lw         $a2, 0x60($v0)
/* 9110C 800A090C DF9B020C */  jal        razSetSwimVelocity
/* 91110 800A0910 00000000 */   nop
/* 91114 800A0914 52830208 */  j          .L800A0D48
/* 91118 800A0918 2120F102 */   addu      $a0, $s7, $s1
.L800A091C:
/* 9111C 800A091C 09016016 */  bnez       $s3, .L800A0D44
/* 91120 800A0920 00000000 */   nop
/* 91124 800A0924 0400828C */  lw         $v0, 0x4($a0)
/* 91128 800A0928 00000000 */  nop
/* 9112C 800A092C 0B004010 */  beqz       $v0, .L800A095C
/* 91130 800A0930 00000000 */   nop
/* 91134 800A0934 0000248E */  lw         $a0, 0x0($s1)
/* 91138 800A0938 938B020C */  jal        SteerSwitchMode
/* 9113C 800A093C 21280000 */   addu      $a1, $zero, $zero
.L800A0940:
/* 91140 800A0940 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 91144 800A0944 0000248E */  lw         $a0, 0x0($s1)
/* 91148 800A0948 5000468C */  lw         $a2, 0x50($v0)
/* 9114C 800A094C DF9B020C */  jal        razSetSwimVelocity
/* 91150 800A0950 21280000 */   addu      $a1, $zero, $zero
/* 91154 800A0954 52830208 */  j          .L800A0D48
/* 91158 800A0958 2120F102 */   addu      $a0, $s7, $s1
.L800A095C:
/* 9115C 800A095C 0000248E */  lw         $a0, 0x0($s1)
/* 91160 800A0960 938B020C */  jal        SteerSwitchMode
/* 91164 800A0964 06000524 */   addiu     $a1, $zero, 0x6
/* 91168 800A0968 52830208 */  j          .L800A0D48
/* 9116C 800A096C 2120F102 */   addu      $a0, $s7, $s1
.L800A0970:
/* 91170 800A0970 68FA828F */  lw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 91174 800A0974 0400928C */  lw         $s2, 0x4($a0)
/* 91178 800A0978 0A005614 */  bne        $v0, $s6, .L800A09A4
/* 9117C 800A097C 00000000 */   nop
/* 91180 800A0980 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 91184 800A0984 00000000 */  nop
/* 91188 800A0988 10004230 */  andi       $v0, $v0, 0x10
/* 9118C 800A098C 05004014 */  bnez       $v0, .L800A09A4
/* 91190 800A0990 0100023C */   lui       $v0, (0x186A0 >> 16)
/* 91194 800A0994 A0864234 */  ori        $v0, $v0, (0x186A0 & 0xFFFF)
/* 91198 800A0998 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 9119C 800A099C 52830208 */  j          .L800A0D48
/* 911A0 800A09A0 2120F102 */   addu      $a0, $s7, $s1
.L800A09A4:
/* 911A4 800A09A4 2C006016 */  bnez       $s3, .L800A0A58
/* 911A8 800A09A8 00000000 */   nop
/* 911AC 800A09AC 2F97020C */  jal        razGetHeldWeapon
/* 911B0 800A09B0 00000000 */   nop
/* 911B4 800A09B4 E8FB878F */  lw         $a3, %gp_rel(PlayerData)($gp)
/* 911B8 800A09B8 0C004686 */  lh         $a2, 0xC($s2)
/* 911BC 800A09BC 4C00E38C */  lw         $v1, 0x4C($a3)
/* 911C0 800A09C0 1C012526 */  addiu      $a1, $s1, 0x11C
/* 911C4 800A09C4 1000A3AF */  sw         $v1, 0x10($sp)
/* 911C8 800A09C8 0000248E */  lw         $a0, 0x0($s1)
/* 911CC 800A09CC 4800E78C */  lw         $a3, 0x48($a3)
/* 911D0 800A09D0 67DB010C */  jal        PhysicsForceSetWater
/* 911D4 800A09D4 21804000 */   addu      $s0, $v0, $zero
/* 911D8 800A09D8 0C004286 */  lh         $v0, 0xC($s2)
/* 911DC 800A09DC 00000000 */  nop
/* 911E0 800A09E0 C1FF4228 */  slti       $v0, $v0, -0x3F
/* 911E4 800A09E4 04004014 */  bnez       $v0, .L800A09F8
/* 911E8 800A09E8 FFFB0324 */   addiu     $v1, $zero, -0x401
/* 911EC 800A09EC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 911F0 800A09F0 81820208 */  j          .L800A0A04
/* 911F4 800A09F4 00044234 */   ori       $v0, $v0, 0x400
.L800A09F8:
/* 911F8 800A09F8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 911FC 800A09FC 00000000 */  nop
/* 91200 800A0A00 24104300 */  and        $v0, $v0, $v1
.L800A0A04:
/* 91204 800A0A04 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 91208 800A0A08 13000012 */  beqz       $s0, .L800A0A58
/* 9120C 800A0A0C 21200002 */   addu      $a0, $s0, $zero
/* 91210 800A0A10 92D1000C */  jal        INSTANCE_Query
/* 91214 800A0A14 04000524 */   addiu     $a1, $zero, 0x4
/* 91218 800A0A18 03000324 */  addiu      $v1, $zero, 0x3
/* 9121C 800A0A1C 0E004314 */  bne        $v0, $v1, .L800A0A58
/* 91220 800A0A20 00000000 */   nop
/* 91224 800A0A24 0000258E */  lw         $a1, 0x0($s1)
/* 91228 800A0A28 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 9122C 800A0A2C F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 91230 800A0A30 00000000 */   nop
/* 91234 800A0A34 21200000 */  addu       $a0, $zero, $zero
/* 91238 800A0A38 21288000 */  addu       $a1, $a0, $zero
/* 9123C 800A0A3C 4FC6010C */  jal        SetControlInitIdleData
/* 91240 800A0A40 09000624 */   addiu     $a2, $zero, 0x9
/* 91244 800A0A44 21202002 */  addu       $a0, $s1, $zero
/* 91248 800A0A48 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9124C 800A0A4C E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 91250 800A0A50 F4CA010C */  jal        StateSwitchStateCharacterData
/* 91254 800A0A54 21304000 */   addu      $a2, $v0, $zero
.L800A0A58:
/* 91258 800A0A58 10004296 */  lhu        $v0, 0x10($s2)
/* 9125C 800A0A5C 00000000 */  nop
/* 91260 800A0A60 00024230 */  andi       $v0, $v0, 0x200
/* 91264 800A0A64 04004010 */  beqz       $v0, .L800A0A78
/* 91268 800A0A68 00000000 */   nop
/* 9126C 800A0A6C 02006016 */  bnez       $s3, .L800A0A78
/* 91270 800A0A70 30000224 */   addiu     $v0, $zero, 0x30
/* 91274 800A0A74 F0FC82A7 */  sh         $v0, %gp_rel(ExternalForces_dup1 + 0x10)($gp)
.L800A0A78:
/* 91278 800A0A78 10004296 */  lhu        $v0, 0x10($s2)
/* 9127C 800A0A7C 00000000 */  nop
/* 91280 800A0A80 40004230 */  andi       $v0, $v0, 0x40
/* 91284 800A0A84 0C004010 */  beqz       $v0, .L800A0AB8
/* 91288 800A0A88 0400023C */   lui       $v0, (0x40000 >> 16)
/* 9128C 800A0A8C 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 91290 800A0A90 00000000 */  nop
/* 91294 800A0A94 08006214 */  bne        $v1, $v0, .L800A0AB8
/* 91298 800A0A98 00000000 */   nop
/* 9129C 800A0A9C A0F98287 */  lh         $v0, %gp_rel(Raziel + 0x370)($gp)
/* 912A0 800A0AA0 00000000 */  nop
/* 912A4 800A0AA4 04004018 */  blez       $v0, .L800A0AB8
/* 912A8 800A0AA8 21202002 */   addu      $a0, $s1, $zero
/* 912AC 800A0AAC 4800A68F */  lw         $a2, 0x48($sp)
/* 912B0 800A0AB0 8B7B020C */  jal        StateHandlerInitSwim
/* 912B4 800A0AB4 21286002 */   addu      $a1, $s3, $zero
.L800A0AB8:
/* 912B8 800A0AB8 10004296 */  lhu        $v0, 0x10($s2)
/* 912BC 800A0ABC 00000000 */  nop
/* 912C0 800A0AC0 00044230 */  andi       $v0, $v0, 0x400
/* 912C4 800A0AC4 2B004010 */  beqz       $v0, .L800A0B74
/* 912C8 800A0AC8 00000000 */   nop
/* 912CC 800A0ACC 1A006016 */  bnez       $s3, .L800A0B38
/* 912D0 800A0AD0 21202002 */   addu      $a0, $s1, $zero
/* 912D4 800A0AD4 08FD8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1 + 0x28)
/* 912D8 800A0AD8 21280000 */  addu       $a1, $zero, $zero
/* 912DC 800A0ADC 2130A000 */  addu       $a2, $a1, $zero
/* 912E0 800A0AE0 F0FF0724 */  addiu      $a3, $zero, -0x10
/* 912E4 800A0AE4 10000224 */  addiu      $v0, $zero, 0x10
/* 912E8 800A0AE8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 912EC 800A0AEC 00100224 */  addiu      $v0, $zero, 0x1000
/* 912F0 800A0AF0 1000B6AF */  sw         $s6, 0x10($sp)
/* 912F4 800A0AF4 2E69020C */  jal        SetExternalForce
/* 912F8 800A0AF8 1400A2AF */   sw        $v0, 0x14($sp)
/* 912FC 800A0AFC 0000238E */  lw         $v1, 0x0($s1)
/* 91300 800A0B00 9CF98287 */  lh         $v0, %gp_rel(Raziel + 0x36C)($gp)
/* 91304 800A0B04 00000000 */  nop
/* 91308 800A0B08 740162AC */  sw         $v0, 0x174($v1)
/* 9130C 800A0B0C 0000238E */  lw         $v1, 0x0($s1)
/* 91310 800A0B10 9EF98287 */  lh         $v0, %gp_rel(Raziel + 0x36E)($gp)
/* 91314 800A0B14 00000000 */  nop
/* 91318 800A0B18 780162AC */  sw         $v0, 0x178($v1)
/* 9131C 800A0B1C 0000238E */  lw         $v1, 0x0($s1)
/* 91320 800A0B20 A0F98287 */  lh         $v0, %gp_rel(Raziel + 0x370)($gp)
/* 91324 800A0B24 00000000 */  nop
/* 91328 800A0B28 7C0162AC */  sw         $v0, 0x17C($v1)
/* 9132C 800A0B2C 38000224 */  addiu      $v0, $zero, 0x38
/* 91330 800A0B30 F0FC82A7 */  sh         $v0, %gp_rel(ExternalForces_dup1 + 0x10)($gp)
/* 91334 800A0B34 21202002 */  addu       $a0, $s1, $zero
.L800A0B38:
/* 91338 800A0B38 21286002 */  addu       $a1, $s3, $zero
/* 9133C 800A0B3C 23000624 */  addiu      $a2, $zero, 0x23
/* 91340 800A0B40 21380000 */  addu       $a3, $zero, $zero
/* 91344 800A0B44 1000A0AF */  sw         $zero, 0x10($sp)
/* 91348 800A0B48 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9134C 800A0B4C 1400B6AF */   sw        $s6, 0x14($sp)
/* 91350 800A0B50 0000248E */  lw         $a0, 0x0($s1)
/* 91354 800A0B54 938B020C */  jal        SteerSwitchMode
/* 91358 800A0B58 04000524 */   addiu     $a1, $zero, 0x4
/* 9135C 800A0B5C 21202002 */  addu       $a0, $s1, $zero
/* 91360 800A0B60 21286002 */  addu       $a1, $s3, $zero
/* 91364 800A0B64 0B80063C */  lui        $a2, %hi(StateHandlerFall)
/* 91368 800A0B68 A8BDC624 */  addiu      $a2, $a2, %lo(StateHandlerFall)
/* 9136C 800A0B6C C1CA010C */  jal        StateSwitchStateData
/* 91370 800A0B70 21380000 */   addu      $a3, $zero, $zero
.L800A0B74:
/* 91374 800A0B74 10004296 */  lhu        $v0, 0x10($s2)
/* 91378 800A0B78 00000000 */  nop
/* 9137C 800A0B7C 20004230 */  andi       $v0, $v0, 0x20
/* 91380 800A0B80 70004010 */  beqz       $v0, .L800A0D44
/* 91384 800A0B84 21202002 */   addu      $a0, $s1, $zero
/* 91388 800A0B88 21286002 */  addu       $a1, $s3, $zero
/* 9138C 800A0B8C 23000624 */  addiu      $a2, $zero, 0x23
/* 91390 800A0B90 21380000 */  addu       $a3, $zero, $zero
/* 91394 800A0B94 1000023C */  lui        $v0, (0x100000 >> 16)
/* 91398 800A0B98 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9139C 800A0B9C 1000A0AF */  sw         $zero, 0x10($sp)
/* 913A0 800A0BA0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 913A4 800A0BA4 1400B6AF */   sw        $s6, 0x14($sp)
/* 913A8 800A0BA8 0000248E */  lw         $a0, 0x0($s1)
/* 913AC 800A0BAC 938B020C */  jal        SteerSwitchMode
/* 913B0 800A0BB0 04000524 */   addiu     $a1, $zero, 0x4
/* 913B4 800A0BB4 21202002 */  addu       $a0, $s1, $zero
/* 913B8 800A0BB8 21286002 */  addu       $a1, $s3, $zero
/* 913BC 800A0BBC 0B80063C */  lui        $a2, %hi(StateHandlerFall)
/* 913C0 800A0BC0 A8BDC624 */  addiu      $a2, $a2, %lo(StateHandlerFall)
/* 913C4 800A0BC4 C1CA010C */  jal        StateSwitchStateData
/* 913C8 800A0BC8 21380000 */   addu      $a3, $zero, $zero
/* 913CC 800A0BCC E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 913D0 800A0BD0 21280000 */  addu       $a1, $zero, $zero
/* 913D4 800A0BD4 2130A000 */  addu       $a2, $a1, $zero
/* 913D8 800A0BD8 F0FF0724 */  addiu      $a3, $zero, -0x10
/* 913DC 800A0BDC 00100224 */  addiu      $v0, $zero, 0x1000
/* 913E0 800A0BE0 1000B6AF */  sw         $s6, 0x10($sp)
/* 913E4 800A0BE4 2E69020C */  jal        SetExternalForce
/* 913E8 800A0BE8 1400A2AF */   sw        $v0, 0x14($sp)
/* 913EC 800A0BEC 52830208 */  j          .L800A0D48
/* 913F0 800A0BF0 2120F102 */   addu      $a0, $s7, $s1
.L800A0BF4:
/* 913F4 800A0BF4 0000248E */  lw         $a0, 0x0($s1)
/* 913F8 800A0BF8 03830208 */  j          .L800A0C0C
/* 913FC 800A0BFC 00100524 */   addiu     $a1, $zero, 0x1000
.L800A0C00:
/* 91400 800A0C00 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 91404 800A0C04 0000248E */  lw         $a0, 0x0($s1)
/* 91408 800A0C08 6400458C */  lw         $a1, 0x64($v0)
.L800A0C0C:
/* 9140C 800A0C0C 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 91410 800A0C10 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 91414 800A0C14 52830208 */  j          .L800A0D48
/* 91418 800A0C18 2120F102 */   addu      $a0, $s7, $s1
.L800A0C1C:
/* 9141C 800A0C1C 21202002 */  addu       $a0, $s1, $zero
/* 91420 800A0C20 3A96020C */  jal        razPickupAndGrab
/* 91424 800A0C24 21286002 */   addu      $a1, $s3, $zero
/* 91428 800A0C28 52830208 */  j          .L800A0D48
/* 9142C 800A0C2C 2120F102 */   addu      $a0, $s7, $s1
.L800A0C30:
/* 91430 800A0C30 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 91434 800A0C34 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 91438 800A0C38 24104300 */  and        $v0, $v0, $v1
/* 9143C 800A0C3C 42004014 */  bnez       $v0, .L800A0D48
/* 91440 800A0C40 2120F102 */   addu      $a0, $s7, $s1
/* 91444 800A0C44 40006016 */  bnez       $s3, .L800A0D48
/* 91448 800A0C48 0B80053C */   lui       $a1, %hi(StateHandlerGlyphs)
/* 9144C 800A0C4C 21202002 */  addu       $a0, $s1, $zero
/* 91450 800A0C50 50F6A524 */  addiu      $a1, $a1, %lo(StateHandlerGlyphs)
/* 91454 800A0C54 F4CA010C */  jal        StateSwitchStateCharacterData
/* 91458 800A0C58 21300000 */   addu      $a2, $zero, $zero
/* 9145C 800A0C5C 21202002 */  addu       $a0, $s1, $zero
/* 91460 800A0C60 02000524 */  addiu      $a1, $zero, 0x2
/* 91464 800A0C64 3D000624 */  addiu      $a2, $zero, 0x3D
/* 91468 800A0C68 21380000 */  addu       $a3, $zero, $zero
/* 9146C 800A0C6C 03000224 */  addiu      $v0, $zero, 0x3
/* 91470 800A0C70 1000A2AF */  sw         $v0, 0x10($sp)
/* 91474 800A0C74 20C8010C */  jal        G2EmulationSwitchAnimation
/* 91478 800A0C78 1400B4AF */   sw        $s4, 0x14($sp)
/* 9147C 800A0C7C 21202002 */  addu       $a0, $s1, $zero
/* 91480 800A0C80 21280000 */  addu       $a1, $zero, $zero
/* 91484 800A0C84 3F000624 */  addiu      $a2, $zero, 0x3F
/* 91488 800A0C88 2138A000 */  addu       $a3, $a1, $zero
/* 9148C 800A0C8C 10001024 */  addiu      $s0, $zero, 0x10
/* 91490 800A0C90 1000B0AF */  sw         $s0, 0x10($sp)
/* 91494 800A0C94 20C8010C */  jal        G2EmulationSwitchAnimation
/* 91498 800A0C98 1400B4AF */   sw        $s4, 0x14($sp)
/* 9149C 800A0C9C 21202002 */  addu       $a0, $s1, $zero
/* 914A0 800A0CA0 01000524 */  addiu      $a1, $zero, 0x1
/* 914A4 800A0CA4 3F000624 */  addiu      $a2, $zero, 0x3F
/* 914A8 800A0CA8 21380000 */  addu       $a3, $zero, $zero
/* 914AC 800A0CAC 1000B0AF */  sw         $s0, 0x10($sp)
.L800A0CB0:
/* 914B0 800A0CB0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 914B4 800A0CB4 1400B4AF */   sw        $s4, 0x14($sp)
/* 914B8 800A0CB8 52830208 */  j          .L800A0D48
/* 914BC 800A0CBC 2120F102 */   addu      $a0, $s7, $s1
.L800A0CC0:
/* 914C0 800A0CC0 21200000 */  addu       $a0, $zero, $zero
/* 914C4 800A0CC4 21288000 */  addu       $a1, $a0, $zero
/* 914C8 800A0CC8 4FC6010C */  jal        SetControlInitIdleData
/* 914CC 800A0CCC 09000624 */   addiu     $a2, $zero, 0x9
/* 914D0 800A0CD0 21202002 */  addu       $a0, $s1, $zero
/* 914D4 800A0CD4 21286002 */  addu       $a1, $s3, $zero
/* 914D8 800A0CD8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 914DC 800A0CDC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 914E0 800A0CE0 C1CA010C */  jal        StateSwitchStateData
/* 914E4 800A0CE4 21384000 */   addu      $a3, $v0, $zero
/* 914E8 800A0CE8 16006016 */  bnez       $s3, .L800A0D44
/* 914EC 800A0CEC 00000000 */   nop
/* 914F0 800A0CF0 0000258E */  lw         $a1, 0x0($s1)
/* 914F4 800A0CF4 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 914F8 800A0CF8 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 914FC 800A0CFC 00000000 */   nop
/* 91500 800A0D00 52830208 */  j          .L800A0D48
/* 91504 800A0D04 2120F102 */   addu      $a0, $s7, $s1
.L800A0D08:
/* 91508 800A0D08 0E006016 */  bnez       $s3, .L800A0D44
/* 9150C 800A0D0C 00000000 */   nop
/* 91510 800A0D10 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 91514 800A0D14 0400838C */  lw         $v1, 0x4($a0)
/* 91518 800A0D18 00084230 */  andi       $v0, $v0, 0x800
/* 9151C 800A0D1C 09004010 */  beqz       $v0, .L800A0D44
/* 91520 800A0D20 00000000 */   nop
/* 91524 800A0D24 0C00648C */  lw         $a0, 0xC($v1)
/* 91528 800A0D28 7391020C */  jal        LoseHealth
/* 9152C 800A0D2C 00000000 */   nop
/* 91530 800A0D30 52830208 */  j          .L800A0D48
/* 91534 800A0D34 2120F102 */   addu      $a0, $s7, $s1
.L800A0D38:
/* 91538 800A0D38 4800A68F */  lw         $a2, 0x48($sp)
/* 9153C 800A0D3C B9BF020C */  jal        DefaultStateHandler
/* 91540 800A0D40 21286002 */   addu      $a1, $s3, $zero
.L800A0D44:
/* 91544 800A0D44 2120F102 */  addu       $a0, $s7, $s1
.L800A0D48:
/* 91548 800A0D48 27C3010C */  jal        DeMessageQueue
/* 9154C 800A0D4C 0C008424 */   addiu     $a0, $a0, 0xC
/* 91550 800A0D50 BE800208 */  j          .L800A02F8
/* 91554 800A0D54 2110F102 */   addu      $v0, $s7, $s1
.L800A0D58:
/* 91558 800A0D58 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 9155C 800A0D5C 3800BE8F */  lw         $fp, 0x38($sp)
/* 91560 800A0D60 3400B78F */  lw         $s7, 0x34($sp)
/* 91564 800A0D64 3000B68F */  lw         $s6, 0x30($sp)
/* 91568 800A0D68 2C00B58F */  lw         $s5, 0x2C($sp)
/* 9156C 800A0D6C 2800B48F */  lw         $s4, 0x28($sp)
/* 91570 800A0D70 2400B38F */  lw         $s3, 0x24($sp)
/* 91574 800A0D74 2000B28F */  lw         $s2, 0x20($sp)
/* 91578 800A0D78 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9157C 800A0D7C 1800B08F */  lw         $s0, 0x18($sp)
/* 91580 800A0D80 0800E003 */  jr         $ra
/* 91584 800A0D84 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerSwim, . - StateHandlerSwim
