.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DebugProcess
/* 93ABC 800A32BC 0800E003 */  jr         $ra
/* 93AC0 800A32C0 00000000 */   nop
.size DebugProcess, . - DebugProcess
