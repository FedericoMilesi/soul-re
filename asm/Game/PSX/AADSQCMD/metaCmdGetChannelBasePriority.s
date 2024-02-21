.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetChannelBasePriority
/* 46F60 80056760 0800E003 */  jr         $ra
/* 46F64 80056764 00000000 */   nop
.size metaCmdGetChannelBasePriority, . - metaCmdGetChannelBasePriority
