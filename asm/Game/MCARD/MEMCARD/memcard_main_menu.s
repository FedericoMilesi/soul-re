.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_main_menu
/* AA048 800B9848 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AA04C 800B984C 1800BFAF */  sw         $ra, 0x18($sp)
/* AA050 800B9850 1400B1AF */  sw         $s1, 0x14($sp)
/* AA054 800B9854 1000B0AF */  sw         $s0, 0x10($sp)
/* AA058 800B9858 2400908C */  lw         $s0, 0x24($a0)
/* AA05C 800B985C 2188A000 */  addu       $s1, $a1, $zero
/* AA060 800B9860 F7E5020C */  jal        maybe_start
/* AA064 800B9864 21200002 */   addu      $a0, $s0, $zero
/* AA068 800B9868 07004010 */  beqz       $v0, .L800B9888
/* AA06C 800B986C FFFF0224 */   addiu     $v0, $zero, -0x1
/* AA070 800B9870 0400028E */  lw         $v0, 0x4($s0)
/* AA074 800B9874 0800048E */  lw         $a0, 0x8($s0)
/* AA078 800B9878 1800428C */  lw         $v0, 0x18($v0)
/* AA07C 800B987C 00000000 */  nop
/* AA080 800B9880 09F84000 */  jalr       $v0
/* AA084 800B9884 21282002 */   addu      $a1, $s1, $zero
.L800B9888:
/* AA088 800B9888 1800BF8F */  lw         $ra, 0x18($sp)
/* AA08C 800B988C 1400B18F */  lw         $s1, 0x14($sp)
/* AA090 800B9890 1000B08F */  lw         $s0, 0x10($sp)
/* AA094 800B9894 0800E003 */  jr         $ra
/* AA098 800B9898 2000BD27 */   addiu     $sp, $sp, 0x20
.size memcard_main_menu, . - memcard_main_menu
