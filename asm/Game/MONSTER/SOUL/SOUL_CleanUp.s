.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_CleanUp
/* 7E4E8 8008DCE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7E4EC 8008DCEC 1000BFAF */  sw         $ra, 0x10($sp)
/* 7E4F0 8008DCF0 CC33020C */  jal        MON_CleanUp
/* 7E4F4 8008DCF4 00000000 */   nop
/* 7E4F8 8008DCF8 1000BF8F */  lw         $ra, 0x10($sp)
/* 7E4FC 8008DCFC 00000000 */  nop
/* 7E500 8008DD00 0800E003 */  jr         $ra
/* 7E504 8008DD04 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUL_CleanUp, . - SOUL_CleanUp
