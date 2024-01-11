.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_SetColorIndex
/* 1E2F8 8002DAF8 08BA84A3 */  sb         $a0, %gp_rel(fontTracker + 0x61C)($gp)
/* 1E2FC 8002DAFC 0800E003 */  jr         $ra
/* 1E300 8002DB00 00000000 */   nop
.size FONT_SetColorIndex, . - FONT_SetColorIndex
