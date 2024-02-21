.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdIgnoreChannelPitchMap
/* 46D8C 8005658C 0800E003 */  jr         $ra
/* 46D90 80056590 00000000 */   nop
.size metaCmdIgnoreChannelPitchMap, . - metaCmdIgnoreChannelPitchMap
