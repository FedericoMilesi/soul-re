.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphDrawMenu
/* 6B800 8007B000 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6B804 8007B004 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 6B808 8007B008 7000A4AF */  sw         $a0, 0x70($sp)
/* 6B80C 8007B00C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6B810 8007B010 7000AA8F */  lw         $t2, 0x70($sp)
/* 6B814 8007B014 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 6B818 8007B018 6800BEAF */  sw         $fp, 0x68($sp)
/* 6B81C 8007B01C 6400B7AF */  sw         $s7, 0x64($sp)
/* 6B820 8007B020 6000B6AF */  sw         $s6, 0x60($sp)
/* 6B824 8007B024 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 6B828 8007B028 5800B4AF */  sw         $s4, 0x58($sp)
/* 6B82C 8007B02C 5400B3AF */  sw         $s3, 0x54($sp)
/* 6B830 8007B030 5000B2AF */  sw         $s2, 0x50($sp)
/* 6B834 8007B034 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 6B838 8007B038 4800B0AF */  sw         $s0, 0x48($sp)
/* 6B83C 8007B03C 80110200 */  sll        $v0, $v0, 6
/* 6B840 8007B040 02830200 */  srl        $s0, $v0, 12
/* 6B844 8007B044 1C00428D */  lw         $v0, 0x1C($t2)
/* 6B848 8007B048 6C01548D */  lw         $s4, 0x16C($t2)
/* 6B84C 8007B04C 1C00578C */  lw         $s7, 0x1C($v0)
/* 6B850 8007B050 92D1000C */  jal        INSTANCE_Query
/* 6B854 8007B054 20000524 */   addiu     $a1, $zero, 0x20
/* 6B858 8007B058 98008486 */  lh         $a0, 0x98($s4)
/* 6B85C 8007B05C 96008586 */  lh         $a1, 0x96($s4)
/* 6B860 8007B060 00000000 */  nop
/* 6B864 8007B064 1A008510 */  beq        $a0, $a1, .L8007B0D0
/* 6B868 8007B068 21F04000 */   addu      $fp, $v0, $zero
/* 6B86C 8007B06C 7EE8000C */  jal        AngleDiff
/* 6B870 8007B070 00000000 */   nop
/* 6B874 8007B074 00140200 */  sll        $v0, $v0, 16
/* 6B878 8007B078 03140200 */  sra        $v0, $v0, 16
/* 6B87C 8007B07C 02004104 */  bgez       $v0, .L8007B088
/* 6B880 8007B080 00000000 */   nop
/* 6B884 8007B084 23100200 */  negu       $v0, $v0
.L8007B088:
/* 6B888 8007B088 2A100202 */  slt        $v0, $s0, $v0
/* 6B88C 8007B08C 04004014 */  bnez       $v0, .L8007B0A0
/* 6B890 8007B090 00000000 */   nop
/* 6B894 8007B094 98008296 */  lhu        $v0, 0x98($s4)
/* 6B898 8007B098 34EC0108 */  j          .L8007B0D0
/* 6B89C 8007B09C 960082A6 */   sh        $v0, 0x96($s4)
.L8007B0A0:
/* 6B8A0 8007B0A0 9A008286 */  lh         $v0, 0x9A($s4)
/* 6B8A4 8007B0A4 00000000 */  nop
/* 6B8A8 8007B0A8 04004018 */  blez       $v0, .L8007B0BC
/* 6B8AC 8007B0AC 00000000 */   nop
/* 6B8B0 8007B0B0 96008296 */  lhu        $v0, 0x96($s4)
/* 6B8B4 8007B0B4 32EC0108 */  j          .L8007B0C8
/* 6B8B8 8007B0B8 21105000 */   addu      $v0, $v0, $s0
.L8007B0BC:
/* 6B8BC 8007B0BC 96008296 */  lhu        $v0, 0x96($s4)
/* 6B8C0 8007B0C0 00000000 */  nop
/* 6B8C4 8007B0C4 23105000 */  subu       $v0, $v0, $s0
.L8007B0C8:
/* 6B8C8 8007B0C8 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 6B8CC 8007B0CC 960082A6 */  sh         $v0, 0x96($s4)
.L8007B0D0:
/* 6B8D0 8007B0D0 DCEB010C */  jal        HUD_GetPlayerScreenPt
/* 6B8D4 8007B0D4 3000A427 */   addiu     $a0, $sp, 0x30
/* 6B8D8 8007B0D8 3200A287 */  lh         $v0, 0x32($sp)
/* 6B8DC 8007B0DC 00000000 */  nop
/* 6B8E0 8007B0E0 48004228 */  slti       $v0, $v0, 0x48
/* 6B8E4 8007B0E4 02004010 */  beqz       $v0, .L8007B0F0
/* 6B8E8 8007B0E8 48000224 */   addiu     $v0, $zero, 0x48
/* 6B8EC 8007B0EC 3200A2A7 */  sh         $v0, 0x32($sp)
.L8007B0F0:
/* 6B8F0 8007B0F0 21A80000 */  addu       $s5, $zero, $zero
/* 6B8F4 8007B0F4 96008286 */  lh         $v0, 0x96($s4)
/* 6B8F8 8007B0F8 92009686 */  lh         $s6, 0x92($s4)
/* 6B8FC 8007B0FC 000C5324 */  addiu      $s3, $v0, 0xC00
.L8007B100:
/* 6B900 8007B100 FF0F7332 */  andi       $s3, $s3, 0xFFF
/* 6B904 8007B104 21806002 */  addu       $s0, $s3, $zero
/* 6B908 8007B108 21200002 */  addu       $a0, $s0, $zero
/* 6B90C 8007B10C 7EE8000C */  jal        AngleDiff
/* 6B910 8007B110 000C0524 */   addiu     $a1, $zero, 0xC00
/* 6B914 8007B114 00140200 */  sll        $v0, $v0, 16
/* 6B918 8007B118 08004004 */  bltz       $v0, .L8007B13C
/* 6B91C 8007B11C 21200002 */   addu      $a0, $s0, $zero
/* 6B920 8007B120 7EE8000C */  jal        AngleDiff
/* 6B924 8007B124 000C0524 */   addiu     $a1, $zero, 0xC00
/* 6B928 8007B128 00140200 */  sll        $v0, $v0, 16
/* 6B92C 8007B12C C3130200 */  sra        $v0, $v0, 15
/* 6B930 8007B130 00100A24 */  addiu      $t2, $zero, 0x1000
/* 6B934 8007B134 55EC0108 */  j          .L8007B154
/* 6B938 8007B138 23904201 */   subu      $s2, $t2, $v0
.L8007B13C:
/* 6B93C 8007B13C 7EE8000C */  jal        AngleDiff
/* 6B940 8007B140 000C0524 */   addiu     $a1, $zero, 0xC00
/* 6B944 8007B144 00140200 */  sll        $v0, $v0, 16
/* 6B948 8007B148 C3130200 */  sra        $v0, $v0, 15
/* 6B94C 8007B14C 00100A24 */  addiu      $t2, $zero, 0x1000
/* 6B950 8007B150 21904201 */  addu       $s2, $t2, $v0
.L8007B154:
/* 6B954 8007B154 0006422A */  slti       $v0, $s2, 0x600
/* 6B958 8007B158 02004010 */  beqz       $v0, .L8007B164
/* 6B95C 8007B15C 00000000 */   nop
/* 6B960 8007B160 00061224 */  addiu      $s2, $zero, 0x600
.L8007B164:
/* 6B964 8007B164 94008286 */  lh         $v0, 0x94($s4)
/* 6B968 8007B168 00000000 */  nop
/* 6B96C 8007B16C 18005200 */  mult       $v0, $s2
/* 6B970 8007B170 12100000 */  mflo       $v0
/* 6B974 8007B174 03004104 */  bgez       $v0, .L8007B184
/* 6B978 8007B178 03930200 */   sra       $s2, $v0, 12
/* 6B97C 8007B17C FF0F4224 */  addiu      $v0, $v0, 0xFFF
/* 6B980 8007B180 03930200 */  sra        $s2, $v0, 12
.L8007B184:
/* 6B984 8007B184 DCE4010C */  jal        rcos
/* 6B988 8007B188 21206002 */   addu      $a0, $s3, $zero
/* 6B98C 8007B18C 18005600 */  mult       $v0, $s6
/* 6B990 8007B190 21206002 */  addu       $a0, $s3, $zero
/* 6B994 8007B194 3000A297 */  lhu        $v0, 0x30($sp)
/* 6B998 8007B198 12500000 */  mflo       $t2
/* 6B99C 8007B19C 031B0A00 */  sra        $v1, $t2, 12
/* 6B9A0 8007B1A0 21104300 */  addu       $v0, $v0, $v1
/* 6B9A4 8007B1A4 D0E4010C */  jal        rsin
/* 6B9A8 8007B1A8 2800A2A7 */   sh        $v0, 0x28($sp)
/* 6B9AC 8007B1AC 18005600 */  mult       $v0, $s6
/* 6B9B0 8007B1B0 12500000 */  mflo       $t2
/* 6B9B4 8007B1B4 031B0A00 */  sra        $v1, $t2, 12
/* 6B9B8 8007B1B8 02006104 */  bgez       $v1, .L8007B1C4
/* 6B9BC 8007B1BC 0100B026 */   addiu     $s0, $s5, 0x1
/* 6B9C0 8007B1C0 07006324 */  addiu      $v1, $v1, 0x7
.L8007B1C4:
/* 6B9C4 8007B1C4 21200002 */  addu       $a0, $s0, $zero
/* 6B9C8 8007B1C8 3200A297 */  lhu        $v0, 0x32($sp)
/* 6B9CC 8007B1CC C3180300 */  sra        $v1, $v1, 3
/* 6B9D0 8007B1D0 23104300 */  subu       $v0, $v0, $v1
/* 6B9D4 8007B1D4 86EB010C */  jal        _GlyphIsGlyphSet
/* 6B9D8 8007B1D8 2A00A2A7 */   sh        $v0, 0x2A($sp)
/* 6B9DC 8007B1DC 0A004010 */  beqz       $v0, .L8007B208
/* 6B9E0 8007B1E0 2188A002 */   addu      $s1, $s5, $zero
/* 6B9E4 8007B1E4 97EB010C */  jal        _GlyphIsGlyphUsable
/* 6B9E8 8007B1E8 21200002 */   addu      $a0, $s0, $zero
/* 6B9EC 8007B1EC 0C004010 */  beqz       $v0, .L8007B220
/* 6B9F0 8007B1F0 2120E002 */   addu      $a0, $s7, $zero
/* 6B9F4 8007B1F4 B2EB010C */  jal        _GlyphCost
/* 6B9F8 8007B1F8 21280002 */   addu      $a1, $s0, $zero
/* 6B9FC 8007B1FC 2A10C203 */  slt        $v0, $fp, $v0
/* 6BA00 8007B200 89EC0108 */  j          .L8007B224
/* 6BA04 8007B204 01004338 */   xori      $v1, $v0, 0x1
.L8007B208:
/* 6BA08 8007B208 07000224 */  addiu      $v0, $zero, 0x7
/* 6BA0C 8007B20C 03000212 */  beq        $s0, $v0, .L8007B21C
/* 6BA10 8007B210 21884000 */   addu      $s1, $v0, $zero
/* 6BA14 8007B214 89EC0108 */  j          .L8007B224
/* 6BA18 8007B218 01000324 */   addiu     $v1, $zero, 0x1
.L8007B21C:
/* 6BA1C 8007B21C 2188A002 */  addu       $s1, $s5, $zero
.L8007B220:
/* 6BA20 8007B220 21180000 */  addu       $v1, $zero, $zero
.L8007B224:
/* 6BA24 8007B224 0000E286 */  lh         $v0, 0x0($s7)
/* 6BA28 8007B228 00000000 */  nop
/* 6BA2C 8007B22C 18005200 */  mult       $v0, $s2
/* 6BA30 8007B230 12100000 */  mflo       $v0
/* 6BA34 8007B234 02004104 */  bgez       $v0, .L8007B240
/* 6BA38 8007B238 2800A427 */   addiu     $a0, $sp, 0x28
/* 6BA3C 8007B23C FF1F4224 */  addiu      $v0, $v0, 0x1FFF
.L8007B240:
/* 6BA40 8007B240 43330200 */  sra        $a2, $v0, 13
/* 6BA44 8007B244 21382002 */  addu       $a3, $s1, $zero
/* 6BA48 8007B248 7000AA8F */  lw         $t2, 0x70($sp)
/* 6BA4C 8007B24C B7FD7326 */  addiu      $s3, $s3, -0x249
/* 6BA50 8007B250 1000A3AF */  sw         $v1, 0x10($sp)
/* 6BA54 8007B254 1C00458D */  lw         $a1, 0x1C($t2)
/* 6BA58 8007B258 271B010C */  jal        FX_MakeGlyphIcon
/* 6BA5C 8007B25C 0100B526 */   addiu     $s5, $s5, 0x1
/* 6BA60 8007B260 0700A22A */  slti       $v0, $s5, 0x7
/* 6BA64 8007B264 A6FF4014 */  bnez       $v0, .L8007B100
/* 6BA68 8007B268 00100224 */   addiu     $v0, $zero, 0x1000
/* 6BA6C 8007B26C 90008386 */  lh         $v1, 0x90($s4)
/* 6BA70 8007B270 00000000 */  nop
/* 6BA74 8007B274 24006214 */  bne        $v1, $v0, .L8007B308
/* 6BA78 8007B278 00000000 */   nop
/* 6BA7C 8007B27C 98008386 */  lh         $v1, 0x98($s4)
/* 6BA80 8007B280 96008286 */  lh         $v0, 0x96($s4)
/* 6BA84 8007B284 00000000 */  nop
/* 6BA88 8007B288 1E006214 */  bne        $v1, $v0, .L8007B304
/* 6BA8C 8007B28C 00000000 */   nop
/* 6BA90 8007B290 8C008586 */  lh         $a1, 0x8C($s4)
/* 6BA94 8007B294 B2EB010C */  jal        _GlyphCost
/* 6BA98 8007B298 2120E002 */   addu      $a0, $s7, $zero
/* 6BA9C 8007B29C 2A10C203 */  slt        $v0, $fp, $v0
/* 6BAA0 8007B2A0 18004014 */  bnez       $v0, .L8007B304
/* 6BAA4 8007B2A4 2140C002 */   addu      $t0, $s6, $zero
/* 6BAA8 8007B2A8 3000A287 */  lh         $v0, 0x30($sp)
/* 6BAAC 8007B2AC 3200A987 */  lh         $t1, 0x32($sp)
/* 6BAB0 8007B2B0 02000105 */  bgez       $t0, .L8007B2BC
/* 6BAB4 8007B2B4 3800A2AF */   sw        $v0, 0x38($sp)
/* 6BAB8 8007B2B8 07000825 */  addiu      $t0, $t0, 0x7
.L8007B2BC:
/* 6BABC 8007B2BC 4001033C */  lui        $v1, (0x1404040 >> 16)
/* 6BAC0 8007B2C0 40406334 */  ori        $v1, $v1, (0x1404040 & 0xFFFF)
/* 6BAC4 8007B2C4 3800A427 */  addiu      $a0, $sp, 0x38
/* 6BAC8 8007B2C8 40010524 */  addiu      $a1, $zero, 0x140
/* 6BACC 8007B2CC C3100800 */  sra        $v0, $t0, 3
/* 6BAD0 8007B2D0 08BE868F */  lw         $a2, %gp_rel(gameTrackerX + 0x40)($gp)
/* 6BAD4 8007B2D4 9CBF878F */  lw         $a3, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 6BAD8 8007B2D8 21102201 */  addu       $v0, $t1, $v0
/* 6BADC 8007B2DC 3C00A2AF */  sw         $v0, 0x3C($sp)
/* 6BAE0 8007B2E0 05000224 */  addiu      $v0, $zero, 0x5
/* 6BAE4 8007B2E4 1000A2AF */  sw         $v0, 0x10($sp)
/* 6BAE8 8007B2E8 14000224 */  addiu      $v0, $zero, 0x14
/* 6BAEC 8007B2EC 1800A2AF */  sw         $v0, 0x18($sp)
/* 6BAF0 8007B2F0 18000224 */  addiu      $v0, $zero, 0x18
/* 6BAF4 8007B2F4 1400A3AF */  sw         $v1, 0x14($sp)
/* 6BAF8 8007B2F8 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 6BAFC 8007B2FC 23AE000C */  jal        DRAW_CreateAGlowingCircle
/* 6BB00 8007B300 2000A0AF */   sw        $zero, 0x20($sp)
.L8007B304:
/* 6BB04 8007B304 90008386 */  lh         $v1, 0x90($s4)
.L8007B308:
/* 6BB08 8007B308 0200E286 */  lh         $v0, 0x2($s7)
/* 6BB0C 8007B30C 00000000 */  nop
/* 6BB10 8007B310 1A006200 */  div        $zero, $v1, $v0
/* 6BB14 8007B314 12180000 */  mflo       $v1
/* 6BB18 8007B318 02000424 */  addiu      $a0, $zero, 0x2
/* 6BB1C 8007B31C 20000624 */  addiu      $a2, $zero, 0x20
/* 6BB20 8007B320 002C0300 */  sll        $a1, $v1, 16
/* 6BB24 8007B324 00120300 */  sll        $v0, $v1, 8
/* 6BB28 8007B328 2528A200 */  or         $a1, $a1, $v0
/* 6BB2C 8007B32C 181A010C */  jal        FX_DrawScreenPoly
/* 6BB30 8007B330 25286500 */   or        $a1, $v1, $a1
/* 6BB34 8007B334 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 6BB38 8007B338 6800BE8F */  lw         $fp, 0x68($sp)
/* 6BB3C 8007B33C 6400B78F */  lw         $s7, 0x64($sp)
/* 6BB40 8007B340 6000B68F */  lw         $s6, 0x60($sp)
/* 6BB44 8007B344 5C00B58F */  lw         $s5, 0x5C($sp)
/* 6BB48 8007B348 5800B48F */  lw         $s4, 0x58($sp)
/* 6BB4C 8007B34C 5400B38F */  lw         $s3, 0x54($sp)
/* 6BB50 8007B350 5000B28F */  lw         $s2, 0x50($sp)
/* 6BB54 8007B354 4C00B18F */  lw         $s1, 0x4C($sp)
/* 6BB58 8007B358 4800B08F */  lw         $s0, 0x48($sp)
/* 6BB5C 8007B35C 0800E003 */  jr         $ra
/* 6BB60 8007B360 7000BD27 */   addiu     $sp, $sp, 0x70
.size GlyphDrawMenu, . - GlyphDrawMenu
