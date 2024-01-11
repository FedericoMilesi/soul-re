.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetPreviousPoint
/* 31FB8 800417B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 31FBC 800417BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 31FC0 800417C0 21808000 */  addu       $s0, $a0, $zero
/* 31FC4 800417C4 1400B1AF */  sw         $s1, 0x14($sp)
/* 31FC8 800417C8 1800BFAF */  sw         $ra, 0x18($sp)
/* 31FCC 800417CC 0B08010C */  jal        SplineGetPrev
/* 31FD0 800417D0 2188A000 */   addu      $s1, $a1, $zero
/* 31FD4 800417D4 08004010 */  beqz       $v0, .L800417F8
/* 31FD8 800417D8 21200002 */   addu      $a0, $s0, $zero
/* 31FDC 800417DC 88C38627 */  addiu      $a2, $gp, %gp_rel(point.56)
/* 31FE0 800417E0 F306010C */  jal        SplineGetData
/* 31FE4 800417E4 21282002 */   addu      $a1, $s1, $zero
/* 31FE8 800417E8 21184000 */  addu       $v1, $v0, $zero
/* 31FEC 800417EC 88C38227 */  addiu      $v0, $gp, %gp_rel(point.56)
/* 31FF0 800417F0 02006014 */  bnez       $v1, .L800417FC
/* 31FF4 800417F4 00000000 */   nop
.L800417F8:
/* 31FF8 800417F8 21100000 */  addu       $v0, $zero, $zero
.L800417FC:
/* 31FFC 800417FC 1800BF8F */  lw         $ra, 0x18($sp)
/* 32000 80041800 1400B18F */  lw         $s1, 0x14($sp)
/* 32004 80041804 1000B08F */  lw         $s0, 0x10($sp)
/* 32008 80041808 0800E003 */  jr         $ra
/* 3200C 8004180C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SplineGetPreviousPoint, . - SplineGetPreviousPoint
