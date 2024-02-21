.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainG2_ShutDownEngine
/* 866D4 80095ED4 0800E003 */  jr         $ra
/* 866D8 80095ED8 00000000 */   nop
.size MainG2_ShutDownEngine, . - MainG2_ShutDownEngine
