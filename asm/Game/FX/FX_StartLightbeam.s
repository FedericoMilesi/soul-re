.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartLightbeam
/* 3D994 8004D194 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3D998 8004D198 90A2428C */  lw         $v0, %lo(objectAccess + 0x54)($v0)
/* 3D99C 8004D19C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3D9A0 8004D1A0 1400B1AF */  sw         $s1, 0x14($sp)
/* 3D9A4 8004D1A4 21888000 */  addu       $s1, $a0, $zero
/* 3D9A8 8004D1A8 1800B2AF */  sw         $s2, 0x18($sp)
/* 3D9AC 8004D1AC 2190A000 */  addu       $s2, $a1, $zero
/* 3D9B0 8004D1B0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3D9B4 8004D1B4 2198C000 */  addu       $s3, $a2, $zero
/* 3D9B8 8004D1B8 2000BFAF */  sw         $ra, 0x20($sp)
/* 3D9BC 8004D1BC 17004010 */  beqz       $v0, .L8004D21C
/* 3D9C0 8004D1C0 1000B0AF */   sw        $s0, 0x10($sp)
/* 3D9C4 8004D1C4 18000424 */  addiu      $a0, $zero, 0x18
/* 3D9C8 8004D1C8 1C00428C */  lw         $v0, 0x1C($v0)
/* 3D9CC 8004D1CC 00000000 */  nop
/* 3D9D0 8004D1D0 1800438C */  lw         $v1, 0x18($v0)
/* 3D9D4 8004D1D4 80100700 */  sll        $v0, $a3, 2
/* 3D9D8 8004D1D8 21104300 */  addu       $v0, $v0, $v1
/* 3D9DC 8004D1DC 0000508C */  lw         $s0, 0x0($v0)
/* 3D9E0 8004D1E0 8140010C */  jal        MEMPACK_Malloc
/* 3D9E4 8004D1E4 0D000524 */   addiu     $a1, $zero, 0xD
/* 3D9E8 8004D1E8 0C004010 */  beqz       $v0, .L8004D21C
/* 3D9EC 8004D1EC 21204000 */   addu      $a0, $v0, $zero
/* 3D9F0 8004D1F0 85000224 */  addiu      $v0, $zero, 0x85
/* 3D9F4 8004D1F4 0C0082A0 */  sb         $v0, 0xC($a0)
/* 3D9F8 8004D1F8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3D9FC 8004D1FC 080091AC */  sw         $s1, 0x8($a0)
/* 3DA00 8004D200 040080AC */  sw         $zero, 0x4($a0)
/* 3DA04 8004D204 0D0080A0 */  sb         $zero, 0xD($a0)
/* 3DA08 8004D208 0E0082A4 */  sh         $v0, 0xE($a0)
/* 3DA0C 8004D20C 100092A4 */  sh         $s2, 0x10($a0)
/* 3DA10 8004D210 120093A4 */  sh         $s3, 0x12($a0)
/* 3DA14 8004D214 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3DA18 8004D218 140090AC */   sw        $s0, 0x14($a0)
.L8004D21C:
/* 3DA1C 8004D21C 2000BF8F */  lw         $ra, 0x20($sp)
/* 3DA20 8004D220 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3DA24 8004D224 1800B28F */  lw         $s2, 0x18($sp)
/* 3DA28 8004D228 1400B18F */  lw         $s1, 0x14($sp)
/* 3DA2C 8004D22C 1000B08F */  lw         $s0, 0x10($sp)
/* 3DA30 8004D230 0800E003 */  jr         $ra
/* 3DA34 8004D234 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_StartLightbeam, . - FX_StartLightbeam
