.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_CreateLightning
/* 3D28C 8004CA8C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3D290 8004CA90 1400B1AF */  sw         $s1, 0x14($sp)
/* 3D294 8004CA94 21888000 */  addu       $s1, $a0, $zero
/* 3D298 8004CA98 1800B2AF */  sw         $s2, 0x18($sp)
/* 3D29C 8004CA9C 2190A000 */  addu       $s2, $a1, $zero
/* 3D2A0 8004CAA0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3D2A4 8004CAA4 2198C000 */  addu       $s3, $a2, $zero
/* 3D2A8 8004CAA8 2000B4AF */  sw         $s4, 0x20($sp)
/* 3D2AC 8004CAAC 21A0E000 */  addu       $s4, $a3, $zero
/* 3D2B0 8004CAB0 3C000424 */  addiu      $a0, $zero, 0x3C
/* 3D2B4 8004CAB4 0D000524 */  addiu      $a1, $zero, 0xD
/* 3D2B8 8004CAB8 2400BFAF */  sw         $ra, 0x24($sp)
/* 3D2BC 8004CABC 8140010C */  jal        MEMPACK_Malloc
/* 3D2C0 8004CAC0 1000B0AF */   sw        $s0, 0x10($sp)
/* 3D2C4 8004CAC4 21804000 */  addu       $s0, $v0, $zero
/* 3D2C8 8004CAC8 29000012 */  beqz       $s0, .L8004CB70
/* 3D2CC 8004CACC 0580023C */   lui       $v0, %hi(FX_ContinueLightning)
/* 3D2D0 8004CAD0 D0A74224 */  addiu      $v0, $v0, %lo(FX_ContinueLightning)
/* 3D2D4 8004CAD4 040002AE */  sw         $v0, 0x4($s0)
/* 3D2D8 8004CAD8 87000224 */  addiu      $v0, $zero, 0x87
/* 3D2DC 8004CADC 080011AE */  sw         $s1, 0x8($s0)
/* 3D2E0 8004CAE0 1C0011AE */  sw         $s1, 0x1C($s0)
/* 3D2E4 8004CAE4 0C0002A2 */  sb         $v0, 0xC($s0)
/* 3D2E8 8004CAE8 0D0000A2 */  sb         $zero, 0xD($s0)
/* 3D2EC 8004CAEC 0E0012A6 */  sh         $s2, 0xE($s0)
/* 3D2F0 8004CAF0 100013A6 */  sh         $s3, 0x10($s0)
/* 3D2F4 8004CAF4 120014A6 */  sh         $s4, 0x12($s0)
/* 3D2F8 8004CAF8 3800A28F */  lw         $v0, 0x38($sp)
/* 3D2FC 8004CAFC 00000000 */  nop
/* 3D300 8004CB00 2A0002A6 */  sh         $v0, 0x2A($s0)
/* 3D304 8004CB04 3C00A28F */  lw         $v0, 0x3C($sp)
/* 3D308 8004CB08 00000000 */  nop
/* 3D30C 8004CB0C 2C0002A6 */  sh         $v0, 0x2C($s0)
/* 3D310 8004CB10 4000A28F */  lw         $v0, 0x40($sp)
/* 3D314 8004CB14 00000000 */  nop
/* 3D318 8004CB18 2E0002A6 */  sh         $v0, 0x2E($s0)
/* 3D31C 8004CB1C 4400A28F */  lw         $v0, 0x44($sp)
/* 3D320 8004CB20 00000000 */  nop
/* 3D324 8004CB24 300002A6 */  sh         $v0, 0x30($s0)
/* 3D328 8004CB28 4800A28F */  lw         $v0, 0x48($sp)
/* 3D32C 8004CB2C 00000000 */  nop
/* 3D330 8004CB30 320002A6 */  sh         $v0, 0x32($s0)
/* 3D334 8004CB34 4C00A28F */  lw         $v0, 0x4C($sp)
/* 3D338 8004CB38 00000000 */  nop
/* 3D33C 8004CB3C 340002AE */  sw         $v0, 0x34($s0)
/* 3D340 8004CB40 5000A28F */  lw         $v0, 0x50($sp)
/* 3D344 8004CB44 21200002 */  addu       $a0, $s0, $zero
/* 3D348 8004CB48 140000A6 */  sh         $zero, 0x14($s0)
/* 3D34C 8004CB4C 160000A6 */  sh         $zero, 0x16($s0)
/* 3D350 8004CB50 180000A6 */  sh         $zero, 0x18($s0)
/* 3D354 8004CB54 200000A6 */  sh         $zero, 0x20($s0)
/* 3D358 8004CB58 220000A6 */  sh         $zero, 0x22($s0)
/* 3D35C 8004CB5C 240000A6 */  sh         $zero, 0x24($s0)
/* 3D360 8004CB60 380002AE */  sw         $v0, 0x38($s0)
/* 3D364 8004CB64 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3D368 8004CB68 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3D36C 8004CB6C 280002A6 */   sh        $v0, 0x28($s0)
.L8004CB70:
/* 3D370 8004CB70 21100002 */  addu       $v0, $s0, $zero
/* 3D374 8004CB74 2400BF8F */  lw         $ra, 0x24($sp)
/* 3D378 8004CB78 2000B48F */  lw         $s4, 0x20($sp)
/* 3D37C 8004CB7C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3D380 8004CB80 1800B28F */  lw         $s2, 0x18($sp)
/* 3D384 8004CB84 1400B18F */  lw         $s1, 0x14($sp)
/* 3D388 8004CB88 1000B08F */  lw         $s0, 0x10($sp)
/* 3D38C 8004CB8C 0800E003 */  jr         $ra
/* 3D390 8004CB90 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_CreateLightning, . - FX_CreateLightning
