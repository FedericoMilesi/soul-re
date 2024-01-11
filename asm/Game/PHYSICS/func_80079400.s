.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80079400
/* 69C00 80079400 0800E003 */  jr         $ra
/* 69C04 80079404 21E08000 */   addu      $gp, $a0, $zero
.size func_80079400, . - func_80079400
