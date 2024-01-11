.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphIsGlyphUsable
/* 6B65C 8007AE5C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B660 8007AE60 1000B0AF */  sw         $s0, 0x10($sp)
/* 6B664 8007AE64 21808000 */  addu       $s0, $a0, $zero
/* 6B668 8007AE68 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6B66C 8007AE6C 1400BFAF */  sw         $ra, 0x14($sp)
/* 6B670 8007AE70 92D1000C */  jal        INSTANCE_Query
/* 6B674 8007AE74 13000524 */   addiu     $a1, $zero, 0x13
/* 6B678 8007AE78 11001026 */  addiu      $s0, $s0, 0x11
/* 6B67C 8007AE7C 01000324 */  addiu      $v1, $zero, 0x1
/* 6B680 8007AE80 04180302 */  sllv       $v1, $v1, $s0
/* 6B684 8007AE84 1400BF8F */  lw         $ra, 0x14($sp)
/* 6B688 8007AE88 1000B08F */  lw         $s0, 0x10($sp)
/* 6B68C 8007AE8C 24106200 */  and        $v0, $v1, $v0
/* 6B690 8007AE90 0800E003 */  jr         $ra
/* 6B694 8007AE94 1800BD27 */   addiu     $sp, $sp, 0x18
.size _GlyphIsGlyphUsable, . - _GlyphIsGlyphUsable
