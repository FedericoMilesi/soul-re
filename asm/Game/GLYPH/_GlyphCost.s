.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphCost
/* 6B6C8 8007AEC8 2120A400 */  addu       $a0, $a1, $a0
/* 6B6CC 8007AECC 03008290 */  lbu        $v0, 0x3($a0)
/* 6B6D0 8007AED0 0800E003 */  jr         $ra
/* 6B6D4 8007AED4 00000000 */   nop
.size _GlyphCost, . - _GlyphCost
