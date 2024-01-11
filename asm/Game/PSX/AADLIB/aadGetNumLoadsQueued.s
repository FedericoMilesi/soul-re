.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetNumLoadsQueued
/* 436BC 80052EBC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 436C0 80052EC0 00000000 */  nop
/* 436C4 80052EC4 4807428C */  lw         $v0, 0x748($v0)
/* 436C8 80052EC8 0800E003 */  jr         $ra
/* 436CC 80052ECC 00000000 */   nop
.size aadGetNumLoadsQueued, . - aadGetNumLoadsQueued
