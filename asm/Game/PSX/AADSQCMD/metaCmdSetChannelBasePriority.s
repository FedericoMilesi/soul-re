.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelBasePriority
/* 46D20 80056520 0800E003 */  jr         $ra
/* 46D24 80056524 00000000 */   nop
.size metaCmdSetChannelBasePriority, . - metaCmdSetChannelBasePriority
