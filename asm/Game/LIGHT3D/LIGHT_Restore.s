.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LIGHT_Restore
/* 279AC 800371AC 0800E003 */  jr         $ra
/* 279B0 800371B0 00000000 */   nop
.size LIGHT_Restore, . - LIGHT_Restore
