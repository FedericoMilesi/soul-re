.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SfxOn
/* 30FD0 800407D0 0800E003 */  jr         $ra
/* 30FD4 800407D4 00000000 */   nop
.size SOUND_SfxOn, . - SOUND_SfxOn
