.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiNoteOff
/* 458A4 800550A4 0800E003 */  jr         $ra
/* 458A8 800550A8 00000000 */   nop
.size midiNoteOff, . - midiNoteOff
