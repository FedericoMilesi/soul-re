.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_UpdateMorphPalettes
/* 64C08 80074408 0800E003 */  jr         $ra
/* 64C0C 8007440C 00000000 */   nop
.size VRAM_UpdateMorphPalettes, . - VRAM_UpdateMorphPalettes
