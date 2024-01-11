.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsWarpgateUsable
/* 4BC74 8005B474 1CC78297 */  lhu        $v0, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4BC78 8005B478 00000000 */  nop
/* 4BC7C 8005B47C 04004238 */  xori       $v0, $v0, 0x4
/* 4BC80 8005B480 0800E003 */  jr         $ra
/* 4BC84 8005B484 0100422C */   sltiu     $v0, $v0, 0x1
.size WARPGATE_IsWarpgateUsable, . - WARPGATE_IsWarpgateUsable
