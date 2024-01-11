.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphIsGlyphOpen
/* 6B604 8007AE04 6C01828C */  lw         $v0, 0x16C($a0)
/* 6B608 8007AE08 00000000 */  nop
/* 6B60C 8007AE0C 8E004284 */  lh         $v0, 0x8E($v0)
/* 6B610 8007AE10 0800E003 */  jr         $ra
/* 6B614 8007AE14 00000000 */   nop
.size GlyphIsGlyphOpen, . - GlyphIsGlyphOpen
