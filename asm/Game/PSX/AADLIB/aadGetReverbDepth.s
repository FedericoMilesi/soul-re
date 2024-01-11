.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetReverbDepth
/* 44DB8 800545B8 0800E003 */  jr         $ra
/* 44DBC 800545BC 10270224 */   addiu     $v0, $zero, 0x2710
.size aadGetReverbDepth, . - aadGetReverbDepth
