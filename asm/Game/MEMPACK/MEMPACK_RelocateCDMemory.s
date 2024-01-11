.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_RelocateCDMemory
/* 4226C 80051A6C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 42270 80051A70 08008524 */  addiu      $a1, $a0, 0x8
/* 42274 80051A74 1000BFAF */  sw         $ra, 0x10($sp)
/* 42278 80051A78 26E1000C */  jal        LOAD_UpdateBigFilePointers
/* 4227C 80051A7C 2120C000 */   addu      $a0, $a2, $zero
/* 42280 80051A80 1000BF8F */  lw         $ra, 0x10($sp)
/* 42284 80051A84 00000000 */  nop
/* 42288 80051A88 0800E003 */  jr         $ra
/* 4228C 80051A8C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MEMPACK_RelocateCDMemory, . - MEMPACK_RelocateCDMemory
