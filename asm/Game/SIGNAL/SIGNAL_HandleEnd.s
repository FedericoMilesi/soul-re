.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleEnd
/* EB84 8001E384 0800E003 */  jr         $ra
/* EB88 8001E388 21100000 */   addu      $v0, $zero, $zero
.size SIGNAL_HandleEnd, . - SIGNAL_HandleEnd
