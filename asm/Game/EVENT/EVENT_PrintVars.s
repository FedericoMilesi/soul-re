.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_PrintVars
/* 58FBC 800687BC 0800E003 */  jr         $ra
/* 58FC0 800687C0 00000000 */   nop
.size EVENT_PrintVars, . - EVENT_PrintVars
