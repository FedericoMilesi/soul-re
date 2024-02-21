.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_BirthEntry
/* 78A6C 8008826C 0800E003 */  jr         $ra
/* 78A70 80088270 00000000 */   nop
.size MON_BirthEntry, . - MON_BirthEntry
