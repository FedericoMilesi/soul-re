.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_StartNewGame
/* 98680 800A7E80 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 98684 800A7E84 30F68427 */  addiu      $a0, $gp, %gp_rel(Raziel)
/* 98688 800A7E88 21280000 */  addu       $a1, $zero, $zero
/* 9868C 800A7E8C 1000BFAF */  sw         $ra, 0x10($sp)
/* 98690 800A7E90 2EF2020C */  jal        func_800BC8B8
/* 98694 800A7E94 B8050624 */   addiu     $a2, $zero, 0x5B8
/* 98698 800A7E98 1000BF8F */  lw         $ra, 0x10($sp)
/* 9869C 800A7E9C 00000000 */  nop
/* 986A0 800A7EA0 0800E003 */  jr         $ra
/* 986A4 800A7EA4 1800BD27 */   addiu     $sp, $sp, 0x18
.size RAZIEL_StartNewGame, . - RAZIEL_StartNewGame
