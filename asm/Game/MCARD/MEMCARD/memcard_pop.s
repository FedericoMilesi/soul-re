.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_pop
/* AA104 800B9904 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA108 800B9908 1000B0AF */  sw         $s0, 0x10($sp)
/* AA10C 800B990C 0D80103C */  lui        $s0, %hi(gameTrackerX)
/* AA110 800B9910 60331026 */  addiu      $s0, $s0, %lo(gameTrackerX)
/* AA114 800B9914 1400BFAF */  sw         $ra, 0x14($sp)
/* AA118 800B9918 2000048E */  lw         $a0, 0x20($s0)
/* AA11C 800B991C 0ADE020C */  jal        menu_pop
/* AA120 800B9920 00000000 */   nop
/* AA124 800B9924 2400048E */  lw         $a0, 0x24($s0)
/* AA128 800B9928 E6E5020C */  jal        memcard_end
/* AA12C 800B992C 00000000 */   nop
/* AA130 800B9930 1400BF8F */  lw         $ra, 0x14($sp)
/* AA134 800B9934 1000B08F */  lw         $s0, 0x10($sp)
/* AA138 800B9938 0800E003 */  jr         $ra
/* AA13C 800B993C 1800BD27 */   addiu     $sp, $sp, 0x18
.size memcard_pop, . - memcard_pop
