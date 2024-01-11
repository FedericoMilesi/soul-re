.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_ReportFreeMemory
/* 40DEC 800505EC F4C6838F */  lw         $v1, %gp_rel(newMemTracker + 0x4)($gp)
/* 40DF0 800505F0 F8C6828F */  lw         $v0, %gp_rel(newMemTracker + 0x8)($gp)
/* 40DF4 800505F4 0800E003 */  jr         $ra
/* 40DF8 800505F8 23106200 */   subu      $v0, $v1, $v0
.size MEMPACK_ReportFreeMemory, . - MEMPACK_ReportFreeMemory
