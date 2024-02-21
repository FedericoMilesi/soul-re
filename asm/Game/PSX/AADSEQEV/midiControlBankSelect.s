.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiControlBankSelect
/* 46564 80055D64 0800E003 */  jr         $ra
/* 46568 80055D68 00000000 */   nop
.size midiControlBankSelect, . - midiControlBankSelect
