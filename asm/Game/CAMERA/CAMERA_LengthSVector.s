.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_LengthSVector
/* 6A70 80016270 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6A74 80016274 1000BFAF */  sw         $ra, 0x10($sp)
/* 6A78 80016278 00008284 */  lh         $v0, 0x0($a0)
/* 6A7C 8001627C 00000000 */  nop
/* 6A80 80016280 18004200 */  mult       $v0, $v0
/* 6A84 80016284 12280000 */  mflo       $a1
/* 6A88 80016288 02008284 */  lh         $v0, 0x2($a0)
/* 6A8C 8001628C 00000000 */  nop
/* 6A90 80016290 18004200 */  mult       $v0, $v0
/* 6A94 80016294 12180000 */  mflo       $v1
/* 6A98 80016298 04008284 */  lh         $v0, 0x4($a0)
/* 6A9C 8001629C 00000000 */  nop
/* 6AA0 800162A0 18004200 */  mult       $v0, $v0
/* 6AA4 800162A4 2120A300 */  addu       $a0, $a1, $v1
/* 6AA8 800162A8 12380000 */  mflo       $a3
/* 6AAC 800162AC A6E7000C */  jal        MATH3D_FastSqrt0
/* 6AB0 800162B0 21208700 */   addu      $a0, $a0, $a3
/* 6AB4 800162B4 1000BF8F */  lw         $ra, 0x10($sp)
/* 6AB8 800162B8 00000000 */  nop
/* 6ABC 800162BC 0800E003 */  jr         $ra
/* 6AC0 800162C0 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_LengthSVector, . - CAMERA_LengthSVector
