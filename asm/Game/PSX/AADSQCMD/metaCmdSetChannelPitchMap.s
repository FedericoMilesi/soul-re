.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelPitchMap
/* 46D84 80056584 0800E003 */  jr         $ra
/* 46D88 80056588 00000000 */   nop
.size metaCmdSetChannelPitchMap, . - metaCmdSetChannelPitchMap
