.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdLoopBreak
/* 4733C 80056B3C 0800E003 */  jr         $ra
/* 47340 80056B40 00000000 */   nop
.size metaCmdLoopBreak, . - metaCmdLoopBreak
