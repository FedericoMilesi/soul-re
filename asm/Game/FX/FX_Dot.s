.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Dot
/* 39258 80048A58 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 3925C 80048A5C 3800B4AF */  sw         $s4, 0x38($sp)
/* 39260 80048A60 21A08000 */  addu       $s4, $a0, $zero
/* 39264 80048A64 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 39268 80048A68 3400B3AF */  sw         $s3, 0x34($sp)
/* 3926C 80048A6C 6000B38F */  lw         $s3, 0x60($sp)
/* 39270 80048A70 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 39274 80048A74 6400B58F */  lw         $s5, 0x64($sp)
/* 39278 80048A78 3000B2AF */  sw         $s2, 0x30($sp)
/* 3927C 80048A7C 6800B28F */  lw         $s2, 0x68($sp)
/* 39280 80048A80 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 39284 80048A84 6C00B18F */  lw         $s1, 0x6C($sp)
/* 39288 80048A88 4000B6AF */  sw         $s6, 0x40($sp)
/* 3928C 80048A8C 21B0A000 */  addu       $s6, $a1, $zero
/* 39290 80048A90 4400B7AF */  sw         $s7, 0x44($sp)
/* 39294 80048A94 21B8C000 */  addu       $s7, $a2, $zero
/* 39298 80048A98 4800BEAF */  sw         $fp, 0x48($sp)
/* 3929C 80048A9C 21F0E000 */  addu       $fp, $a3, $zero
/* 392A0 80048AA0 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 392A4 80048AA4 C009010C */  jal        FX_GetPrim
/* 392A8 80048AA8 2800B0AF */   sw        $s0, 0x28($sp)
/* 392AC 80048AAC 21804000 */  addu       $s0, $v0, $zero
/* 392B0 80048AB0 38000012 */  beqz       $s0, .L80048B94
/* 392B4 80048AB4 21100002 */   addu      $v0, $s0, $zero
/* 392B8 80048AB8 0D002006 */  bltz       $s1, .L80048AF0
/* 392BC 80048ABC 21200002 */   addu      $a0, $s0, $zero
/* 392C0 80048AC0 21288002 */  addu       $a1, $s4, $zero
/* 392C4 80048AC4 21300000 */  addu       $a2, $zero, $zero
/* 392C8 80048AC8 2138C000 */  addu       $a3, $a2, $zero
/* 392CC 80048ACC 1000B1AF */  sw         $s1, 0x10($sp)
/* 392D0 80048AD0 1400B6AF */  sw         $s6, 0x14($sp)
/* 392D4 80048AD4 1800B7AF */  sw         $s7, 0x18($sp)
/* 392D8 80048AD8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 392DC 80048ADC 2000B5AF */  sw         $s5, 0x20($sp)
/* 392E0 80048AE0 8D29010C */  jal        FX_MakeParticleTexFX
/* 392E4 80048AE4 2400B2AF */   sw        $s2, 0x24($sp)
/* 392E8 80048AE8 D9220108 */  j          .L80048B64
/* 392EC 80048AEC 00000000 */   nop
.L80048AF0:
/* 392F0 80048AF0 21288002 */  addu       $a1, $s4, $zero
/* 392F4 80048AF4 00341500 */  sll        $a2, $s5, 16
/* 392F8 80048AF8 03340600 */  sra        $a2, $a2, 16
/* 392FC 80048AFC 2138C000 */  addu       $a3, $a2, $zero
/* 39300 80048B00 00141200 */  sll        $v0, $s2, 16
/* 39304 80048B04 44BA838F */  lw         $v1, %gp_rel(gFXT)($gp)
/* 39308 80048B08 03140200 */  sra        $v0, $v0, 16
/* 3930C 80048B0C 1000B3AF */  sw         $s3, 0x10($sp)
/* 39310 80048B10 1400B6AF */  sw         $s6, 0x14($sp)
/* 39314 80048B14 1800B7AF */  sw         $s7, 0x18($sp)
/* 39318 80048B18 2000A2AF */  sw         $v0, 0x20($sp)
/* 3931C 80048B1C 5C22010C */  jal        FX_DFacadeParticleSetup
/* 39320 80048B20 1C00A3AF */   sw        $v1, 0x1C($sp)
/* 39324 80048B24 05006012 */  beqz       $s3, .L80048B3C
/* 39328 80048B28 0C00033C */   lui       $v1, (0xC0000 >> 16)
/* 3932C 80048B2C 0C00028E */  lw         $v0, 0xC($s0)
/* 39330 80048B30 00000000 */  nop
/* 39334 80048B34 25104300 */  or         $v0, $v0, $v1
/* 39338 80048B38 0C0002AE */  sw         $v0, 0xC($s0)
.L80048B3C:
/* 3933C 80048B3C 00100224 */  addiu      $v0, $zero, 0x1000
/* 39340 80048B40 1A005200 */  div        $zero, $v0, $s2
/* 39344 80048B44 12100000 */  mflo       $v0
/* 39348 80048B48 200013AE */  sw         $s3, 0x20($s0)
/* 3934C 80048B4C 240000AE */  sw         $zero, 0x24($s0)
/* 39350 80048B50 3A0000A6 */  sh         $zero, 0x3A($s0)
/* 39354 80048B54 380000A6 */  sh         $zero, 0x38($s0)
/* 39358 80048B58 360000A6 */  sh         $zero, 0x36($s0)
/* 3935C 80048B5C 340000A6 */  sh         $zero, 0x34($s0)
/* 39360 80048B60 320002A6 */  sh         $v0, 0x32($s0)
.L80048B64:
/* 39364 80048B64 0600C013 */  beqz       $fp, .L80048B80
/* 39368 80048B68 00100224 */   addiu     $v0, $zero, 0x1000
/* 3936C 80048B6C 0C00038E */  lw         $v1, 0xC($s0)
/* 39370 80048B70 3E0002A6 */  sh         $v0, 0x3E($s0)
/* 39374 80048B74 5A001EA6 */  sh         $fp, 0x5A($s0)
/* 39378 80048B78 00206334 */  ori        $v1, $v1, 0x2000
/* 3937C 80048B7C 0C0003AE */  sw         $v1, 0xC($s0)
.L80048B80:
/* 39380 80048B80 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 39384 80048B84 21280002 */  addu       $a1, $s0, $zero
/* 39388 80048B88 8F19010C */  jal        FX_Sprite_Insert
/* 3938C 80048B8C 986D8424 */   addiu     $a0, $a0, 0x6D98
/* 39390 80048B90 21100002 */  addu       $v0, $s0, $zero
.L80048B94:
/* 39394 80048B94 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 39398 80048B98 4800BE8F */  lw         $fp, 0x48($sp)
/* 3939C 80048B9C 4400B78F */  lw         $s7, 0x44($sp)
/* 393A0 80048BA0 4000B68F */  lw         $s6, 0x40($sp)
/* 393A4 80048BA4 3C00B58F */  lw         $s5, 0x3C($sp)
/* 393A8 80048BA8 3800B48F */  lw         $s4, 0x38($sp)
/* 393AC 80048BAC 3400B38F */  lw         $s3, 0x34($sp)
/* 393B0 80048BB0 3000B28F */  lw         $s2, 0x30($sp)
/* 393B4 80048BB4 2C00B18F */  lw         $s1, 0x2C($sp)
/* 393B8 80048BB8 2800B08F */  lw         $s0, 0x28($sp)
/* 393BC 80048BBC 0800E003 */  jr         $ra
/* 393C0 80048BC0 5000BD27 */   addiu     $sp, $sp, 0x50
.size FX_Dot, . - FX_Dot
