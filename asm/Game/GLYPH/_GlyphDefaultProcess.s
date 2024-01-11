.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GlyphDefaultProcess
/* 6B6D8 8007AED8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6B6DC 8007AEDC 1400B1AF */  sw         $s1, 0x14($sp)
/* 6B6E0 8007AEE0 21888000 */  addu       $s1, $a0, $zero
/* 6B6E4 8007AEE4 1800B2AF */  sw         $s2, 0x18($sp)
/* 6B6E8 8007AEE8 0080123C */  lui        $s2, (0x80000010 >> 16)
/* 6B6EC 8007AEEC 10005236 */  ori        $s2, $s2, (0x80000010 & 0xFFFF)
/* 6B6F0 8007AEF0 2000BFAF */  sw         $ra, 0x20($sp)
/* 6B6F4 8007AEF4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6B6F8 8007AEF8 1000B0AF */  sw         $s0, 0x10($sp)
/* 6B6FC 8007AEFC 6C01228E */  lw         $v0, 0x16C($s1)
/* 6B700 8007AF00 0880133C */  lui        $s3, %hi(_GlyphSelectProcess)
/* 6B704 8007AF04 04005024 */  addiu      $s0, $v0, 0x4
.L8007AF08:
/* 6B708 8007AF08 39C3010C */  jal        PeekMessageQueue
/* 6B70C 8007AF0C 21200002 */   addu      $a0, $s0, $zero
/* 6B710 8007AF10 10004010 */  beqz       $v0, .L8007AF54
/* 6B714 8007AF14 00000000 */   nop
/* 6B718 8007AF18 0000428C */  lw         $v0, 0x0($v0)
/* 6B71C 8007AF1C 00000000 */  nop
/* 6B720 8007AF20 08005214 */  bne        $v0, $s2, .L8007AF44
/* 6B724 8007AF24 21202002 */   addu      $a0, $s1, $zero
/* 6B728 8007AF28 59EB010C */  jal        _GlyphSwitchProcess
/* 6B72C 8007AF2C D8B66526 */   addiu     $a1, $s3, %lo(_GlyphSelectProcess)
/* 6B730 8007AF30 11000424 */  addiu      $a0, $zero, 0x11
/* 6B734 8007AF34 7F000524 */  addiu      $a1, $zero, 0x7F
/* 6B738 8007AF38 40000624 */  addiu      $a2, $zero, 0x40
/* 6B73C 8007AF3C 2402010C */  jal        SndPlayVolPan
/* 6B740 8007AF40 21380000 */   addu      $a3, $zero, $zero
.L8007AF44:
/* 6B744 8007AF44 27C3010C */  jal        DeMessageQueue
/* 6B748 8007AF48 21200002 */   addu      $a0, $s0, $zero
/* 6B74C 8007AF4C C2EB0108 */  j          .L8007AF08
/* 6B750 8007AF50 00000000 */   nop
.L8007AF54:
/* 6B754 8007AF54 2000BF8F */  lw         $ra, 0x20($sp)
/* 6B758 8007AF58 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6B75C 8007AF5C 1800B28F */  lw         $s2, 0x18($sp)
/* 6B760 8007AF60 1400B18F */  lw         $s1, 0x14($sp)
/* 6B764 8007AF64 1000B08F */  lw         $s0, 0x10($sp)
/* 6B768 8007AF68 0800E003 */  jr         $ra
/* 6B76C 8007AF6C 2800BD27 */   addiu     $sp, $sp, 0x28
.size _GlyphDefaultProcess, . - _GlyphDefaultProcess
