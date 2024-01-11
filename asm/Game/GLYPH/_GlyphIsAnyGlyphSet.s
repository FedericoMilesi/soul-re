.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphIsAnyGlyphSet
/* 6B698 8007AE98 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B69C 8007AE9C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6B6A0 8007AEA0 1000BFAF */  sw         $ra, 0x10($sp)
/* 6B6A4 8007AEA4 92D1000C */  jal        INSTANCE_Query
/* 6B6A8 8007AEA8 24000524 */   addiu     $a1, $zero, 0x24
/* 6B6AC 8007AEAC 60AB838F */  lw         $v1, %gp_rel(debugRazielFlags3)($gp)
/* 6B6B0 8007AEB0 1000BF8F */  lw         $ra, 0x10($sp)
/* 6B6B4 8007AEB4 25104300 */  or         $v0, $v0, $v1
/* 6B6B8 8007AEB8 FC01033C */  lui        $v1, (0x1FC0000 >> 16)
/* 6B6BC 8007AEBC 24104300 */  and        $v0, $v0, $v1
/* 6B6C0 8007AEC0 0800E003 */  jr         $ra
/* 6B6C4 8007AEC4 1800BD27 */   addiu     $sp, $sp, 0x18
.size _GlyphIsAnyGlyphSet, . - _GlyphIsAnyGlyphSet
