.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Effect
/* 7F22C 8008EA2C 0800E003 */  jr         $ra
/* 7F230 8008EA30 00000000 */   nop
.size SOUL_Effect, . - SOUL_Effect
