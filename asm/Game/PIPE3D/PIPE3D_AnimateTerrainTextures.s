.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_AnimateTerrainTextures
/* 2CAC8 8003C2C8 0400CB8C */  lw         $t3, 0x4($a2)
/* 2CACC 8003C2CC 62008010 */  beqz       $a0, .L8003C458
/* 2CAD0 8003C2D0 FC2FE724 */   addiu     $a3, $a3, 0x2FFC
/* 2CAD4 8003C2D4 0000888C */  lw         $t0, 0x0($a0)
/* 2CAD8 8003C2D8 0800C38C */  lw         $v1, 0x8($a2)
/* 2CADC 8003C2DC 40100800 */  sll        $v0, $t0, 1
/* 2CAE0 8003C2E0 21104800 */  addu       $v0, $v0, $t0
/* 2CAE4 8003C2E4 40110200 */  sll        $v0, $v0, 5
/* 2CAE8 8003C2E8 23186200 */  subu       $v1, $v1, $v0
/* 2CAEC 8003C2EC 2B186301 */  sltu       $v1, $t3, $v1
/* 2CAF0 8003C2F0 58006010 */  beqz       $v1, .L8003C454
/* 2CAF4 8003C2F4 00000000 */   nop
/* 2CAF8 8003C2F8 56000019 */  blez       $t0, .L8003C454
/* 2CAFC 8003C2FC 21680000 */   addu      $t5, $zero, $zero
/* 2CB00 8003C300 0001193C */  lui        $t9, (0x1000000 >> 16)
/* 2CB04 8003C304 0080183C */  lui        $t8, (0x80000000 >> 16)
/* 2CB08 8003C308 FF000C3C */  lui        $t4, (0xFFFFFF >> 16)
/* 2CB0C 8003C30C FFFF8C35 */  ori        $t4, $t4, (0xFFFFFF & 0xFFFF)
/* 2CB10 8003C310 00050F3C */  lui        $t7, (0x5000000 >> 16)
/* 2CB14 8003C314 21708000 */  addu       $t6, $a0, $zero
/* 2CB18 8003C318 14006825 */  addiu      $t0, $t3, 0x14
.L8003C31C:
/* 2CB1C 8003C31C 0400C98D */  lw         $t1, 0x4($t6)
/* 2CB20 8003C320 00000000 */  nop
/* 2CB24 8003C324 1C00228D */  lw         $v0, 0x1C($t1)
/* 2CB28 8003C328 00000000 */  nop
/* 2CB2C 8003C32C 1B00A200 */  divu       $zero, $a1, $v0
/* 2CB30 8003C330 12100000 */  mflo       $v0
/* 2CB34 8003C334 1800238D */  lw         $v1, 0x18($t1)
/* 2CB38 8003C338 00000000 */  nop
/* 2CB3C 8003C33C 1B004300 */  divu       $zero, $v0, $v1
/* 2CB40 8003C340 10180000 */  mfhi       $v1
/* 2CB44 8003C344 1000228D */  lw         $v0, 0x10($t1)
/* 2CB48 8003C348 C0180300 */  sll        $v1, $v1, 3
/* 2CB4C 8003C34C 20006324 */  addiu      $v1, $v1, 0x20
/* 2CB50 8003C350 21502301 */  addu       $t2, $t1, $v1
/* 2CB54 8003C354 0000438D */  lw         $v1, 0x0($t2)
/* 2CB58 8003C358 00000000 */  nop
/* 2CB5C 8003C35C 1A006210 */  beq        $v1, $v0, .L8003C3C8
/* 2CB60 8003C360 00000000 */   nop
/* 2CB64 8003C364 F0FF19AD */  sw         $t9, -0x10($t0)
/* 2CB68 8003C368 F4FF18AD */  sw         $t8, -0xC($t0)
/* 2CB6C 8003C36C 0000428D */  lw         $v0, 0x0($t2)
/* 2CB70 8003C370 00000000 */  nop
/* 2CB74 8003C374 F8FF02AD */  sw         $v0, -0x8($t0)
/* 2CB78 8003C378 0000228D */  lw         $v0, 0x0($t1)
/* 2CB7C 8003C37C 00000000 */  nop
/* 2CB80 8003C380 FCFF02AD */  sw         $v0, -0x4($t0)
/* 2CB84 8003C384 0400228D */  lw         $v0, 0x4($t1)
/* 2CB88 8003C388 00000000 */  nop
/* 2CB8C 8003C38C 000002AD */  sw         $v0, 0x0($t0)
/* 2CB90 8003C390 0000E28C */  lw         $v0, 0x0($a3)
/* 2CB94 8003C394 00000000 */  nop
/* 2CB98 8003C398 24104C00 */  and        $v0, $v0, $t4
/* 2CB9C 8003C39C 25104F00 */  or         $v0, $v0, $t7
/* 2CBA0 8003C3A0 000062AD */  sw         $v0, 0x0($t3)
/* 2CBA4 8003C3A4 24106C01 */  and        $v0, $t3, $t4
/* 2CBA8 8003C3A8 0000E2AC */  sw         $v0, 0x0($a3)
/* 2CBAC 8003C3AC 0000428D */  lw         $v0, 0x0($t2)
/* 2CBB0 8003C3B0 18000825 */  addiu      $t0, $t0, 0x18
/* 2CBB4 8003C3B4 100022AD */  sw         $v0, 0x10($t1)
/* 2CBB8 8003C3B8 0000C28C */  lw         $v0, 0x0($a2)
/* 2CBBC 8003C3BC 18006B25 */  addiu      $t3, $t3, 0x18
/* 2CBC0 8003C3C0 01004224 */  addiu      $v0, $v0, 0x1
/* 2CBC4 8003C3C4 0000C2AC */  sw         $v0, 0x0($a2)
.L8003C3C8:
/* 2CBC8 8003C3C8 0400438D */  lw         $v1, 0x4($t2)
/* 2CBCC 8003C3CC 1400228D */  lw         $v0, 0x14($t1)
/* 2CBD0 8003C3D0 00000000 */  nop
/* 2CBD4 8003C3D4 1A006210 */  beq        $v1, $v0, .L8003C440
/* 2CBD8 8003C3D8 00000000 */   nop
/* 2CBDC 8003C3DC F0FF19AD */  sw         $t9, -0x10($t0)
/* 2CBE0 8003C3E0 F4FF18AD */  sw         $t8, -0xC($t0)
/* 2CBE4 8003C3E4 0400428D */  lw         $v0, 0x4($t2)
/* 2CBE8 8003C3E8 00000000 */  nop
/* 2CBEC 8003C3EC F8FF02AD */  sw         $v0, -0x8($t0)
/* 2CBF0 8003C3F0 0800228D */  lw         $v0, 0x8($t1)
/* 2CBF4 8003C3F4 00000000 */  nop
/* 2CBF8 8003C3F8 FCFF02AD */  sw         $v0, -0x4($t0)
/* 2CBFC 8003C3FC 0C00228D */  lw         $v0, 0xC($t1)
/* 2CC00 8003C400 00000000 */  nop
/* 2CC04 8003C404 000002AD */  sw         $v0, 0x0($t0)
/* 2CC08 8003C408 0000E28C */  lw         $v0, 0x0($a3)
/* 2CC0C 8003C40C 00000000 */  nop
/* 2CC10 8003C410 24104C00 */  and        $v0, $v0, $t4
/* 2CC14 8003C414 25104F00 */  or         $v0, $v0, $t7
/* 2CC18 8003C418 000062AD */  sw         $v0, 0x0($t3)
/* 2CC1C 8003C41C 24106C01 */  and        $v0, $t3, $t4
/* 2CC20 8003C420 0000E2AC */  sw         $v0, 0x0($a3)
/* 2CC24 8003C424 0400428D */  lw         $v0, 0x4($t2)
/* 2CC28 8003C428 18000825 */  addiu      $t0, $t0, 0x18
/* 2CC2C 8003C42C 140022AD */  sw         $v0, 0x14($t1)
/* 2CC30 8003C430 0000C28C */  lw         $v0, 0x0($a2)
/* 2CC34 8003C434 18006B25 */  addiu      $t3, $t3, 0x18
/* 2CC38 8003C438 01004224 */  addiu      $v0, $v0, 0x1
/* 2CC3C 8003C43C 0000C2AC */  sw         $v0, 0x0($a2)
.L8003C440:
/* 2CC40 8003C440 0000828C */  lw         $v0, 0x0($a0)
/* 2CC44 8003C444 0100AD25 */  addiu      $t5, $t5, 0x1
/* 2CC48 8003C448 2A10A201 */  slt        $v0, $t5, $v0
/* 2CC4C 8003C44C B3FF4014 */  bnez       $v0, .L8003C31C
/* 2CC50 8003C450 0400CE25 */   addiu     $t6, $t6, 0x4
.L8003C454:
/* 2CC54 8003C454 0400CBAC */  sw         $t3, 0x4($a2)
.L8003C458:
/* 2CC58 8003C458 0800E003 */  jr         $ra
/* 2CC5C 8003C45C 00000000 */   nop
.size PIPE3D_AnimateTerrainTextures, . - PIPE3D_AnimateTerrainTextures
