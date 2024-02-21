.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSlotVolumeFade
/* 46CF8 800564F8 0800E003 */  jr         $ra
/* 46CFC 800564FC 00000000 */   nop
.size metaCmdSlotVolumeFade, . - metaCmdSlotVolumeFade
