.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetNextPoint
/* 31F60 80041760 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 31F64 80041764 1000B0AF */  sw         $s0, 0x10($sp)
/* 31F68 80041768 21808000 */  addu       $s0, $a0, $zero
/* 31F6C 8004176C 1400B1AF */  sw         $s1, 0x14($sp)
/* 31F70 80041770 1800BFAF */  sw         $ra, 0x18($sp)
/* 31F74 80041774 C407010C */  jal        SplineGetNext
/* 31F78 80041778 2188A000 */   addu      $s1, $a1, $zero
/* 31F7C 8004177C 08004010 */  beqz       $v0, .L800417A0
/* 31F80 80041780 21200002 */   addu      $a0, $s0, $zero
/* 31F84 80041784 80C38627 */  addiu      $a2, $gp, %gp_rel(point.53)
/* 31F88 80041788 F306010C */  jal        SplineGetData
/* 31F8C 8004178C 21282002 */   addu      $a1, $s1, $zero
/* 31F90 80041790 21184000 */  addu       $v1, $v0, $zero
/* 31F94 80041794 80C38227 */  addiu      $v0, $gp, %gp_rel(point.53)
/* 31F98 80041798 02006014 */  bnez       $v1, .L800417A4
/* 31F9C 8004179C 00000000 */   nop
.L800417A0:
/* 31FA0 800417A0 21100000 */  addu       $v0, $zero, $zero
.L800417A4:
/* 31FA4 800417A4 1800BF8F */  lw         $ra, 0x18($sp)
/* 31FA8 800417A8 1400B18F */  lw         $s1, 0x14($sp)
/* 31FAC 800417AC 1000B08F */  lw         $s0, 0x10($sp)
/* 31FB0 800417B0 0800E003 */  jr         $ra
/* 31FB4 800417B4 2000BD27 */   addiu     $sp, $sp, 0x20
.size SplineGetNextPoint, . - SplineGetNextPoint
