.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdDefineLabel
/* 47344 80056B44 0800E003 */  jr         $ra
/* 47348 80056B48 00000000 */   nop
.size metaCmdDefineLabel, . - metaCmdDefineLabel
