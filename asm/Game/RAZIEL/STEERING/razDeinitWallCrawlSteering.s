.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razDeinitWallCrawlSteering
/* 939E4 800A31E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 939E8 800A31E8 1000B0AF */  sw         $s0, 0x10($sp)
/* 939EC 800A31EC 21808000 */  addu       $s0, $a0, $zero
/* 939F0 800A31F0 1400B1AF */  sw         $s1, 0x14($sp)
/* 939F4 800A31F4 C8011126 */  addiu      $s1, $s0, 0x1C8
/* 939F8 800A31F8 21202002 */  addu       $a0, $s1, $zero
/* 939FC 800A31FC 01000524 */  addiu      $a1, $zero, 0x1
/* 93A00 800A3200 1800BFAF */  sw         $ra, 0x18($sp)
/* 93A04 800A3204 8D41020C */  jal        G2Anim_DisableController
/* 93A08 800A3208 26000624 */   addiu     $a2, $zero, 0x26
/* 93A0C 800A320C 60000296 */  lhu        $v0, 0x60($s0)
/* 93A10 800A3210 21202002 */  addu       $a0, $s1, $zero
/* 93A14 800A3214 C2FE4224 */  addiu      $v0, $v0, -0x13E
/* 93A18 800A3218 600002A6 */  sh         $v0, 0x60($s0)
/* 93A1C 800A321C 68000296 */  lhu        $v0, 0x68($s0)
/* 93A20 800A3220 4000038E */  lw         $v1, 0x40($s0)
/* 93A24 800A3224 C2FE4224 */  addiu      $v0, $v0, -0x13E
/* 93A28 800A3228 680002A6 */  sh         $v0, 0x68($s0)
/* 93A2C 800A322C 1C00628C */  lw         $v0, 0x1C($v1)
/* 93A30 800A3230 21280000 */  addu       $a1, $zero, $zero
/* 93A34 800A3234 C2FE4224 */  addiu      $v0, $v0, -0x13E
/* 93A38 800A3238 1C0062AC */  sw         $v0, 0x1C($v1)
/* 93A3C 800A323C 4400038E */  lw         $v1, 0x44($s0)
/* 93A40 800A3240 0E000624 */  addiu      $a2, $zero, 0xE
/* 93A44 800A3244 1C00628C */  lw         $v0, 0x1C($v1)
/* 93A48 800A3248 2C010724 */  addiu      $a3, $zero, 0x12C
/* 93A4C 800A324C C2FE4224 */  addiu      $v0, $v0, -0x13E
/* 93A50 800A3250 9D41020C */  jal        G2Anim_InterpDisableController
/* 93A54 800A3254 1C0062AC */   sw        $v0, 0x1C($v1)
/* 93A58 800A3258 21202002 */  addu       $a0, $s1, $zero
/* 93A5C 800A325C 21280000 */  addu       $a1, $zero, $zero
/* 93A60 800A3260 08000624 */  addiu      $a2, $zero, 0x8
/* 93A64 800A3264 9D41020C */  jal        G2Anim_InterpDisableController
/* 93A68 800A3268 2C010724 */   addiu     $a3, $zero, 0x12C
/* 93A6C 800A326C 21202002 */  addu       $a0, $s1, $zero
/* 93A70 800A3270 0E000524 */  addiu      $a1, $zero, 0xE
/* 93A74 800A3274 2130A000 */  addu       $a2, $a1, $zero
/* 93A78 800A3278 9D41020C */  jal        G2Anim_InterpDisableController
/* 93A7C 800A327C 2C010724 */   addiu     $a3, $zero, 0x12C
/* 93A80 800A3280 21202002 */  addu       $a0, $s1, $zero
/* 93A84 800A3284 32000524 */  addiu      $a1, $zero, 0x32
/* 93A88 800A3288 4C000624 */  addiu      $a2, $zero, 0x4C
/* 93A8C 800A328C 9D41020C */  jal        G2Anim_InterpDisableController
/* 93A90 800A3290 2C010724 */   addiu     $a3, $zero, 0x12C
/* 93A94 800A3294 21202002 */  addu       $a0, $s1, $zero
/* 93A98 800A3298 3A000524 */  addiu      $a1, $zero, 0x3A
/* 93A9C 800A329C 4C000624 */  addiu      $a2, $zero, 0x4C
/* 93AA0 800A32A0 9D41020C */  jal        G2Anim_InterpDisableController
/* 93AA4 800A32A4 2C010724 */   addiu     $a3, $zero, 0x12C
/* 93AA8 800A32A8 1800BF8F */  lw         $ra, 0x18($sp)
/* 93AAC 800A32AC 1400B18F */  lw         $s1, 0x14($sp)
/* 93AB0 800A32B0 1000B08F */  lw         $s0, 0x10($sp)
/* 93AB4 800A32B4 0800E003 */  jr         $ra
/* 93AB8 800A32B8 2000BD27 */   addiu     $sp, $sp, 0x20
.size razDeinitWallCrawlSteering, . - razDeinitWallCrawlSteering
