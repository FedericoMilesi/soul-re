.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphCollide
/* 6B480 8007AC80 0800E003 */  jr         $ra
/* 6B484 8007AC84 00000000 */   nop
.size GlyphCollide, . - GlyphCollide
