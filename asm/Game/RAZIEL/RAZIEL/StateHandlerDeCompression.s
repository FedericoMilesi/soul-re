.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerDeCompression
/* 9D018 800AC818 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 9D01C 800AC81C 1800B0AF */  sw         $s0, 0x18($sp)
/* 9D020 800AC820 21808000 */  addu       $s0, $a0, $zero
/* 9D024 800AC824 2000B2AF */  sw         $s2, 0x20($sp)
/* 9D028 800AC828 2190A000 */  addu       $s2, $a1, $zero
/* 9D02C 800AC82C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 9D030 800AC830 21A8C000 */  addu       $s5, $a2, $zero
/* 9D034 800AC834 C0101200 */  sll        $v0, $s2, 3
/* 9D038 800AC838 21105200 */  addu       $v0, $v0, $s2
/* 9D03C 800AC83C C0100200 */  sll        $v0, $v0, 3
/* 9D040 800AC840 23105200 */  subu       $v0, $v0, $s2
/* 9D044 800AC844 80100200 */  sll        $v0, $v0, 2
/* 9D048 800AC848 08004324 */  addiu      $v1, $v0, 0x8
/* 9D04C 800AC84C 2800B4AF */  sw         $s4, 0x28($sp)
/* 9D050 800AC850 21A00302 */  addu       $s4, $s0, $v1
/* 9D054 800AC854 2400B3AF */  sw         $s3, 0x24($sp)
/* 9D058 800AC858 21980202 */  addu       $s3, $s0, $v0
/* 9D05C 800AC85C 3000BFAF */  sw         $ra, 0x30($sp)
/* 9D060 800AC860 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9D064 800AC864 0000038E */  lw         $v1, 0x0($s0)
/* 9D068 800AC868 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 9D06C 800AC86C C80062A4 */  sh         $v0, 0xC8($v1)
.L800AC870:
/* 9D070 800AC870 39C3010C */  jal        PeekMessageQueue
/* 9D074 800AC874 04008426 */   addiu     $a0, $s4, 0x4
/* 9D078 800AC878 21884000 */  addu       $s1, $v0, $zero
/* 9D07C 800AC87C B9002012 */  beqz       $s1, .L800ACB64
/* 9D080 800AC880 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9D084 800AC884 0000238E */  lw         $v1, 0x0($s1)
/* 9D088 800AC888 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9D08C 800AC88C 18006210 */  beq        $v1, $v0, .L800AC8F0
/* 9D090 800AC890 2A104300 */   slt       $v0, $v0, $v1
/* 9D094 800AC894 08004014 */  bnez       $v0, .L800AC8B8
/* 9D098 800AC898 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9D09C 800AC89C 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 9D0A0 800AC8A0 AC006210 */  beq        $v1, $v0, .L800ACB54
/* 9D0A4 800AC8A4 20004234 */   ori       $v0, $v0, (0x80000020 & 0xFFFF)
/* 9D0A8 800AC8A8 AA006210 */  beq        $v1, $v0, .L800ACB54
/* 9D0AC 800AC8AC 21200002 */   addu      $a0, $s0, $zero
/* 9D0B0 800AC8B0 D3B20208 */  j          .L800ACB4C
/* 9D0B4 800AC8B4 21284002 */   addu      $a1, $s2, $zero
.L800AC8B8:
/* 9D0B8 800AC8B8 73006210 */  beq        $v1, $v0, .L800ACA88
/* 9D0BC 800AC8BC 2A104300 */   slt       $v0, $v0, $v1
/* 9D0C0 800AC8C0 07004014 */  bnez       $v0, .L800AC8E0
/* 9D0C4 800AC8C4 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9D0C8 800AC8C8 1000023C */  lui        $v0, (0x100004 >> 16)
/* 9D0CC 800AC8CC 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9D0D0 800AC8D0 65006210 */  beq        $v1, $v0, .L800ACA68
/* 9D0D4 800AC8D4 21200002 */   addu      $a0, $s0, $zero
/* 9D0D8 800AC8D8 D3B20208 */  j          .L800ACB4C
/* 9D0DC 800AC8DC 21284002 */   addu      $a1, $s2, $zero
.L800AC8E0:
/* 9D0E0 800AC8E0 9C006210 */  beq        $v1, $v0, .L800ACB54
/* 9D0E4 800AC8E4 21200002 */   addu      $a0, $s0, $zero
/* 9D0E8 800AC8E8 D3B20208 */  j          .L800ACB4C
/* 9D0EC 800AC8EC 21284002 */   addu      $a1, $s2, $zero
.L800AC8F0:
/* 9D0F0 800AC8F0 10004016 */  bnez       $s2, .L800AC934
/* 9D0F4 800AC8F4 FFFF4226 */   addiu     $v0, $s2, -0x1
/* 9D0F8 800AC8F8 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9D0FC 800AC8FC 00000000 */  nop
/* 9D100 800AC900 1C0102AE */  sw         $v0, 0x11C($s0)
/* 9D104 800AC904 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9D108 800AC908 19010224 */  addiu      $v0, $zero, 0x119
/* 9D10C 800AC90C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9D110 800AC910 00106334 */  ori        $v1, $v1, 0x1000
/* 9D114 800AC914 90F983AF */  sw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9D118 800AC918 0000048E */  lw         $a0, 0x0($s0)
/* 9D11C 800AC91C 03000224 */  addiu      $v0, $zero, 0x3
/* 9D120 800AC920 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9D124 800AC924 938B020C */  jal        SteerSwitchMode
/* 9D128 800AC928 21280000 */   addu      $a1, $zero, $zero
/* 9D12C 800AC92C 56B20208 */  j          .L800AC958
/* 9D130 800AC930 00000000 */   nop
.L800AC934:
/* 9D134 800AC934 C0180200 */  sll        $v1, $v0, 3
/* 9D138 800AC938 21186200 */  addu       $v1, $v1, $v0
/* 9D13C 800AC93C C0180300 */  sll        $v1, $v1, 3
/* 9D140 800AC940 23186200 */  subu       $v1, $v1, $v0
/* 9D144 800AC944 80180300 */  sll        $v1, $v1, 2
/* 9D148 800AC948 21180302 */  addu       $v1, $s0, $v1
/* 9D14C 800AC94C 1C01628C */  lw         $v0, 0x11C($v1)
/* 9D150 800AC950 00000000 */  nop
/* 9D154 800AC954 1C0162AE */  sw         $v0, 0x11C($s3)
.L800AC958:
/* 9D158 800AC958 7E004016 */  bnez       $s2, .L800ACB54
/* 9D15C 800AC95C 21200002 */   addu      $a0, $s0, $zero
/* 9D160 800AC960 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9D164 800AC964 21280000 */   addu      $a1, $zero, $zero
/* 9D168 800AC968 90F9858F */  lw         $a1, %gp_rel(Raziel + 0x360)($gp)
/* 9D16C 800AC96C 21184000 */  addu       $v1, $v0, $zero
/* 9D170 800AC970 2000A230 */  andi       $v0, $a1, 0x20
/* 9D174 800AC974 10004014 */  bnez       $v0, .L800AC9B8
/* 9D178 800AC978 00140300 */   sll       $v0, $v1, 16
/* 9D17C 800AC97C 031C0200 */  sra        $v1, $v0, 16
/* 9D180 800AC980 11000224 */  addiu      $v0, $zero, 0x11
/* 9D184 800AC984 0C006210 */  beq        $v1, $v0, .L800AC9B8
/* 9D188 800AC988 12000224 */   addiu     $v0, $zero, 0x12
/* 9D18C 800AC98C 0A006210 */  beq        $v1, $v0, .L800AC9B8
/* 9D190 800AC990 13000224 */   addiu     $v0, $zero, 0x13
/* 9D194 800AC994 08006210 */  beq        $v1, $v0, .L800AC9B8
/* 9D198 800AC998 00000000 */   nop
/* 9D19C 800AC99C 0000048E */  lw         $a0, 0x0($s0)
/* 9D1A0 800AC9A0 00000000 */  nop
/* 9D1A4 800AC9A4 7C01828C */  lw         $v0, 0x17C($a0)
/* 9D1A8 800AC9A8 00000000 */  nop
/* 9D1AC 800AC9AC 00FF4228 */  slti       $v0, $v0, -0x100
/* 9D1B0 800AC9B0 0C004010 */  beqz       $v0, .L800AC9E4
/* 9D1B4 800AC9B4 1000A230 */   andi      $v0, $a1, 0x10
.L800AC9B8:
/* 9D1B8 800AC9B8 0000048E */  lw         $a0, 0x0($s0)
/* 9D1BC 800AC9BC 2C000524 */  addiu      $a1, $zero, 0x2C
/* 9D1C0 800AC9C0 21300000 */  addu       $a2, $zero, $zero
/* 9D1C4 800AC9C4 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9D1C8 800AC9C8 2138C000 */   addu      $a3, $a2, $zero
/* 9D1CC 800AC9CC 61004010 */  beqz       $v0, .L800ACB54
/* 9D1D0 800AC9D0 01000224 */   addiu     $v0, $zero, 0x1
/* 9D1D4 800AC9D4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D1D8 800AC9D8 21200002 */  addu       $a0, $s0, $zero
/* 9D1DC 800AC9DC 95B20208 */  j          .L800ACA54
/* 9D1E0 800AC9E0 29000524 */   addiu     $a1, $zero, 0x29
.L800AC9E4:
/* 9D1E4 800AC9E4 13004014 */  bnez       $v0, .L800ACA34
/* 9D1E8 800AC9E8 1C000524 */   addiu     $a1, $zero, 0x1C
/* 9D1EC 800AC9EC 0400228E */  lw         $v0, 0x4($s1)
/* 9D1F0 800AC9F0 00000000 */  nop
/* 9D1F4 800AC9F4 0E004010 */  beqz       $v0, .L800ACA30
/* 9D1F8 800AC9F8 0C000524 */   addiu     $a1, $zero, 0xC
/* 9D1FC 800AC9FC 21300000 */  addu       $a2, $zero, $zero
/* 9D200 800ACA00 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9D204 800ACA04 2138C000 */   addu      $a3, $a2, $zero
/* 9D208 800ACA08 52004010 */  beqz       $v0, .L800ACB54
/* 9D20C 800ACA0C 01000224 */   addiu     $v0, $zero, 0x1
/* 9D210 800ACA10 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D214 800ACA14 21200002 */  addu       $a0, $s0, $zero
/* 9D218 800ACA18 1D000524 */  addiu      $a1, $zero, 0x1D
/* 9D21C 800ACA1C 21300000 */  addu       $a2, $zero, $zero
/* 9D220 800ACA20 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9D224 800ACA24 2138C000 */   addu      $a3, $a2, $zero
/* 9D228 800ACA28 D5B20208 */  j          .L800ACB54
/* 9D22C 800ACA2C 00000000 */   nop
.L800ACA30:
/* 9D230 800ACA30 1C000524 */  addiu      $a1, $zero, 0x1C
.L800ACA34:
/* 9D234 800ACA34 21300000 */  addu       $a2, $zero, $zero
/* 9D238 800ACA38 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9D23C 800ACA3C 2138C000 */   addu      $a3, $a2, $zero
/* 9D240 800ACA40 44004010 */  beqz       $v0, .L800ACB54
/* 9D244 800ACA44 01000224 */   addiu     $v0, $zero, 0x1
/* 9D248 800ACA48 1000A2AF */  sw         $v0, 0x10($sp)
/* 9D24C 800ACA4C 21200002 */  addu       $a0, $s0, $zero
/* 9D250 800ACA50 25000524 */  addiu      $a1, $zero, 0x25
.L800ACA54:
/* 9D254 800ACA54 21300000 */  addu       $a2, $zero, $zero
/* 9D258 800ACA58 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9D25C 800ACA5C 21384000 */   addu      $a3, $v0, $zero
/* 9D260 800ACA60 D5B20208 */  j          .L800ACB54
/* 9D264 800ACA64 00000000 */   nop
.L800ACA68:
/* 9D268 800ACA68 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 9D26C 800ACA6C 21300000 */  addu       $a2, $zero, $zero
/* 9D270 800ACA70 1000A0AF */  sw         $zero, 0x10($sp)
/* 9D274 800ACA74 0000048E */  lw         $a0, 0x0($s0)
/* 9D278 800ACA78 4E68020C */  jal        SetPhysics
/* 9D27C 800ACA7C 2138C000 */   addu      $a3, $a2, $zero
/* 9D280 800ACA80 D5B20208 */  j          .L800ACB54
/* 9D284 800ACA84 00000000 */   nop
.L800ACA88:
/* 9D288 800ACA88 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9D28C 800ACA8C 00000000 */  nop
/* 9D290 800ACA90 0000438C */  lw         $v1, 0x0($v0)
/* 9D294 800ACA94 9CA4828F */  lw         $v0, %gp_rel(RazielCommands + 0x18)($gp)
/* 9D298 800ACA98 00000000 */  nop
/* 9D29C 800ACA9C 24106200 */  and        $v0, $v1, $v0
/* 9D2A0 800ACAA0 06004010 */  beqz       $v0, .L800ACABC
/* 9D2A4 800ACAA4 0080023C */   lui       $v0, (0x8000000F >> 16)
/* 9D2A8 800ACAA8 26004016 */  bnez       $s2, .L800ACB44
/* 9D2AC 800ACAAC 21200002 */   addu      $a0, $s0, $zero
/* 9D2B0 800ACAB0 0B80053C */  lui        $a1, %hi(StateHandlerCrouch)
/* 9D2B4 800ACAB4 BCB20208 */  j          .L800ACAF0
/* 9D2B8 800ACAB8 E890A524 */   addiu     $a1, $a1, %lo(StateHandlerCrouch)
.L800ACABC:
/* 9D2BC 800ACABC 0F004234 */  ori        $v0, $v0, (0x8000000F & 0xFFFF)
/* 9D2C0 800ACAC0 24106200 */  and        $v0, $v1, $v0
/* 9D2C4 800ACAC4 14004010 */  beqz       $v0, .L800ACB18
/* 9D2C8 800ACAC8 21200000 */   addu      $a0, $zero, $zero
/* 9D2CC 800ACACC 1D004016 */  bnez       $s2, .L800ACB44
/* 9D2D0 800ACAD0 21200002 */   addu      $a0, $s0, $zero
/* 9D2D4 800ACAD4 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9D2D8 800ACAD8 21280000 */   addu      $a1, $zero, $zero
/* 9D2DC 800ACADC 1D000324 */  addiu      $v1, $zero, 0x1D
/* 9D2E0 800ACAE0 07004314 */  bne        $v0, $v1, .L800ACB00
/* 9D2E4 800ACAE4 21200002 */   addu      $a0, $s0, $zero
/* 9D2E8 800ACAE8 0B80053C */  lui        $a1, %hi(StateHandlerMove)
/* 9D2EC 800ACAEC A8ABA524 */  addiu      $a1, $a1, %lo(StateHandlerMove)
.L800ACAF0:
/* 9D2F0 800ACAF0 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9D2F4 800ACAF4 21300000 */   addu      $a2, $zero, $zero
/* 9D2F8 800ACAF8 D5B20208 */  j          .L800ACB54
/* 9D2FC 800ACAFC 1C0160AE */   sw        $zero, 0x11C($s3)
.L800ACB00:
/* 9D300 800ACB00 0B80053C */  lui        $a1, %hi(StateHandlerStartMove)
/* 9D304 800ACB04 C4A2A524 */  addiu      $a1, $a1, %lo(StateHandlerStartMove)
/* 9D308 800ACB08 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9D30C 800ACB0C 05000624 */   addiu     $a2, $zero, 0x5
/* 9D310 800ACB10 D5B20208 */  j          .L800ACB54
/* 9D314 800ACB14 1C0160AE */   sw        $zero, 0x11C($s3)
.L800ACB18:
/* 9D318 800ACB18 21288000 */  addu       $a1, $a0, $zero
/* 9D31C 800ACB1C 4FC6010C */  jal        SetControlInitIdleData
/* 9D320 800ACB20 04000624 */   addiu     $a2, $zero, 0x4
/* 9D324 800ACB24 21200002 */  addu       $a0, $s0, $zero
/* 9D328 800ACB28 21284002 */  addu       $a1, $s2, $zero
/* 9D32C 800ACB2C 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9D330 800ACB30 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9D334 800ACB34 C1CA010C */  jal        StateSwitchStateData
/* 9D338 800ACB38 21384000 */   addu      $a3, $v0, $zero
/* 9D33C 800ACB3C 01000224 */  addiu      $v0, $zero, 0x1
/* 9D340 800ACB40 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
.L800ACB44:
/* 9D344 800ACB44 D5B20208 */  j          .L800ACB54
/* 9D348 800ACB48 1C0160AE */   sw        $zero, 0x11C($s3)
.L800ACB4C:
/* 9D34C 800ACB4C B9BF020C */  jal        DefaultStateHandler
/* 9D350 800ACB50 2130A002 */   addu      $a2, $s5, $zero
.L800ACB54:
/* 9D354 800ACB54 27C3010C */  jal        DeMessageQueue
/* 9D358 800ACB58 04008426 */   addiu     $a0, $s4, 0x4
/* 9D35C 800ACB5C 1CB20208 */  j          .L800AC870
/* 9D360 800ACB60 00000000 */   nop
.L800ACB64:
/* 9D364 800ACB64 3000BF8F */  lw         $ra, 0x30($sp)
/* 9D368 800ACB68 2C00B58F */  lw         $s5, 0x2C($sp)
/* 9D36C 800ACB6C 2800B48F */  lw         $s4, 0x28($sp)
/* 9D370 800ACB70 2400B38F */  lw         $s3, 0x24($sp)
/* 9D374 800ACB74 2000B28F */  lw         $s2, 0x20($sp)
/* 9D378 800ACB78 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9D37C 800ACB7C 1800B08F */  lw         $s0, 0x18($sp)
/* 9D380 800ACB80 0800E003 */  jr         $ra
/* 9D384 800ACB84 3800BD27 */   addiu     $sp, $sp, 0x38
.size StateHandlerDeCompression, . - StateHandlerDeCompression
