.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_PrintVramBlock
/* 63644 80072E44 0800E003 */  jr         $ra
/* 63648 80072E48 00000000 */   nop
.size VRAM_PrintVramBlock, . - VRAM_PrintVramBlock
