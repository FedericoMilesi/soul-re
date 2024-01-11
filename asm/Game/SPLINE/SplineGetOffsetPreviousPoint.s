.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetOffsetPreviousPoint
/* 32D08 80042508 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 32D0C 8004250C 1000B0AF */  sw         $s0, 0x10($sp)
/* 32D10 80042510 21808000 */  addu       $s0, $a0, $zero
/* 32D14 80042514 1400B1AF */  sw         $s1, 0x14($sp)
/* 32D18 80042518 1800BFAF */  sw         $ra, 0x18($sp)
/* 32D1C 8004251C CF08010C */  jal        SplineGetOffsetPrev
/* 32D20 80042520 2188A000 */   addu      $s1, $a1, $zero
/* 32D24 80042524 08004010 */  beqz       $v0, .L80042548
/* 32D28 80042528 21200002 */   addu      $a0, $s0, $zero
/* 32D2C 8004252C A8C38627 */  addiu      $a2, $gp, %gp_rel(point.80)
/* 32D30 80042530 F306010C */  jal        SplineGetData
/* 32D34 80042534 21282002 */   addu      $a1, $s1, $zero
/* 32D38 80042538 21184000 */  addu       $v1, $v0, $zero
/* 32D3C 8004253C A8C38227 */  addiu      $v0, $gp, %gp_rel(point.80)
/* 32D40 80042540 02006014 */  bnez       $v1, .L8004254C
/* 32D44 80042544 00000000 */   nop
.L80042548:
/* 32D48 80042548 21100000 */  addu       $v0, $zero, $zero
.L8004254C:
/* 32D4C 8004254C 1800BF8F */  lw         $ra, 0x18($sp)
/* 32D50 80042550 1400B18F */  lw         $s1, 0x14($sp)
/* 32D54 80042554 1000B08F */  lw         $s0, 0x10($sp)
/* 32D58 80042558 0800E003 */  jr         $ra
/* 32D5C 8004255C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SplineGetOffsetPreviousPoint, . - SplineGetOffsetPreviousPoint
