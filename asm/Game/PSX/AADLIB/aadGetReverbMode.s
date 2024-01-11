.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetReverbMode
/* 44D80 80054580 0800E003 */  jr         $ra
/* 44D84 80054584 03000224 */   addiu     $v0, $zero, 0x3
.size aadGetReverbMode, . - aadGetReverbMode
