.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_SetSearchDirectory
/* 28C74 80038474 08BC84AF */  sw         $a0, %gp_rel(loadStatus + 0x74)($gp)
/* 28C78 80038478 0800E003 */  jr         $ra
/* 28C7C 8003847C 00000000 */   nop
.size LOAD_SetSearchDirectory, . - LOAD_SetSearchDirectory
