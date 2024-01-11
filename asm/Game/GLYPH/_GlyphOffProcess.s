.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphOffProcess
/* 6BDA0 8007B5A0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6BDA4 8007B5A4 1400B1AF */  sw         $s1, 0x14($sp)
/* 6BDA8 8007B5A8 21888000 */  addu       $s1, $a0, $zero
/* 6BDAC 8007B5AC 2000B4AF */  sw         $s4, 0x20($sp)
/* 6BDB0 8007B5B0 21A0A000 */  addu       $s4, $a1, $zero
/* 6BDB4 8007B5B4 2400B5AF */  sw         $s5, 0x24($sp)
/* 6BDB8 8007B5B8 2800BFAF */  sw         $ra, 0x28($sp)
/* 6BDBC 8007B5BC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6BDC0 8007B5C0 1800B2AF */  sw         $s2, 0x18($sp)
/* 6BDC4 8007B5C4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6BDC8 8007B5C8 6C01308E */  lw         $s0, 0x16C($s1)
/* 6BDCC 8007B5CC E0EC010C */  jal        ShrinkGlyphMenu
/* 6BDD0 8007B5D0 21A8C000 */   addu      $s5, $a2, $zero
/* 6BDD4 8007B5D4 1000123C */  lui        $s2, (0x100001 >> 16)
/* 6BDD8 8007B5D8 01005236 */  ori        $s2, $s2, (0x100001 & 0xFFFF)
/* 6BDDC 8007B5DC 0880023C */  lui        $v0, %hi(_GlyphSelectProcess)
/* 6BDE0 8007B5E0 D8B65324 */  addiu      $s3, $v0, %lo(_GlyphSelectProcess)
.L8007B5E4:
/* 6BDE4 8007B5E4 39C3010C */  jal        PeekMessageQueue
/* 6BDE8 8007B5E8 04000426 */   addiu     $a0, $s0, 0x4
/* 6BDEC 8007B5EC 26004010 */  beqz       $v0, .L8007B688
/* 6BDF0 8007B5F0 00000000 */   nop
/* 6BDF4 8007B5F4 0000438C */  lw         $v1, 0x0($v0)
/* 6BDF8 8007B5F8 00000000 */  nop
/* 6BDFC 8007B5FC 1E007210 */  beq        $v1, $s2, .L8007B678
/* 6BE00 8007B600 2A104302 */   slt       $v0, $s2, $v1
/* 6BE04 8007B604 07004014 */  bnez       $v0, .L8007B624
/* 6BE08 8007B608 1000023C */   lui       $v0, (0x100004 >> 16)
/* 6BE0C 8007B60C 0080023C */  lui        $v0, (0x80000010 >> 16)
/* 6BE10 8007B610 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 6BE14 8007B614 08006210 */  beq        $v1, $v0, .L8007B638
/* 6BE18 8007B618 21202002 */   addu      $a0, $s1, $zero
/* 6BE1C 8007B61C 9CED0108 */  j          .L8007B670
/* 6BE20 8007B620 21288002 */   addu      $a1, $s4, $zero
.L8007B624:
/* 6BE24 8007B624 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 6BE28 8007B628 10006214 */  bne        $v1, $v0, .L8007B66C
/* 6BE2C 8007B62C 21202002 */   addu      $a0, $s1, $zero
/* 6BE30 8007B630 9EED0108 */  j          .L8007B678
/* 6BE34 8007B634 00000000 */   nop
.L8007B638:
/* 6BE38 8007B638 0000028E */  lw         $v0, 0x0($s0)
/* 6BE3C 8007B63C 00000000 */  nop
/* 6BE40 8007B640 06005314 */  bne        $v0, $s3, .L8007B65C
/* 6BE44 8007B644 0880053C */   lui       $a1, %hi(_GlyphOffProcess)
/* 6BE48 8007B648 21202002 */  addu       $a0, $s1, $zero
/* 6BE4C 8007B64C 59EB010C */  jal        _GlyphSwitchProcess
/* 6BE50 8007B650 A0B5A524 */   addiu     $a1, $a1, %lo(_GlyphOffProcess)
/* 6BE54 8007B654 9EED0108 */  j          .L8007B678
/* 6BE58 8007B658 00000000 */   nop
.L8007B65C:
/* 6BE5C 8007B65C 59EB010C */  jal        _GlyphSwitchProcess
/* 6BE60 8007B660 21286002 */   addu      $a1, $s3, $zero
/* 6BE64 8007B664 9EED0108 */  j          .L8007B678
/* 6BE68 8007B668 00000000 */   nop
.L8007B66C:
/* 6BE6C 8007B66C 21288002 */  addu       $a1, $s4, $zero
.L8007B670:
/* 6BE70 8007B670 B6EB010C */  jal        _GlyphDefaultProcess
/* 6BE74 8007B674 2130A002 */   addu      $a2, $s5, $zero
.L8007B678:
/* 6BE78 8007B678 27C3010C */  jal        DeMessageQueue
/* 6BE7C 8007B67C 04000426 */   addiu     $a0, $s0, 0x4
/* 6BE80 8007B680 79ED0108 */  j          .L8007B5E4
/* 6BE84 8007B684 00000000 */   nop
.L8007B688:
/* 6BE88 8007B688 0000038E */  lw         $v1, 0x0($s0)
/* 6BE8C 8007B68C 0880023C */  lui        $v0, %hi(_GlyphSelectProcess)
/* 6BE90 8007B690 D8B64224 */  addiu      $v0, $v0, %lo(_GlyphSelectProcess)
/* 6BE94 8007B694 05006214 */  bne        $v1, $v0, .L8007B6AC
/* 6BE98 8007B698 11000424 */   addiu     $a0, $zero, 0x11
/* 6BE9C 8007B69C 7F000524 */  addiu      $a1, $zero, 0x7F
/* 6BEA0 8007B6A0 40000624 */  addiu      $a2, $zero, 0x40
/* 6BEA4 8007B6A4 2402010C */  jal        SndPlayVolPan
/* 6BEA8 8007B6A8 21380000 */   addu      $a3, $zero, $zero
.L8007B6AC:
/* 6BEAC 8007B6AC 56F0010C */  jal        Glyph_DoFX
/* 6BEB0 8007B6B0 21202002 */   addu      $a0, $s1, $zero
/* 6BEB4 8007B6B4 2800BF8F */  lw         $ra, 0x28($sp)
/* 6BEB8 8007B6B8 2400B58F */  lw         $s5, 0x24($sp)
/* 6BEBC 8007B6BC 2000B48F */  lw         $s4, 0x20($sp)
/* 6BEC0 8007B6C0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6BEC4 8007B6C4 1800B28F */  lw         $s2, 0x18($sp)
/* 6BEC8 8007B6C8 1400B18F */  lw         $s1, 0x14($sp)
/* 6BECC 8007B6CC 1000B08F */  lw         $s0, 0x10($sp)
/* 6BED0 8007B6D0 0800E003 */  jr         $ra
/* 6BED4 8007B6D4 3000BD27 */   addiu     $sp, $sp, 0x30
.size _GlyphOffProcess, . - _GlyphOffProcess
