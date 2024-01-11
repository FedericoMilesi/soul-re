.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_MatrixColumnLength
/* 2B468 8003AC68 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2B46C 8003AC6C 40280500 */  sll        $a1, $a1, 1
/* 2B470 8003AC70 21108500 */  addu       $v0, $a0, $a1
/* 2B474 8003AC74 1000BFAF */  sw         $ra, 0x10($sp)
/* 2B478 8003AC78 00004484 */  lh         $a0, 0x0($v0)
/* 2B47C 8003AC7C 06004584 */  lh         $a1, 0x6($v0)
/* 2B480 8003AC80 0C004684 */  lh         $a2, 0xC($v0)
/* 2B484 8003AC84 E7E9000C */  jal        MATH3D_SquareLength
/* 2B488 8003AC88 00000000 */   nop
/* 2B48C 8003AC8C A6E7000C */  jal        MATH3D_FastSqrt0
/* 2B490 8003AC90 21204000 */   addu      $a0, $v0, $zero
/* 2B494 8003AC94 1000BF8F */  lw         $ra, 0x10($sp)
/* 2B498 8003AC98 00000000 */  nop
/* 2B49C 8003AC9C 0800E003 */  jr         $ra
/* 2B4A0 8003ACA0 1800BD27 */   addiu     $sp, $sp, 0x18
.size PIPE3D_MatrixColumnLength, . - PIPE3D_MatrixColumnLength
