.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessInteractiveMusic
/* A3220 800B2A20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A3224 800B2A24 1800BFAF */  sw         $ra, 0x18($sp)
/* A3228 800B2A28 1400B1AF */  sw         $s1, 0x14($sp)
/* A322C 800B2A2C 1000B0AF */  sw         $s0, 0x10($sp)
/* A3230 800B2A30 3800848C */  lw         $a0, 0x38($a0)
/* A3234 800B2A34 1C66010C */  jal        STREAM_GetLevelWithID
/* A3238 800B2A38 00000000 */   nop
/* A323C 800B2A3C 21884000 */  addu       $s1, $v0, $zero
/* A3240 800B2A40 CC00258E */  lw         $a1, 0xCC($s1)
/* A3244 800B2A44 06000424 */  addiu      $a0, $zero, 0x6
/* A3248 800B2A48 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A324C 800B2A4C 0200A530 */   andi      $a1, $a1, 0x2
/* A3250 800B2A50 CC00258E */  lw         $a1, 0xCC($s1)
/* A3254 800B2A54 09000424 */  addiu      $a0, $zero, 0x9
/* A3258 800B2A58 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A325C 800B2A5C 0002A530 */   andi      $a1, $a1, 0x200
/* A3260 800B2A60 CC00258E */  lw         $a1, 0xCC($s1)
/* A3264 800B2A64 0A000424 */  addiu      $a0, $zero, 0xA
/* A3268 800B2A68 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A326C 800B2A6C 0001A530 */   andi      $a1, $a1, 0x100
/* A3270 800B2A70 CC00258E */  lw         $a1, 0xCC($s1)
/* A3274 800B2A74 07000424 */  addiu      $a0, $zero, 0x7
/* A3278 800B2A78 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A327C 800B2A7C 4000A530 */   andi      $a1, $a1, 0x40
/* A3280 800B2A80 CC00258E */  lw         $a1, 0xCC($s1)
/* A3284 800B2A84 08000424 */  addiu      $a0, $zero, 0x8
/* A3288 800B2A88 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A328C 800B2A8C 8000A530 */   andi      $a1, $a1, 0x80
/* A3290 800B2A90 CC00258E */  lw         $a1, 0xCC($s1)
/* A3294 800B2A94 0B000424 */  addiu      $a0, $zero, 0xB
/* A3298 800B2A98 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A329C 800B2A9C 0004A530 */   andi      $a1, $a1, 0x400
/* A32A0 800B2AA0 CC00258E */  lw         $a1, 0xCC($s1)
/* A32A4 800B2AA4 0E000424 */  addiu      $a0, $zero, 0xE
/* A32A8 800B2AA8 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A32AC 800B2AAC 0040A530 */   andi      $a1, $a1, 0x4000
/* A32B0 800B2AB0 CC00238E */  lw         $v1, 0xCC($s1)
/* A32B4 800B2AB4 00000000 */  nop
/* A32B8 800B2AB8 02006230 */  andi       $v0, $v1, 0x2
/* A32BC 800B2ABC 0C004010 */  beqz       $v0, .L800B2AF0
/* A32C0 800B2AC0 C0006230 */   andi      $v0, $v1, 0xC0
/* A32C4 800B2AC4 0A004014 */  bnez       $v0, .L800B2AF0
/* A32C8 800B2AC8 00000000 */   nop
/* A32CC 800B2ACC BEB7000C */  jal        GAMELOOP_GetTimeOfDay
/* A32D0 800B2AD0 00000000 */   nop
/* A32D4 800B2AD4 07000424 */  addiu      $a0, $zero, 0x7
/* A32D8 800B2AD8 6C075038 */  xori       $s0, $v0, 0x76C
/* A32DC 800B2ADC 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A32E0 800B2AE0 2B281000 */   sltu      $a1, $zero, $s0
/* A32E4 800B2AE4 08000424 */  addiu      $a0, $zero, 0x8
/* A32E8 800B2AE8 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A32EC 800B2AEC 0100052E */   sltiu     $a1, $s0, 0x1
.L800B2AF0:
/* A32F0 800B2AF0 68FA858F */  lw         $a1, %gp_rel(Raziel + 0x438)($gp)
/* A32F4 800B2AF4 0C000424 */  addiu      $a0, $zero, 0xC
/* A32F8 800B2AF8 0200A538 */  xori       $a1, $a1, 0x2
/* A32FC 800B2AFC 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A3300 800B2B00 0100A52C */   sltiu     $a1, $a1, 0x1
/* A3304 800B2B04 05000424 */  addiu      $a0, $zero, 0x5
/* A3308 800B2B08 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A330C 800B2B0C 0400053C */  lui        $a1, (0x40000 >> 16)
/* A3310 800B2B10 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A3314 800B2B14 24284500 */   and       $a1, $v0, $a1
/* A3318 800B2B18 CC00248E */  lw         $a0, 0xCC($s1)
/* A331C 800B2B1C 00000000 */  nop
/* A3320 800B2B20 10008230 */  andi       $v0, $a0, 0x10
/* A3324 800B2B24 06004014 */  bnez       $v0, .L800B2B40
/* A3328 800B2B28 0002033C */   lui       $v1, (0x2000000 >> 16)
/* A332C 800B2B2C 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A3330 800B2B30 00000000 */  nop
/* A3334 800B2B34 24104300 */  and        $v0, $v0, $v1
/* A3338 800B2B38 03004010 */  beqz       $v0, .L800B2B48
/* A333C 800B2B3C 08008230 */   andi      $v0, $a0, 0x8
.L800B2B40:
/* A3340 800B2B40 E1CA0208 */  j          .L800B2B84
/* A3344 800B2B44 03000424 */   addiu     $a0, $zero, 0x3
.L800B2B48:
/* A3348 800B2B48 06004014 */  bnez       $v0, .L800B2B64
/* A334C 800B2B4C 00000000 */   nop
/* A3350 800B2B50 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* A3354 800B2B54 00000000 */  nop
/* A3358 800B2B58 20004230 */  andi       $v0, $v0, 0x20
/* A335C 800B2B5C 03004010 */  beqz       $v0, .L800B2B6C
/* A3360 800B2B60 04008230 */   andi      $v0, $a0, 0x4
.L800B2B64:
/* A3364 800B2B64 E1CA0208 */  j          .L800B2B84
/* A3368 800B2B68 02000424 */   addiu     $a0, $zero, 0x2
.L800B2B6C:
/* A336C 800B2B6C 03004010 */  beqz       $v0, .L800B2B7C
/* A3370 800B2B70 20008230 */   andi      $v0, $a0, 0x20
/* A3374 800B2B74 E1CA0208 */  j          .L800B2B84
/* A3378 800B2B78 01000424 */   addiu     $a0, $zero, 0x1
.L800B2B7C:
/* A337C 800B2B7C 09004010 */  beqz       $v0, .L800B2BA4
/* A3380 800B2B80 04000424 */   addiu     $a0, $zero, 0x4
.L800B2B84:
/* A3384 800B2B84 88FB828F */  lw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* A3388 800B2B88 E1FF0324 */  addiu      $v1, $zero, -0x1F
/* A338C 800B2B8C 24104300 */  and        $v0, $v0, $v1
/* A3390 800B2B90 88FB82AF */  sw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* A3394 800B2B94 799F020C */  jal        RAZIEL_SetInteractiveMusic
/* A3398 800B2B98 01000524 */   addiu     $a1, $zero, 0x1
/* A339C 800B2B9C EFCA0208 */  j          .L800B2BBC
/* A33A0 800B2BA0 00000000 */   nop
.L800B2BA4:
/* A33A4 800B2BA4 88FB828F */  lw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* A33A8 800B2BA8 E1FF0324 */  addiu      $v1, $zero, -0x1F
/* A33AC 800B2BAC 24104300 */  and        $v0, $v0, $v1
/* A33B0 800B2BB0 88FB82AF */  sw         $v0, %gp_rel(Raziel + 0x558)($gp)
/* A33B4 800B2BB4 3604010C */  jal        SOUND_SetMusicModifier
/* A33B8 800B2BB8 21200000 */   addu      $a0, $zero, $zero
.L800B2BBC:
/* A33BC 800B2BBC 1800BF8F */  lw         $ra, 0x18($sp)
/* A33C0 800B2BC0 1400B18F */  lw         $s1, 0x14($sp)
/* A33C4 800B2BC4 1000B08F */  lw         $s0, 0x10($sp)
/* A33C8 800B2BC8 0800E003 */  jr         $ra
/* A33CC 800B2BCC 2000BD27 */   addiu     $sp, $sp, 0x20
.size ProcessInteractiveMusic, . - ProcessInteractiveMusic
