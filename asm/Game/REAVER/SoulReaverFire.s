.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverFire
/* 6B358 8007AB58 D4EC8287 */  lh         $v0, %gp_rel(FireReaverFlag)($gp)
/* 6B35C 8007AB5C 0800E003 */  jr         $ra
/* 6B360 8007AB60 00000000 */   nop
.size SoulReaverFire, . - SoulReaverFire
