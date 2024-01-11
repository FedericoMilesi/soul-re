.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsWarpgateReady
/* 4BC88 8005B488 1CC78283 */  lb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4BC8C 8005B48C 00000000 */  nop
/* 4BC90 8005B490 04004238 */  xori       $v0, $v0, 0x4
/* 4BC94 8005B494 0800E003 */  jr         $ra
/* 4BC98 8005B498 0100422C */   sltiu     $v0, $v0, 0x1
.size WARPGATE_IsWarpgateReady, . - WARPGATE_IsWarpgateReady
