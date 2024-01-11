.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphIsGlyphSet
/* 6B618 8007AE18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B61C 8007AE1C 1000B0AF */  sw         $s0, 0x10($sp)
/* 6B620 8007AE20 21808000 */  addu       $s0, $a0, $zero
/* 6B624 8007AE24 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6B628 8007AE28 1400BFAF */  sw         $ra, 0x14($sp)
/* 6B62C 8007AE2C 92D1000C */  jal        INSTANCE_Query
/* 6B630 8007AE30 24000524 */   addiu     $a1, $zero, 0x24
/* 6B634 8007AE34 11001026 */  addiu      $s0, $s0, 0x11
/* 6B638 8007AE38 60AB838F */  lw         $v1, %gp_rel(debugRazielFlags3)($gp)
/* 6B63C 8007AE3C 1400BF8F */  lw         $ra, 0x14($sp)
/* 6B640 8007AE40 25184300 */  or         $v1, $v0, $v1
/* 6B644 8007AE44 01000224 */  addiu      $v0, $zero, 0x1
/* 6B648 8007AE48 04100202 */  sllv       $v0, $v0, $s0
/* 6B64C 8007AE4C 1000B08F */  lw         $s0, 0x10($sp)
/* 6B650 8007AE50 24104300 */  and        $v0, $v0, $v1
/* 6B654 8007AE54 0800E003 */  jr         $ra
/* 6B658 8007AE58 1800BD27 */   addiu     $sp, $sp, 0x18
.size _GlyphIsGlyphSet, . - _GlyphIsGlyphSet
