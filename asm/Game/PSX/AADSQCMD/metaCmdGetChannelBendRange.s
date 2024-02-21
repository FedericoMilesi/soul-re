.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetChannelBendRange
/* 46F68 80056768 0800E003 */  jr         $ra
/* 46F6C 8005676C 00000000 */   nop
.size metaCmdGetChannelBendRange, . - metaCmdGetChannelBendRange
