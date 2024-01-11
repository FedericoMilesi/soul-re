.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_SetInterpController_Vector
/* 8123C 80090A3C B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 81240 80090A40 3000B2AF */  sw         $s2, 0x30($sp)
/* 81244 80090A44 21908000 */  addu       $s2, $a0, $zero
/* 81248 80090A48 3400B3AF */  sw         $s3, 0x34($sp)
/* 8124C 80090A4C 2198A000 */  addu       $s3, $a1, $zero
/* 81250 80090A50 3800B4AF */  sw         $s4, 0x38($sp)
/* 81254 80090A54 21A0C000 */  addu       $s4, $a2, $zero
/* 81258 80090A58 4000B6AF */  sw         $s6, 0x40($sp)
/* 8125C 80090A5C 21B0E000 */  addu       $s6, $a3, $zero
/* 81260 80090A60 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 81264 80090A64 5800B58F */  lw         $s5, 0x58($sp)
/* 81268 80090A68 4400BFAF */  sw         $ra, 0x44($sp)
/* 8126C 80090A6C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 81270 80090A70 0A47020C */  jal        _G2Anim_FindController
/* 81274 80090A74 2800B0AF */   sw        $s0, 0x28($sp)
/* 81278 80090A78 21884000 */  addu       $s1, $v0, $zero
/* 8127C 80090A7C 02002292 */  lbu        $v0, 0x2($s1)
/* 81280 80090A80 08000324 */  addiu      $v1, $zero, 0x8
/* 81284 80090A84 38004230 */  andi       $v0, $v0, 0x38
/* 81288 80090A88 13004314 */  bne        $v0, $v1, .L80090AD8
/* 8128C 80090A8C 21204002 */   addu      $a0, $s2, $zero
/* 81290 80090A90 2120C002 */  addu       $a0, $s6, $zero
/* 81294 80090A94 08002692 */  lbu        $a2, 0x8($s1)
/* 81298 80090A98 A745020C */  jal        _G2Anim_CopyVectorWithOrder
/* 8129C 80090A9C 1800A527 */   addiu     $a1, $sp, 0x18
/* 812A0 80090AA0 2000B027 */  addiu      $s0, $sp, 0x20
/* 812A4 80090AA4 21200002 */  addu       $a0, $s0, $zero
/* 812A8 80090AA8 63E7010C */  jal        func_80079D8C
/* 812AC 80090AAC 1800A527 */   addiu     $a1, $sp, 0x18
/* 812B0 80090AB0 21204002 */  addu       $a0, $s2, $zero
/* 812B4 80090AB4 21286002 */  addu       $a1, $s3, $zero
/* 812B8 80090AB8 21308002 */  addu       $a2, $s4, $zero
/* 812BC 80090ABC 21380002 */  addu       $a3, $s0, $zero
/* 812C0 80090AC0 00141500 */  sll        $v0, $s5, 16
/* 812C4 80090AC4 03140200 */  sra        $v0, $v0, 16
/* 812C8 80090AC8 E842020C */  jal        G2Anim_SetInterpController_Quat
/* 812CC 80090ACC 1000A2AF */   sw        $v0, 0x10($sp)
/* 812D0 80090AD0 DE420208 */  j          .L80090B78
/* 812D4 80090AD4 00000000 */   nop
.L80090AD8:
/* 812D8 80090AD8 21286002 */  addu       $a1, $s3, $zero
/* 812DC 80090ADC 21308002 */  addu       $a2, $s4, $zero
/* 812E0 80090AE0 14003026 */  addiu      $s0, $s1, 0x14
/* 812E4 80090AE4 0D42020C */  jal        G2Anim_GetControllerCurrentInterpVector
/* 812E8 80090AE8 21380002 */   addu      $a3, $s0, $zero
/* 812EC 80090AEC 0000C286 */  lh         $v0, 0x0($s6)
/* 812F0 80090AF0 14002386 */  lh         $v1, 0x14($s1)
/* 812F4 80090AF4 00000000 */  nop
/* 812F8 80090AF8 23104300 */  subu       $v0, $v0, $v1
/* 812FC 80090AFC 00130200 */  sll        $v0, $v0, 12
/* 81300 80090B00 001C1500 */  sll        $v1, $s5, 16
/* 81304 80090B04 031C0300 */  sra        $v1, $v1, 16
/* 81308 80090B08 01006324 */  addiu      $v1, $v1, 0x1
/* 8130C 80090B0C 1A004300 */  div        $zero, $v0, $v1
/* 81310 80090B10 12100000 */  mflo       $v0
/* 81314 80090B14 00000000 */  nop
/* 81318 80090B18 1A0022A6 */  sh         $v0, 0x1A($s1)
/* 8131C 80090B1C 0200C286 */  lh         $v0, 0x2($s6)
/* 81320 80090B20 02000486 */  lh         $a0, 0x2($s0)
/* 81324 80090B24 00000000 */  nop
/* 81328 80090B28 23104400 */  subu       $v0, $v0, $a0
/* 8132C 80090B2C 00130200 */  sll        $v0, $v0, 12
/* 81330 80090B30 1A004300 */  div        $zero, $v0, $v1
/* 81334 80090B34 12100000 */  mflo       $v0
/* 81338 80090B38 1A002526 */  addiu      $a1, $s1, 0x1A
/* 8133C 80090B3C 0200A2A4 */  sh         $v0, 0x2($a1)
/* 81340 80090B40 0400C286 */  lh         $v0, 0x4($s6)
/* 81344 80090B44 04000486 */  lh         $a0, 0x4($s0)
/* 81348 80090B48 00000000 */  nop
/* 8134C 80090B4C 23104400 */  subu       $v0, $v0, $a0
/* 81350 80090B50 00130200 */  sll        $v0, $v0, 12
/* 81354 80090B54 1A004300 */  div        $zero, $v0, $v1
/* 81358 80090B58 12100000 */  mflo       $v0
/* 8135C 80090B5C 00000000 */  nop
/* 81360 80090B60 0400A2A4 */  sh         $v0, 0x4($a1)
/* 81364 80090B64 08002292 */  lbu        $v0, 0x8($s1)
/* 81368 80090B68 0A0035A6 */  sh         $s5, 0xA($s1)
/* 8136C 80090B6C 0C0020A6 */  sh         $zero, 0xC($s1)
/* 81370 80090B70 00404234 */  ori        $v0, $v0, 0x4000
/* 81374 80090B74 080022A6 */  sh         $v0, 0x8($s1)
.L80090B78:
/* 81378 80090B78 4400BF8F */  lw         $ra, 0x44($sp)
/* 8137C 80090B7C 4000B68F */  lw         $s6, 0x40($sp)
/* 81380 80090B80 3C00B58F */  lw         $s5, 0x3C($sp)
/* 81384 80090B84 3800B48F */  lw         $s4, 0x38($sp)
/* 81388 80090B88 3400B38F */  lw         $s3, 0x34($sp)
/* 8138C 80090B8C 3000B28F */  lw         $s2, 0x30($sp)
/* 81390 80090B90 2C00B18F */  lw         $s1, 0x2C($sp)
/* 81394 80090B94 2800B08F */  lw         $s0, 0x28($sp)
/* 81398 80090B98 0800E003 */  jr         $ra
/* 8139C 80090B9C 4800BD27 */   addiu     $sp, $sp, 0x48
.size G2Anim_SetInterpController_Vector, . - G2Anim_SetInterpController_Vector
