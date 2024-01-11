.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsWarpgateInUse
/* 4BC5C 8005B45C 18C7828F */  lw         $v0, %gp_rel(WarpGateLoadInfo)($gp)
/* 4BC60 8005B460 0800E003 */  jr         $ra
/* 4BC64 8005B464 00000000 */   nop
.size WARPGATE_IsWarpgateInUse, . - WARPGATE_IsWarpgateInUse
