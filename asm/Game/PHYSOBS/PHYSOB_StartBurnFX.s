.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_StartBurnFX
/* 5B600 8006AE00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5B604 8006AE04 1800B2AF */  sw         $s2, 0x18($sp)
/* 5B608 8006AE08 21908000 */  addu       $s2, $a0, $zero
/* 5B60C 8006AE0C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5B610 8006AE10 1400B1AF */  sw         $s1, 0x14($sp)
/* 5B614 8006AE14 1000B0AF */  sw         $s0, 0x10($sp)
/* 5B618 8006AE18 6C01428E */  lw         $v0, 0x16C($s2)
/* 5B61C 8006AE1C 00000000 */  nop
/* 5B620 8006AE20 34004284 */  lh         $v0, 0x34($v0)
/* 5B624 8006AE24 1C00518E */  lw         $s1, 0x1C($s2)
/* 5B628 8006AE28 12004014 */  bnez       $v0, .L8006AE74
/* 5B62C 8006AE2C 00000000 */   nop
/* 5B630 8006AE30 36002286 */  lh         $v0, 0x36($s1)
/* 5B634 8006AE34 00000000 */  nop
/* 5B638 8006AE38 0E004010 */  beqz       $v0, .L8006AE74
/* 5B63C 8006AE3C 00000000 */   nop
/* 5B640 8006AE40 0C004018 */  blez       $v0, .L8006AE74
/* 5B644 8006AE44 21800000 */   addu      $s0, $zero, $zero
/* 5B648 8006AE48 80101000 */  sll        $v0, $s0, 2
.L8006AE4C:
/* 5B64C 8006AE4C 21204002 */  addu       $a0, $s2, $zero
/* 5B650 8006AE50 3800258E */  lw         $a1, 0x38($s1)
/* 5B654 8006AE54 01000624 */  addiu      $a2, $zero, 0x1
/* 5B658 8006AE58 8E34010C */  jal        FX_StartInstanceEffect
/* 5B65C 8006AE5C 2128A200 */   addu      $a1, $a1, $v0
/* 5B660 8006AE60 36002286 */  lh         $v0, 0x36($s1)
/* 5B664 8006AE64 01001026 */  addiu      $s0, $s0, 0x1
/* 5B668 8006AE68 2A100202 */  slt        $v0, $s0, $v0
/* 5B66C 8006AE6C F7FF4014 */  bnez       $v0, .L8006AE4C
/* 5B670 8006AE70 80101000 */   sll       $v0, $s0, 2
.L8006AE74:
/* 5B674 8006AE74 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5B678 8006AE78 1800B28F */  lw         $s2, 0x18($sp)
/* 5B67C 8006AE7C 1400B18F */  lw         $s1, 0x14($sp)
/* 5B680 8006AE80 1000B08F */  lw         $s0, 0x10($sp)
/* 5B684 8006AE84 0800E003 */  jr         $ra
/* 5B688 8006AE88 2000BD27 */   addiu     $sp, $sp, 0x20
.size PHYSOB_StartBurnFX, . - PHYSOB_StartBurnFX
