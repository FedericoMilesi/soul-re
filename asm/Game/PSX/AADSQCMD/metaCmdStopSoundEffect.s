.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdStopSoundEffect
/* 476E8 80056EE8 0800E003 */  jr         $ra
/* 476EC 80056EEC 00000000 */   nop
.size metaCmdStopSoundEffect, . - metaCmdStopSoundEffect
