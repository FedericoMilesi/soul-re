.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphGenericProcess
/* 6CA08 8007C208 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6CA0C 8007C20C 1800B2AF */  sw         $s2, 0x18($sp)
/* 6CA10 8007C210 21908000 */  addu       $s2, $a0, $zero
/* 6CA14 8007C214 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6CA18 8007C218 2198A000 */  addu       $s3, $a1, $zero
/* 6CA1C 8007C21C 2000B4AF */  sw         $s4, 0x20($sp)
/* 6CA20 8007C220 2400BFAF */  sw         $ra, 0x24($sp)
/* 6CA24 8007C224 1400B1AF */  sw         $s1, 0x14($sp)
/* 6CA28 8007C228 1000B0AF */  sw         $s0, 0x10($sp)
/* 6CA2C 8007C22C 6C01518E */  lw         $s1, 0x16C($s2)
/* 6CA30 8007C230 E0EC010C */  jal        ShrinkGlyphMenu
/* 6CA34 8007C234 21A0C000 */   addu      $s4, $a2, $zero
/* 6CA38 8007C238 1000103C */  lui        $s0, (0x100001 >> 16)
/* 6CA3C 8007C23C 01001036 */  ori        $s0, $s0, (0x100001 & 0xFFFF)
.L8007C240:
/* 6CA40 8007C240 39C3010C */  jal        PeekMessageQueue
/* 6CA44 8007C244 04002426 */   addiu     $a0, $s1, 0x4
/* 6CA48 8007C248 21004010 */  beqz       $v0, .L8007C2D0
/* 6CA4C 8007C24C 00000000 */   nop
/* 6CA50 8007C250 0000438C */  lw         $v1, 0x0($v0)
/* 6CA54 8007C254 00000000 */  nop
/* 6CA58 8007C258 0D007010 */  beq        $v1, $s0, .L8007C290
/* 6CA5C 8007C25C 2A100302 */   slt       $v0, $s0, $v1
/* 6CA60 8007C260 06004014 */  bnez       $v0, .L8007C27C
/* 6CA64 8007C264 1000023C */   lui       $v0, (0x100004 >> 16)
/* 6CA68 8007C268 0080023C */  lui        $v0, (0x80000004 >> 16)
/* 6CA6C 8007C26C 0D006210 */  beq        $v1, $v0, .L8007C2A4
/* 6CA70 8007C270 21204002 */   addu      $a0, $s2, $zero
/* 6CA74 8007C274 AEF00108 */  j          .L8007C2B8
/* 6CA78 8007C278 21286002 */   addu      $a1, $s3, $zero
.L8007C27C:
/* 6CA7C 8007C27C 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 6CA80 8007C280 0F006210 */  beq        $v1, $v0, .L8007C2C0
/* 6CA84 8007C284 21204002 */   addu      $a0, $s2, $zero
/* 6CA88 8007C288 AEF00108 */  j          .L8007C2B8
/* 6CA8C 8007C28C 21286002 */   addu      $a1, $s3, $zero
.L8007C290:
/* 6CA90 8007C290 8C002586 */  lh         $a1, 0x8C($s1)
/* 6CA94 8007C294 E8EE010C */  jal        Glyph_StartSpell
/* 6CA98 8007C298 21204002 */   addu      $a0, $s2, $zero
/* 6CA9C 8007C29C B0F00108 */  j          .L8007C2C0
/* 6CAA0 8007C2A0 00000000 */   nop
.L8007C2A4:
/* 6CAA4 8007C2A4 0880053C */  lui        $a1, %hi(_GlyphOffProcess)
/* 6CAA8 8007C2A8 59EB010C */  jal        _GlyphSwitchProcess
/* 6CAAC 8007C2AC A0B5A524 */   addiu     $a1, $a1, %lo(_GlyphOffProcess)
/* 6CAB0 8007C2B0 B0F00108 */  j          .L8007C2C0
/* 6CAB4 8007C2B4 00000000 */   nop
.L8007C2B8:
/* 6CAB8 8007C2B8 B6EB010C */  jal        _GlyphDefaultProcess
/* 6CABC 8007C2BC 21308002 */   addu      $a2, $s4, $zero
.L8007C2C0:
/* 6CAC0 8007C2C0 27C3010C */  jal        DeMessageQueue
/* 6CAC4 8007C2C4 04002426 */   addiu     $a0, $s1, 0x4
/* 6CAC8 8007C2C8 90F00108 */  j          .L8007C240
/* 6CACC 8007C2CC 00000000 */   nop
.L8007C2D0:
/* 6CAD0 8007C2D0 DEEC8287 */  lh         $v0, %gp_rel(glyph_trigger)($gp)
/* 6CAD4 8007C2D4 00000000 */  nop
/* 6CAD8 8007C2D8 0F004010 */  beqz       $v0, .L8007C318
/* 6CADC 8007C2DC 00000000 */   nop
/* 6CAE0 8007C2E0 1C00428E */  lw         $v0, 0x1C($s2)
/* 6CAE4 8007C2E4 8C002586 */  lh         $a1, 0x8C($s1)
/* 6CAE8 8007C2E8 1C00508C */  lw         $s0, 0x1C($v0)
/* 6CAEC 8007C2EC A8EF010C */  jal        Glyph_DoSpell
/* 6CAF0 8007C2F0 21204002 */   addu      $a0, $s2, $zero
/* 6CAF4 8007C2F4 8C002586 */  lh         $a1, 0x8C($s1)
/* 6CAF8 8007C2F8 DEEC80A7 */  sh         $zero, %gp_rel(glyph_trigger)($gp)
/* 6CAFC 8007C2FC B2EB010C */  jal        _GlyphCost
/* 6CB00 8007C300 21200002 */   addu      $a0, $s0, $zero
/* 6CB04 8007C304 0400053C */  lui        $a1, (0x40008 >> 16)
/* 6CB08 8007C308 0800A534 */  ori        $a1, $a1, (0x40008 & 0xFFFF)
/* 6CB0C 8007C30C F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6CB10 8007C310 A1D1000C */  jal        INSTANCE_Post
/* 6CB14 8007C314 21304000 */   addu      $a2, $v0, $zero
.L8007C318:
/* 6CB18 8007C318 56F0010C */  jal        Glyph_DoFX
/* 6CB1C 8007C31C 21204002 */   addu      $a0, $s2, $zero
/* 6CB20 8007C320 2400BF8F */  lw         $ra, 0x24($sp)
/* 6CB24 8007C324 2000B48F */  lw         $s4, 0x20($sp)
/* 6CB28 8007C328 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6CB2C 8007C32C 1800B28F */  lw         $s2, 0x18($sp)
/* 6CB30 8007C330 1400B18F */  lw         $s1, 0x14($sp)
/* 6CB34 8007C334 1000B08F */  lw         $s0, 0x10($sp)
/* 6CB38 8007C338 0800E003 */  jr         $ra
/* 6CB3C 8007C33C 2800BD27 */   addiu     $sp, $sp, 0x28
.size _GlyphGenericProcess, . - _GlyphGenericProcess
