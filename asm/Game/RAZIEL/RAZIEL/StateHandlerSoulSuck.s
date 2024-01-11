.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerSoulSuck
/* 9A2E0 800A9AE0 98A6828F */  lw         $v0, %gp_rel(LoopCounter)($gp)
/* 9A2E4 800A9AE4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9A2E8 800A9AE8 2400B1AF */  sw         $s1, 0x24($sp)
/* 9A2EC 800A9AEC 21888000 */  addu       $s1, $a0, $zero
/* 9A2F0 800A9AF0 2000B0AF */  sw         $s0, 0x20($sp)
/* 9A2F4 800A9AF4 2180A000 */  addu       $s0, $a1, $zero
/* 9A2F8 800A9AF8 3400B5AF */  sw         $s5, 0x34($sp)
/* 9A2FC 800A9AFC 21A8C000 */  addu       $s5, $a2, $zero
/* 9A300 800A9B00 3800BFAF */  sw         $ra, 0x38($sp)
/* 9A304 800A9B04 3000B4AF */  sw         $s4, 0x30($sp)
/* 9A308 800A9B08 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 9A30C 800A9B0C 03004230 */  andi       $v0, $v0, 0x3
/* 9A310 800A9B10 04004014 */  bnez       $v0, .L800A9B24
/* 9A314 800A9B14 2800B2AF */   sw        $s2, 0x28($sp)
/* 9A318 800A9B18 0000248E */  lw         $a0, 0x0($s1)
/* 9A31C 800A9B1C 051C010C */  jal        FX_MakeSoulDust
/* 9A320 800A9B20 10000524 */   addiu     $a1, $zero, 0x10
.L800A9B24:
/* 9A324 800A9B24 21202002 */  addu       $a0, $s1, $zero
/* 9A328 800A9B28 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9A32C 800A9B2C 21280002 */   addu      $a1, $s0, $zero
/* 9A330 800A9B30 21984000 */  addu       $s3, $v0, $zero
/* 9A334 800A9B34 C0101000 */  sll        $v0, $s0, 3
/* 9A338 800A9B38 21105000 */  addu       $v0, $v0, $s0
/* 9A33C 800A9B3C C0100200 */  sll        $v0, $v0, 3
/* 9A340 800A9B40 23105000 */  subu       $v0, $v0, $s0
/* 9A344 800A9B44 80100200 */  sll        $v0, $v0, 2
/* 9A348 800A9B48 08004224 */  addiu      $v0, $v0, 0x8
/* 9A34C 800A9B4C 21A02202 */  addu       $s4, $s1, $v0
/* 9A350 800A9B50 01001224 */  addiu      $s2, $zero, 0x1
.L800A9B54:
/* 9A354 800A9B54 39C3010C */  jal        PeekMessageQueue
/* 9A358 800A9B58 04008426 */   addiu     $a0, $s4, 0x4
/* 9A35C 800A9B5C 21204000 */  addu       $a0, $v0, $zero
/* 9A360 800A9B60 24018010 */  beqz       $a0, .L800A9FF4
/* 9A364 800A9B64 0001023C */   lui       $v0, (0x1000006 >> 16)
/* 9A368 800A9B68 0000838C */  lw         $v1, 0x0($a0)
/* 9A36C 800A9B6C 06004234 */  ori        $v0, $v0, (0x1000006 & 0xFFFF)
/* 9A370 800A9B70 86006210 */  beq        $v1, $v0, .L800A9D8C
/* 9A374 800A9B74 2A104300 */   slt       $v0, $v0, $v1
/* 9A378 800A9B78 15004014 */  bnez       $v0, .L800A9BD0
/* 9A37C 800A9B7C 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 9A380 800A9B80 1000023C */  lui        $v0, (0x100001 >> 16)
/* 9A384 800A9B84 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9A388 800A9B88 25006210 */  beq        $v1, $v0, .L800A9C20
/* 9A38C 800A9B8C 2A104300 */   slt       $v0, $v0, $v1
/* 9A390 800A9B90 07004014 */  bnez       $v0, .L800A9BB0
/* 9A394 800A9B94 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9A398 800A9B98 0080023C */  lui        $v0, (0x80000010 >> 16)
/* 9A39C 800A9B9C 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 9A3A0 800A9BA0 10016210 */  beq        $v1, $v0, .L800A9FE4
/* 9A3A4 800A9BA4 21202002 */   addu      $a0, $s1, $zero
/* 9A3A8 800A9BA8 F7A70208 */  j          .L800A9FDC
/* 9A3AC 800A9BAC 21280002 */   addu      $a1, $s0, $zero
.L800A9BB0:
/* 9A3B0 800A9BB0 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9A3B4 800A9BB4 62006210 */  beq        $v1, $v0, .L800A9D40
/* 9A3B8 800A9BB8 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 9A3BC 800A9BBC 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 9A3C0 800A9BC0 08016210 */  beq        $v1, $v0, .L800A9FE4
/* 9A3C4 800A9BC4 21202002 */   addu      $a0, $s1, $zero
/* 9A3C8 800A9BC8 F7A70208 */  j          .L800A9FDC
/* 9A3CC 800A9BCC 21280002 */   addu      $a1, $s0, $zero
.L800A9BD0:
/* 9A3D0 800A9BD0 F5006210 */  beq        $v1, $v0, .L800A9FA8
/* 9A3D4 800A9BD4 2A104300 */   slt       $v0, $v0, $v1
/* 9A3D8 800A9BD8 0A004014 */  bnez       $v0, .L800A9C04
/* 9A3DC 800A9BDC 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9A3E0 800A9BE0 0001023C */  lui        $v0, (0x1000009 >> 16)
/* 9A3E4 800A9BE4 09004234 */  ori        $v0, $v0, (0x1000009 & 0xFFFF)
/* 9A3E8 800A9BE8 E5006210 */  beq        $v1, $v0, .L800A9F80
/* 9A3EC 800A9BEC 0001023C */   lui       $v0, (0x1000016 >> 16)
/* 9A3F0 800A9BF0 16004234 */  ori        $v0, $v0, (0x1000016 & 0xFFFF)
/* 9A3F4 800A9BF4 D4006210 */  beq        $v1, $v0, .L800A9F48
/* 9A3F8 800A9BF8 00000000 */   nop
/* 9A3FC 800A9BFC F6A70208 */  j          .L800A9FD8
/* 9A400 800A9C00 21202002 */   addu      $a0, $s1, $zero
.L800A9C04:
/* 9A404 800A9C04 8E006210 */  beq        $v1, $v0, .L800A9E40
/* 9A408 800A9C08 0020023C */   lui       $v0, (0x20000002 >> 16)
/* 9A40C 800A9C0C 02004234 */  ori        $v0, $v0, (0x20000002 & 0xFFFF)
/* 9A410 800A9C10 5E006210 */  beq        $v1, $v0, .L800A9D8C
/* 9A414 800A9C14 21202002 */   addu      $a0, $s1, $zero
/* 9A418 800A9C18 F7A70208 */  j          .L800A9FDC
/* 9A41C 800A9C1C 21280002 */   addu      $a1, $s0, $zero
.L800A9C20:
/* 9A420 800A9C20 24000016 */  bnez       $s0, .L800A9CB4
/* 9A424 800A9C24 02000224 */   addiu     $v0, $zero, 0x2
/* 9A428 800A9C28 09000224 */  addiu      $v0, $zero, 0x9
/* 9A42C 800A9C2C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9A430 800A9C30 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9A434 800A9C34 03000324 */  addiu      $v1, $zero, 0x3
/* 9A438 800A9C38 30FD83AF */  sw         $v1, %gp_rel(PhysicsMode)($gp)
/* 9A43C 800A9C3C 00104230 */  andi       $v0, $v0, 0x1000
/* 9A440 800A9C40 13004010 */  beqz       $v0, .L800A9C90
/* 9A444 800A9C44 21202002 */   addu      $a0, $s1, $zero
/* 9A448 800A9C48 1CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3EC)($gp)
/* 9A44C 800A9C4C 00000000 */  nop
/* 9A450 800A9C50 0F004310 */  beq        $v0, $v1, .L800A9C90
/* 9A454 800A9C54 DC000524 */   addiu     $a1, $zero, 0xDC
/* 9A458 800A9C58 0000278E */  lw         $a3, 0x0($s1)
/* 9A45C 800A9C5C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9A460 800A9C60 1000A0AF */  sw         $zero, 0x10($sp)
/* 9A464 800A9C64 5C00E624 */  addiu      $a2, $a3, 0x5C
/* 9A468 800A9C68 6000448C */  lw         $a0, 0x60($v0)
/* 9A46C 800A9C6C 4894020C */  jal        razAlignYRotMove
/* 9A470 800A9C70 7400E724 */   addiu     $a3, $a3, 0x74
/* 9A474 800A9C74 0001053C */  lui        $a1, (0x1000014 >> 16)
/* 9A478 800A9C78 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9A47C 800A9C7C 1400A534 */  ori        $a1, $a1, (0x1000014 & 0xFFFF)
/* 9A480 800A9C80 6000448C */  lw         $a0, 0x60($v0)
/* 9A484 800A9C84 A1D1000C */  jal        INSTANCE_Post
/* 9A488 800A9C88 01000624 */   addiu     $a2, $zero, 0x1
/* 9A48C 800A9C8C 21202002 */  addu       $a0, $s1, $zero
.L800A9C90:
/* 9A490 800A9C90 21280002 */  addu       $a1, $s0, $zero
/* 9A494 800A9C94 4E000624 */  addiu      $a2, $zero, 0x4E
/* 9A498 800A9C98 21380000 */  addu       $a3, $zero, $zero
/* 9A49C 800A9C9C 04000224 */  addiu      $v0, $zero, 0x4
/* 9A4A0 800A9CA0 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A4A4 800A9CA4 1400B2AF */  sw         $s2, 0x14($sp)
/* 9A4A8 800A9CA8 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 9A4AC 800A9CAC 1800A2AF */   sw        $v0, 0x18($sp)
/* 9A4B0 800A9CB0 02000224 */  addiu      $v0, $zero, 0x2
.L800A9CB4:
/* 9A4B4 800A9CB4 08000216 */  bne        $s0, $v0, .L800A9CD8
/* 9A4B8 800A9CB8 21202002 */   addu      $a0, $s1, $zero
/* 9A4BC 800A9CBC 21284000 */  addu       $a1, $v0, $zero
/* 9A4C0 800A9CC0 21300000 */  addu       $a2, $zero, $zero
/* 9A4C4 800A9CC4 2138C000 */  addu       $a3, $a2, $zero
/* 9A4C8 800A9CC8 04000224 */  addiu      $v0, $zero, 0x4
/* 9A4CC 800A9CCC 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A4D0 800A9CD0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9A4D4 800A9CD4 1400B0AF */   sw        $s0, 0x14($sp)
.L800A9CD8:
/* 9A4D8 800A9CD8 C2001216 */  bne        $s0, $s2, .L800A9FE4
/* 9A4DC 800A9CDC 00000000 */   nop
/* 9A4E0 800A9CE0 2F97020C */  jal        razGetHeldWeapon
/* 9A4E4 800A9CE4 00000000 */   nop
/* 9A4E8 800A9CE8 06004014 */  bnez       $v0, .L800A9D04
/* 9A4EC 800A9CEC 21202002 */   addu      $a0, $s1, $zero
/* 9A4F0 800A9CF0 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9A4F4 800A9CF4 00000000 */  nop
/* 9A4F8 800A9CF8 00104230 */  andi       $v0, $v0, 0x1000
/* 9A4FC 800A9CFC 04004010 */  beqz       $v0, .L800A9D10
/* 9A500 800A9D00 01000524 */   addiu     $a1, $zero, 0x1
.L800A9D04:
/* 9A504 800A9D04 01000524 */  addiu      $a1, $zero, 0x1
/* 9A508 800A9D08 45A70208 */  j          .L800A9D14
/* 9A50C 800A9D0C 5E000624 */   addiu     $a2, $zero, 0x5E
.L800A9D10:
/* 9A510 800A9D10 4E000624 */  addiu      $a2, $zero, 0x4E
.L800A9D14:
/* 9A514 800A9D14 21380000 */  addu       $a3, $zero, $zero
/* 9A518 800A9D18 04000224 */  addiu      $v0, $zero, 0x4
/* 9A51C 800A9D1C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A520 800A9D20 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9A524 800A9D24 1400B0AF */   sw        $s0, 0x14($sp)
/* 9A528 800A9D28 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9A52C 800A9D2C 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 9A530 800A9D30 25104300 */  or         $v0, $v0, $v1
/* 9A534 800A9D34 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9A538 800A9D38 F9A70208 */  j          .L800A9FE4
/* 9A53C 800A9D3C 00000000 */   nop
.L800A9D40:
/* 9A540 800A9D40 A8001216 */  bne        $s0, $s2, .L800A9FE4
/* 9A544 800A9D44 00000000 */   nop
/* 9A548 800A9D48 B19D020C */  jal        razSetCowlNoDraw
/* 9A54C 800A9D4C 01000424 */   addiu     $a0, $zero, 0x1
/* 9A550 800A9D50 FFEF043C */  lui        $a0, (0xEFFFFFFF >> 16)
/* 9A554 800A9D54 FFFF8434 */  ori        $a0, $a0, (0xEFFFFFFF & 0xFFFF)
/* 9A558 800A9D58 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9A55C 800A9D5C BFFF0324 */  addiu      $v1, $zero, -0x41
/* 9A560 800A9D60 24104300 */  and        $v0, $v0, $v1
/* 9A564 800A9D64 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9A568 800A9D68 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9A56C 800A9D6C 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* 9A570 800A9D70 24104400 */  and        $v0, $v0, $a0
/* 9A574 800A9D74 00106330 */  andi       $v1, $v1, 0x1000
/* 9A578 800A9D78 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9A57C 800A9D7C 99006010 */  beqz       $v1, .L800A9FE4
/* 9A580 800A9D80 0001053C */   lui       $a1, (0x1000014 >> 16)
/* 9A584 800A9D84 89A70208 */  j          .L800A9E24
/* 9A588 800A9D88 00000000 */   nop
.L800A9D8C:
/* 9A58C 800A9D8C 4F000224 */  addiu      $v0, $zero, 0x4F
/* 9A590 800A9D90 0C006216 */  bne        $s3, $v0, .L800A9DC4
/* 9A594 800A9D94 21202002 */   addu      $a0, $s1, $zero
/* 9A598 800A9D98 21280002 */  addu       $a1, $s0, $zero
/* 9A59C 800A9D9C 2F000624 */  addiu      $a2, $zero, 0x2F
/* 9A5A0 800A9DA0 21380000 */  addu       $a3, $zero, $zero
/* 9A5A4 800A9DA4 03000224 */  addiu      $v0, $zero, 0x3
/* 9A5A8 800A9DA8 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A5AC 800A9DAC 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9A5B0 800A9DB0 1400B2AF */   sw        $s2, 0x14($sp)
/* 9A5B4 800A9DB4 36C3010C */  jal        PurgeMessageQueue
/* 9A5B8 800A9DB8 04008426 */   addiu     $a0, $s4, 0x4
/* 9A5BC 800A9DBC 82A70208 */  j          .L800A9E08
/* 9A5C0 800A9DC0 00000000 */   nop
.L800A9DC4:
/* 9A5C4 800A9DC4 38FB868F */  lw         $a2, %gp_rel(Raziel + 0x508)($gp)
/* 9A5C8 800A9DC8 00000000 */  nop
/* 9A5CC 800A9DCC 0B00C014 */  bnez       $a2, .L800A9DFC
/* 9A5D0 800A9DD0 21280002 */   addu      $a1, $s0, $zero
/* 9A5D4 800A9DD4 21200000 */  addu       $a0, $zero, $zero
/* 9A5D8 800A9DD8 21288000 */  addu       $a1, $a0, $zero
/* 9A5DC 800A9DDC 4FC6010C */  jal        SetControlInitIdleData
/* 9A5E0 800A9DE0 03000624 */   addiu     $a2, $zero, 0x3
/* 9A5E4 800A9DE4 21202002 */  addu       $a0, $s1, $zero
/* 9A5E8 800A9DE8 21280002 */  addu       $a1, $s0, $zero
/* 9A5EC 800A9DEC 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9A5F0 800A9DF0 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9A5F4 800A9DF4 80A70208 */  j          .L800A9E00
/* 9A5F8 800A9DF8 21384000 */   addu      $a3, $v0, $zero
.L800A9DFC:
/* 9A5FC 800A9DFC 21380000 */  addu       $a3, $zero, $zero
.L800A9E00:
/* 9A600 800A9E00 C1CA010C */  jal        StateSwitchStateData
/* 9A604 800A9E04 00000000 */   nop
.L800A9E08:
/* 9A608 800A9E08 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9A60C 800A9E0C 00000000 */  nop
/* 9A610 800A9E10 00104230 */  andi       $v0, $v0, 0x1000
/* 9A614 800A9E14 73004010 */  beqz       $v0, .L800A9FE4
/* 9A618 800A9E18 00000000 */   nop
/* 9A61C 800A9E1C 71000016 */  bnez       $s0, .L800A9FE4
/* 9A620 800A9E20 0001053C */   lui       $a1, (0x1000014 >> 16)
.L800A9E24:
/* 9A624 800A9E24 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9A628 800A9E28 1400A534 */  ori        $a1, $a1, (0x1000014 & 0xFFFF)
/* 9A62C 800A9E2C 6000448C */  lw         $a0, 0x60($v0)
/* 9A630 800A9E30 A1D1000C */  jal        INSTANCE_Post
/* 9A634 800A9E34 21300000 */   addu      $a2, $zero, $zero
/* 9A638 800A9E38 F9A70208 */  j          .L800A9FE4
/* 9A63C 800A9E3C 00000000 */   nop
.L800A9E40:
/* 9A640 800A9E40 2F000224 */  addiu      $v0, $zero, 0x2F
/* 9A644 800A9E44 14006216 */  bne        $s3, $v0, .L800A9E98
/* 9A648 800A9E48 4E000224 */   addiu     $v0, $zero, 0x4E
/* 9A64C 800A9E4C 38FB868F */  lw         $a2, %gp_rel(Raziel + 0x508)($gp)
/* 9A650 800A9E50 00000000 */  nop
/* 9A654 800A9E54 0400C010 */  beqz       $a2, .L800A9E68
/* 9A658 800A9E58 21202002 */   addu      $a0, $s1, $zero
/* 9A65C 800A9E5C 21280002 */  addu       $a1, $s0, $zero
/* 9A660 800A9E60 A3A70208 */  j          .L800A9E8C
/* 9A664 800A9E64 21380000 */   addu      $a3, $zero, $zero
.L800A9E68:
/* 9A668 800A9E68 21200000 */  addu       $a0, $zero, $zero
/* 9A66C 800A9E6C 21288000 */  addu       $a1, $a0, $zero
/* 9A670 800A9E70 4FC6010C */  jal        SetControlInitIdleData
/* 9A674 800A9E74 03000624 */   addiu     $a2, $zero, 0x3
/* 9A678 800A9E78 21202002 */  addu       $a0, $s1, $zero
/* 9A67C 800A9E7C 21280002 */  addu       $a1, $s0, $zero
/* 9A680 800A9E80 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9A684 800A9E84 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9A688 800A9E88 21384000 */  addu       $a3, $v0, $zero
.L800A9E8C:
/* 9A68C 800A9E8C C1CA010C */  jal        StateSwitchStateData
/* 9A690 800A9E90 00000000 */   nop
/* 9A694 800A9E94 4E000224 */  addiu      $v0, $zero, 0x4E
.L800A9E98:
/* 9A698 800A9E98 09006216 */  bne        $s3, $v0, .L800A9EC0
/* 9A69C 800A9E9C 50000224 */   addiu     $v0, $zero, 0x50
/* 9A6A0 800A9EA0 21202002 */  addu       $a0, $s1, $zero
/* 9A6A4 800A9EA4 21280002 */  addu       $a1, $s0, $zero
/* 9A6A8 800A9EA8 4F000624 */  addiu      $a2, $zero, 0x4F
/* 9A6AC 800A9EAC 21380000 */  addu       $a3, $zero, $zero
/* 9A6B0 800A9EB0 1000A0AF */  sw         $zero, 0x10($sp)
/* 9A6B4 800A9EB4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9A6B8 800A9EB8 1400B2AF */   sw        $s2, 0x14($sp)
/* 9A6BC 800A9EBC 50000224 */  addiu      $v0, $zero, 0x50
.L800A9EC0:
/* 9A6C0 800A9EC0 48006216 */  bne        $s3, $v0, .L800A9FE4
/* 9A6C4 800A9EC4 00000000 */   nop
/* 9A6C8 800A9EC8 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9A6CC 800A9ECC 88A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x4)($gp)
/* 9A6D0 800A9ED0 0000428C */  lw         $v0, 0x0($v0)
/* 9A6D4 800A9ED4 00000000 */  nop
/* 9A6D8 800A9ED8 24104300 */  and        $v0, $v0, $v1
/* 9A6DC 800A9EDC 06004010 */  beqz       $v0, .L800A9EF8
/* 9A6E0 800A9EE0 21202002 */   addu      $a0, $s1, $zero
/* 9A6E4 800A9EE4 21280002 */  addu       $a1, $s0, $zero
/* 9A6E8 800A9EE8 4F000624 */  addiu      $a2, $zero, 0x4F
/* 9A6EC 800A9EEC 21380000 */  addu       $a3, $zero, $zero
/* 9A6F0 800A9EF0 E5A70208 */  j          .L800A9F94
/* 9A6F4 800A9EF4 08000224 */   addiu     $v0, $zero, 0x8
.L800A9EF8:
/* 9A6F8 800A9EF8 38FB868F */  lw         $a2, %gp_rel(Raziel + 0x508)($gp)
/* 9A6FC 800A9EFC 00000000 */  nop
/* 9A700 800A9F00 0500C010 */  beqz       $a2, .L800A9F18
/* 9A704 800A9F04 21280002 */   addu      $a1, $s0, $zero
/* 9A708 800A9F08 C1CA010C */  jal        StateSwitchStateData
/* 9A70C 800A9F0C 21380000 */   addu      $a3, $zero, $zero
/* 9A710 800A9F10 F9A70208 */  j          .L800A9FE4
/* 9A714 800A9F14 00000000 */   nop
.L800A9F18:
/* 9A718 800A9F18 21200000 */  addu       $a0, $zero, $zero
/* 9A71C 800A9F1C 21288000 */  addu       $a1, $a0, $zero
/* 9A720 800A9F20 4FC6010C */  jal        SetControlInitIdleData
/* 9A724 800A9F24 03000624 */   addiu     $a2, $zero, 0x3
/* 9A728 800A9F28 21202002 */  addu       $a0, $s1, $zero
/* 9A72C 800A9F2C 21280002 */  addu       $a1, $s0, $zero
/* 9A730 800A9F30 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9A734 800A9F34 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9A738 800A9F38 C1CA010C */  jal        StateSwitchStateData
/* 9A73C 800A9F3C 21384000 */   addu      $a3, $v0, $zero
/* 9A740 800A9F40 F9A70208 */  j          .L800A9FE4
/* 9A744 800A9F44 00000000 */   nop
.L800A9F48:
/* 9A748 800A9F48 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 9A74C 800A9F4C 00000000 */  nop
/* 9A750 800A9F50 00084230 */  andi       $v0, $v0, 0x800
/* 9A754 800A9F54 23004010 */  beqz       $v0, .L800A9FE4
/* 9A758 800A9F58 00000000 */   nop
/* 9A75C 800A9F5C 21001216 */  bne        $s0, $s2, .L800A9FE4
/* 9A760 800A9F60 00000000 */   nop
/* 9A764 800A9F64 0400848C */  lw         $a0, 0x4($a0)
/* 9A768 800A9F68 5091020C */  jal        GainHealth
/* 9A76C 800A9F6C 00000000 */   nop
/* 9A770 800A9F70 C89E020C */  jal        razSetPlayerEventHistory
/* 9A774 800A9F74 00100424 */   addiu     $a0, $zero, 0x1000
/* 9A778 800A9F78 F9A70208 */  j          .L800A9FE4
/* 9A77C 800A9F7C 00000000 */   nop
.L800A9F80:
/* 9A780 800A9F80 21202002 */  addu       $a0, $s1, $zero
/* 9A784 800A9F84 21280002 */  addu       $a1, $s0, $zero
/* 9A788 800A9F88 50000624 */  addiu      $a2, $zero, 0x50
/* 9A78C 800A9F8C 21380000 */  addu       $a3, $zero, $zero
/* 9A790 800A9F90 02000224 */  addiu      $v0, $zero, 0x2
.L800A9F94:
/* 9A794 800A9F94 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A798 800A9F98 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9A79C 800A9F9C 1400B2AF */   sw        $s2, 0x14($sp)
/* 9A7A0 800A9FA0 F9A70208 */  j          .L800A9FE4
/* 9A7A4 800A9FA4 00000000 */   nop
.L800A9FA8:
/* 9A7A8 800A9FA8 0400828C */  lw         $v0, 0x4($a0)
/* 9A7AC 800A9FAC 00000000 */  nop
/* 9A7B0 800A9FB0 10004294 */  lhu        $v0, 0x10($v0)
/* 9A7B4 800A9FB4 00000000 */  nop
/* 9A7B8 800A9FB8 40004230 */  andi       $v0, $v0, 0x40
/* 9A7BC 800A9FBC 09004010 */  beqz       $v0, .L800A9FE4
/* 9A7C0 800A9FC0 21202002 */   addu      $a0, $s1, $zero
/* 9A7C4 800A9FC4 21280002 */  addu       $a1, $s0, $zero
/* 9A7C8 800A9FC8 8B7B020C */  jal        StateHandlerInitSwim
/* 9A7CC 800A9FCC 21300000 */   addu      $a2, $zero, $zero
/* 9A7D0 800A9FD0 F9A70208 */  j          .L800A9FE4
/* 9A7D4 800A9FD4 00000000 */   nop
.L800A9FD8:
/* 9A7D8 800A9FD8 21280002 */  addu       $a1, $s0, $zero
.L800A9FDC:
/* 9A7DC 800A9FDC B9BF020C */  jal        DefaultStateHandler
/* 9A7E0 800A9FE0 2130A002 */   addu      $a2, $s5, $zero
.L800A9FE4:
/* 9A7E4 800A9FE4 27C3010C */  jal        DeMessageQueue
/* 9A7E8 800A9FE8 04008426 */   addiu     $a0, $s4, 0x4
/* 9A7EC 800A9FEC D5A60208 */  j          .L800A9B54
/* 9A7F0 800A9FF0 00000000 */   nop
.L800A9FF4:
/* 9A7F4 800A9FF4 3800BF8F */  lw         $ra, 0x38($sp)
/* 9A7F8 800A9FF8 3400B58F */  lw         $s5, 0x34($sp)
/* 9A7FC 800A9FFC 3000B48F */  lw         $s4, 0x30($sp)
/* 9A800 800AA000 2C00B38F */  lw         $s3, 0x2C($sp)
/* 9A804 800AA004 2800B28F */  lw         $s2, 0x28($sp)
/* 9A808 800AA008 2400B18F */  lw         $s1, 0x24($sp)
/* 9A80C 800AA00C 2000B08F */  lw         $s0, 0x20($sp)
/* 9A810 800AA010 0800E003 */  jr         $ra
/* 9A814 800AA014 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerSoulSuck, . - StateHandlerSoulSuck
