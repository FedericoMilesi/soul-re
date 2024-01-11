.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_FindVFromAAndD
/* 684E4 80077CE4 40280500 */  sll        $a1, $a1, 1
/* 684E8 80077CE8 18008500 */  mult       $a0, $a1
/* 684EC 80077CEC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 684F0 80077CF0 12200000 */  mflo       $a0
/* 684F4 80077CF4 03008014 */  bnez       $a0, .L80077D04
/* 684F8 80077CF8 1000BFAF */   sw        $ra, 0x10($sp)
/* 684FC 80077CFC 43DF0108 */  j          .L80077D0C
/* 68500 80077D00 21100000 */   addu      $v0, $zero, $zero
.L80077D04:
/* 68504 80077D04 A6E7000C */  jal        MATH3D_FastSqrt0
/* 68508 80077D08 00000000 */   nop
.L80077D0C:
/* 6850C 80077D0C 1000BF8F */  lw         $ra, 0x10($sp)
/* 68510 80077D10 00000000 */  nop
/* 68514 80077D14 0800E003 */  jr         $ra
/* 68518 80077D18 1800BD27 */   addiu     $sp, $sp, 0x18
.size PHYSICS_FindVFromAAndD, . - PHYSICS_FindVFromAAndD
