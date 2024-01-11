.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoAreaAction
/* 565CC 80065DCC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 565D0 80065DD0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 565D4 80065DD4 21888000 */  addu       $s1, $a0, $zero
/* 565D8 80065DD8 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 565DC 80065DDC 01000224 */  addiu      $v0, $zero, 0x1
/* 565E0 80065DE0 2000BFAF */  sw         $ra, 0x20($sp)
/* 565E4 80065DE4 1800B0AF */  sw         $s0, 0x18($sp)
/* 565E8 80065DE8 1400A2AF */  sw         $v0, 0x14($sp)
/* 565EC 80065DEC 0400228E */  lw         $v0, 0x4($s1)
/* 565F0 80065DF0 0000308E */  lw         $s0, 0x0($s1)
/* 565F4 80065DF4 1A004310 */  beq        $v0, $v1, .L80065E60
/* 565F8 80065DF8 2120A000 */   addu      $a0, $a1, $zero
/* 565FC 80065DFC 1000A527 */  addiu      $a1, $sp, 0x10
/* 56600 80065E00 008E010C */  jal        EVENT_ParseOperand2
/* 56604 80065E04 1400A627 */   addiu     $a2, $sp, 0x14
/* 56608 80065E08 21184000 */  addu       $v1, $v0, $zero
/* 5660C 80065E0C 0400248E */  lw         $a0, 0x4($s1)
/* 56610 80065E10 70000224 */  addiu      $v0, $zero, 0x70
/* 56614 80065E14 0B008210 */  beq        $a0, $v0, .L80065E44
/* 56618 80065E18 71000224 */   addiu     $v0, $zero, 0x71
/* 5661C 80065E1C 10008214 */  bne        $a0, $v0, .L80065E60
/* 56620 80065E20 00000000 */   nop
/* 56624 80065E24 1000A28F */  lw         $v0, 0x10($sp)
/* 56628 80065E28 00000000 */  nop
/* 5662C 80065E2C 0C004014 */  bnez       $v0, .L80065E60
/* 56630 80065E30 00000000 */   nop
/* 56634 80065E34 0800028E */  lw         $v0, 0x8($s0)
/* 56638 80065E38 3A0003A6 */  sh         $v1, 0x3A($s0)
/* 5663C 80065E3C 98970108 */  j          .L80065E60
/* 56640 80065E40 460043A4 */   sh        $v1, 0x46($v0)
.L80065E44:
/* 56644 80065E44 1000A28F */  lw         $v0, 0x10($sp)
/* 56648 80065E48 00000000 */  nop
/* 5664C 80065E4C 04004014 */  bnez       $v0, .L80065E60
/* 56650 80065E50 00000000 */   nop
/* 56654 80065E54 0800028E */  lw         $v0, 0x8($s0)
/* 56658 80065E58 380003A6 */  sh         $v1, 0x38($s0)
/* 5665C 80065E5C 440043A4 */  sh         $v1, 0x44($v0)
.L80065E60:
/* 56660 80065E60 2000BF8F */  lw         $ra, 0x20($sp)
/* 56664 80065E64 1C00B18F */  lw         $s1, 0x1C($sp)
/* 56668 80065E68 1800B08F */  lw         $s0, 0x18($sp)
/* 5666C 80065E6C 21100000 */  addu       $v0, $zero, $zero
/* 56670 80065E70 0800E003 */  jr         $ra
/* 56674 80065E74 2800BD27 */   addiu     $sp, $sp, 0x28
.size EVENT_DoAreaAction, . - EVENT_DoAreaAction
