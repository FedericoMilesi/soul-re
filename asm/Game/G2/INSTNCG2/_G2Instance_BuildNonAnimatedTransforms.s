.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Instance_BuildNonAnimatedTransforms
/* 86274 80095A74 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 86278 80095A78 1000B0AF */  sw         $s0, 0x10($sp)
/* 8627C 80095A7C 21808000 */  addu       $s0, $a0, $zero
/* 86280 80095A80 1400BFAF */  sw         $ra, 0x14($sp)
/* 86284 80095A84 1800038E */  lw         $v1, 0x18($s0)
/* 86288 80095A88 0010023C */  lui        $v0, (0x10000000 >> 16)
/* 8628C 80095A8C 24106200 */  and        $v0, $v1, $v0
/* 86290 80095A90 10004010 */  beqz       $v0, .L80095AD4
/* 86294 80095A94 0004023C */   lui       $v0, (0x4000000 >> 16)
/* 86298 80095A98 24106200 */  and        $v0, $v1, $v0
/* 8629C 80095A9C 09004014 */  bnez       $v0, .L80095AC4
/* 862A0 80095AA0 0020023C */   lui       $v0, (0x20000000 >> 16)
/* 862A4 80095AA4 24106200 */  and        $v0, $v1, $v0
/* 862A8 80095AA8 0A004010 */  beqz       $v0, .L80095AD4
/* 862AC 80095AAC 00000000 */   nop
/* 862B0 80095AB0 1400028E */  lw         $v0, 0x14($s0)
/* 862B4 80095AB4 00000000 */  nop
/* 862B8 80095AB8 00084230 */  andi       $v0, $v0, 0x800
/* 862BC 80095ABC 05004010 */  beqz       $v0, .L80095AD4
/* 862C0 80095AC0 00000000 */   nop
.L80095AC4:
/* 862C4 80095AC4 5655020C */  jal        G2Instance_ClearMatrices
/* 862C8 80095AC8 21200002 */   addu      $a0, $s0, $zero
/* 862CC 80095ACC C8560208 */  j          .L80095B20
/* 862D0 80095AD0 00000000 */   nop
.L80095AD4:
/* 862D4 80095AD4 1C00038E */  lw         $v1, 0x1C($s0)
/* 862D8 80095AD8 26010286 */  lh         $v0, 0x126($s0)
/* 862DC 80095ADC 0C00638C */  lw         $v1, 0xC($v1)
/* 862E0 80095AE0 80100200 */  sll        $v0, $v0, 2
/* 862E4 80095AE4 21104300 */  addu       $v0, $v0, $v1
/* 862E8 80095AE8 0000428C */  lw         $v0, 0x0($v0)
/* 862EC 80095AEC 00000000 */  nop
/* 862F0 80095AF0 1800448C */  lw         $a0, 0x18($v0)
/* 862F4 80095AF4 81C4000C */  jal        GAMELOOP_GetMatrices
/* 862F8 80095AF8 00000000 */   nop
/* 862FC 80095AFC 21184000 */  addu       $v1, $v0, $zero
/* 86300 80095B00 03006014 */  bnez       $v1, .L80095B10
/* 86304 80095B04 21200002 */   addu      $a0, $s0, $zero
/* 86308 80095B08 C8560208 */  j          .L80095B20
/* 8630C 80095B0C 400000AE */   sw        $zero, 0x40($s0)
.L80095B10:
/* 86310 80095B10 4000028E */  lw         $v0, 0x40($s0)
/* 86314 80095B14 400083AC */  sw         $v1, 0x40($a0)
/* 86318 80095B18 9A55020C */  jal        _G2Instance_RebuildNonAnimatedTransforms
/* 8631C 80095B1C 440082AC */   sw        $v0, 0x44($a0)
.L80095B20:
/* 86320 80095B20 1400BF8F */  lw         $ra, 0x14($sp)
/* 86324 80095B24 1000B08F */  lw         $s0, 0x10($sp)
/* 86328 80095B28 0800E003 */  jr         $ra
/* 8632C 80095B2C 1800BD27 */   addiu     $sp, $sp, 0x18
.size _G2Instance_BuildNonAnimatedTransforms, . - _G2Instance_BuildNonAnimatedTransforms
