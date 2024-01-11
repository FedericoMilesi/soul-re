.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_ACForcedMovement
/* 9A1C 8001921C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9A20 80019220 2000B0AF */  sw         $s0, 0x20($sp)
/* 9A24 80019224 2180A000 */  addu       $s0, $a1, $zero
/* 9A28 80019228 2800BFAF */  sw         $ra, 0x28($sp)
/* 9A2C 8001922C 2400B1AF */  sw         $s1, 0x24($sp)
/* 9A30 80019230 4400028E */  lw         $v0, 0x44($s0)
/* 9A34 80019234 21888000 */  addu       $s1, $a0, $zero
/* 9A38 80019238 80100200 */  sll        $v0, $v0, 2
/* 9A3C 8001923C 21100202 */  addu       $v0, $s0, $v0
/* 9A40 80019240 0000438C */  lw         $v1, 0x0($v0)
/* 9A44 80019244 1400428C */  lw         $v0, 0x14($v0)
/* 9A48 80019248 08006484 */  lh         $a0, 0x8($v1)
/* 9A4C 8001924C 2400458C */  lw         $a1, 0x24($v0)
/* 9A50 80019250 C27A000C */  jal        COLLIDE_GetNormal
/* 9A54 80019254 1000A627 */   addiu     $a2, $sp, 0x10
/* 9A58 80019258 1800A427 */  addiu      $a0, $sp, 0x18
/* 9A5C 8001925C 5000028E */  lw         $v0, 0x50($s0)
/* 9A60 80019260 5400038E */  lw         $v1, 0x54($s0)
/* 9A64 80019264 00004594 */  lhu        $a1, 0x0($v0)
/* 9A68 80019268 02004694 */  lhu        $a2, 0x2($v0)
/* 9A6C 8001926C 04004294 */  lhu        $v0, 0x4($v0)
/* 9A70 80019270 00006794 */  lhu        $a3, 0x0($v1)
/* 9A74 80019274 02006894 */  lhu        $t0, 0x2($v1)
/* 9A78 80019278 04006394 */  lhu        $v1, 0x4($v1)
/* 9A7C 8001927C 2328A700 */  subu       $a1, $a1, $a3
/* 9A80 80019280 2330C800 */  subu       $a2, $a2, $t0
/* 9A84 80019284 23104300 */  subu       $v0, $v0, $v1
/* 9A88 80019288 1800A5A7 */  sh         $a1, 0x18($sp)
/* 9A8C 8001928C 020086A4 */  sh         $a2, 0x2($a0)
/* 9A90 80019290 0663000C */  jal        CAMERA_Normalize
/* 9A94 80019294 040082A4 */   sh        $v0, 0x4($a0)
/* 9A98 80019298 1800A387 */  lh         $v1, 0x18($sp)
/* 9A9C 8001929C 1000A287 */  lh         $v0, 0x10($sp)
/* 9AA0 800192A0 00000000 */  nop
/* 9AA4 800192A4 18006200 */  mult       $v1, $v0
/* 9AA8 800192A8 1A00A387 */  lh         $v1, 0x1A($sp)
/* 9AAC 800192AC 1200A287 */  lh         $v0, 0x12($sp)
/* 9AB0 800192B0 00000000 */  nop
/* 9AB4 800192B4 18006200 */  mult       $v1, $v0
/* 9AB8 800192B8 1C00A387 */  lh         $v1, 0x1C($sp)
/* 9ABC 800192BC 1400A287 */  lh         $v0, 0x14($sp)
/* 9AC0 800192C0 00000000 */  nop
/* 9AC4 800192C4 18006200 */  mult       $v1, $v0
/* 9AC8 800192C8 4C000296 */  lhu        $v0, 0x4C($s0)
/* 9ACC 800192CC 00000000 */  nop
/* 9AD0 800192D0 B00122A6 */  sh         $v0, 0x1B0($s1)
/* 9AD4 800192D4 2800BF8F */  lw         $ra, 0x28($sp)
/* 9AD8 800192D8 2400B18F */  lw         $s1, 0x24($sp)
/* 9ADC 800192DC 2000B08F */  lw         $s0, 0x20($sp)
/* 9AE0 800192E0 21100000 */  addu       $v0, $zero, $zero
/* 9AE4 800192E4 0800E003 */  jr         $ra
/* 9AE8 800192E8 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAMERA_ACForcedMovement, . - CAMERA_ACForcedMovement
