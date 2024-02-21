.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiPolyphonicAftertouch
/* 464B0 80055CB0 0800E003 */  jr         $ra
/* 464B4 80055CB4 00000000 */   nop
.size midiPolyphonicAftertouch, . - midiPolyphonicAftertouch
