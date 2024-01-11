.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_LoadReturn
/* 64AE8 800742E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 64AEC 800742EC 1000BFAF */  sw         $ra, 0x10($sp)
/* 64AF0 800742F0 2641010C */  jal        MEMPACK_Free
/* 64AF4 800742F4 2120A000 */   addu      $a0, $a1, $zero
/* 64AF8 800742F8 1000BF8F */  lw         $ra, 0x10($sp)
/* 64AFC 800742FC 00000000 */  nop
/* 64B00 80074300 0800E003 */  jr         $ra
/* 64B04 80074304 1800BD27 */   addiu     $sp, $sp, 0x18
.size VRAM_LoadReturn, . - VRAM_LoadReturn
