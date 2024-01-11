.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_DistanceBetweenPositions
/* 2A728 80039F28 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2A72C 80039F2C 21108000 */  addu       $v0, $a0, $zero
/* 2A730 80039F30 1000BFAF */  sw         $ra, 0x10($sp)
/* 2A734 80039F34 0000A384 */  lh         $v1, 0x0($a1)
/* 2A738 80039F38 00004484 */  lh         $a0, 0x0($v0)
/* 2A73C 80039F3C 0200A884 */  lh         $t0, 0x2($a1)
/* 2A740 80039F40 0400A784 */  lh         $a3, 0x4($a1)
/* 2A744 80039F44 04004684 */  lh         $a2, 0x4($v0)
/* 2A748 80039F48 23206400 */  subu       $a0, $v1, $a0
/* 2A74C 80039F4C 02004384 */  lh         $v1, 0x2($v0)
/* 2A750 80039F50 2330E600 */  subu       $a2, $a3, $a2
/* 2A754 80039F54 E7E9000C */  jal        MATH3D_SquareLength
/* 2A758 80039F58 23280301 */   subu      $a1, $t0, $v1
/* 2A75C 80039F5C A6E7000C */  jal        MATH3D_FastSqrt0
/* 2A760 80039F60 21204000 */   addu      $a0, $v0, $zero
/* 2A764 80039F64 1000BF8F */  lw         $ra, 0x10($sp)
/* 2A768 80039F68 00000000 */  nop
/* 2A76C 80039F6C 0800E003 */  jr         $ra
/* 2A770 80039F70 1800BD27 */   addiu     $sp, $sp, 0x18
.size MATH3D_DistanceBetweenPositions, . - MATH3D_DistanceBetweenPositions
