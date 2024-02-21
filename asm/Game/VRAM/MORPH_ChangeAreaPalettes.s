.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_ChangeAreaPalettes
/* 64C10 80074410 0800E003 */  jr         $ra
/* 64C14 80074414 00000000 */   nop
.size MORPH_ChangeAreaPalettes, . - MORPH_ChangeAreaPalettes
