.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_GetWarpRoomIndex
/* 4BAC8 8005B2C8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4BACC 8005B2CC 1800B2AF */  sw         $s2, 0x18($sp)
/* 4BAD0 8005B2D0 21908000 */  addu       $s2, $a0, $zero
/* 4BAD4 8005B2D4 1000B0AF */  sw         $s0, 0x10($sp)
/* 4BAD8 8005B2D8 21800000 */  addu       $s0, $zero, $zero
/* 4BADC 8005B2DC 1400B1AF */  sw         $s1, 0x14($sp)
/* 4BAE0 8005B2E0 00A19127 */  addiu      $s1, $gp, %gp_rel(WarpRoomArray)
/* 4BAE4 8005B2E4 1C00BFAF */  sw         $ra, 0x1C($sp)
.L8005B2E8:
/* 4BAE8 8005B2E8 21202002 */  addu       $a0, $s1, $zero
/* 4BAEC 8005B2EC 1CD2010C */  jal        strcmpi
/* 4BAF0 8005B2F0 21284002 */   addu      $a1, $s2, $zero
/* 4BAF4 8005B2F4 06004010 */  beqz       $v0, .L8005B310
/* 4BAF8 8005B2F8 21100002 */   addu      $v0, $s0, $zero
/* 4BAFC 8005B2FC 01001026 */  addiu      $s0, $s0, 0x1
/* 4BB00 8005B300 0E00022A */  slti       $v0, $s0, 0xE
/* 4BB04 8005B304 F8FF4014 */  bnez       $v0, .L8005B2E8
/* 4BB08 8005B308 14003126 */   addiu     $s1, $s1, 0x14
/* 4BB0C 8005B30C FFFF0224 */  addiu      $v0, $zero, -0x1
.L8005B310:
/* 4BB10 8005B310 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4BB14 8005B314 1800B28F */  lw         $s2, 0x18($sp)
/* 4BB18 8005B318 1400B18F */  lw         $s1, 0x14($sp)
/* 4BB1C 8005B31C 1000B08F */  lw         $s0, 0x10($sp)
/* 4BB20 8005B320 0800E003 */  jr         $ra
/* 4BB24 8005B324 2000BD27 */   addiu     $sp, $sp, 0x20
.size WARPGATE_GetWarpRoomIndex, . - WARPGATE_GetWarpRoomIndex
