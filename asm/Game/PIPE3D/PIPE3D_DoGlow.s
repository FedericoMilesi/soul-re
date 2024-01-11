.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_DoGlow
/* 2D024 8003C824 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2D028 8003C828 3000B2AF */  sw         $s2, 0x30($sp)
/* 2D02C 8003C82C 21908000 */  addu       $s2, $a0, $zero
/* 2D030 8003C830 3400B3AF */  sw         $s3, 0x34($sp)
/* 2D034 8003C834 2198E000 */  addu       $s3, $a3, $zero
/* 2D038 8003C838 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 2D03C 8003C83C 3800B4AF */  sw         $s4, 0x38($sp)
/* 2D040 8003C840 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 2D044 8003C844 2800B0AF */  sw         $s0, 0x28($sp)
/* 2D048 8003C848 1400428E */  lw         $v0, 0x14($s2)
/* 2D04C 8003C84C 5000B48F */  lw         $s4, 0x50($sp)
/* 2D050 8003C850 5400B18F */  lw         $s1, 0x54($sp)
/* 2D054 8003C854 00024230 */  andi       $v0, $v0, 0x200
/* 2D058 8003C858 E1004010 */  beqz       $v0, .L8003CBE0
/* 2D05C 8003C85C 21380000 */   addu      $a3, $zero, $zero
/* 2D060 8003C860 6210033C */  lui        $v1, (0x10624DD3 >> 16)
/* 2D064 8003C864 1000248E */  lw         $a0, 0x10($s1)
/* 2D068 8003C868 04C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x23C)($gp)
/* 2D06C 8003C86C D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* 2D070 8003C870 21208200 */  addu       $a0, $a0, $v0
/* 2D074 8003C874 19008300 */  multu      $a0, $v1
/* 2D078 8003C878 1C002586 */  lh         $a1, 0x1C($s1)
/* 2D07C 8003C87C 10400000 */  mfhi       $t0
/* 2D080 8003C880 C21A0800 */  srl        $v1, $t0, 11
/* 2D084 8003C884 40110300 */  sll        $v0, $v1, 5
/* 2D088 8003C888 23104300 */  subu       $v0, $v0, $v1
/* 2D08C 8003C88C 80100200 */  sll        $v0, $v0, 2
/* 2D090 8003C890 21104300 */  addu       $v0, $v0, $v1
/* 2D094 8003C894 00120200 */  sll        $v0, $v0, 8
/* 2D098 8003C898 23188200 */  subu       $v1, $a0, $v0
/* 2D09C 8003C89C 0200A228 */  slti       $v0, $a1, 0x2
/* 2D0A0 8003C8A0 52004014 */  bnez       $v0, .L8003C9EC
/* 2D0A4 8003C8A4 100023AE */   sw        $v1, 0x10($s1)
/* 2D0A8 8003C8A8 1E002286 */  lh         $v0, 0x1E($s1)
/* 2D0AC 8003C8AC 00000000 */  nop
/* 2D0B0 8003C8B0 18004500 */  mult       $v0, $a1
/* 2D0B4 8003C8B4 12480000 */  mflo       $t1
/* 2D0B8 8003C8B8 00000000 */  nop
/* 2D0BC 8003C8BC 00000000 */  nop
/* 2D0C0 8003C8C0 1B006900 */  divu       $zero, $v1, $t1
/* 2D0C4 8003C8C4 10180000 */  mfhi       $v1
/* 2D0C8 8003C8C8 1E002286 */  lh         $v0, 0x1E($s1)
/* 2D0CC 8003C8CC 00000000 */  nop
/* 2D0D0 8003C8D0 1B006200 */  divu       $zero, $v1, $v0
/* 2D0D4 8003C8D4 12100000 */  mflo       $v0
/* 2D0D8 8003C8D8 00000000 */  nop
/* 2D0DC 8003C8DC 00000000 */  nop
/* 2D0E0 8003C8E0 1B004500 */  divu       $zero, $v0, $a1
/* 2D0E4 8003C8E4 10300000 */  mfhi       $a2
/* 2D0E8 8003C8E8 00000000 */  nop
/* 2D0EC 8003C8EC 0300C014 */  bnez       $a2, .L8003C8FC
/* 2D0F0 8003C8F0 100023AE */   sw        $v1, 0x10($s1)
/* 2D0F4 8003C8F4 40F20008 */  j          .L8003C900
/* 2D0F8 8003C8F8 FFFFA524 */   addiu     $a1, $a1, -0x1
.L8003C8FC:
/* 2D0FC 8003C8FC FFFFC524 */  addiu      $a1, $a2, -0x1
.L8003C900:
/* 2D100 8003C900 1E002486 */  lh         $a0, 0x1E($s1)
/* 2D104 8003C904 1000238E */  lw         $v1, 0x10($s1)
/* 2D108 8003C908 01008224 */  addiu      $v0, $a0, 0x1
/* 2D10C 8003C90C 1B006200 */  divu       $zero, $v1, $v0
/* 2D110 8003C910 10100000 */  mfhi       $v0
/* 2D114 8003C914 00000000 */  nop
/* 2D118 8003C918 00130200 */  sll        $v0, $v0, 12
/* 2D11C 8003C91C 1B004400 */  divu       $zero, $v0, $a0
/* 2D120 8003C920 12200000 */  mflo       $a0
/* 2D124 8003C924 00000000 */  nop
/* 2D128 8003C928 00108228 */  slti       $v0, $a0, 0x1000
/* 2D12C 8003C92C 02004014 */  bnez       $v0, .L8003C938
/* 2D130 8003C930 00100224 */   addiu     $v0, $zero, 0x1000
/* 2D134 8003C934 21200000 */  addu       $a0, $zero, $zero
.L8003C938:
/* 2D138 8003C938 23104400 */  subu       $v0, $v0, $a0
/* 2D13C 8003C93C 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 2D140 8003C940 1400238E */  lw         $v1, 0x14($s1)
/* 2D144 8003C944 80280500 */  sll        $a1, $a1, 2
/* 2D148 8003C948 21106500 */  addu       $v0, $v1, $a1
/* 2D14C 8003C94C 00004C90 */  lbu        $t4, 0x0($v0)
/* 2D150 8003C950 01004D90 */  lbu        $t5, 0x1($v0)
/* 2D154 8003C954 02004E90 */  lbu        $t6, 0x2($v0)
/* 2D158 8003C958 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 2D15C 8003C95C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 2D160 8003C960 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 2D164 8003C964 00000000 */  nop
/* 2D168 8003C968 00000000 */  nop
/* 2D16C 8003C96C 3D00984B */  GPF        1
/* 2D170 8003C970 00408448 */  mtc2       $a0, $8 # handwritten instruction
/* 2D174 8003C974 80100600 */  sll        $v0, $a2, 2
/* 2D178 8003C978 21186200 */  addu       $v1, $v1, $v0
/* 2D17C 8003C97C 00006C90 */  lbu        $t4, 0x0($v1)
/* 2D180 8003C980 01006D90 */  lbu        $t5, 0x1($v1)
/* 2D184 8003C984 02006E90 */  lbu        $t6, 0x2($v1)
/* 2D188 8003C988 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 2D18C 8003C98C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 2D190 8003C990 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 2D194 8003C994 00000000 */  nop
/* 2D198 8003C998 00000000 */  nop
/* 2D19C 8003C99C 3E00A84B */  GPL        1
/* 2D1A0 8003C9A0 18002226 */  addiu      $v0, $s1, 0x18
/* 2D1A4 8003C9A4 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 2D1A8 8003C9A8 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 2D1AC 8003C9AC 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 2D1B0 8003C9B0 00004CA0 */  sb         $t4, 0x0($v0)
/* 2D1B4 8003C9B4 01004DA0 */  sb         $t5, 0x1($v0)
/* 2D1B8 8003C9B8 02004EA0 */  sb         $t6, 0x2($v0)
/* 2D1BC 8003C9BC FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 2D1C0 8003C9C0 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 2D1C4 8003C9C4 1800248E */  lw         $a0, 0x18($s1)
/* 2D1C8 8003C9C8 1400228E */  lw         $v0, 0x14($s1)
/* 2D1CC 8003C9CC 24208300 */  and        $a0, $a0, $v1
/* 2D1D0 8003C9D0 2128A200 */  addu       $a1, $a1, $v0
/* 2D1D4 8003C9D4 180024AE */  sw         $a0, 0x18($s1)
/* 2D1D8 8003C9D8 0000A28C */  lw         $v0, 0x0($a1)
/* 2D1DC 8003C9DC 00FF033C */  lui        $v1, (0xFF000000 >> 16)
/* 2D1E0 8003C9E0 24104300 */  and        $v0, $v0, $v1
/* 2D1E4 8003C9E4 25208200 */  or         $a0, $a0, $v0
/* 2D1E8 8003C9E8 180024AE */  sw         $a0, 0x18($s1)
.L8003C9EC:
/* 2D1EC 8003C9EC 4000428E */  lw         $v0, 0x40($s2)
/* 2D1F0 8003C9F0 00000000 */  nop
/* 2D1F4 8003C9F4 7A004010 */  beqz       $v0, .L8003CBE0
/* 2D1F8 8003C9F8 00000000 */   nop
/* 2D1FC 8003C9FC 4400428E */  lw         $v0, 0x44($s2)
/* 2D200 8003CA00 00000000 */  nop
/* 2D204 8003CA04 76004010 */  beqz       $v0, .L8003CBE0
/* 2D208 8003CA08 00000000 */   nop
/* 2D20C 8003CA0C 04014486 */  lh         $a0, 0x104($s2)
/* 2D210 8003CA10 00000000 */  nop
/* 2D214 8003CA14 05008014 */  bnez       $a0, .L8003CA2C
/* 2D218 8003CA18 21800000 */   addu      $s0, $zero, $zero
/* 2D21C 8003CA1C D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 2D220 8003CA20 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 2D224 8003CA24 0D006210 */  beq        $v1, $v0, .L8003CA5C
/* 2D228 8003CA28 00000000 */   nop
.L8003CA2C:
/* 2D22C 8003CA2C D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 2D230 8003CA30 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 2D234 8003CA34 06006210 */  beq        $v1, $v0, .L8003CA50
/* 2D238 8003CA38 01001024 */   addiu     $s0, $zero, 0x1
/* 2D23C 8003CA3C 39D6000C */  jal        INSTANCE_GetFadeValue
/* 2D240 8003CA40 21204002 */   addu      $a0, $s2, $zero
/* 2D244 8003CA44 00100324 */  addiu      $v1, $zero, 0x1000
/* 2D248 8003CA48 ADF20008 */  j          .L8003CAB4
/* 2D24C 8003CA4C 23386200 */   subu      $a3, $v1, $v0
.L8003CA50:
/* 2D250 8003CA50 00100224 */  addiu      $v0, $zero, 0x1000
/* 2D254 8003CA54 ADF20008 */  j          .L8003CAB4
/* 2D258 8003CA58 23384400 */   subu      $a3, $v0, $a0
.L8003CA5C:
/* 2D25C 8003CA5C 0E002486 */  lh         $a0, 0xE($s1)
/* 2D260 8003CA60 00000000 */  nop
/* 2D264 8003CA64 13008004 */  bltz       $a0, .L8003CAB4
/* 2D268 8003CA68 00000000 */   nop
/* 2D26C 8003CA6C 28002386 */  lh         $v1, 0x28($s1)
/* 2D270 8003CA70 1000258E */  lw         $a1, 0x10($s1)
/* 2D274 8003CA74 00000000 */  nop
/* 2D278 8003CA78 2B10A300 */  sltu       $v0, $a1, $v1
/* 2D27C 8003CA7C 05004010 */  beqz       $v0, .L8003CA94
/* 2D280 8003CA80 00130500 */   sll       $v0, $a1, 12
/* 2D284 8003CA84 1B004300 */  divu       $zero, $v0, $v1
/* 2D288 8003CA88 12380000 */  mflo       $a3
/* 2D28C 8003CA8C ADF20008 */  j          .L8003CAB4
/* 2D290 8003CA90 01001024 */   addiu     $s0, $zero, 0x1
.L8003CA94:
/* 2D294 8003CA94 2A002386 */  lh         $v1, 0x2A($s1)
/* 2D298 8003CA98 00000000 */  nop
/* 2D29C 8003CA9C 2A108300 */  slt        $v0, $a0, $v1
/* 2D2A0 8003CAA0 04004010 */  beqz       $v0, .L8003CAB4
/* 2D2A4 8003CAA4 00130400 */   sll       $v0, $a0, 12
/* 2D2A8 8003CAA8 01001024 */  addiu      $s0, $zero, 0x1
/* 2D2AC 8003CAAC 1A004300 */  div        $zero, $v0, $v1
/* 2D2B0 8003CAB0 12380000 */  mflo       $a3
.L8003CAB4:
/* 2D2B4 8003CAB4 1F000012 */  beqz       $s0, .L8003CB34
/* 2D2B8 8003CAB8 00000000 */   nop
/* 2D2BC 8003CABC 00408748 */  mtc2       $a3, $8 # handwritten instruction
/* 2D2C0 8003CAC0 18002226 */  addiu      $v0, $s1, 0x18
/* 2D2C4 8003CAC4 00004C90 */  lbu        $t4, 0x0($v0)
/* 2D2C8 8003CAC8 01004D90 */  lbu        $t5, 0x1($v0)
/* 2D2CC 8003CACC 02004E90 */  lbu        $t6, 0x2($v0)
/* 2D2D0 8003CAD0 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 2D2D4 8003CAD4 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 2D2D8 8003CAD8 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 2D2DC 8003CADC 00000000 */  nop
/* 2D2E0 8003CAE0 00000000 */  nop
/* 2D2E4 8003CAE4 3D00984B */  GPF        1
/* 2D2E8 8003CAE8 2000A227 */  addiu      $v0, $sp, 0x20
/* 2D2EC 8003CAEC 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 2D2F0 8003CAF0 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 2D2F4 8003CAF4 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 2D2F8 8003CAF8 00004CA0 */  sb         $t4, 0x0($v0)
/* 2D2FC 8003CAFC 01004DA0 */  sb         $t5, 0x1($v0)
/* 2D300 8003CB00 02004EA0 */  sb         $t6, 0x2($v0)
/* 2D304 8003CB04 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 2D308 8003CB08 2000A28F */  lw         $v0, 0x20($sp)
/* 2D30C 8003CB0C FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 2D310 8003CB10 24184300 */  and        $v1, $v0, $v1
/* 2D314 8003CB14 2000A3AF */  sw         $v1, 0x20($sp)
/* 2D318 8003CB18 1800228E */  lw         $v0, 0x18($s1)
/* 2D31C 8003CB1C 0001043C */  lui        $a0, (0x1000000 >> 16)
/* 2D320 8003CB20 24104400 */  and        $v0, $v0, $a0
/* 2D324 8003CB24 06004010 */  beqz       $v0, .L8003CB40
/* 2D328 8003CB28 25106400 */   or        $v0, $v1, $a0
/* 2D32C 8003CB2C D0F20008 */  j          .L8003CB40
/* 2D330 8003CB30 2000A2AF */   sw        $v0, 0x20($sp)
.L8003CB34:
/* 2D334 8003CB34 1800228E */  lw         $v0, 0x18($s1)
/* 2D338 8003CB38 00000000 */  nop
/* 2D33C 8003CB3C 2000A2AF */  sw         $v0, 0x20($sp)
.L8003CB40:
/* 2D340 8003CB40 24002392 */  lbu        $v1, 0x24($s1)
/* 2D344 8003CB44 01000224 */  addiu      $v0, $zero, 0x1
/* 2D348 8003CB48 0E006214 */  bne        $v1, $v0, .L8003CB84
/* 2D34C 8003CB4C 21204002 */   addu      $a0, $s2, $zero
/* 2D350 8003CB50 26002586 */  lh         $a1, 0x26($s1)
/* 2D354 8003CB54 2000A28F */  lw         $v0, 0x20($sp)
/* 2D358 8003CB58 00000000 */  nop
/* 2D35C 8003CB5C 1000A2AF */  sw         $v0, 0x10($sp)
/* 2D360 8003CB60 20002286 */  lh         $v0, 0x20($s1)
/* 2D364 8003CB64 21306002 */  addu       $a2, $s3, $zero
/* 2D368 8003CB68 1400A2AF */  sw         $v0, 0x14($sp)
/* 2D36C 8003CB6C 22002286 */  lh         $v0, 0x22($s1)
/* 2D370 8003CB70 21388002 */  addu       $a3, $s4, $zero
/* 2D374 8003CB74 E9AF000C */  jal        DRAW_DrawGlowPoint
/* 2D378 8003CB78 1800A2AF */   sw        $v0, 0x18($sp)
/* 2D37C 8003CB7C F8F20008 */  j          .L8003CBE0
/* 2D380 8003CB80 040062AE */   sw        $v0, 0x4($s3)
.L8003CB84:
/* 2D384 8003CB84 26003086 */  lh         $s0, 0x26($s1)
/* 2D388 8003CB88 24002292 */  lbu        $v0, 0x24($s1)
/* 2D38C 8003CB8C F4F20008 */  j          .L8003CBD0
/* 2D390 8003CB90 21100202 */   addu      $v0, $s0, $v0
.L8003CB94:
/* 2D394 8003CB94 25002692 */  lbu        $a2, 0x25($s1)
/* 2D398 8003CB98 21280002 */  addu       $a1, $s0, $zero
/* 2D39C 8003CB9C 1000B4AF */  sw         $s4, 0x10($sp)
/* 2D3A0 8003CBA0 2000A28F */  lw         $v0, 0x20($sp)
/* 2D3A4 8003CBA4 21386002 */  addu       $a3, $s3, $zero
/* 2D3A8 8003CBA8 1400A2AF */  sw         $v0, 0x14($sp)
/* 2D3AC 8003CBAC 22002286 */  lh         $v0, 0x22($s1)
/* 2D3B0 8003CBB0 21300602 */  addu       $a2, $s0, $a2
/* 2D3B4 8003CBB4 8EAF000C */  jal        DRAW_DrawGlowPoints2
/* 2D3B8 8003CBB8 1800A2AF */   sw        $v0, 0x18($sp)
/* 2D3BC 8003CBBC 040062AE */  sw         $v0, 0x4($s3)
/* 2D3C0 8003CBC0 26002286 */  lh         $v0, 0x26($s1)
/* 2D3C4 8003CBC4 24002392 */  lbu        $v1, 0x24($s1)
/* 2D3C8 8003CBC8 01001026 */  addiu      $s0, $s0, 0x1
/* 2D3CC 8003CBCC 21104300 */  addu       $v0, $v0, $v1
.L8003CBD0:
/* 2D3D0 8003CBD0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 2D3D4 8003CBD4 2A100202 */  slt        $v0, $s0, $v0
/* 2D3D8 8003CBD8 EEFF4014 */  bnez       $v0, .L8003CB94
/* 2D3DC 8003CBDC 21204002 */   addu      $a0, $s2, $zero
.L8003CBE0:
/* 2D3E0 8003CBE0 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 2D3E4 8003CBE4 3800B48F */  lw         $s4, 0x38($sp)
/* 2D3E8 8003CBE8 3400B38F */  lw         $s3, 0x34($sp)
/* 2D3EC 8003CBEC 3000B28F */  lw         $s2, 0x30($sp)
/* 2D3F0 8003CBF0 2C00B18F */  lw         $s1, 0x2C($sp)
/* 2D3F4 8003CBF4 2800B08F */  lw         $s0, 0x28($sp)
/* 2D3F8 8003CBF8 0800E003 */  jr         $ra
/* 2D3FC 8003CBFC 4000BD27 */   addiu     $sp, $sp, 0x40
.size PIPE3D_DoGlow, . - PIPE3D_DoGlow
