.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_DeactivatedProcess
/* 22B3C 8003233C 0800E003 */  jr         $ra
/* 22B40 80032340 00000000 */   nop
.size INSTANCE_DeactivatedProcess, . - INSTANCE_DeactivatedProcess
