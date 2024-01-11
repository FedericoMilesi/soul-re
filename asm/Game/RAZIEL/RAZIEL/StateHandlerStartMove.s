.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerStartMove
/* 9AAC4 800AA2C4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9AAC8 800AA2C8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9AACC 800AA2CC 21888000 */  addu       $s1, $a0, $zero
/* 9AAD0 800AA2D0 2000B2AF */  sw         $s2, 0x20($sp)
/* 9AAD4 800AA2D4 2190A000 */  addu       $s2, $a1, $zero
/* 9AAD8 800AA2D8 2800B4AF */  sw         $s4, 0x28($sp)
/* 9AADC 800AA2DC 21A0C000 */  addu       $s4, $a2, $zero
/* 9AAE0 800AA2E0 C0101200 */  sll        $v0, $s2, 3
/* 9AAE4 800AA2E4 21105200 */  addu       $v0, $v0, $s2
/* 9AAE8 800AA2E8 C0100200 */  sll        $v0, $v0, 3
/* 9AAEC 800AA2EC 23105200 */  subu       $v0, $v0, $s2
/* 9AAF0 800AA2F0 1800B0AF */  sw         $s0, 0x18($sp)
/* 9AAF4 800AA2F4 80800200 */  sll        $s0, $v0, 2
/* 9AAF8 800AA2F8 2400B3AF */  sw         $s3, 0x24($sp)
/* 9AAFC 800AA2FC 21983002 */  addu       $s3, $s1, $s0
/* 9AB00 800AA300 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 9AB04 800AA304 21201102 */  addu       $a0, $s0, $s1
.L800AA308:
/* 9AB08 800AA308 39C3010C */  jal        PeekMessageQueue
/* 9AB0C 800AA30C 0C008424 */   addiu     $a0, $a0, 0xC
/* 9AB10 800AA310 21284000 */  addu       $a1, $v0, $zero
/* 9AB14 800AA314 4001A010 */  beqz       $a1, .L800AA818
/* 9AB18 800AA318 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9AB1C 800AA31C 0000A38C */  lw         $v1, 0x0($a1)
/* 9AB20 800AA320 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9AB24 800AA324 3E006210 */  beq        $v1, $v0, .L800AA420
/* 9AB28 800AA328 2A104300 */   slt       $v0, $v0, $v1
/* 9AB2C 800AA32C 1B004014 */  bnez       $v0, .L800AA39C
/* 9AB30 800AA330 0104023C */   lui       $v0, (0x4010401 >> 16)
/* 9AB34 800AA334 0080023C */  lui        $v0, (0x80000002 >> 16)
/* 9AB38 800AA338 02004234 */  ori        $v0, $v0, (0x80000002 & 0xFFFF)
/* 9AB3C 800AA33C 7E006210 */  beq        $v1, $v0, .L800AA538
/* 9AB40 800AA340 2A104300 */   slt       $v0, $v0, $v1
/* 9AB44 800AA344 07004014 */  bnez       $v0, .L800AA364
/* 9AB48 800AA348 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 9AB4C 800AA34C CC006210 */  beq        $v1, $v0, .L800AA680
/* 9AB50 800AA350 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 9AB54 800AA354 AE006210 */  beq        $v1, $v0, .L800AA610
/* 9AB58 800AA358 21202002 */   addu      $a0, $s1, $zero
/* 9AB5C 800AA35C FFA90208 */  j          .L800AA7FC
/* 9AB60 800AA360 21284002 */   addu      $a1, $s2, $zero
.L800AA364:
/* 9AB64 800AA364 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 9AB68 800AA368 73006210 */  beq        $v1, $v0, .L800AA538
/* 9AB6C 800AA36C 2A104300 */   slt       $v0, $v0, $v1
/* 9AB70 800AA370 06004014 */  bnez       $v0, .L800AA38C
/* 9AB74 800AA374 0080023C */   lui       $v0, (0x80000004 >> 16)
/* 9AB78 800AA378 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 9AB7C 800AA37C E5006210 */  beq        $v1, $v0, .L800AA714
/* 9AB80 800AA380 21202002 */   addu      $a0, $s1, $zero
/* 9AB84 800AA384 FFA90208 */  j          .L800AA7FC
/* 9AB88 800AA388 21284002 */   addu      $a1, $s2, $zero
.L800AA38C:
/* 9AB8C 800AA38C 79006010 */  beqz       $v1, .L800AA574
/* 9AB90 800AA390 21202002 */   addu      $a0, $s1, $zero
/* 9AB94 800AA394 FFA90208 */  j          .L800AA7FC
/* 9AB98 800AA398 21284002 */   addu      $a1, $s2, $zero
.L800AA39C:
/* 9AB9C 800AA39C 01044234 */  ori        $v0, $v0, (0x4010401 & 0xFFFF)
/* 9ABA0 800AA3A0 09016210 */  beq        $v1, $v0, .L800AA7C8
/* 9ABA4 800AA3A4 2A104300 */   slt       $v0, $v0, $v1
/* 9ABA8 800AA3A8 11004014 */  bnez       $v0, .L800AA3F0
/* 9ABAC 800AA3AC 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9ABB0 800AA3B0 0004023C */  lui        $v0, (0x4000001 >> 16)
/* 9ABB4 800AA3B4 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 9ABB8 800AA3B8 DD006210 */  beq        $v1, $v0, .L800AA730
/* 9ABBC 800AA3BC 2A104300 */   slt       $v0, $v0, $v1
/* 9ABC0 800AA3C0 06004014 */  bnez       $v0, .L800AA3DC
/* 9ABC4 800AA3C4 0104023C */   lui       $v0, (0x4010080 >> 16)
/* 9ABC8 800AA3C8 0002023C */  lui        $v0, (0x2000080 >> 16)
/* 9ABCC 800AA3CC 51006210 */  beq        $v1, $v0, .L800AA514
/* 9ABD0 800AA3D0 21202002 */   addu      $a0, $s1, $zero
/* 9ABD4 800AA3D4 FFA90208 */  j          .L800AA7FC
/* 9ABD8 800AA3D8 21284002 */   addu      $a1, $s2, $zero
.L800AA3DC:
/* 9ABDC 800AA3DC 80004234 */  ori        $v0, $v0, (0x2000080 & 0xFFFF)
/* 9ABE0 800AA3E0 2D006210 */  beq        $v1, $v0, .L800AA498
/* 9ABE4 800AA3E4 21202002 */   addu      $a0, $s1, $zero
/* 9ABE8 800AA3E8 FFA90208 */  j          .L800AA7FC
/* 9ABEC 800AA3EC 21284002 */   addu      $a1, $s2, $zero
.L800AA3F0:
/* 9ABF0 800AA3F0 2A106200 */  slt        $v0, $v1, $v0
/* 9ABF4 800AA3F4 00014014 */  bnez       $v0, .L800AA7F8
/* 9ABF8 800AA3F8 21202002 */   addu      $a0, $s1, $zero
/* 9ABFC 800AA3FC 0008023C */  lui        $v0, (0x8000001 >> 16)
/* 9AC00 800AA400 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 9AC04 800AA404 2A104300 */  slt        $v0, $v0, $v1
/* 9AC08 800AA408 B1004010 */  beqz       $v0, .L800AA6D0
/* 9AC0C 800AA40C 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9AC10 800AA410 FC006210 */  beq        $v1, $v0, .L800AA804
/* 9AC14 800AA414 21284002 */   addu      $a1, $s2, $zero
/* 9AC18 800AA418 FFA90208 */  j          .L800AA7FC
/* 9AC1C 800AA41C 00000000 */   nop
.L800AA420:
/* 9AC20 800AA420 21202002 */  addu       $a0, $s1, $zero
/* 9AC24 800AA424 0400A68C */  lw         $a2, 0x4($a1)
/* 9AC28 800AA428 86A8020C */  jal        StateInitStartMove
/* 9AC2C 800AA42C 21284002 */   addu      $a1, $s2, $zero
/* 9AC30 800AA430 01000224 */  addiu      $v0, $zero, 0x1
/* 9AC34 800AA434 F3004016 */  bnez       $s2, .L800AA804
/* 9AC38 800AA438 200162AE */   sw        $v0, 0x120($s3)
/* 9AC3C 800AA43C 0200043C */  lui        $a0, (0x2A119 >> 16)
/* 9AC40 800AA440 19A18434 */  ori        $a0, $a0, (0x2A119 & 0xFFFF)
/* 9AC44 800AA444 2000033C */  lui        $v1, (0x200800 >> 16)
/* 9AC48 800AA448 00086334 */  ori        $v1, $v1, (0x200800 & 0xFFFF)
/* 9AC4C 800AA44C 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9AC50 800AA450 C8FD84AF */  sw         $a0, %gp_rel(ControlFlag)($gp)
/* 9AC54 800AA454 24104300 */  and        $v0, $v0, $v1
/* 9AC58 800AA458 04004234 */  ori        $v0, $v0, 0x4
/* 9AC5C 800AA45C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9AC60 800AA460 0000248E */  lw         $a0, 0x0($s1)
/* 9AC64 800AA464 03000224 */  addiu      $v0, $zero, 0x3
/* 9AC68 800AA468 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9AC6C 800AA46C 938B020C */  jal        SteerSwitchMode
/* 9AC70 800AA470 02000524 */   addiu     $a1, $zero, 0x2
/* 9AC74 800AA474 CC0C0224 */  addiu      $v0, $zero, 0xCCC
/* 9AC78 800AA478 C4F982A7 */  sh         $v0, %gp_rel(Raziel + 0x394)($gp)
/* 9AC7C 800AA47C 00040224 */  addiu      $v0, $zero, 0x400
/* 9AC80 800AA480 C8F982A7 */  sh         $v0, %gp_rel(Raziel + 0x398)($gp)
/* 9AC84 800AA484 00100224 */  addiu      $v0, $zero, 0x1000
/* 9AC88 800AA488 CAF982A7 */  sh         $v0, %gp_rel(Raziel + 0x39A)($gp)
/* 9AC8C 800AA48C 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 9AC90 800AA490 02AA0208 */  j          .L800AA808
/* 9AC94 800AA494 21201102 */   addu      $a0, $s0, $s1
.L800AA498:
/* 9AC98 800AA498 02000224 */  addiu      $v0, $zero, 0x2
/* 9AC9C 800AA49C 0C004212 */  beq        $s2, $v0, .L800AA4D0
/* 9ACA0 800AA4A0 00000000 */   nop
/* 9ACA4 800AA4A4 0400A28C */  lw         $v0, 0x4($a1)
/* 9ACA8 800AA4A8 00000000 */  nop
/* 9ACAC 800AA4AC 04004010 */  beqz       $v0, .L800AA4C0
/* 9ACB0 800AA4B0 21202002 */   addu      $a0, $s1, $zero
/* 9ACB4 800AA4B4 21284002 */  addu       $a1, $s2, $zero
/* 9ACB8 800AA4B8 32A90208 */  j          .L800AA4C8
/* 9ACBC 800AA4BC 01000624 */   addiu     $a2, $zero, 0x1
.L800AA4C0:
/* 9ACC0 800AA4C0 21284002 */  addu       $a1, $s2, $zero
/* 9ACC4 800AA4C4 21300000 */  addu       $a2, $zero, $zero
.L800AA4C8:
/* 9ACC8 800AA4C8 91C9010C */  jal        G2EmulationSetMode
/* 9ACCC 800AA4CC 00000000 */   nop
.L800AA4D0:
/* 9ACD0 800AA4D0 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9ACD4 800AA4D4 00000000 */  nop
/* 9ACD8 800AA4D8 02004230 */  andi       $v0, $v0, 0x2
/* 9ACDC 800AA4DC C9004010 */  beqz       $v0, .L800AA804
/* 9ACE0 800AA4E0 0080033C */   lui       $v1, (0x8000000F >> 16)
/* 9ACE4 800AA4E4 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9ACE8 800AA4E8 00000000 */  nop
/* 9ACEC 800AA4EC 0000428C */  lw         $v0, 0x0($v0)
/* 9ACF0 800AA4F0 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 9ACF4 800AA4F4 24104300 */  and        $v0, $v0, $v1
/* 9ACF8 800AA4F8 C2004010 */  beqz       $v0, .L800AA804
/* 9ACFC 800AA4FC 21284002 */   addu      $a1, $s2, $zero
/* 9AD00 800AA500 21202002 */  addu       $a0, $s1, $zero
/* 9AD04 800AA504 91C9010C */  jal        G2EmulationSetMode
/* 9AD08 800AA508 02000624 */   addiu     $a2, $zero, 0x2
/* 9AD0C 800AA50C 9AA90208 */  j          .L800AA668
/* 9AD10 800AA510 00000000 */   nop
.L800AA514:
/* 9AD14 800AA514 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9AD18 800AA518 00000000 */  nop
/* 9AD1C 800AA51C 20004230 */  andi       $v0, $v0, 0x20
/* 9AD20 800AA520 05004010 */  beqz       $v0, .L800AA538
/* 9AD24 800AA524 00000000 */   nop
/* 9AD28 800AA528 3A96020C */  jal        razPickupAndGrab
/* 9AD2C 800AA52C 21284002 */   addu      $a1, $s2, $zero
/* 9AD30 800AA530 02AA0208 */  j          .L800AA808
/* 9AD34 800AA534 21201102 */   addu      $a0, $s0, $s1
.L800AA538:
/* 9AD38 800AA538 B3004016 */  bnez       $s2, .L800AA808
/* 9AD3C 800AA53C 21201102 */   addu      $a0, $s0, $s1
/* 9AD40 800AA540 0000228E */  lw         $v0, 0x0($s1)
/* 9AD44 800AA544 00000000 */  nop
/* 9AD48 800AA548 B400428C */  lw         $v0, 0xB4($v0)
/* 9AD4C 800AA54C 00000000 */  nop
/* 9AD50 800AA550 08004010 */  beqz       $v0, .L800AA574
/* 9AD54 800AA554 94002426 */   addiu     $a0, $s1, 0x94
/* 9AD58 800AA558 0000A58C */  lw         $a1, 0x0($a1)
/* 9AD5C 800AA55C 4EC3010C */  jal        EnMessageQueueData
/* 9AD60 800AA560 21300000 */   addu      $a2, $zero, $zero
/* 9AD64 800AA564 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9AD68 800AA568 8000033C */  lui        $v1, (0x800000 >> 16)
/* 9AD6C 800AA56C 25104300 */  or         $v0, $v0, $v1
/* 9AD70 800AA570 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800AA574:
/* 9AD74 800AA574 A4004016 */  bnez       $s2, .L800AA808
/* 9AD78 800AA578 21201102 */   addu      $a0, $s0, $s1
/* 9AD7C 800AA57C 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9AD80 800AA580 00000000 */  nop
/* 9AD84 800AA584 07004230 */  andi       $v0, $v0, 0x7
/* 9AD88 800AA588 05004014 */  bnez       $v0, .L800AA5A0
/* 9AD8C 800AA58C 21202002 */   addu      $a0, $s1, $zero
/* 9AD90 800AA590 11CA010C */  jal        G2EmulationQueryMode
/* 9AD94 800AA594 21280000 */   addu      $a1, $zero, $zero
/* 9AD98 800AA598 17004014 */  bnez       $v0, .L800AA5F8
/* 9AD9C 800AA59C 00000000 */   nop
.L800AA5A0:
/* 9ADA0 800AA5A0 3CFB848F */  lw         $a0, %gp_rel(Raziel + 0x50C)($gp)
/* 9ADA4 800AA5A4 00000000 */  nop
/* 9ADA8 800AA5A8 01008230 */  andi       $v0, $a0, 0x1
/* 9ADAC 800AA5AC 03004010 */  beqz       $v0, .L800AA5BC
/* 9ADB0 800AA5B0 02008230 */   andi      $v0, $a0, 0x2
/* 9ADB4 800AA5B4 72A90208 */  j          .L800AA5C8
/* 9ADB8 800AA5B8 02000424 */   addiu     $a0, $zero, 0x2
.L800AA5BC:
/* 9ADBC 800AA5BC 02004010 */  beqz       $v0, .L800AA5C8
/* 9ADC0 800AA5C0 04008430 */   andi      $a0, $a0, 0x4
/* 9ADC4 800AA5C4 03000424 */  addiu      $a0, $zero, 0x3
.L800AA5C8:
/* 9ADC8 800AA5C8 05000524 */  addiu      $a1, $zero, 0x5
/* 9ADCC 800AA5CC 4FC6010C */  jal        SetControlInitIdleData
/* 9ADD0 800AA5D0 2130A000 */   addu      $a2, $a1, $zero
/* 9ADD4 800AA5D4 21202002 */  addu       $a0, $s1, $zero
/* 9ADD8 800AA5D8 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9ADDC 800AA5DC E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9ADE0 800AA5E0 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9ADE4 800AA5E4 21304000 */   addu      $a2, $v0, $zero
/* 9ADE8 800AA5E8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9ADEC 800AA5EC FFDF0324 */  addiu      $v1, $zero, -0x2001
/* 9ADF0 800AA5F0 24104300 */  and        $v0, $v0, $v1
/* 9ADF4 800AA5F4 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800AA5F8:
/* 9ADF8 800AA5F8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9ADFC 800AA5FC 00000000 */  nop
/* 9AE00 800AA600 00204234 */  ori        $v0, $v0, 0x2000
/* 9AE04 800AA604 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9AE08 800AA608 02AA0208 */  j          .L800AA808
/* 9AE0C 800AA60C 21201102 */   addu      $a0, $s0, $s1
.L800AA610:
/* 9AE10 800AA610 7D004016 */  bnez       $s2, .L800AA808
/* 9AE14 800AA614 21201102 */   addu      $a0, $s0, $s1
/* 9AE18 800AA618 21280000 */  addu       $a1, $zero, $zero
/* 9AE1C 800AA61C 2130A000 */  addu       $a2, $a1, $zero
/* 9AE20 800AA620 08000224 */  addiu      $v0, $zero, 0x8
/* 9AE24 800AA624 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9AE28 800AA628 0000248E */  lw         $a0, 0x0($s1)
/* 9AE2C 800AA62C 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9AE30 800AA630 2138A000 */   addu      $a3, $a1, $zero
/* 9AE34 800AA634 07004010 */  beqz       $v0, .L800AA654
/* 9AE38 800AA638 01000224 */   addiu     $v0, $zero, 0x1
/* 9AE3C 800AA63C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9AE40 800AA640 21202002 */  addu       $a0, $s1, $zero
/* 9AE44 800AA644 1A000524 */  addiu      $a1, $zero, 0x1A
/* 9AE48 800AA648 21300000 */  addu       $a2, $zero, $zero
/* 9AE4C 800AA64C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9AE50 800AA650 2138C000 */   addu      $a3, $a2, $zero
.L800AA654:
/* 9AE54 800AA654 21202002 */  addu       $a0, $s1, $zero
/* 9AE58 800AA658 0B80053C */  lui        $a1, %hi(StateHandlerCompression)
/* 9AE5C 800AA65C ACB5A524 */  addiu      $a1, $a1, %lo(StateHandlerCompression)
/* 9AE60 800AA660 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9AE64 800AA664 21300000 */   addu      $a2, $zero, $zero
.L800AA668:
/* 9AE68 800AA668 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9AE6C 800AA66C FFDF0324 */  addiu      $v1, $zero, -0x2001
/* 9AE70 800AA670 24104300 */  and        $v0, $v0, $v1
/* 9AE74 800AA674 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9AE78 800AA678 02AA0208 */  j          .L800AA808
/* 9AE7C 800AA67C 21201102 */   addu      $a0, $s0, $s1
.L800AA680:
/* 9AE80 800AA680 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9AE84 800AA684 00000000 */  nop
/* 9AE88 800AA688 04004230 */  andi       $v0, $v0, 0x4
/* 9AE8C 800AA68C 17004010 */  beqz       $v0, .L800AA6EC
/* 9AE90 800AA690 01000224 */   addiu     $v0, $zero, 0x1
/* 9AE94 800AA694 0E004216 */  bne        $s2, $v0, .L800AA6D0
/* 9AE98 800AA698 21202002 */   addu      $a0, $s1, $zero
/* 9AE9C 800AA69C CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9AEA0 800AA6A0 00000000 */  nop
/* 9AEA4 800AA6A4 80004230 */  andi       $v0, $v0, 0x80
/* 9AEA8 800AA6A8 57004014 */  bnez       $v0, .L800AA808
/* 9AEAC 800AA6AC 21201102 */   addu      $a0, $s0, $s1
/* 9AEB0 800AA6B0 21202002 */  addu       $a0, $s1, $zero
/* 9AEB4 800AA6B4 01000524 */  addiu      $a1, $zero, 0x1
/* 9AEB8 800AA6B8 0A80063C */  lui        $a2, %hi(StateHandlerAttack2)
/* 9AEBC 800AA6BC E4BDC624 */  addiu      $a2, $a2, %lo(StateHandlerAttack2)
/* 9AEC0 800AA6C0 C1CA010C */  jal        StateSwitchStateData
/* 9AEC4 800AA6C4 0A000724 */   addiu     $a3, $zero, 0xA
/* 9AEC8 800AA6C8 02AA0208 */  j          .L800AA808
/* 9AECC 800AA6CC 21201102 */   addu      $a0, $s0, $s1
.L800AA6D0:
/* 9AED0 800AA6D0 21284002 */  addu       $a1, $s2, $zero
/* 9AED4 800AA6D4 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 9AED8 800AA6D8 A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 9AEDC 800AA6DC C1CA010C */  jal        StateSwitchStateData
/* 9AEE0 800AA6E0 21380000 */   addu      $a3, $zero, $zero
/* 9AEE4 800AA6E4 02AA0208 */  j          .L800AA808
/* 9AEE8 800AA6E8 21201102 */   addu      $a0, $s0, $s1
.L800AA6EC:
/* 9AEEC 800AA6EC 46004016 */  bnez       $s2, .L800AA808
/* 9AEF0 800AA6F0 21201102 */   addu      $a0, $s0, $s1
/* 9AEF4 800AA6F4 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9AEF8 800AA6F8 00000000 */  nop
/* 9AEFC 800AA6FC 80004230 */  andi       $v0, $v0, 0x80
/* 9AF00 800AA700 41004014 */  bnez       $v0, .L800AA808
/* 9AF04 800AA704 0A80053C */   lui       $a1, %hi(StateHandlerAttack2)
/* 9AF08 800AA708 21202002 */  addu       $a0, $s1, $zero
/* 9AF0C 800AA70C EEA90208 */  j          .L800AA7B8
/* 9AF10 800AA710 E4BDA524 */   addiu     $a1, $a1, %lo(StateHandlerAttack2)
.L800AA714:
/* 9AF14 800AA714 21284002 */  addu       $a1, $s2, $zero
/* 9AF18 800AA718 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 9AF1C 800AA71C A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 9AF20 800AA720 C1CA010C */  jal        StateSwitchStateData
/* 9AF24 800AA724 03000724 */   addiu     $a3, $zero, 0x3
/* 9AF28 800AA728 02AA0208 */  j          .L800AA808
/* 9AF2C 800AA72C 21201102 */   addu      $a0, $s0, $s1
.L800AA730:
/* 9AF30 800AA730 35004016 */  bnez       $s2, .L800AA808
/* 9AF34 800AA734 21201102 */   addu      $a0, $s0, $s1
/* 9AF38 800AA738 21202002 */  addu       $a0, $s1, $zero
/* 9AF3C 800AA73C F6C9010C */  jal        G2EmulationQueryFrame
/* 9AF40 800AA740 21280000 */   addu      $a1, $zero, $zero
/* 9AF44 800AA744 07004228 */  slti       $v0, $v0, 0x7
/* 9AF48 800AA748 2F004014 */  bnez       $v0, .L800AA808
/* 9AF4C 800AA74C 21201102 */   addu      $a0, $s0, $s1
/* 9AF50 800AA750 0000248E */  lw         $a0, 0x0($s1)
/* 9AF54 800AA754 30F68527 */  addiu      $a1, $gp, %gp_rel(Raziel)
/* 9AF58 800AA758 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 9AF5C 800AA75C 1069020C */  jal        SetDropPhysics
/* 9AF60 800AA760 00000000 */   nop
/* 9AF64 800AA764 0000248E */  lw         $a0, 0x0($s1)
/* 9AF68 800AA768 00000000 */  nop
/* 9AF6C 800AA76C 7C01828C */  lw         $v0, 0x17C($a0)
/* 9AF70 800AA770 00000000 */  nop
/* 9AF74 800AA774 E0FF4228 */  slti       $v0, $v0, -0x20
/* 9AF78 800AA778 22004010 */  beqz       $v0, .L800AA804
/* 9AF7C 800AA77C 18000524 */   addiu     $a1, $zero, 0x18
/* 9AF80 800AA780 21300000 */  addu       $a2, $zero, $zero
/* 9AF84 800AA784 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9AF88 800AA788 2138C000 */   addu      $a3, $a2, $zero
/* 9AF8C 800AA78C 07004010 */  beqz       $v0, .L800AA7AC
/* 9AF90 800AA790 01000224 */   addiu     $v0, $zero, 0x1
/* 9AF94 800AA794 1000A2AF */  sw         $v0, 0x10($sp)
/* 9AF98 800AA798 21202002 */  addu       $a0, $s1, $zero
/* 9AF9C 800AA79C 24000524 */  addiu      $a1, $zero, 0x24
/* 9AFA0 800AA7A0 21300000 */  addu       $a2, $zero, $zero
/* 9AFA4 800AA7A4 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9AFA8 800AA7A8 04000724 */   addiu     $a3, $zero, 0x4
.L800AA7AC:
/* 9AFAC 800AA7AC 21202002 */  addu       $a0, $s1, $zero
/* 9AFB0 800AA7B0 0B80053C */  lui        $a1, %hi(StateHandlerFall)
/* 9AFB4 800AA7B4 A8BDA524 */  addiu      $a1, $a1, %lo(StateHandlerFall)
.L800AA7B8:
/* 9AFB8 800AA7B8 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9AFBC 800AA7BC 21300000 */   addu      $a2, $zero, $zero
/* 9AFC0 800AA7C0 02AA0208 */  j          .L800AA808
/* 9AFC4 800AA7C4 21201102 */   addu      $a0, $s0, $s1
.L800AA7C8:
/* 9AFC8 800AA7C8 21200000 */  addu       $a0, $zero, $zero
/* 9AFCC 800AA7CC 05000524 */  addiu      $a1, $zero, 0x5
/* 9AFD0 800AA7D0 4FC6010C */  jal        SetControlInitIdleData
/* 9AFD4 800AA7D4 2130A000 */   addu      $a2, $a1, $zero
/* 9AFD8 800AA7D8 21202002 */  addu       $a0, $s1, $zero
/* 9AFDC 800AA7DC 21284002 */  addu       $a1, $s2, $zero
/* 9AFE0 800AA7E0 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9AFE4 800AA7E4 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9AFE8 800AA7E8 C1CA010C */  jal        StateSwitchStateData
/* 9AFEC 800AA7EC 21384000 */   addu      $a3, $v0, $zero
/* 9AFF0 800AA7F0 02AA0208 */  j          .L800AA808
/* 9AFF4 800AA7F4 21201102 */   addu      $a0, $s0, $s1
.L800AA7F8:
/* 9AFF8 800AA7F8 21284002 */  addu       $a1, $s2, $zero
.L800AA7FC:
/* 9AFFC 800AA7FC B9BF020C */  jal        DefaultStateHandler
/* 9B000 800AA800 21308002 */   addu      $a2, $s4, $zero
.L800AA804:
/* 9B004 800AA804 21201102 */  addu       $a0, $s0, $s1
.L800AA808:
/* 9B008 800AA808 27C3010C */  jal        DeMessageQueue
/* 9B00C 800AA80C 0C008424 */   addiu     $a0, $a0, 0xC
/* 9B010 800AA810 C2A80208 */  j          .L800AA308
/* 9B014 800AA814 21201102 */   addu      $a0, $s0, $s1
.L800AA818:
/* 9B018 800AA818 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9B01C 800AA81C 0080033C */  lui        $v1, (0x8000000F >> 16)
/* 9B020 800AA820 0000428C */  lw         $v0, 0x0($v0)
/* 9B024 800AA824 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 9B028 800AA828 24104300 */  and        $v0, $v0, $v1
/* 9B02C 800AA82C 16004010 */  beqz       $v0, .L800AA888
/* 9B030 800AA830 C0101200 */   sll       $v0, $s2, 3
/* 9B034 800AA834 21105200 */  addu       $v0, $v0, $s2
/* 9B038 800AA838 C0100200 */  sll        $v0, $v0, 3
/* 9B03C 800AA83C 23105200 */  subu       $v0, $v0, $s2
/* 9B040 800AA840 80100200 */  sll        $v0, $v0, 2
/* 9B044 800AA844 21802202 */  addu       $s0, $s1, $v0
/* 9B048 800AA848 2001028E */  lw         $v0, 0x120($s0)
/* 9B04C 800AA84C 00000000 */  nop
/* 9B050 800AA850 0D004010 */  beqz       $v0, .L800AA888
/* 9B054 800AA854 01004224 */   addiu     $v0, $v0, 0x1
/* 9B058 800AA858 200102AE */  sw         $v0, 0x120($s0)
/* 9B05C 800AA85C 08004228 */  slti       $v0, $v0, 0x8
/* 9B060 800AA860 0A004014 */  bnez       $v0, .L800AA88C
/* 9B064 800AA864 21202002 */   addu      $a0, $s1, $zero
/* 9B068 800AA868 21284002 */  addu       $a1, $s2, $zero
/* 9B06C 800AA86C 91C9010C */  jal        G2EmulationSetMode
/* 9B070 800AA870 01000624 */   addiu     $a2, $zero, 0x1
/* 9B074 800AA874 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B078 800AA878 FFDF0324 */  addiu      $v1, $zero, -0x2001
/* 9B07C 800AA87C 200100AE */  sw         $zero, 0x120($s0)
/* 9B080 800AA880 24104300 */  and        $v0, $v0, $v1
/* 9B084 800AA884 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800AA888:
/* 9B088 800AA888 21202002 */  addu       $a0, $s1, $zero
.L800AA88C:
/* 9B08C 800AA88C F6C9010C */  jal        G2EmulationQueryFrame
/* 9B090 800AA890 21284002 */   addu      $a1, $s2, $zero
/* 9B094 800AA894 0B004228 */  slti       $v0, $v0, 0xB
/* 9B098 800AA898 1A004014 */  bnez       $v0, .L800AA904
/* 9B09C 800AA89C 00000000 */   nop
/* 9B0A0 800AA8A0 18004016 */  bnez       $s2, .L800AA904
/* 9B0A4 800AA8A4 00000000 */   nop
/* 9B0A8 800AA8A8 0000248E */  lw         $a0, 0x0($s1)
/* 9B0AC 800AA8AC A3CE020C */  jal        CheckHolding
/* 9B0B0 800AA8B0 00000000 */   nop
/* 9B0B4 800AA8B4 13004010 */  beqz       $v0, .L800AA904
/* 9B0B8 800AA8B8 0B80023C */   lui       $v0, %hi(StateHandlerStartMove)
/* 9B0BC 800AA8BC 2401238E */  lw         $v1, 0x124($s1)
/* 9B0C0 800AA8C0 C4A25024 */  addiu      $s0, $v0, %lo(StateHandlerStartMove)
/* 9B0C4 800AA8C4 06007014 */  bne        $v1, $s0, .L800AA8E0
/* 9B0C8 800AA8C8 21202002 */   addu      $a0, $s1, $zero
/* 9B0CC 800AA8CC 01000524 */  addiu      $a1, $zero, 0x1
/* 9B0D0 800AA8D0 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 9B0D4 800AA8D4 A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 9B0D8 800AA8D8 C1CA010C */  jal        StateSwitchStateData
/* 9B0DC 800AA8DC 0B000724 */   addiu     $a3, $zero, 0xB
.L800AA8E0:
/* 9B0E0 800AA8E0 4002228E */  lw         $v0, 0x240($s1)
/* 9B0E4 800AA8E4 00000000 */  nop
/* 9B0E8 800AA8E8 06005014 */  bne        $v0, $s0, .L800AA904
/* 9B0EC 800AA8EC 21202002 */   addu      $a0, $s1, $zero
/* 9B0F0 800AA8F0 02000524 */  addiu      $a1, $zero, 0x2
/* 9B0F4 800AA8F4 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 9B0F8 800AA8F8 A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 9B0FC 800AA8FC C1CA010C */  jal        StateSwitchStateData
/* 9B100 800AA900 0B000724 */   addiu     $a3, $zero, 0xB
.L800AA904:
/* 9B104 800AA904 A4F9828F */  lw         $v0, %gp_rel(Raziel + 0x374)($gp)
/* 9B108 800AA908 00000000 */  nop
/* 9B10C 800AA90C 0D004010 */  beqz       $v0, .L800AA944
/* 9B110 800AA910 00104228 */   slti      $v0, $v0, 0x1000
/* 9B114 800AA914 0B004010 */  beqz       $v0, .L800AA944
/* 9B118 800AA918 00000000 */   nop
/* 9B11C 800AA91C 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9B120 800AA920 00000000 */  nop
/* 9B124 800AA924 01004230 */  andi       $v0, $v0, 0x1
/* 9B128 800AA928 06004010 */  beqz       $v0, .L800AA944
/* 9B12C 800AA92C 21202002 */   addu      $a0, $s1, $zero
/* 9B130 800AA930 21284002 */  addu       $a1, $s2, $zero
/* 9B134 800AA934 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 9B138 800AA938 A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 9B13C 800AA93C C1CA010C */  jal        StateSwitchStateData
/* 9B140 800AA940 21380000 */   addu      $a3, $zero, $zero
.L800AA944:
/* 9B144 800AA944 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 9B148 800AA948 2800B48F */  lw         $s4, 0x28($sp)
/* 9B14C 800AA94C 2400B38F */  lw         $s3, 0x24($sp)
/* 9B150 800AA950 2000B28F */  lw         $s2, 0x20($sp)
/* 9B154 800AA954 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9B158 800AA958 1800B08F */  lw         $s0, 0x18($sp)
/* 9B15C 800AA95C 0800E003 */  jr         $ra
/* 9B160 800AA960 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerStartMove, . - StateHandlerStartMove
