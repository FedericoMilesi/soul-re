.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_ProcessSecondController
/* 5100 80014900 0800E003 */  jr         $ra
/* 5104 80014904 00000000 */   nop
.size DEBUG_ProcessSecondController, . - DEBUG_ProcessSecondController
