.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_HandleGlobalValueSignal
/* 30CBC 800404BC 0800E003 */  jr         $ra
/* 30CC0 800404C0 00000000 */   nop
.size SOUND_HandleGlobalValueSignal, . - SOUND_HandleGlobalValueSignal
