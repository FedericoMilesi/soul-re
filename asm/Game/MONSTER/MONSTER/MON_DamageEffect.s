.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_DamageEffect
/* 7D080 8008C880 78FFBD27 */  addiu      $sp, $sp, -0x88
/* 7D084 8008C884 7000B2AF */  sw         $s2, 0x70($sp)
/* 7D088 8008C888 21908000 */  addu       $s2, $a0, $zero
/* 7D08C 8008C88C 6800B0AF */  sw         $s0, 0x68($sp)
/* 7D090 8008C890 2180A000 */  addu       $s0, $a1, $zero
/* 7D094 8008C894 0D80023C */  lui        $v0, %hi(burntTest + 0x8)
/* 7D098 8008C898 7C00B5AF */  sw         $s5, 0x7C($sp)
/* 7D09C 8008C89C 8000BFAF */  sw         $ra, 0x80($sp)
/* 7D0A0 8008C8A0 7800B4AF */  sw         $s4, 0x78($sp)
/* 7D0A4 8008C8A4 7400B3AF */  sw         $s3, 0x74($sp)
/* 7D0A8 8008C8A8 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 7D0AC 8008C8AC 381B4B24 */  addiu      $t3, $v0, %lo(burntTest + 0x8)
/* 7D0B0 8008C8B0 03006889 */  lwl        $t0, 0x3($t3)
/* 7D0B4 8008C8B4 00006899 */  lwr        $t0, 0x0($t3)
/* 7D0B8 8008C8B8 07006989 */  lwl        $t1, 0x7($t3)
/* 7D0BC 8008C8BC 04006999 */  lwr        $t1, 0x4($t3)
/* 7D0C0 8008C8C0 2300A8AB */  swl        $t0, 0x23($sp)
/* 7D0C4 8008C8C4 2000A8BB */  swr        $t0, 0x20($sp)
/* 7D0C8 8008C8C8 2700A9AB */  swl        $t1, 0x27($sp)
/* 7D0CC 8008C8CC 2400A9BB */  swr        $t1, 0x24($sp)
/* 7D0D0 8008C8D0 6C01548E */  lw         $s4, 0x16C($s2)
/* 7D0D4 8008C8D4 D2000016 */  bnez       $s0, .L8008CC20
/* 7D0D8 8008C8D8 2000B527 */   addiu     $s5, $sp, 0x20
/* 7D0DC 8008C8DC 0010023C */  lui        $v0, (0x10000200 >> 16)
/* 7D0E0 8008C8E0 00024234 */  ori        $v0, $v0, (0x10000200 & 0xFFFF)
/* 7D0E4 8008C8E4 0000838E */  lw         $v1, 0x0($s4)
/* 7D0E8 8008C8E8 2400538E */  lw         $s3, 0x24($s2)
/* 7D0EC 8008C8EC 24186200 */  and        $v1, $v1, $v0
/* 7D0F0 8008C8F0 0010023C */  lui        $v0, (0x10000000 >> 16)
/* 7D0F4 8008C8F4 39006214 */  bne        $v1, $v0, .L8008C9DC
/* 7D0F8 8008C8F8 8000033C */   lui       $v1, (0x800010 >> 16)
/* 7D0FC 8008C8FC 3AF2020C */  jal        rand
/* 7D100 8008C900 04001024 */   addiu     $s0, $zero, 0x4
/* 7D104 8008C904 1C00448E */  lw         $a0, 0x1C($s2)
/* 7D108 8008C908 26014386 */  lh         $v1, 0x126($s2)
/* 7D10C 8008C90C 0C00848C */  lw         $a0, 0xC($a0)
/* 7D110 8008C910 80180300 */  sll        $v1, $v1, 2
/* 7D114 8008C914 21186400 */  addu       $v1, $v1, $a0
/* 7D118 8008C918 0000638C */  lw         $v1, 0x0($v1)
/* 7D11C 8008C91C 00000000 */  nop
/* 7D120 8008C920 1800638C */  lw         $v1, 0x18($v1)
/* 7D124 8008C924 00000000 */  nop
/* 7D128 8008C928 1A004300 */  div        $zero, $v0, $v1
/* 7D12C 8008C92C 10180000 */  mfhi       $v1
/* 7D130 8008C930 4000518E */  lw         $s1, 0x40($s2)
/* 7D134 8008C934 0D80023C */  lui        $v0, %hi(burntTest + 0x10)
/* 7D138 8008C938 401B4B24 */  addiu      $t3, $v0, %lo(burntTest + 0x10)
/* 7D13C 8008C93C 03006889 */  lwl        $t0, 0x3($t3)
/* 7D140 8008C940 00006899 */  lwr        $t0, 0x0($t3)
/* 7D144 8008C944 07006989 */  lwl        $t1, 0x7($t3)
/* 7D148 8008C948 04006999 */  lwr        $t1, 0x4($t3)
/* 7D14C 8008C94C 3B00A8AB */  swl        $t0, 0x3B($sp)
/* 7D150 8008C950 3800A8BB */  swr        $t0, 0x38($sp)
/* 7D154 8008C954 3F00A9AB */  swl        $t1, 0x3F($sp)
/* 7D158 8008C958 3C00A9BB */  swr        $t1, 0x3C($sp)
/* 7D15C 8008C95C 40190300 */  sll        $v1, $v1, 5
/* 7D160 8008C960 3AF2020C */  jal        rand
/* 7D164 8008C964 21882302 */   addu      $s1, $s1, $v1
/* 7D168 8008C968 07004230 */  andi       $v0, $v0, 0x7
/* 7D16C 8008C96C 23100202 */  subu       $v0, $s0, $v0
/* 7D170 8008C970 3AF2020C */  jal        rand
/* 7D174 8008C974 3000A2A7 */   sh        $v0, 0x30($sp)
/* 7D178 8008C978 FF00033C */  lui        $v1, (0xFF2828 >> 16)
/* 7D17C 8008C97C 28286334 */  ori        $v1, $v1, (0xFF2828 & 0xFFFF)
/* 7D180 8008C980 2800A427 */  addiu      $a0, $sp, 0x28
/* 7D184 8008C984 07004230 */  andi       $v0, $v0, 0x7
/* 7D188 8008C988 23800202 */  subu       $s0, $s0, $v0
/* 7D18C 8008C98C 3200B0A7 */  sh         $s0, 0x32($sp)
/* 7D190 8008C990 3400A0A7 */  sh         $zero, 0x34($sp)
/* 7D194 8008C994 14002296 */  lhu        $v0, 0x14($s1)
/* 7D198 8008C998 3000A527 */  addiu      $a1, $sp, 0x30
/* 7D19C 8008C99C 2800A2A7 */  sh         $v0, 0x28($sp)
/* 7D1A0 8008C9A0 18002296 */  lhu        $v0, 0x18($s1)
/* 7D1A4 8008C9A4 3800A627 */  addiu      $a2, $sp, 0x38
/* 7D1A8 8008C9A8 2A00A2A7 */  sh         $v0, 0x2A($sp)
/* 7D1AC 8008C9AC 1C002296 */  lhu        $v0, 0x1C($s1)
/* 7D1B0 8008C9B0 21380000 */  addu       $a3, $zero, $zero
/* 7D1B4 8008C9B4 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* 7D1B8 8008C9B8 18000224 */  addiu      $v0, $zero, 0x18
/* 7D1BC 8008C9BC 1400A2AF */  sw         $v0, 0x14($sp)
/* 7D1C0 8008C9C0 10000224 */  addiu      $v0, $zero, 0x10
/* 7D1C4 8008C9C4 1800A2AF */  sw         $v0, 0x18($sp)
/* 7D1C8 8008C9C8 02000224 */  addiu      $v0, $zero, 0x2
/* 7D1CC 8008C9CC 1000A3AF */  sw         $v1, 0x10($sp)
/* 7D1D0 8008C9D0 9622010C */  jal        FX_Dot
/* 7D1D4 8008C9D4 1C00A2AF */   sw        $v0, 0x1C($sp)
/* 7D1D8 8008C9D8 8000033C */  lui        $v1, (0x800010 >> 16)
.L8008C9DC:
/* 7D1DC 8008C9DC 0000828E */  lw         $v0, 0x0($s4)
/* 7D1E0 8008C9E0 10006334 */  ori        $v1, $v1, (0x800010 & 0xFFFF)
/* 7D1E4 8008C9E4 24104300 */  and        $v0, $v0, $v1
/* 7D1E8 8008C9E8 19004314 */  bne        $v0, $v1, .L8008CA50
/* 7D1EC 8008C9EC 4800B127 */   addiu     $s1, $sp, 0x48
/* 7D1F0 8008C9F0 21202002 */  addu       $a0, $s1, $zero
/* 7D1F4 8008C9F4 21280000 */  addu       $a1, $zero, $zero
/* 7D1F8 8008C9F8 08000624 */  addiu      $a2, $zero, 0x8
/* 7D1FC 8008C9FC 18006292 */  lbu        $v0, 0x18($s3)
/* 7D200 8008CA00 4000508E */  lw         $s0, 0x40($s2)
/* 7D204 8008CA04 40110200 */  sll        $v0, $v0, 5
/* 7D208 8008CA08 2EF2020C */  jal        memset
/* 7D20C 8008CA0C 21800202 */   addu      $s0, $s0, $v0
/* 7D210 8008CA10 1800033C */  lui        $v1, (0x1800D0 >> 16)
/* 7D214 8008CA14 D0006334 */  ori        $v1, $v1, (0x1800D0 & 0xFFFF)
/* 7D218 8008CA18 4000A427 */  addiu      $a0, $sp, 0x40
/* 7D21C 8008CA1C 14000296 */  lhu        $v0, 0x14($s0)
/* 7D220 8008CA20 21282002 */  addu       $a1, $s1, $zero
/* 7D224 8008CA24 4000A2A7 */  sh         $v0, 0x40($sp)
/* 7D228 8008CA28 18000296 */  lhu        $v0, 0x18($s0)
/* 7D22C 8008CA2C 2130A002 */  addu       $a2, $s5, $zero
/* 7D230 8008CA30 4200A2A7 */  sh         $v0, 0x42($sp)
/* 7D234 8008CA34 1C000296 */  lhu        $v0, 0x1C($s0)
/* 7D238 8008CA38 04000724 */  addiu      $a3, $zero, 0x4
/* 7D23C 8008CA3C 4400A2A7 */  sh         $v0, 0x44($sp)
/* 7D240 8008CA40 08000224 */  addiu      $v0, $zero, 0x8
/* 7D244 8008CA44 1000A3AF */  sw         $v1, 0x10($sp)
/* 7D248 8008CA48 F122010C */  jal        FX_Blood
/* 7D24C 8008CA4C 1400A2AF */   sw        $v0, 0x14($sp)
.L8008CA50:
/* 7D250 8008CA50 0000828E */  lw         $v0, 0x0($s4)
/* 7D254 8008CA54 4000033C */  lui        $v1, (0x400000 >> 16)
/* 7D258 8008CA58 24104300 */  and        $v0, $v0, $v1
/* 7D25C 8008CA5C 1E004010 */  beqz       $v0, .L8008CAD8
/* 7D260 8008CA60 0D80023C */   lui       $v0, %hi(objectAccess + 0x54)
/* 7D264 8008CA64 90A2428C */  lw         $v0, %lo(objectAccess + 0x54)($v0)
/* 7D268 8008CA68 00000000 */  nop
/* 7D26C 8008CA6C 17004010 */  beqz       $v0, .L8008CACC
/* 7D270 8008CA70 21204002 */   addu      $a0, $s2, $zero
/* 7D274 8008CA74 0C00428C */  lw         $v0, 0xC($v0)
/* 7D278 8008CA78 00000000 */  nop
/* 7D27C 8008CA7C 0000508C */  lw         $s0, 0x0($v0)
/* 7D280 8008CA80 1B006692 */  lbu        $a2, 0x1B($s3)
/* 7D284 8008CA84 FD26010C */  jal        FX_MakeSpark
/* 7D288 8008CA88 21280002 */   addu      $a1, $s0, $zero
/* 7D28C 8008CA8C 21204002 */  addu       $a0, $s2, $zero
/* 7D290 8008CA90 1C006692 */  lbu        $a2, 0x1C($s3)
/* 7D294 8008CA94 FD26010C */  jal        FX_MakeSpark
/* 7D298 8008CA98 21280002 */   addu      $a1, $s0, $zero
/* 7D29C 8008CA9C 21204002 */  addu       $a0, $s2, $zero
/* 7D2A0 8008CAA0 1D006692 */  lbu        $a2, 0x1D($s3)
/* 7D2A4 8008CAA4 FD26010C */  jal        FX_MakeSpark
/* 7D2A8 8008CAA8 21280002 */   addu      $a1, $s0, $zero
/* 7D2AC 8008CAAC 21204002 */  addu       $a0, $s2, $zero
/* 7D2B0 8008CAB0 1E006692 */  lbu        $a2, 0x1E($s3)
/* 7D2B4 8008CAB4 FD26010C */  jal        FX_MakeSpark
/* 7D2B8 8008CAB8 21280002 */   addu      $a1, $s0, $zero
/* 7D2BC 8008CABC 21204002 */  addu       $a0, $s2, $zero
/* 7D2C0 8008CAC0 1F006692 */  lbu        $a2, 0x1F($s3)
/* 7D2C4 8008CAC4 FD26010C */  jal        FX_MakeSpark
/* 7D2C8 8008CAC8 21280002 */   addu      $a1, $s0, $zero
.L8008CACC:
/* 7D2CC 8008CACC 98A58527 */  addiu      $a1, $gp, %gp_rel(burntTest)
/* 7D2D0 8008CAD0 F531020C */  jal        MONSTER_VertexBurnt
/* 7D2D4 8008CAD4 21204002 */   addu      $a0, $s2, $zero
.L8008CAD8:
/* 7D2D8 8008CAD8 58018392 */  lbu        $v1, 0x158($s4)
/* 7D2DC 8008CADC 03000224 */  addiu      $v0, $zero, 0x3
/* 7D2E0 8008CAE0 77006214 */  bne        $v1, $v0, .L8008CCC0
/* 7D2E4 8008CAE4 00000000 */   nop
/* 7D2E8 8008CAE8 1000628E */  lw         $v0, 0x10($s3)
/* 7D2EC 8008CAEC 00000000 */  nop
/* 7D2F0 8008CAF0 02004230 */  andi       $v0, $v0, 0x2
/* 7D2F4 8008CAF4 72004010 */  beqz       $v0, .L8008CCC0
/* 7D2F8 8008CAF8 00000000 */   nop
/* 7D2FC 8008CAFC 9006020C */  jal        MON_GetTime
/* 7D300 8008CB00 21204002 */   addu      $a0, $s2, $zero
/* 7D304 8008CB04 1C01838E */  lw         $v1, 0x11C($s4)
/* 7D308 8008CB08 00000000 */  nop
/* 7D30C 8008CB0C 2B104300 */  sltu       $v0, $v0, $v1
/* 7D310 8008CB10 6B004010 */  beqz       $v0, .L8008CCC0
/* 7D314 8008CB14 00000000 */   nop
/* 7D318 8008CB18 98A58527 */  addiu      $a1, $gp, %gp_rel(burntTest)
/* 7D31C 8008CB1C F531020C */  jal        MONSTER_VertexBurnt
/* 7D320 8008CB20 21204002 */   addu      $a0, $s2, $zero
/* 7D324 8008CB24 0C000224 */  addiu      $v0, $zero, 0xC
/* 7D328 8008CB28 5A00A0A7 */  sh         $zero, 0x5A($sp)
/* 7D32C 8008CB2C 5800A0A7 */  sh         $zero, 0x58($sp)
/* 7D330 8008CB30 5C00A2A7 */  sh         $v0, 0x5C($sp)
/* 7D334 8008CB34 6200A0A7 */  sh         $zero, 0x62($sp)
/* 7D338 8008CB38 6000A0A7 */  sh         $zero, 0x60($sp)
/* 7D33C 8008CB3C 6400A0A7 */  sh         $zero, 0x64($sp)
/* 7D340 8008CB40 1C00438E */  lw         $v1, 0x1C($s2)
/* 7D344 8008CB44 26014286 */  lh         $v0, 0x126($s2)
/* 7D348 8008CB48 0C00638C */  lw         $v1, 0xC($v1)
/* 7D34C 8008CB4C 80100200 */  sll        $v0, $v0, 2
/* 7D350 8008CB50 21104300 */  addu       $v0, $v0, $v1
/* 7D354 8008CB54 0000428C */  lw         $v0, 0x0($v0)
/* 7D358 8008CB58 00000000 */  nop
/* 7D35C 8008CB5C 1800548C */  lw         $s4, 0x18($v0)
/* 7D360 8008CB60 01001124 */  addiu      $s1, $zero, 0x1
/* 7D364 8008CB64 2A103402 */  slt        $v0, $s1, $s4
/* 7D368 8008CB68 55004010 */  beqz       $v0, .L8008CCC0
/* 7D36C 8008CB6C 8000133C */   lui       $s3, (0x808080 >> 16)
/* 7D370 8008CB70 80807336 */  ori        $s3, $s3, (0x808080 & 0xFFFF)
/* 7D374 8008CB74 50001524 */  addiu      $s5, $zero, 0x50
.L8008CB78:
/* 7D378 8008CB78 4000508E */  lw         $s0, 0x40($s2)
/* 7D37C 8008CB7C 40111100 */  sll        $v0, $s1, 5
/* 7D380 8008CB80 3AF2020C */  jal        rand
/* 7D384 8008CB84 21800202 */   addu      $s0, $s0, $v0
/* 7D388 8008CB88 14000396 */  lhu        $v1, 0x14($s0)
/* 7D38C 8008CB8C 03004230 */  andi       $v0, $v0, 0x3
/* 7D390 8008CB90 21186200 */  addu       $v1, $v1, $v0
/* 7D394 8008CB94 3AF2020C */  jal        rand
/* 7D398 8008CB98 5000A3A7 */   sh        $v1, 0x50($sp)
/* 7D39C 8008CB9C 18000396 */  lhu        $v1, 0x18($s0)
/* 7D3A0 8008CBA0 03004230 */  andi       $v0, $v0, 0x3
/* 7D3A4 8008CBA4 21186200 */  addu       $v1, $v1, $v0
/* 7D3A8 8008CBA8 3AF2020C */  jal        rand
/* 7D3AC 8008CBAC 5200A3A7 */   sh        $v1, 0x52($sp)
/* 7D3B0 8008CBB0 1C000396 */  lhu        $v1, 0x1C($s0)
/* 7D3B4 8008CBB4 03004230 */  andi       $v0, $v0, 0x3
/* 7D3B8 8008CBB8 21186200 */  addu       $v1, $v1, $v0
/* 7D3BC 8008CBBC 3AF2020C */  jal        rand
/* 7D3C0 8008CBC0 5400A3A7 */   sh        $v1, 0x54($sp)
/* 7D3C4 8008CBC4 1F004230 */  andi       $v0, $v0, 0x1F
/* 7D3C8 8008CBC8 06004014 */  bnez       $v0, .L8008CBE4
/* 7D3CC 8008CBCC 5000A427 */   addiu     $a0, $sp, 0x50
/* 7D3D0 8008CBD0 5800A527 */  addiu      $a1, $sp, 0x58
/* 7D3D4 8008CBD4 6000A627 */  addiu      $a2, $sp, 0x60
/* 7D3D8 8008CBD8 00FF0724 */  addiu      $a3, $zero, -0x100
/* 7D3DC 8008CBDC FD320208 */  j          .L8008CBF4
/* 7D3E0 8008CBE0 20000224 */   addiu     $v0, $zero, 0x20
.L8008CBE4:
/* 7D3E4 8008CBE4 5800A527 */  addiu      $a1, $sp, 0x58
/* 7D3E8 8008CBE8 6000A627 */  addiu      $a2, $sp, 0x60
/* 7D3EC 8008CBEC 00FF0724 */  addiu      $a3, $zero, -0x100
/* 7D3F0 8008CBF0 02000224 */  addiu      $v0, $zero, 0x2
.L8008CBF4:
/* 7D3F4 8008CBF4 1000B3AF */  sw         $s3, 0x10($sp)
/* 7D3F8 8008CBF8 1400B5AF */  sw         $s5, 0x14($sp)
/* 7D3FC 8008CBFC 1800A2AF */  sw         $v0, 0x18($sp)
/* 7D400 8008CC00 9622010C */  jal        FX_Dot
/* 7D404 8008CC04 1C00A0AF */   sw        $zero, 0x1C($sp)
/* 7D408 8008CC08 01003126 */  addiu      $s1, $s1, 0x1
/* 7D40C 8008CC0C 2A103402 */  slt        $v0, $s1, $s4
/* 7D410 8008CC10 2B004010 */  beqz       $v0, .L8008CCC0
/* 7D414 8008CC14 00000000 */   nop
/* 7D418 8008CC18 DE320208 */  j          .L8008CB78
/* 7D41C 8008CC1C 00000000 */   nop
.L8008CC20:
/* 7D420 8008CC20 12000386 */  lh         $v1, 0x12($s0)
/* 7D424 8008CC24 20000224 */  addiu      $v0, $zero, 0x20
/* 7D428 8008CC28 07006214 */  bne        $v1, $v0, .L8008CC48
/* 7D42C 8008CC2C 10000224 */   addiu     $v0, $zero, 0x10
/* 7D430 8008CC30 10000286 */  lh         $v0, 0x10($s0)
/* 7D434 8008CC34 00000000 */  nop
/* 7D438 8008CC38 05004010 */  beqz       $v0, .L8008CC50
/* 7D43C 8008CC3C 21204002 */   addu      $a0, $s2, $zero
/* 7D440 8008CC40 16330208 */  j          .L8008CC58
/* 7D444 8008CC44 21280002 */   addu      $a1, $s0, $zero
.L8008CC48:
/* 7D448 8008CC48 08006214 */  bne        $v1, $v0, .L8008CC6C
/* 7D44C 8008CC4C 00000000 */   nop
.L8008CC50:
/* 7D450 8008CC50 21204002 */  addu       $a0, $s2, $zero
/* 7D454 8008CC54 5C008524 */  addiu      $a1, $a0, 0x5C
.L8008CC58:
/* 7D458 8008CC58 98A58627 */  addiu      $a2, $gp, %gp_rel(burntTest)
/* 7D45C 8008CC5C 9531020C */  jal        MONSTER_StartVertexBurnt
/* 7D460 8008CC60 00000000 */   nop
/* 7D464 8008CC64 24330208 */  j          .L8008CC90
/* 7D468 8008CC68 00000000 */   nop
.L8008CC6C:
/* 7D46C 8008CC6C 44018486 */  lh         $a0, 0x144($s4)
/* 7D470 8008CC70 46018586 */  lh         $a1, 0x146($s4)
/* 7D474 8008CC74 C02F020C */  jal        MONSTER_CalcDamageIntensity
/* 7D478 8008CC78 00000000 */   nop
/* 7D47C 8008CC7C 21204002 */  addu       $a0, $s2, $zero
/* 7D480 8008CC80 21280002 */  addu       $a1, $s0, $zero
/* 7D484 8008CC84 9530020C */  jal        MONSTER_StartVertexBlood
/* 7D488 8008CC88 21304000 */   addu      $a2, $v0, $zero
/* 7D48C 8008CC8C 4C0182A6 */  sh         $v0, 0x14C($s4)
.L8008CC90:
/* 7D490 8008CC90 10000786 */  lh         $a3, 0x10($s0)
/* 7D494 8008CC94 00000000 */  nop
/* 7D498 8008CC98 0900E010 */  beqz       $a3, .L8008CCC0
/* 7D49C 8008CC9C 1800023C */   lui       $v0, (0x1800D0 >> 16)
/* 7D4A0 8008CCA0 D0004234 */  ori        $v0, $v0, (0x1800D0 & 0xFFFF)
/* 7D4A4 8008CCA4 21200002 */  addu       $a0, $s0, $zero
/* 7D4A8 8008CCA8 08008524 */  addiu      $a1, $a0, 0x8
/* 7D4AC 8008CCAC 2000A627 */  addiu      $a2, $sp, 0x20
/* 7D4B0 8008CCB0 1000A2AF */  sw         $v0, 0x10($sp)
/* 7D4B4 8008CCB4 08000224 */  addiu      $v0, $zero, 0x8
/* 7D4B8 8008CCB8 F122010C */  jal        FX_Blood
/* 7D4BC 8008CCBC 1400A2AF */   sw        $v0, 0x14($sp)
.L8008CCC0:
/* 7D4C0 8008CCC0 8000BF8F */  lw         $ra, 0x80($sp)
/* 7D4C4 8008CCC4 7C00B58F */  lw         $s5, 0x7C($sp)
/* 7D4C8 8008CCC8 7800B48F */  lw         $s4, 0x78($sp)
/* 7D4CC 8008CCCC 7400B38F */  lw         $s3, 0x74($sp)
/* 7D4D0 8008CCD0 7000B28F */  lw         $s2, 0x70($sp)
/* 7D4D4 8008CCD4 6C00B18F */  lw         $s1, 0x6C($sp)
/* 7D4D8 8008CCD8 6800B08F */  lw         $s0, 0x68($sp)
/* 7D4DC 8008CCDC 0800E003 */  jr         $ra
/* 7D4E0 8008CCE0 8800BD27 */   addiu     $sp, $sp, 0x88
.size MON_DamageEffect, . - MON_DamageEffect
