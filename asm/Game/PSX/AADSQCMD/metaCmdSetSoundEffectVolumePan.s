.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetSoundEffectVolumePan
/* 476F0 80056EF0 0800E003 */  jr         $ra
/* 476F4 80056EF4 00000000 */   nop
.size metaCmdSetSoundEffectVolumePan, . - metaCmdSetSoundEffectVolumePan
