.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_IsInInterpolation
/* 8087C 8009007C 2C00828C */  lw         $v0, 0x2C($a0)
/* 80880 80090080 00000000 */  nop
/* 80884 80090084 05004010 */  beqz       $v0, .L8009009C
/* 80888 80090088 00000000 */   nop
/* 8088C 8009008C 0800428C */  lw         $v0, 0x8($v0)
/* 80890 80090090 00000000 */  nop
/* 80894 80090094 03004014 */  bnez       $v0, .L800900A4
/* 80898 80090098 00000000 */   nop
.L8009009C:
/* 8089C 8009009C 0800E003 */  jr         $ra
/* 808A0 800900A0 21100000 */   addu      $v0, $zero, $zero
.L800900A4:
/* 808A4 800900A4 0800E003 */  jr         $ra
/* 808A8 800900A8 01000224 */   addiu     $v0, $zero, 0x1
.size G2AnimSection_IsInInterpolation, . - G2AnimSection_IsInInterpolation
