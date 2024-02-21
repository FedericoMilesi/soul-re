.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_EnvironmentDamageEntry
/* 7B980 8008B180 0800E003 */  jr         $ra
/* 7B984 8008B184 00000000 */   nop
.size MON_EnvironmentDamageEntry, . - MON_EnvironmentDamageEntry
