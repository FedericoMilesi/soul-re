.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphTrigger
/* 6CB40 8007C340 F0A48287 */  lh         $v0, %gp_rel(fx_going)($gp)
/* 6CB44 8007C344 00000000 */  nop
/* 6CB48 8007C348 02004014 */  bnez       $v0, .L8007C354
/* 6CB4C 8007C34C 01000224 */   addiu     $v0, $zero, 0x1
/* 6CB50 8007C350 DEEC82A7 */  sh         $v0, %gp_rel(glyph_trigger)($gp)
.L8007C354:
/* 6CB54 8007C354 0800E003 */  jr         $ra
/* 6CB58 8007C358 00000000 */   nop
.size GlyphTrigger, . - GlyphTrigger
