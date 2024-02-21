.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSlotPanFade
/* 46D00 80056500 0800E003 */  jr         $ra
/* 46D04 80056504 00000000 */   nop
.size metaCmdSlotPanFade, . - metaCmdSlotPanFade
