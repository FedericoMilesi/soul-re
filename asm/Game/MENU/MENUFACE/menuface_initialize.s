.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menuface_initialize
/* A99F8 800B91F8 ECAA828F */  lw         $v0, %gp_rel(hack_initialized)($gp)
/* A99FC 800B91FC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A9A00 800B9200 2C00BFAF */  sw         $ra, 0x2C($sp)
/* A9A04 800B9204 2800B6AF */  sw         $s6, 0x28($sp)
/* A9A08 800B9208 2400B5AF */  sw         $s5, 0x24($sp)
/* A9A0C 800B920C 2000B4AF */  sw         $s4, 0x20($sp)
/* A9A10 800B9210 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A9A14 800B9214 1800B2AF */  sw         $s2, 0x18($sp)
/* A9A18 800B9218 1400B1AF */  sw         $s1, 0x14($sp)
/* A9A1C 800B921C 37004014 */  bnez       $v0, .L800B92FC
/* A9A20 800B9220 1000B0AF */   sw        $s0, 0x10($sp)
/* A9A24 800B9224 0D80043C */  lui        $a0, %hi(hack_initialized + 0x4)
/* A9A28 800B9228 88208424 */  addiu      $a0, $a0, %lo(hack_initialized + 0x4)
/* A9A2C 800B922C 3E82010C */  jal        LOAD_ReadFile
/* A9A30 800B9230 0B000524 */   addiu     $a1, $zero, 0xB
/* A9A34 800B9234 21B04000 */  addu       $s6, $v0, $zero
/* A9A38 800B9238 3000C012 */  beqz       $s6, .L800B92FC
/* A9A3C 800B923C 2190C002 */   addu      $s2, $s6, $zero
/* A9A40 800B9240 80030424 */  addiu      $a0, $zero, 0x380
/* A9A44 800B9244 8140010C */  jal        MEMPACK_Malloc
/* A9A48 800B9248 2D000524 */   addiu     $a1, $zero, 0x2D
/* A9A4C 800B924C 200082AF */  sw         $v0, %gp_rel(FaceButtons)($gp)
/* A9A50 800B9250 05004014 */  bnez       $v0, .L800B9268
/* A9A54 800B9254 21A80000 */   addu      $s5, $zero, $zero
/* A9A58 800B9258 2641010C */  jal        MEMPACK_Free
/* A9A5C 800B925C 2120C002 */   addu      $a0, $s6, $zero
/* A9A60 800B9260 BFE40208 */  j          .L800B92FC
/* A9A64 800B9264 00000000 */   nop
.L800B9268:
/* A9A68 800B9268 6CAA9027 */  addiu      $s0, $gp, %gp_rel(MenuFaces)
/* A9A6C 800B926C 2198A002 */  addu       $s3, $s5, $zero
.L800B9270:
/* A9A70 800B9270 21880000 */  addu       $s1, $zero, $zero
/* A9A74 800B9274 FFFF0224 */  addiu      $v0, $zero, -0x1
/* A9A78 800B9278 080002A6 */  sh         $v0, 0x8($s0)
/* A9A7C 800B927C 0A0000A6 */  sh         $zero, 0xA($s0)
/* A9A80 800B9280 0E0000A6 */  sh         $zero, 0xE($s0)
/* A9A84 800B9284 0C0000A6 */  sh         $zero, 0xC($s0)
/* A9A88 800B9288 21204002 */  addu       $a0, $s2, $zero
.L800B928C:
/* A9A8C 800B928C 21287102 */  addu       $a1, $s3, $s1
/* A9A90 800B9290 2000828F */  lw         $v0, %gp_rel(FaceButtons)($gp)
/* A9A94 800B9294 00290500 */  sll        $a1, $a1, 4
/* A9A98 800B9298 C2AB000C */  jal        DRAW_LoadButton
/* A9A9C 800B929C 21284500 */   addu      $a1, $v0, $a1
/* A9AA0 800B92A0 21204002 */  addu       $a0, $s2, $zero
/* A9AA4 800B92A4 04000592 */  lbu        $a1, 0x4($s0)
/* A9AA8 800B92A8 05000692 */  lbu        $a2, 0x5($s0)
/* A9AAC 800B92AC 6CE4020C */  jal        NextTimAddr
/* A9AB0 800B92B0 21380000 */   addu      $a3, $zero, $zero
/* A9AB4 800B92B4 21904000 */  addu       $s2, $v0, $zero
/* A9AB8 800B92B8 01001424 */  addiu      $s4, $zero, 0x1
/* A9ABC 800B92BC 04183402 */  sllv       $v1, $s4, $s1
/* A9AC0 800B92C0 0E000296 */  lhu        $v0, 0xE($s0)
/* A9AC4 800B92C4 21883402 */  addu       $s1, $s1, $s4
/* A9AC8 800B92C8 25104300 */  or         $v0, $v0, $v1
/* A9ACC 800B92CC 0E0002A6 */  sh         $v0, 0xE($s0)
/* A9AD0 800B92D0 0700222A */  slti       $v0, $s1, 0x7
/* A9AD4 800B92D4 EDFF4014 */  bnez       $v0, .L800B928C
/* A9AD8 800B92D8 21204002 */   addu      $a0, $s2, $zero
/* A9ADC 800B92DC 10001026 */  addiu      $s0, $s0, 0x10
/* A9AE0 800B92E0 21A8B402 */  addu       $s5, $s5, $s4
/* A9AE4 800B92E4 0800A22A */  slti       $v0, $s5, 0x8
/* A9AE8 800B92E8 E1FF4014 */  bnez       $v0, .L800B9270
/* A9AEC 800B92EC 07007326 */   addiu     $s3, $s3, 0x7
/* A9AF0 800B92F0 2641010C */  jal        MEMPACK_Free
/* A9AF4 800B92F4 2120C002 */   addu      $a0, $s6, $zero
/* A9AF8 800B92F8 ECAA94AF */  sw         $s4, %gp_rel(hack_initialized)($gp)
.L800B92FC:
/* A9AFC 800B92FC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* A9B00 800B9300 2800B68F */  lw         $s6, 0x28($sp)
/* A9B04 800B9304 2400B58F */  lw         $s5, 0x24($sp)
/* A9B08 800B9308 2000B48F */  lw         $s4, 0x20($sp)
/* A9B0C 800B930C 1C00B38F */  lw         $s3, 0x1C($sp)
/* A9B10 800B9310 1800B28F */  lw         $s2, 0x18($sp)
/* A9B14 800B9314 1400B18F */  lw         $s1, 0x14($sp)
/* A9B18 800B9318 1000B08F */  lw         $s0, 0x10($sp)
/* A9B1C 800B931C 0800E003 */  jr         $ra
/* A9B20 800B9320 3000BD27 */   addiu     $sp, $sp, 0x30
.size menuface_initialize, . - menuface_initialize
