.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdUsePrimaryTempo
/* 467F4 80055FF4 0800E003 */  jr         $ra
/* 467F8 80055FF8 00000000 */   nop
.size metaCmdUsePrimaryTempo, . - metaCmdUsePrimaryTempo
