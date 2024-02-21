.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_CaptureScreen
/* 4F9C 8001479C 0800E003 */  jr         $ra
/* 4FA0 800147A0 00000000 */   nop
.size DEBUG_CaptureScreen, . - DEBUG_CaptureScreen
