.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerGlide
/* 9D388 800ACB88 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 9D38C 800ACB8C 2400B1AF */  sw         $s1, 0x24($sp)
/* 9D390 800ACB90 21888000 */  addu       $s1, $a0, $zero
/* 9D394 800ACB94 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 9D398 800ACB98 2198A000 */  addu       $s3, $a1, $zero
/* 9D39C 800ACB9C 4000BEAF */  sw         $fp, 0x40($sp)
/* 9D3A0 800ACBA0 21F0C000 */  addu       $fp, $a2, $zero
/* 9D3A4 800ACBA4 3800B6AF */  sw         $s6, 0x38($sp)
/* 9D3A8 800ACBA8 21B00000 */  addu       $s6, $zero, $zero
/* 9D3AC 800ACBAC 4400BFAF */  sw         $ra, 0x44($sp)
/* 9D3B0 800ACBB0 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 9D3B4 800ACBB4 3400B5AF */  sw         $s5, 0x34($sp)
/* 9D3B8 800ACBB8 3000B4AF */  sw         $s4, 0x30($sp)
/* 9D3BC 800ACBBC 2800B2AF */  sw         $s2, 0x28($sp)
/* 9D3C0 800ACBC0 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9D3C4 800ACBC4 2000B0AF */   sw        $s0, 0x20($sp)
/* 9D3C8 800ACBC8 21202002 */  addu       $a0, $s1, $zero
/* 9D3CC 800ACBCC 21286002 */  addu       $a1, $s3, $zero
/* 9D3D0 800ACBD0 F6C9010C */  jal        G2EmulationQueryFrame
/* 9D3D4 800ACBD4 21A84000 */   addu      $s5, $v0, $zero
/* 9D3D8 800ACBD8 05006016 */  bnez       $s3, .L800ACBF0
/* 9D3DC 800ACBDC 21B84000 */   addu      $s7, $v0, $zero
/* 9D3E0 800ACBE0 2001228E */  lw         $v0, 0x120($s1)
/* 9D3E4 800ACBE4 FDFF0324 */  addiu      $v1, $zero, -0x3
/* 9D3E8 800ACBE8 24104300 */  and        $v0, $v0, $v1
/* 9D3EC 800ACBEC 200122AE */  sw         $v0, 0x120($s1)
.L800ACBF0:
/* 9D3F0 800ACBF0 C0101300 */  sll        $v0, $s3, 3
/* 9D3F4 800ACBF4 21105300 */  addu       $v0, $v0, $s3
/* 9D3F8 800ACBF8 C0100200 */  sll        $v0, $v0, 3
/* 9D3FC 800ACBFC 23105300 */  subu       $v0, $v0, $s3
/* 9D400 800ACC00 80100200 */  sll        $v0, $v0, 2
/* 9D404 800ACC04 08004324 */  addiu      $v1, $v0, 0x8
/* 9D408 800ACC08 21A02302 */  addu       $s4, $s1, $v1
/* 9D40C 800ACC0C 21902202 */  addu       $s2, $s1, $v0
.L800ACC10:
/* 9D410 800ACC10 39C3010C */  jal        PeekMessageQueue
/* 9D414 800ACC14 04008426 */   addiu     $a0, $s4, 0x4
/* 9D418 800ACC18 21804000 */  addu       $s0, $v0, $zero
/* 9D41C 800ACC1C 82010012 */  beqz       $s0, .L800AD228
/* 9D420 800ACC20 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 9D424 800ACC24 0000038E */  lw         $v1, 0x0($s0)
/* 9D428 800ACC28 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 9D42C 800ACC2C 7A016210 */  beq        $v1, $v0, .L800AD218
/* 9D430 800ACC30 2A104300 */   slt       $v0, $v0, $v1
/* 9D434 800ACC34 29004014 */  bnez       $v0, .L800ACCDC
/* 9D438 800ACC38 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9D43C 800ACC3C 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 9D440 800ACC40 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9D444 800ACC44 74016210 */  beq        $v1, $v0, .L800AD218
/* 9D448 800ACC48 2A104300 */   slt       $v0, $v0, $v1
/* 9D44C 800ACC4C 10004014 */  bnez       $v0, .L800ACC90
/* 9D450 800ACC50 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9D454 800ACC54 0080023C */  lui        $v0, (0x80000004 >> 16)
/* 9D458 800ACC58 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 9D45C 800ACC5C D7006210 */  beq        $v1, $v0, .L800ACFBC
/* 9D460 800ACC60 2A104300 */   slt       $v0, $v0, $v1
/* 9D464 800ACC64 05004014 */  bnez       $v0, .L800ACC7C
/* 9D468 800ACC68 0080023C */   lui       $v0, (0x80000008 >> 16)
/* 9D46C 800ACC6C 6A016210 */  beq        $v1, $v0, .L800AD218
/* 9D470 800ACC70 21202002 */   addu      $a0, $s1, $zero
/* 9D474 800ACC74 84B40208 */  j          .L800AD210
/* 9D478 800ACC78 21286002 */   addu      $a1, $s3, $zero
.L800ACC7C:
/* 9D47C 800ACC7C 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 9D480 800ACC80 65016210 */  beq        $v1, $v0, .L800AD218
/* 9D484 800ACC84 21202002 */   addu      $a0, $s1, $zero
/* 9D488 800ACC88 84B40208 */  j          .L800AD210
/* 9D48C 800ACC8C 21286002 */   addu      $a1, $s3, $zero
.L800ACC90:
/* 9D490 800ACC90 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9D494 800ACC94 37006210 */  beq        $v1, $v0, .L800ACD74
/* 9D498 800ACC98 2A104300 */   slt       $v0, $v0, $v1
/* 9D49C 800ACC9C 07004014 */  bnez       $v0, .L800ACCBC
/* 9D4A0 800ACCA0 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9D4A4 800ACCA4 0400023C */  lui        $v0, (0x40005 >> 16)
/* 9D4A8 800ACCA8 05004234 */  ori        $v0, $v0, (0x40005 & 0xFFFF)
/* 9D4AC 800ACCAC 5A016210 */  beq        $v1, $v0, .L800AD218
/* 9D4B0 800ACCB0 21202002 */   addu      $a0, $s1, $zero
/* 9D4B4 800ACCB4 84B40208 */  j          .L800AD210
/* 9D4B8 800ACCB8 21286002 */   addu      $a1, $s3, $zero
.L800ACCBC:
/* 9D4BC 800ACCBC 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9D4C0 800ACCC0 53006210 */  beq        $v1, $v0, .L800ACE10
/* 9D4C4 800ACCC4 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 9D4C8 800ACCC8 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 9D4CC 800ACCCC 52016210 */  beq        $v1, $v0, .L800AD218
/* 9D4D0 800ACCD0 21202002 */   addu      $a0, $s1, $zero
/* 9D4D4 800ACCD4 84B40208 */  j          .L800AD210
/* 9D4D8 800ACCD8 21286002 */   addu      $a1, $s3, $zero
.L800ACCDC:
/* 9D4DC 800ACCDC 53006210 */  beq        $v1, $v0, .L800ACE2C
/* 9D4E0 800ACCE0 2A104300 */   slt       $v0, $v0, $v1
/* 9D4E4 800ACCE4 11004014 */  bnez       $v0, .L800ACD2C
/* 9D4E8 800ACCE8 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9D4EC 800ACCEC 0104023C */  lui        $v0, (0x4010008 >> 16)
/* 9D4F0 800ACCF0 08004234 */  ori        $v0, $v0, (0x4010008 & 0xFFFF)
/* 9D4F4 800ACCF4 68006210 */  beq        $v1, $v0, .L800ACE98
/* 9D4F8 800ACCF8 2A104300 */   slt       $v0, $v0, $v1
/* 9D4FC 800ACCFC 07004014 */  bnez       $v0, .L800ACD1C
/* 9D500 800ACD00 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 9D504 800ACD04 0004023C */  lui        $v0, (0x4000007 >> 16)
/* 9D508 800ACD08 07004234 */  ori        $v0, $v0, (0x4000007 & 0xFFFF)
/* 9D50C 800ACD0C FA006210 */  beq        $v1, $v0, .L800AD0F8
/* 9D510 800ACD10 21202002 */   addu      $a0, $s1, $zero
/* 9D514 800ACD14 84B40208 */  j          .L800AD210
/* 9D518 800ACD18 21286002 */   addu      $a1, $s3, $zero
.L800ACD1C:
/* 9D51C 800ACD1C 18016210 */  beq        $v1, $v0, .L800AD180
/* 9D520 800ACD20 21202002 */   addu      $a0, $s1, $zero
/* 9D524 800ACD24 84B40208 */  j          .L800AD210
/* 9D528 800ACD28 21286002 */   addu      $a1, $s3, $zero
.L800ACD2C:
/* 9D52C 800ACD2C C1006210 */  beq        $v1, $v0, .L800AD034
/* 9D530 800ACD30 2A104300 */   slt       $v0, $v0, $v1
/* 9D534 800ACD34 07004014 */  bnez       $v0, .L800ACD54
/* 9D538 800ACD38 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 9D53C 800ACD3C 0008023C */  lui        $v0, (0x8000003 >> 16)
/* 9D540 800ACD40 03004234 */  ori        $v0, $v0, (0x8000003 & 0xFFFF)
/* 9D544 800ACD44 49006210 */  beq        $v1, $v0, .L800ACE6C
/* 9D548 800ACD48 21202002 */   addu      $a0, $s1, $zero
/* 9D54C 800ACD4C 84B40208 */  j          .L800AD210
/* 9D550 800ACD50 21286002 */   addu      $a1, $s3, $zero
.L800ACD54:
/* 9D554 800ACD54 01004234 */  ori        $v0, $v0, (0x20000001 & 0xFFFF)
/* 9D558 800ACD58 54006210 */  beq        $v1, $v0, .L800ACEAC
/* 9D55C 800ACD5C 0020023C */   lui       $v0, (0x20000004 >> 16)
/* 9D560 800ACD60 04004234 */  ori        $v0, $v0, (0x20000004 & 0xFFFF)
/* 9D564 800ACD64 7F006210 */  beq        $v1, $v0, .L800ACF64
/* 9D568 800ACD68 21202002 */   addu      $a0, $s1, $zero
/* 9D56C 800ACD6C 84B40208 */  j          .L800AD210
/* 9D570 800ACD70 21286002 */   addu      $a1, $s3, $zero
.L800ACD74:
/* 9D574 800ACD74 1A006016 */  bnez       $s3, .L800ACDE0
/* 9D578 800ACD78 21202002 */   addu      $a0, $s1, $zero
/* 9D57C 800ACD7C 00200224 */  addiu      $v0, $zero, 0x2000
/* 9D580 800ACD80 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9D584 800ACD84 0000248E */  lw         $a0, 0x0($s1)
/* 9D588 800ACD88 18050224 */  addiu      $v0, $zero, 0x518
/* 9D58C 800ACD8C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9D590 800ACD90 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 9D594 800ACD94 938B020C */  jal        SteerSwitchMode
/* 9D598 800ACD98 08000524 */   addiu     $a1, $zero, 0x8
/* 9D59C 800ACD9C 0000248E */  lw         $a0, 0x0($s1)
/* 9D5A0 800ACDA0 3B87020C */  jal        DeInitAlgorithmicWings
/* 9D5A4 800ACDA4 00000000 */   nop
/* 9D5A8 800ACDA8 0000228E */  lw         $v0, 0x0($s1)
/* 9D5AC 800ACDAC 00000000 */  nop
/* 9D5B0 800ACDB0 7C01428C */  lw         $v0, 0x17C($v0)
/* 9D5B4 800ACDB4 00000000 */  nop
/* 9D5B8 800ACDB8 09004104 */  bgez       $v0, .L800ACDE0
/* 9D5BC 800ACDBC 21202002 */   addu      $a0, $s1, $zero
/* 9D5C0 800ACDC0 21280000 */  addu       $a1, $zero, $zero
/* 9D5C4 800ACDC4 2130A000 */  addu       $a2, $a1, $zero
/* 9D5C8 800ACDC8 E8FF0224 */  addiu      $v0, $zero, -0x18
/* 9D5CC 800ACDCC 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D5D0 800ACDD0 0000248E */  lw         $a0, 0x0($s1)
/* 9D5D4 800ACDD4 4E68020C */  jal        SetPhysics
/* 9D5D8 800ACDD8 34000724 */   addiu     $a3, $zero, 0x34
/* 9D5DC 800ACDDC 21202002 */  addu       $a0, $s1, $zero
.L800ACDE0:
/* 9D5E0 800ACDE0 21286002 */  addu       $a1, $s3, $zero
/* 9D5E4 800ACDE4 01000324 */  addiu      $v1, $zero, 0x1
/* 9D5E8 800ACDE8 05000224 */  addiu      $v0, $zero, 0x5
/* 9D5EC 800ACDEC 1C0143AE */  sw         $v1, 0x11C($s2)
/* 9D5F0 800ACDF0 200140AE */  sw         $zero, 0x120($s2)
/* 9D5F4 800ACDF4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D5F8 800ACDF8 1400A3AF */  sw         $v1, 0x14($sp)
/* 9D5FC 800ACDFC 0400078E */  lw         $a3, 0x4($s0)
/* 9D600 800ACE00 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9D604 800ACE04 10000624 */   addiu     $a2, $zero, 0x10
/* 9D608 800ACE08 86B40208 */  j          .L800AD218
/* 9D60C 800ACE0C 00000000 */   nop
.L800ACE10:
/* 9D610 800ACE10 01016016 */  bnez       $s3, .L800AD218
/* 9D614 800ACE14 00000000 */   nop
/* 9D618 800ACE18 0000248E */  lw         $a0, 0x0($s1)
/* 9D61C 800ACE1C D586020C */  jal        InitAlgorithmicWings
/* 9D620 800ACE20 00000000 */   nop
/* 9D624 800ACE24 86B40208 */  j          .L800AD218
/* 9D628 800ACE28 200120AE */   sw        $zero, 0x120($s1)
.L800ACE2C:
/* 9D62C 800ACE2C 1C01428E */  lw         $v0, 0x11C($s2)
/* 9D630 800ACE30 00000000 */  nop
/* 9D634 800ACE34 F8004010 */  beqz       $v0, .L800AD218
/* 9D638 800ACE38 21202002 */   addu      $a0, $s1, $zero
/* 9D63C 800ACE3C 21286002 */  addu       $a1, $s3, $zero
/* 9D640 800ACE40 12000624 */  addiu      $a2, $zero, 0x12
/* 9D644 800ACE44 21380000 */  addu       $a3, $zero, $zero
/* 9D648 800ACE48 05000224 */  addiu      $v0, $zero, 0x5
/* 9D64C 800ACE4C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D650 800ACE50 02000224 */  addiu      $v0, $zero, 0x2
/* 9D654 800ACE54 1400A2AF */  sw         $v0, 0x14($sp)
/* 9D658 800ACE58 04000224 */  addiu      $v0, $zero, 0x4
/* 9D65C 800ACE5C 31C8010C */  jal        G2EmulationSwitchAnimationAlpha
/* 9D660 800ACE60 1800A2AF */   sw        $v0, 0x18($sp)
/* 9D664 800ACE64 86B40208 */  j          .L800AD218
/* 9D668 800ACE68 1C0140AE */   sw        $zero, 0x11C($s2)
.L800ACE6C:
/* 9D66C 800ACE6C 10000224 */  addiu      $v0, $zero, 0x10
/* 9D670 800ACE70 E900A216 */  bne        $s5, $v0, .L800AD218
/* 9D674 800ACE74 21280000 */   addu      $a1, $zero, $zero
/* 9D678 800ACE78 2130A000 */  addu       $a2, $a1, $zero
/* 9D67C 800ACE7C E8FF0224 */  addiu      $v0, $zero, -0x18
/* 9D680 800ACE80 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D684 800ACE84 0000248E */  lw         $a0, 0x0($s1)
/* 9D688 800ACE88 4E68020C */  jal        SetPhysics
/* 9D68C 800ACE8C 34000724 */   addiu     $a3, $zero, 0x34
/* 9D690 800ACE90 86B40208 */  j          .L800AD218
/* 9D694 800ACE94 00000000 */   nop
.L800ACE98:
/* 9D698 800ACE98 21202002 */  addu       $a0, $s1, $zero
/* 9D69C 800ACE9C 21286002 */  addu       $a1, $s3, $zero
/* 9D6A0 800ACEA0 0B80063C */  lui        $a2, %hi(StateHandlerDeCompression)
/* 9D6A4 800ACEA4 80B40208 */  j          .L800AD200
/* 9D6A8 800ACEA8 18C8C624 */   addiu     $a2, $a2, %lo(StateHandlerDeCompression)
.L800ACEAC:
/* 9D6AC 800ACEAC 0D00E22A */  slti       $v0, $s7, 0xD
/* 9D6B0 800ACEB0 03004010 */  beqz       $v0, .L800ACEC0
/* 9D6B4 800ACEB4 10000224 */   addiu     $v0, $zero, 0x10
/* 9D6B8 800ACEB8 2400A212 */  beq        $s5, $v0, .L800ACF4C
/* 9D6BC 800ACEBC 8C008426 */   addiu     $a0, $s4, 0x8C
.L800ACEC0:
/* 9D6C0 800ACEC0 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9D6C4 800ACEC4 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9D6C8 800ACEC8 0000428C */  lw         $v0, 0x0($v0)
/* 9D6CC 800ACECC 00000000 */  nop
/* 9D6D0 800ACED0 24104300 */  and        $v0, $v0, $v1
/* 9D6D4 800ACED4 1D004014 */  bnez       $v0, .L800ACF4C
/* 9D6D8 800ACED8 8C008426 */   addiu     $a0, $s4, 0x8C
/* 9D6DC 800ACEDC 15006016 */  bnez       $s3, .L800ACF34
/* 9D6E0 800ACEE0 21202002 */   addu      $a0, $s1, $zero
/* 9D6E4 800ACEE4 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 9D6E8 800ACEE8 21300000 */  addu       $a2, $zero, $zero
/* 9D6EC 800ACEEC 1000A0AF */  sw         $zero, 0x10($sp)
/* 9D6F0 800ACEF0 0000248E */  lw         $a0, 0x0($s1)
/* 9D6F4 800ACEF4 4E68020C */  jal        SetPhysics
/* 9D6F8 800ACEF8 2138C000 */   addu      $a3, $a2, $zero
/* 9D6FC 800ACEFC 18000524 */  addiu      $a1, $zero, 0x18
/* 9D700 800ACF00 21300000 */  addu       $a2, $zero, $zero
/* 9D704 800ACF04 0000248E */  lw         $a0, 0x0($s1)
/* 9D708 800ACF08 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9D70C 800ACF0C 2138C000 */   addu      $a3, $a2, $zero
/* 9D710 800ACF10 07004010 */  beqz       $v0, .L800ACF30
/* 9D714 800ACF14 01000224 */   addiu     $v0, $zero, 0x1
/* 9D718 800ACF18 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D71C 800ACF1C 21202002 */  addu       $a0, $s1, $zero
/* 9D720 800ACF20 24000524 */  addiu      $a1, $zero, 0x24
/* 9D724 800ACF24 21300000 */  addu       $a2, $zero, $zero
/* 9D728 800ACF28 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9D72C 800ACF2C 04000724 */   addiu     $a3, $zero, 0x4
.L800ACF30:
/* 9D730 800ACF30 21202002 */  addu       $a0, $s1, $zero
.L800ACF34:
/* 9D734 800ACF34 0B80053C */  lui        $a1, %hi(StateHandlerFall)
/* 9D738 800ACF38 A8BDA524 */  addiu      $a1, $a1, %lo(StateHandlerFall)
/* 9D73C 800ACF3C F4CA010C */  jal        StateSwitchStateCharacterData
/* 9D740 800ACF40 21300000 */   addu      $a2, $zero, $zero
/* 9D744 800ACF44 86B40208 */  j          .L800AD218
/* 9D748 800ACF48 00000000 */   nop
.L800ACF4C:
/* 9D74C 800ACF4C 0020053C */  lui        $a1, (0x20000001 >> 16)
/* 9D750 800ACF50 0100A534 */  ori        $a1, $a1, (0x20000001 & 0xFFFF)
/* 9D754 800ACF54 4EC3010C */  jal        EnMessageQueueData
/* 9D758 800ACF58 21300000 */   addu      $a2, $zero, $zero
/* 9D75C 800ACF5C 86B40208 */  j          .L800AD218
/* 9D760 800ACF60 00000000 */   nop
.L800ACF64:
/* 9D764 800ACF64 0C006016 */  bnez       $s3, .L800ACF98
/* 9D768 800ACF68 21286002 */   addu      $a1, $s3, $zero
/* 9D76C 800ACF6C E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 9D770 800ACF70 04000624 */  addiu      $a2, $zero, 0x4
/* 9D774 800ACF74 34000224 */  addiu      $v0, $zero, 0x34
/* 9D778 800ACF78 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D77C 800ACF7C E8FF0224 */  addiu      $v0, $zero, -0x18
/* 9D780 800ACF80 1400A2AF */  sw         $v0, 0x14($sp)
/* 9D784 800ACF84 0000258E */  lw         $a1, 0x0($s1)
/* 9D788 800ACF88 3E69020C */  jal        SetExternalTransitionForce
/* 9D78C 800ACF8C 21380000 */   addu      $a3, $zero, $zero
/* 9D790 800ACF90 21202002 */  addu       $a0, $s1, $zero
/* 9D794 800ACF94 21286002 */  addu       $a1, $s3, $zero
.L800ACF98:
/* 9D798 800ACF98 12000624 */  addiu      $a2, $zero, 0x12
/* 9D79C 800ACF9C 21380000 */  addu       $a3, $zero, $zero
/* 9D7A0 800ACFA0 05000224 */  addiu      $v0, $zero, 0x5
/* 9D7A4 800ACFA4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D7A8 800ACFA8 02000224 */  addiu      $v0, $zero, 0x2
/* 9D7AC 800ACFAC 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9D7B0 800ACFB0 1400A2AF */   sw        $v0, 0x14($sp)
/* 9D7B4 800ACFB4 86B40208 */  j          .L800AD218
/* 9D7B8 800ACFB8 1C0140AE */   sw        $zero, 0x11C($s2)
.L800ACFBC:
/* 9D7BC 800ACFBC 01000224 */  addiu      $v0, $zero, 0x1
/* 9D7C0 800ACFC0 0B006216 */  bne        $s3, $v0, .L800ACFF0
/* 9D7C4 800ACFC4 21202002 */   addu      $a0, $s1, $zero
/* 9D7C8 800ACFC8 E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 9D7CC 800ACFCC 04000624 */  addiu      $a2, $zero, 0x4
/* 9D7D0 800ACFD0 18000224 */  addiu      $v0, $zero, 0x18
/* 9D7D4 800ACFD4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D7D8 800ACFD8 E8FF0224 */  addiu      $v0, $zero, -0x18
/* 9D7DC 800ACFDC 1400A2AF */  sw         $v0, 0x14($sp)
/* 9D7E0 800ACFE0 0000258E */  lw         $a1, 0x0($s1)
/* 9D7E4 800ACFE4 3E69020C */  jal        SetExternalTransitionForce
/* 9D7E8 800ACFE8 21380000 */   addu      $a3, $zero, $zero
/* 9D7EC 800ACFEC 21202002 */  addu       $a0, $s1, $zero
.L800ACFF0:
/* 9D7F0 800ACFF0 21286002 */  addu       $a1, $s3, $zero
/* 9D7F4 800ACFF4 11000624 */  addiu      $a2, $zero, 0x11
/* 9D7F8 800ACFF8 21380000 */  addu       $a3, $zero, $zero
/* 9D7FC 800ACFFC 05000224 */  addiu      $v0, $zero, 0x5
/* 9D800 800AD000 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D804 800AD004 02000224 */  addiu      $v0, $zero, 0x2
/* 9D808 800AD008 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9D80C 800AD00C 1400A2AF */   sw        $v0, 0x14($sp)
/* 9D810 800AD010 2001428E */  lw         $v0, 0x120($s2)
/* 9D814 800AD014 00000000 */  nop
/* 9D818 800AD018 01004230 */  andi       $v0, $v0, 0x1
/* 9D81C 800AD01C 7E004010 */  beqz       $v0, .L800AD218
/* 9D820 800AD020 1C0140AE */   sw        $zero, 0x11C($s2)
/* 9D824 800AD024 C89E020C */  jal        razSetPlayerEventHistory
/* 9D828 800AD028 00400424 */   addiu     $a0, $zero, 0x4000
/* 9D82C 800AD02C 86B40208 */  j          .L800AD218
/* 9D830 800AD030 00000000 */   nop
.L800AD034:
/* 9D834 800AD034 10000224 */  addiu      $v0, $zero, 0x10
/* 9D838 800AD038 7700A212 */  beq        $s5, $v0, .L800AD218
/* 9D83C 800AD03C 01001624 */   addiu     $s6, $zero, 0x1
/* 9D840 800AD040 B4F98287 */  lh         $v0, %gp_rel(Raziel + 0x384)($gp)
/* 9D844 800AD044 00000000 */  nop
/* 9D848 800AD048 0C004018 */  blez       $v0, .L800AD07C
/* 9D84C 800AD04C 21202002 */   addu      $a0, $s1, $zero
/* 9D850 800AD050 21286002 */  addu       $a1, $s3, $zero
/* 9D854 800AD054 2B000624 */  addiu      $a2, $zero, 0x2B
/* 9D858 800AD058 21380000 */  addu       $a3, $zero, $zero
/* 9D85C 800AD05C 06000224 */  addiu      $v0, $zero, 0x6
/* 9D860 800AD060 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D864 800AD064 01000224 */  addiu      $v0, $zero, 0x1
/* 9D868 800AD068 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9D86C 800AD06C 1400A2AF */   sw        $v0, 0x14($sp)
/* 9D870 800AD070 02000224 */  addiu      $v0, $zero, 0x2
/* 9D874 800AD074 1C0142AE */  sw         $v0, 0x11C($s2)
/* 9D878 800AD078 B4F98287 */  lh         $v0, %gp_rel(Raziel + 0x384)($gp)
.L800AD07C:
/* 9D87C 800AD07C 00000000 */  nop
/* 9D880 800AD080 0C004104 */  bgez       $v0, .L800AD0B4
/* 9D884 800AD084 21202002 */   addu      $a0, $s1, $zero
/* 9D888 800AD088 21286002 */  addu       $a1, $s3, $zero
/* 9D88C 800AD08C 2C000624 */  addiu      $a2, $zero, 0x2C
/* 9D890 800AD090 21380000 */  addu       $a3, $zero, $zero
/* 9D894 800AD094 06000224 */  addiu      $v0, $zero, 0x6
/* 9D898 800AD098 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D89C 800AD09C 01000224 */  addiu      $v0, $zero, 0x1
/* 9D8A0 800AD0A0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9D8A4 800AD0A4 1400A2AF */   sw        $v0, 0x14($sp)
/* 9D8A8 800AD0A8 02000224 */  addiu      $v0, $zero, 0x2
/* 9D8AC 800AD0AC 1C0142AE */  sw         $v0, 0x11C($s2)
/* 9D8B0 800AD0B0 B4F98287 */  lh         $v0, %gp_rel(Raziel + 0x384)($gp)
.L800AD0B4:
/* 9D8B4 800AD0B4 00000000 */  nop
/* 9D8B8 800AD0B8 57004014 */  bnez       $v0, .L800AD218
/* 9D8BC 800AD0BC 01001624 */   addiu     $s6, $zero, 0x1
/* 9D8C0 800AD0C0 1C01438E */  lw         $v1, 0x11C($s2)
/* 9D8C4 800AD0C4 02000224 */  addiu      $v0, $zero, 0x2
/* 9D8C8 800AD0C8 53006214 */  bne        $v1, $v0, .L800AD218
/* 9D8CC 800AD0CC 21202002 */   addu      $a0, $s1, $zero
/* 9D8D0 800AD0D0 21286002 */  addu       $a1, $s3, $zero
/* 9D8D4 800AD0D4 12000624 */  addiu      $a2, $zero, 0x12
/* 9D8D8 800AD0D8 21380000 */  addu       $a3, $zero, $zero
/* 9D8DC 800AD0DC 05000224 */  addiu      $v0, $zero, 0x5
/* 9D8E0 800AD0E0 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D8E4 800AD0E4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9D8E8 800AD0E8 1400A3AF */   sw        $v1, 0x14($sp)
/* 9D8EC 800AD0EC 1C0140AE */  sw         $zero, 0x11C($s2)
/* 9D8F0 800AD0F0 86B40208 */  j          .L800AD218
/* 9D8F4 800AD0F4 01001624 */   addiu     $s6, $zero, 0x1
.L800AD0F8:
/* 9D8F8 800AD0F8 47006016 */  bnez       $s3, .L800AD218
/* 9D8FC 800AD0FC 00000000 */   nop
/* 9D900 800AD100 0400068E */  lw         $a2, 0x4($s0)
/* 9D904 800AD104 0000228E */  lw         $v0, 0x0($s1)
/* 9D908 800AD108 0800C394 */  lhu        $v1, 0x8($a2)
/* 9D90C 800AD10C 7C01428C */  lw         $v0, 0x17C($v0)
/* 9D910 800AD110 00000000 */  nop
/* 9D914 800AD114 2A186200 */  slt        $v1, $v1, $v0
/* 9D918 800AD118 07006010 */  beqz       $v1, .L800AD138
/* 9D91C 800AD11C 21280000 */   addu      $a1, $zero, $zero
/* 9D920 800AD120 F4FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1 + 0x14)
/* 9D924 800AD124 2130A000 */  addu       $a2, $a1, $zero
/* 9D928 800AD128 2138A000 */  addu       $a3, $a1, $zero
/* 9D92C 800AD12C 1000A0AF */  sw         $zero, 0x10($sp)
/* 9D930 800AD130 54B40208 */  j          .L800AD150
/* 9D934 800AD134 1400A0AF */   sw        $zero, 0x14($sp)
.L800AD138:
/* 9D938 800AD138 F4FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1 + 0x14)
/* 9D93C 800AD13C 0000C784 */  lh         $a3, 0x0($a2)
/* 9D940 800AD140 2130A000 */  addu       $a2, $a1, $zero
/* 9D944 800AD144 FC0F0224 */  addiu      $v0, $zero, 0xFFC
/* 9D948 800AD148 1000A0AF */  sw         $zero, 0x10($sp)
/* 9D94C 800AD14C 1400A2AF */  sw         $v0, 0x14($sp)
.L800AD150:
/* 9D950 800AD150 2E69020C */  jal        SetExternalForce
/* 9D954 800AD154 00000000 */   nop
/* 9D958 800AD158 2001428E */  lw         $v0, 0x120($s2)
/* 9D95C 800AD15C 00000000 */  nop
/* 9D960 800AD160 03004234 */  ori        $v0, $v0, 0x3
/* 9D964 800AD164 200142AE */  sw         $v0, 0x120($s2)
/* 9D968 800AD168 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 9D96C 800AD16C 00000000 */  nop
/* 9D970 800AD170 00404234 */  ori        $v0, $v0, 0x4000
/* 9D974 800AD174 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 9D978 800AD178 86B40208 */  j          .L800AD218
/* 9D97C 800AD17C 00000000 */   nop
.L800AD180:
/* 9D980 800AD180 0400028E */  lw         $v0, 0x4($s0)
/* 9D984 800AD184 00000000 */  nop
/* 9D988 800AD188 0E004384 */  lh         $v1, 0xE($v0)
/* 9D98C 800AD18C 00000000 */  nop
/* 9D990 800AD190 21006104 */  bgez       $v1, .L800AD218
/* 9D994 800AD194 01800224 */   addiu     $v0, $zero, -0x7FFF
/* 9D998 800AD198 1F006210 */  beq        $v1, $v0, .L800AD218
/* 9D99C 800AD19C 01000224 */   addiu     $v0, $zero, 0x1
/* 9D9A0 800AD1A0 68FA908F */  lw         $s0, %gp_rel(Raziel + 0x438)($gp)
/* 9D9A4 800AD1A4 00000000 */  nop
/* 9D9A8 800AD1A8 1B000216 */  bne        $s0, $v0, .L800AD218
/* 9D9AC 800AD1AC 00000000 */   nop
/* 9D9B0 800AD1B0 08006016 */  bnez       $s3, .L800AD1D4
/* 9D9B4 800AD1B4 21202002 */   addu      $a0, $s1, $zero
/* 9D9B8 800AD1B8 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 9D9BC 800AD1BC 21300000 */  addu       $a2, $zero, $zero
/* 9D9C0 800AD1C0 1000A0AF */  sw         $zero, 0x10($sp)
/* 9D9C4 800AD1C4 0000248E */  lw         $a0, 0x0($s1)
/* 9D9C8 800AD1C8 4E68020C */  jal        SetPhysics
/* 9D9CC 800AD1CC 2138C000 */   addu      $a3, $a2, $zero
/* 9D9D0 800AD1D0 21202002 */  addu       $a0, $s1, $zero
.L800AD1D4:
/* 9D9D4 800AD1D4 21286002 */  addu       $a1, $s3, $zero
/* 9D9D8 800AD1D8 13000624 */  addiu      $a2, $zero, 0x13
/* 9D9DC 800AD1DC 21380000 */  addu       $a3, $zero, $zero
/* 9D9E0 800AD1E0 04000224 */  addiu      $v0, $zero, 0x4
/* 9D9E4 800AD1E4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D9E8 800AD1E8 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9D9EC 800AD1EC 1400B0AF */   sw        $s0, 0x14($sp)
/* 9D9F0 800AD1F0 21202002 */  addu       $a0, $s1, $zero
/* 9D9F4 800AD1F4 21286002 */  addu       $a1, $s3, $zero
/* 9D9F8 800AD1F8 0B80063C */  lui        $a2, %hi(StateHandlerFall)
/* 9D9FC 800AD1FC A8BDC624 */  addiu      $a2, $a2, %lo(StateHandlerFall)
.L800AD200:
/* 9DA00 800AD200 C1CA010C */  jal        StateSwitchStateData
/* 9DA04 800AD204 21380000 */   addu      $a3, $zero, $zero
/* 9DA08 800AD208 86B40208 */  j          .L800AD218
/* 9DA0C 800AD20C 00000000 */   nop
.L800AD210:
/* 9DA10 800AD210 B9BF020C */  jal        DefaultStateHandler
/* 9DA14 800AD214 2130C003 */   addu      $a2, $fp, $zero
.L800AD218:
/* 9DA18 800AD218 27C3010C */  jal        DeMessageQueue
/* 9DA1C 800AD21C 04008426 */   addiu     $a0, $s4, 0x4
/* 9DA20 800AD220 04B30208 */  j          .L800ACC10
/* 9DA24 800AD224 00000000 */   nop
.L800AD228:
/* 9DA28 800AD228 26006016 */  bnez       $s3, .L800AD2C4
/* 9DA2C 800AD22C 00000000 */   nop
/* 9DA30 800AD230 2001238E */  lw         $v1, 0x120($s1)
/* 9DA34 800AD234 00000000 */  nop
/* 9DA38 800AD238 01006230 */  andi       $v0, $v1, 0x1
/* 9DA3C 800AD23C 21004010 */  beqz       $v0, .L800AD2C4
/* 9DA40 800AD240 02006230 */   andi      $v0, $v1, 0x2
/* 9DA44 800AD244 17004014 */  bnez       $v0, .L800AD2A4
/* 9DA48 800AD248 00000000 */   nop
/* 9DA4C 800AD24C 0600C012 */  beqz       $s6, .L800AD268
/* 9DA50 800AD250 0A000624 */   addiu     $a2, $zero, 0xA
/* 9DA54 800AD254 E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 9DA58 800AD258 34000224 */  addiu      $v0, $zero, 0x34
/* 9DA5C 800AD25C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9DA60 800AD260 9DB40208 */  j          .L800AD274
/* 9DA64 800AD264 E8FF0224 */   addiu     $v0, $zero, -0x18
.L800AD268:
/* 9DA68 800AD268 E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 9DA6C 800AD26C E8FF0224 */  addiu      $v0, $zero, -0x18
/* 9DA70 800AD270 1000A0AF */  sw         $zero, 0x10($sp)
.L800AD274:
/* 9DA74 800AD274 1400A2AF */  sw         $v0, 0x14($sp)
/* 9DA78 800AD278 0000258E */  lw         $a1, 0x0($s1)
/* 9DA7C 800AD27C 3E69020C */  jal        SetExternalTransitionForce
/* 9DA80 800AD280 21380000 */   addu      $a3, $zero, $zero
/* 9DA84 800AD284 C0101300 */  sll        $v0, $s3, 3
/* 9DA88 800AD288 21105300 */  addu       $v0, $v0, $s3
/* 9DA8C 800AD28C C0100200 */  sll        $v0, $v0, 3
/* 9DA90 800AD290 23105300 */  subu       $v0, $v0, $s3
/* 9DA94 800AD294 80100200 */  sll        $v0, $v0, 2
/* 9DA98 800AD298 21102202 */  addu       $v0, $s1, $v0
/* 9DA9C 800AD29C B1B40208 */  j          .L800AD2C4
/* 9DAA0 800AD2A0 200140AC */   sw        $zero, 0x120($v0)
.L800AD2A4:
/* 9DAA4 800AD2A4 0400C016 */  bnez       $s6, .L800AD2B8
/* 9DAA8 800AD2A8 34000224 */   addiu     $v0, $zero, 0x34
/* 9DAAC 800AD2AC 0000228E */  lw         $v0, 0x0($s1)
/* 9DAB0 800AD2B0 B1B40208 */  j          .L800AD2C4
/* 9DAB4 800AD2B4 780140AC */   sw        $zero, 0x178($v0)
.L800AD2B8:
/* 9DAB8 800AD2B8 0000238E */  lw         $v1, 0x0($s1)
/* 9DABC 800AD2BC 00000000 */  nop
/* 9DAC0 800AD2C0 780162AC */  sw         $v0, 0x178($v1)
.L800AD2C4:
/* 9DAC4 800AD2C4 4400BF8F */  lw         $ra, 0x44($sp)
/* 9DAC8 800AD2C8 4000BE8F */  lw         $fp, 0x40($sp)
/* 9DACC 800AD2CC 3C00B78F */  lw         $s7, 0x3C($sp)
/* 9DAD0 800AD2D0 3800B68F */  lw         $s6, 0x38($sp)
/* 9DAD4 800AD2D4 3400B58F */  lw         $s5, 0x34($sp)
/* 9DAD8 800AD2D8 3000B48F */  lw         $s4, 0x30($sp)
/* 9DADC 800AD2DC 2C00B38F */  lw         $s3, 0x2C($sp)
/* 9DAE0 800AD2E0 2800B28F */  lw         $s2, 0x28($sp)
/* 9DAE4 800AD2E4 2400B18F */  lw         $s1, 0x24($sp)
/* 9DAE8 800AD2E8 2000B08F */  lw         $s0, 0x20($sp)
/* 9DAEC 800AD2EC 0800E003 */  jr         $ra
/* 9DAF0 800AD2F0 4800BD27 */   addiu     $sp, $sp, 0x48
.size StateHandlerGlide, . - StateHandlerGlide
