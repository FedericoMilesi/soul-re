.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_SphereAndTerrain
/* 1429C 80023A9C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 142A0 80023AA0 2400B5AF */  sw         $s5, 0x24($sp)
/* 142A4 80023AA4 21A88000 */  addu       $s5, $a0, $zero
/* 142A8 80023AA8 2000B4AF */  sw         $s4, 0x20($sp)
/* 142AC 80023AAC 21A0A000 */  addu       $s4, $a1, $zero
/* 142B0 80023AB0 2800BFAF */  sw         $ra, 0x28($sp)
/* 142B4 80023AB4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 142B8 80023AB8 1800B2AF */  sw         $s2, 0x18($sp)
/* 142BC 80023ABC 1400B1AF */  sw         $s1, 0x14($sp)
/* 142C0 80023AC0 EC8B000C */  jal        COLLIDE_SAndT
/* 142C4 80023AC4 1000B0AF */   sw        $s0, 0x10($sp)
/* 142C8 80023AC8 21984000 */  addu       $s3, $v0, $zero
/* 142CC 80023ACC F800848E */  lw         $a0, 0xF8($s4)
/* 142D0 80023AD0 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 142D4 80023AD4 21900000 */   addu      $s2, $zero, $zero
/* 142D8 80023AD8 04004010 */  beqz       $v0, .L80023AEC
/* 142DC 80023ADC 21880000 */   addu      $s1, $zero, $zero
/* 142E0 80023AE0 06004294 */  lhu        $v0, 0x6($v0)
/* 142E4 80023AE4 00000000 */  nop
/* 142E8 80023AE8 01005230 */  andi       $s2, $v0, 0x1
.L80023AEC:
/* 142EC 80023AEC 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
.L80023AF0:
/* 142F0 80023AF0 04000386 */  lh         $v1, 0x4($s0)
/* 142F4 80023AF4 02000224 */  addiu      $v0, $zero, 0x2
/* 142F8 80023AF8 14006214 */  bne        $v1, $v0, .L80023B4C
/* 142FC 80023AFC 00000000 */   nop
/* 14300 80023B00 0800048E */  lw         $a0, 0x8($s0)
/* 14304 80023B04 00000000 */  nop
/* 14308 80023B08 10009410 */  beq        $a0, $s4, .L80023B4C
/* 1430C 80023B0C 00000000 */   nop
/* 14310 80023B10 06004012 */  beqz       $s2, .L80023B2C
/* 14314 80023B14 00000000 */   nop
/* 14318 80023B18 06000296 */  lhu        $v0, 0x6($s0)
/* 1431C 80023B1C 00000000 */  nop
/* 14320 80023B20 01004230 */  andi       $v0, $v0, 0x1
/* 14324 80023B24 09004014 */  bnez       $v0, .L80023B4C
/* 14328 80023B28 00000000 */   nop
.L80023B2C:
/* 1432C 80023B2C B841010C */  jal        MEMPACK_MemoryValidFunc
/* 14330 80023B30 00000000 */   nop
/* 14334 80023B34 05004010 */  beqz       $v0, .L80023B4C
/* 14338 80023B38 00000000 */   nop
/* 1433C 80023B3C 0800058E */  lw         $a1, 0x8($s0)
/* 14340 80023B40 EC8B000C */  jal        COLLIDE_SAndT
/* 14344 80023B44 2120A002 */   addu      $a0, $s5, $zero
/* 14348 80023B48 21984000 */  addu       $s3, $v0, $zero
.L80023B4C:
/* 1434C 80023B4C 01003126 */  addiu      $s1, $s1, 0x1
/* 14350 80023B50 1000222A */  slti       $v0, $s1, 0x10
/* 14354 80023B54 E6FF4014 */  bnez       $v0, .L80023AF0
/* 14358 80023B58 40001026 */   addiu     $s0, $s0, 0x40
/* 1435C 80023B5C 21106002 */  addu       $v0, $s3, $zero
/* 14360 80023B60 2800BF8F */  lw         $ra, 0x28($sp)
/* 14364 80023B64 2400B58F */  lw         $s5, 0x24($sp)
/* 14368 80023B68 2000B48F */  lw         $s4, 0x20($sp)
/* 1436C 80023B6C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 14370 80023B70 1800B28F */  lw         $s2, 0x18($sp)
/* 14374 80023B74 1400B18F */  lw         $s1, 0x14($sp)
/* 14378 80023B78 1000B08F */  lw         $s0, 0x10($sp)
/* 1437C 80023B7C 0800E003 */  jr         $ra
/* 14380 80023B80 3000BD27 */   addiu     $sp, $sp, 0x30
.size COLLIDE_SphereAndTerrain, . - COLLIDE_SphereAndTerrain
