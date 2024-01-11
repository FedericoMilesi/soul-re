.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_InstanceTransformAndDraw
/* 2B8BC 8003B0BC 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 2B8C0 8003B0C0 5000B2AF */  sw         $s2, 0x50($sp)
/* 2B8C4 8003B0C4 21908000 */  addu       $s2, $a0, $zero
/* 2B8C8 8003B0C8 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 2B8CC 8003B0CC 2188A000 */  addu       $s1, $a1, $zero
/* 2B8D0 8003B0D0 4800B0AF */  sw         $s0, 0x48($sp)
/* 2B8D4 8003B0D4 2180C000 */  addu       $s0, $a2, $zero
/* 2B8D8 8003B0D8 6400B7AF */  sw         $s7, 0x64($sp)
/* 2B8DC 8003B0DC 6800BFAF */  sw         $ra, 0x68($sp)
/* 2B8E0 8003B0E0 6000B6AF */  sw         $s6, 0x60($sp)
/* 2B8E4 8003B0E4 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 2B8E8 8003B0E8 5800B4AF */  sw         $s4, 0x58($sp)
/* 2B8EC 8003B0EC 5400B3AF */  sw         $s3, 0x54($sp)
/* 2B8F0 8003B0F0 1C00428E */  lw         $v0, 0x1C($s2)
/* 2B8F4 8003B0F4 26014386 */  lh         $v1, 0x126($s2)
/* 2B8F8 8003B0F8 4000538E */  lw         $s3, 0x40($s2)
/* 2B8FC 8003B0FC 0C00428C */  lw         $v0, 0xC($v0)
/* 2B900 8003B100 80180300 */  sll        $v1, $v1, 2
/* 2B904 8003B104 21186200 */  addu       $v1, $v1, $v0
/* 2B908 8003B108 0000748C */  lw         $s4, 0x0($v1)
/* 2B90C 8003B10C 9D006012 */  beqz       $s3, .L8003B384
/* 2B910 8003B110 21B8E000 */   addu      $s7, $a3, $zero
/* 2B914 8003B114 00080524 */  addiu      $a1, $zero, 0x800
/* 2B918 8003B118 90D7000C */  jal        LIGHT_PresetInstanceLight
/* 2B91C 8003B11C 2000A627 */   addiu     $a2, $sp, 0x20
/* 2B920 8003B120 21A80002 */  addu       $s5, $s0, $zero
/* 2B924 8003B124 8010B626 */  addiu      $s6, $s5, 0x1080
/* 2B928 8003B128 E0000524 */  addiu      $a1, $zero, 0xE0
/* 2B92C 8003B12C 0000868E */  lw         $a2, 0x0($s4)
/* 2B930 8003B130 0400908E */  lw         $s0, 0x4($s4)
/* 2B934 8003B134 40200600 */  sll        $a0, $a2, 1
/* 2B938 8003B138 2A10A400 */  slt        $v0, $a1, $a0
/* 2B93C 8003B13C 05004014 */  bnez       $v0, .L8003B154
/* 2B940 8003B140 20000324 */   addiu     $v1, $zero, 0x20
/* 2B944 8003B144 801F153C */  lui        $s5, (0x1F800080 >> 16)
/* 2B948 8003B148 8000B536 */  ori        $s5, $s5, (0x1F800080 & 0xFFFF)
/* 2B94C 8003B14C 21188300 */  addu       $v1, $a0, $v1
/* 2B950 8003B150 2328A400 */  subu       $a1, $a1, $a0
.L8003B154:
/* 2B954 8003B154 2A10A600 */  slt        $v0, $a1, $a2
/* 2B958 8003B158 03004014 */  bnez       $v0, .L8003B168
/* 2B95C 8003B15C 80180300 */   sll       $v1, $v1, 2
/* 2B960 8003B160 801F023C */  lui        $v0, (0x1F800000 >> 16)
/* 2B964 8003B164 21B06200 */  addu       $s6, $v1, $v0
.L8003B168:
/* 2B968 8003B168 39D6000C */  jal        INSTANCE_GetFadeValue
/* 2B96C 8003B16C 21204002 */   addu      $a0, $s2, $zero
/* 2B970 8003B170 21200002 */  addu       $a0, $s0, $zero
/* 2B974 8003B174 2000B027 */  addiu      $s0, $sp, 0x20
/* 2B978 8003B178 1000B3AF */  sw         $s3, 0x10($sp)
/* 2B97C 8003B17C 1400B0AF */  sw         $s0, 0x14($sp)
/* 2B980 8003B180 1800B6AF */  sw         $s6, 0x18($sp)
/* 2B984 8003B184 9802438E */  lw         $v1, 0x298($s2)
/* 2B988 8003B188 2128A002 */  addu       $a1, $s5, $zero
/* 2B98C 8003B18C 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 2B990 8003B190 6000278E */  lw         $a3, 0x60($s1)
/* 2B994 8003B194 5C9082AF */  sw         $v0, %gp_rel(modelFadeValue)($gp)
/* 2B998 8003B198 5C9C000C */  jal        PIPE3D_TransformAnimatedInstanceVertices_S
/* 2B99C 8003B19C 21308002 */   addu      $a2, $s4, $zero
/* 2B9A0 8003B1A0 21884000 */  addu       $s1, $v0, $zero
/* 2B9A4 8003B1A4 21204002 */  addu       $a0, $s2, $zero
/* 2B9A8 8003B1A8 00100524 */  addiu      $a1, $zero, 0x1000
/* 2B9AC 8003B1AC 90D7000C */  jal        LIGHT_PresetInstanceLight
/* 2B9B0 8003B1B0 21300002 */   addu      $a2, $s0, $zero
/* 2B9B4 8003B1B4 21200002 */  addu       $a0, $s0, $zero
/* 2B9B8 8003B1B8 06014586 */  lh         $a1, 0x106($s2)
/* 2B9BC 8003B1BC 21300002 */  addu       $a2, $s0, $zero
/* 2B9C0 8003B1C0 40290500 */  sll        $a1, $a1, 5
/* 2B9C4 8003B1C4 BFF7020C */  jal        MulMatrix0
/* 2B9C8 8003B1C8 21286502 */   addu      $a1, $s3, $a1
/* 2B9CC 8003B1CC 9FF7020C */  jal        SetLightMatrix
/* 2B9D0 8003B1D0 21200002 */   addu      $a0, $s0, $zero
/* 2B9D4 8003B1D4 00802232 */  andi       $v0, $s1, 0x8000
/* 2B9D8 8003B1D8 03004010 */  beqz       $v0, .L8003B1E8
/* 2B9DC 8003B1DC FF7F023C */   lui       $v0, (0x7FFF6FFF >> 16)
/* 2B9E0 8003B1E0 FF6F4234 */  ori        $v0, $v0, (0x7FFF6FFF & 0xFFFF)
/* 2B9E4 8003B1E4 24882202 */  and        $s1, $s1, $v0
.L8003B1E8:
/* 2B9E8 8003B1E8 FFEF0224 */  addiu      $v0, $zero, -0x1001
/* 2B9EC 8003B1EC 24102202 */  and        $v0, $s1, $v0
/* 2B9F0 8003B1F0 08004010 */  beqz       $v0, .L8003B214
/* 2B9F4 8003B1F4 00000000 */   nop
/* 2B9F8 8003B1F8 1C00428E */  lw         $v0, 0x1C($s2)
/* 2B9FC 8003B1FC 00000000 */  nop
/* 2BA00 8003B200 2C00428C */  lw         $v0, 0x2C($v0)
/* 2BA04 8003B204 00000000 */  nop
/* 2BA08 8003B208 00204230 */  andi       $v0, $v0, 0x2000
/* 2BA0C 8003B20C 5D004010 */  beqz       $v0, .L8003B384
/* 2BA10 8003B210 00000000 */   nop
.L8003B214:
/* 2BA14 8003B214 1000828E */  lw         $v0, 0x10($s4)
/* 2BA18 8003B218 0800E48E */  lw         $a0, 0x8($s7)
/* 2BA1C 8003B21C 40180200 */  sll        $v1, $v0, 1
/* 2BA20 8003B220 21186200 */  addu       $v1, $v1, $v0
/* 2BA24 8003B224 0400E28E */  lw         $v0, 0x4($s7)
/* 2BA28 8003B228 00190300 */  sll        $v1, $v1, 4
/* 2BA2C 8003B22C 21104300 */  addu       $v0, $v0, $v1
/* 2BA30 8003B230 2B104400 */  sltu       $v0, $v0, $a0
/* 2BA34 8003B234 53004010 */  beqz       $v0, .L8003B384
/* 2BA38 8003B238 21800000 */   addu      $s0, $zero, $zero
/* 2BA3C 8003B23C 1C00428E */  lw         $v0, 0x1C($s2)
/* 2BA40 8003B240 00000000 */  nop
/* 2BA44 8003B244 2C00428C */  lw         $v0, 0x2C($v0)
/* 2BA48 8003B248 00000000 */  nop
/* 2BA4C 8003B24C 00104230 */  andi       $v0, $v0, 0x1000
/* 2BA50 8003B250 0D004014 */  bnez       $v0, .L8003B288
/* 2BA54 8003B254 4400A0AF */   sw        $zero, 0x44($sp)
/* 2BA58 8003B258 F0AC848F */  lw         $a0, %gp_rel(theCamera + 0x60)($gp)
/* 2BA5C 8003B25C 52F2020C */  jal        SetRotMatrix
/* 2BA60 8003B260 00000000 */   nop
/* 2BA64 8003B264 F0AC848F */  lw         $a0, %gp_rel(theCamera + 0x60)($gp)
/* 2BA68 8003B268 4AF2020C */  jal        SetTransMatrix
/* 2BA6C 8003B26C 00000000 */   nop
/* 2BA70 8003B270 5C004226 */  addiu      $v0, $s2, 0x5C
/* 2BA74 8003B274 000040C8 */  lwc2       $0, 0x0($v0)
/* 2BA78 8003B278 040041C8 */  lwc2       $1, 0x4($v0)
/* 2BA7C 8003B27C 00000000 */  nop
/* 2BA80 8003B280 00000000 */  nop
/* 2BA84 8003B284 0100184A */  RTPS
.L8003B288:
/* 2BA88 8003B288 4000A227 */  addiu      $v0, $sp, 0x40
/* 2BA8C 8003B28C 000048E8 */  swc2       $8, 0x0($v0)
/* 2BA90 8003B290 72014286 */  lh         $v0, 0x172($s2)
/* 2BA94 8003B294 00000000 */  nop
/* 2BA98 8003B298 1B004010 */  beqz       $v0, .L8003B308
/* 2BA9C 8003B29C 7000023C */   lui       $v0, (0x707070 >> 16)
/* 2BAA0 8003B2A0 70704234 */  ori        $v0, $v0, (0x707070 & 0xFFFF)
/* 2BAA4 8003B2A4 4400A427 */  addiu      $a0, $sp, 0x44
/* 2BAA8 8003B2A8 54908527 */  addiu      $a1, $gp, %gp_rel(depthQBackColor)
/* 2BAAC 8003B2AC 4890908F */  lw         $s0, %gp_rel(depthQBlendStart)($gp)
/* 2BAB0 8003B2B0 5490838F */  lw         $v1, %gp_rel(depthQBackColor)($gp)
/* 2BAB4 8003B2B4 4000A68F */  lw         $a2, 0x40($sp)
/* 2BAB8 8003B2B8 00100724 */  addiu      $a3, $zero, 0x1000
/* 2BABC 8003B2BC 549082AF */  sw         $v0, %gp_rel(depthQBackColor)($gp)
/* 2BAC0 8003B2C0 4C90828F */  lw         $v0, %gp_rel(depthQFogStart)($gp)
/* 2BAC4 8003B2C4 2338E600 */  subu       $a3, $a3, $a2
/* 2BAC8 8003B2C8 4400A3AF */  sw         $v1, 0x44($sp)
/* 2BACC 8003B2CC 489082AF */  sw         $v0, %gp_rel(depthQBlendStart)($gp)
/* 2BAD0 8003B2D0 A8F3020C */  jal        LoadAverageCol
/* 2BAD4 8003B2D4 1000A5AF */   sw        $a1, 0x10($sp)
/* 2BAD8 8003B2D8 72014286 */  lh         $v0, 0x172($s2)
/* 2BADC 8003B2DC 4000A38F */  lw         $v1, 0x40($sp)
/* 2BAE0 8003B2E0 00000000 */  nop
/* 2BAE4 8003B2E4 2A104300 */  slt        $v0, $v0, $v1
/* 2BAE8 8003B2E8 04004010 */  beqz       $v0, .L8003B2FC
/* 2BAEC 8003B2EC 00000000 */   nop
/* 2BAF0 8003B2F0 00408348 */  mtc2       $v1, $8 # handwritten instruction
/* 2BAF4 8003B2F4 C2EC0008 */  j          .L8003B308
/* 2BAF8 8003B2F8 00000000 */   nop
.L8003B2FC:
/* 2BAFC 8003B2FC 72014896 */  lhu        $t0, 0x172($s2)
/* 2BB00 8003B300 00000000 */  nop
/* 2BB04 8003B304 00408848 */  mtc2       $t0, $8 # handwritten instruction
.L8003B308:
/* 2BB08 8003B308 5C90828F */  lw         $v0, %gp_rel(modelFadeValue)($gp)
/* 2BB0C 8003B30C 00000000 */  nop
/* 2BB10 8003B310 FE0F4228 */  slti       $v0, $v0, 0xFFE
/* 2BB14 8003B314 14004010 */  beqz       $v0, .L8003B368
/* 2BB18 8003B318 00000000 */   nop
/* 2BB1C 8003B31C 1C00428E */  lw         $v0, 0x1C($s2)
/* 2BB20 8003B320 00000000 */  nop
/* 2BB24 8003B324 2C00428C */  lw         $v0, 0x2C($v0)
/* 2BB28 8003B328 00000000 */  nop
/* 2BB2C 8003B32C 00104230 */  andi       $v0, $v0, 0x1000
/* 2BB30 8003B330 06004014 */  bnez       $v0, .L8003B34C
/* 2BB34 8003B334 21208002 */   addu      $a0, $s4, $zero
/* 2BB38 8003B338 4000A28F */  lw         $v0, 0x40($sp)
/* 2BB3C 8003B33C 00000000 */  nop
/* 2BB40 8003B340 FA0F4228 */  slti       $v0, $v0, 0xFFA
/* 2BB44 8003B344 08004010 */  beqz       $v0, .L8003B368
/* 2BB48 8003B348 00000000 */   nop
.L8003B34C:
/* 2BB4C 8003B34C 2128A002 */  addu       $a1, $s5, $zero
/* 2BB50 8003B350 14BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x14C)($gp)
/* 2BB54 8003B354 8000A78F */  lw         $a3, 0x80($sp)
/* 2BB58 8003B358 2130E002 */  addu       $a2, $s7, $zero
/* 2BB5C 8003B35C 09F84000 */  jalr       $v0
/* 2BB60 8003B360 1000B6AF */   sw        $s6, 0x10($sp)
/* 2BB64 8003B364 0400E2AE */  sw         $v0, 0x4($s7)
.L8003B368:
/* 2BB68 8003B368 72014286 */  lh         $v0, 0x172($s2)
/* 2BB6C 8003B36C 00000000 */  nop
/* 2BB70 8003B370 04004010 */  beqz       $v0, .L8003B384
/* 2BB74 8003B374 00000000 */   nop
/* 2BB78 8003B378 4400A28F */  lw         $v0, 0x44($sp)
/* 2BB7C 8003B37C 489090AF */  sw         $s0, %gp_rel(depthQBlendStart)($gp)
/* 2BB80 8003B380 549082AF */  sw         $v0, %gp_rel(depthQBackColor)($gp)
.L8003B384:
/* 2BB84 8003B384 6800BF8F */  lw         $ra, 0x68($sp)
/* 2BB88 8003B388 6400B78F */  lw         $s7, 0x64($sp)
/* 2BB8C 8003B38C 6000B68F */  lw         $s6, 0x60($sp)
/* 2BB90 8003B390 5C00B58F */  lw         $s5, 0x5C($sp)
/* 2BB94 8003B394 5800B48F */  lw         $s4, 0x58($sp)
/* 2BB98 8003B398 5400B38F */  lw         $s3, 0x54($sp)
/* 2BB9C 8003B39C 5000B28F */  lw         $s2, 0x50($sp)
/* 2BBA0 8003B3A0 4C00B18F */  lw         $s1, 0x4C($sp)
/* 2BBA4 8003B3A4 4800B08F */  lw         $s0, 0x48($sp)
/* 2BBA8 8003B3A8 0800E003 */  jr         $ra
/* 2BBAC 8003B3AC 7000BD27 */   addiu     $sp, $sp, 0x70
.size PIPE3D_InstanceTransformAndDraw, . - PIPE3D_InstanceTransformAndDraw
