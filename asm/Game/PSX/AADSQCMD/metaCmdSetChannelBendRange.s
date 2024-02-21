.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelBendRange
/* 469F8 800561F8 0800E003 */  jr         $ra
/* 469FC 800561FC 00000000 */   nop
.size metaCmdSetChannelBendRange, . - metaCmdSetChannelBendRange
