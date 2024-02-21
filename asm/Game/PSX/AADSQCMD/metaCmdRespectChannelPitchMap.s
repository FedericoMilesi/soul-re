.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdRespectChannelPitchMap
/* 46D94 80056594 0800E003 */  jr         $ra
/* 46D98 80056598 00000000 */   nop
.size metaCmdRespectChannelPitchMap, . - metaCmdRespectChannelPitchMap
