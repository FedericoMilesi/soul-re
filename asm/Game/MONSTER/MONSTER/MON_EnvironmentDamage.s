.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_EnvironmentDamage
/* 7B988 8008B188 0800E003 */  jr         $ra
/* 7B98C 8008B18C 00000000 */   nop
.size MON_EnvironmentDamage, . - MON_EnvironmentDamage
