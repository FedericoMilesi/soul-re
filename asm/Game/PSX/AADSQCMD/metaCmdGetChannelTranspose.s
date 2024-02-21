.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetChannelTranspose
/* 46F20 80056720 0800E003 */  jr         $ra
/* 46F24 80056724 00000000 */   nop
.size metaCmdGetChannelTranspose, . - metaCmdGetChannelTranspose
