.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdUseSecondaryTempo
/* 467FC 80055FFC 0800E003 */  jr         $ra
/* 46800 80056000 00000000 */   nop
.size metaCmdUseSecondaryTempo, . - metaCmdUseSecondaryTempo
