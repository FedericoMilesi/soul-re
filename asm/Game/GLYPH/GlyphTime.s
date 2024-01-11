.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphTime
/* 6BB64 8007B364 18008400 */  mult       $a0, $a0
/* 6BB68 8007B368 12100000 */  mflo       $v0
/* 6BB6C 8007B36C 02004104 */  bgez       $v0, .L8007B378
/* 6BB70 8007B370 00000000 */   nop
/* 6BB74 8007B374 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8007B378:
/* 6BB78 8007B378 0800E003 */  jr         $ra
/* 6BB7C 8007B37C 03130200 */   sra       $v0, $v0, 12
.size GlyphTime, . - GlyphTime
