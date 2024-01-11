.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_GetSearchDirectory
/* 28C80 80038480 08BC828F */  lw         $v0, %gp_rel(loadStatus + 0x74)($gp)
/* 28C84 80038484 0800E003 */  jr         $ra
/* 28C88 80038488 00000000 */   nop
.size LOAD_GetSearchDirectory, . - LOAD_GetSearchDirectory
