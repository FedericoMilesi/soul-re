.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdChannelVolumeFade
/* 46CE8 800564E8 0800E003 */  jr         $ra
/* 46CEC 800564EC 00000000 */   nop
.size metaCmdChannelVolumeFade, . - metaCmdChannelVolumeFade
