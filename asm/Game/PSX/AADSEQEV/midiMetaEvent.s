.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiMetaEvent
/* 4655C 80055D5C 0800E003 */  jr         $ra
/* 46560 80055D60 00000000 */   nop
.size midiMetaEvent, . - midiMetaEvent
