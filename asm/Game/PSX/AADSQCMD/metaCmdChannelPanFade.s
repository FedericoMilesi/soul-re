.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdChannelPanFade
/* 46CF0 800564F0 0800E003 */  jr         $ra
/* 46CF4 800564F4 00000000 */   nop
.size metaCmdChannelPanFade, . - metaCmdChannelPanFade
