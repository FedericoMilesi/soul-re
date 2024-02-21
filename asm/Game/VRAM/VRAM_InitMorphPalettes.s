.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_InitMorphPalettes
/* 64C00 80074400 0800E003 */  jr         $ra
/* 64C04 80074404 00000000 */   nop
.size VRAM_InitMorphPalettes, . - VRAM_InitMorphPalettes
