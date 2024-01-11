.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCallSignal
/* E904 8001E104 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E908 8001E108 1000BFAF */  sw         $ra, 0x10($sp)
/* E90C 8001E10C 0400A58C */  lw         $a1, 0x4($a1)
/* E910 8001E110 21300000 */  addu       $a2, $zero, $zero
/* E914 8001E114 7279000C */  jal        SIGNAL_HandleSignal
/* E918 8001E118 0800A524 */   addiu     $a1, $a1, 0x8
/* E91C 8001E11C 1000BF8F */  lw         $ra, 0x10($sp)
/* E920 8001E120 01000224 */  addiu      $v0, $zero, 0x1
/* E924 8001E124 0800E003 */  jr         $ra
/* E928 8001E128 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCallSignal, . - SIGNAL_HandleCallSignal
