.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsWarpgateActive
/* 4BC68 8005B468 1CC78283 */  lb         $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4BC6C 8005B46C 0800E003 */  jr         $ra
/* 4BC70 8005B470 2B100200 */   sltu      $v0, $zero, $v0
.size WARPGATE_IsWarpgateActive, . - WARPGATE_IsWarpgateActive
