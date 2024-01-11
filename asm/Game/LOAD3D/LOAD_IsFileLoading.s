.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_IsFileLoading
/* 28CC8 800384C8 A8BB828F */  lw         $v0, %gp_rel(loadStatus + 0x14)($gp)
/* 28CCC 800384CC 0800E003 */  jr         $ra
/* 28CD0 800384D0 2B100200 */   sltu      $v0, $zero, $v0
.size LOAD_IsFileLoading, . - LOAD_IsFileLoading
