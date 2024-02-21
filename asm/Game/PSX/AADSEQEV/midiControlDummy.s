.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiControlDummy
/* 46650 80055E50 0800E003 */  jr         $ra
/* 46654 80055E54 00000000 */   nop
.size midiControlDummy, . - midiControlDummy
