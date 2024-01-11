.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_ChangeDirectoryFlag
/* 28C8C 8003848C 1CBC828F */  lw         $v0, %gp_rel(loadStatus + 0x88)($gp)
/* 28C90 80038490 0800E003 */  jr         $ra
/* 28C94 80038494 00000000 */   nop
.size LOAD_ChangeDirectoryFlag, . - LOAD_ChangeDirectoryFlag
