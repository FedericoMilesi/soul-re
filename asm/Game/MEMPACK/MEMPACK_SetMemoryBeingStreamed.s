.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_SetMemoryBeingStreamed
/* 40EC8 800506C8 02000224 */  addiu      $v0, $zero, 0x2
/* 40ECC 800506CC 0800E003 */  jr         $ra
/* 40ED0 800506D0 FAFF82A0 */   sb        $v0, -0x6($a0)
.size MEMPACK_SetMemoryBeingStreamed, . - MEMPACK_SetMemoryBeingStreamed
