.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdPlaySoundEffect
/* 476E0 80056EE0 0800E003 */  jr         $ra
/* 476E4 80056EE4 00000000 */   nop
.size metaCmdPlaySoundEffect, . - metaCmdPlaySoundEffect
