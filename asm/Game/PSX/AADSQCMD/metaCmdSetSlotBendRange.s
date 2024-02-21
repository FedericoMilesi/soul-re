.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetSlotBendRange
/* 469F0 800561F0 0800E003 */  jr         $ra
/* 469F4 800561F4 00000000 */   nop
.size metaCmdSetSlotBendRange, . - metaCmdSetSlotBendRange
