.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_SetMemoryDoneStreamed
/* 40ED4 800506D4 01000224 */  addiu      $v0, $zero, 0x1
/* 40ED8 800506D8 0800E003 */  jr         $ra
/* 40EDC 800506DC FAFF82A0 */   sb        $v0, -0x6($a0)
.size MEMPACK_SetMemoryDoneStreamed, . - MEMPACK_SetMemoryDoneStreamed
