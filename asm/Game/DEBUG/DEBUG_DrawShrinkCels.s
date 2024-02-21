.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_DrawShrinkCels
/* 4C60 80014460 0800E003 */  jr         $ra
/* 4C64 80014464 00000000 */   nop
.size DEBUG_DrawShrinkCels, . - DEBUG_DrawShrinkCels
