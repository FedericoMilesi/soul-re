.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiChannelAftertouch
/* 4650C 80055D0C 0800E003 */  jr         $ra
/* 46510 80055D10 00000000 */   nop
.size midiChannelAftertouch, . - midiChannelAftertouch
