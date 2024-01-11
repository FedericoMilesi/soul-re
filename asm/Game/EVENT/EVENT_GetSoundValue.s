.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetSoundValue
/* 565C4 80065DC4 0800E003 */  jr         $ra
/* 565C8 80065DC8 21100000 */   addu      $v0, $zero, $zero
.size EVENT_GetSoundValue, . - EVENT_GetSoundValue
