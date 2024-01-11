.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_SizeOfFreeSpace
/* A71E8 800B69E8 E8FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0xC)($gp)
/* A71EC 800B69EC E4FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A71F0 800B69F0 0800E003 */  jr         $ra
/* A71F4 800B69F4 23106200 */   subu      $v0, $v1, $v0
.size SAVE_SizeOfFreeSpace, . - SAVE_SizeOfFreeSpace
