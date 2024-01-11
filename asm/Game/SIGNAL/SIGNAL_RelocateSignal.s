.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_RelocateSignal
/* EDEC 8001E5EC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* EDF0 8001E5F0 2000B4AF */  sw         $s4, 0x20($sp)
/* EDF4 8001E5F4 21A08000 */  addu       $s4, $a0, $zero
/* EDF8 8001E5F8 2400B5AF */  sw         $s5, 0x24($sp)
/* EDFC 8001E5FC 21A8A000 */  addu       $s5, $a1, $zero
/* EE00 8001E600 1000B0AF */  sw         $s0, 0x10($sp)
/* EE04 8001E604 08009026 */  addiu      $s0, $s4, 0x8
/* EE08 8001E608 2800BFAF */  sw         $ra, 0x28($sp)
/* EE0C 8001E60C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* EE10 8001E610 1800B2AF */  sw         $s2, 0x18($sp)
/* EE14 8001E614 1400B1AF */  sw         $s1, 0x14($sp)
/* EE18 8001E618 0000828E */  lw         $v0, 0x0($s4)
/* EE1C 8001E61C 00000000 */  nop
/* EE20 8001E620 1F004018 */  blez       $v0, .L8001E6A0
/* EE24 8001E624 21880000 */   addu      $s1, $zero, $zero
/* EE28 8001E628 FF7F123C */  lui        $s2, (0x7FFFFFFF >> 16)
/* EE2C 8001E62C FFFF5236 */  ori        $s2, $s2, (0x7FFFFFFF & 0xFFFF)
/* EE30 8001E630 908E9327 */  addiu      $s3, $gp, %gp_rel(signalInfoList)
.L8001E634:
/* EE34 8001E634 0000038E */  lw         $v1, 0x0($s0)
/* EE38 8001E638 00000000 */  nop
/* EE3C 8001E63C 24187200 */  and        $v1, $v1, $s2
/* EE40 8001E640 40100300 */  sll        $v0, $v1, 1
/* EE44 8001E644 21104300 */  addu       $v0, $v0, $v1
/* EE48 8001E648 80100200 */  sll        $v0, $v0, 2
/* EE4C 8001E64C 21105300 */  addu       $v0, $v0, $s3
/* EE50 8001E650 0800428C */  lw         $v0, 0x8($v0)
/* EE54 8001E654 00000000 */  nop
/* EE58 8001E658 03004010 */  beqz       $v0, .L8001E668
/* EE5C 8001E65C 21200002 */   addu      $a0, $s0, $zero
/* EE60 8001E660 09F84000 */  jalr       $v0
/* EE64 8001E664 2128A002 */   addu      $a1, $s5, $zero
.L8001E668:
/* EE68 8001E668 0000038E */  lw         $v1, 0x0($s0)
/* EE6C 8001E66C 01003126 */  addiu      $s1, $s1, 0x1
/* EE70 8001E670 24187200 */  and        $v1, $v1, $s2
/* EE74 8001E674 40100300 */  sll        $v0, $v1, 1
/* EE78 8001E678 21104300 */  addu       $v0, $v0, $v1
/* EE7C 8001E67C 80100200 */  sll        $v0, $v0, 2
/* EE80 8001E680 21105300 */  addu       $v0, $v0, $s3
/* EE84 8001E684 04004384 */  lh         $v1, 0x4($v0)
/* EE88 8001E688 0000828E */  lw         $v0, 0x0($s4)
/* EE8C 8001E68C 01006324 */  addiu      $v1, $v1, 0x1
/* EE90 8001E690 80180300 */  sll        $v1, $v1, 2
/* EE94 8001E694 2A102202 */  slt        $v0, $s1, $v0
/* EE98 8001E698 E6FF4014 */  bnez       $v0, .L8001E634
/* EE9C 8001E69C 21800302 */   addu      $s0, $s0, $v1
.L8001E6A0:
/* EEA0 8001E6A0 04000226 */  addiu      $v0, $s0, 0x4
/* EEA4 8001E6A4 2800BF8F */  lw         $ra, 0x28($sp)
/* EEA8 8001E6A8 2400B58F */  lw         $s5, 0x24($sp)
/* EEAC 8001E6AC 2000B48F */  lw         $s4, 0x20($sp)
/* EEB0 8001E6B0 1C00B38F */  lw         $s3, 0x1C($sp)
/* EEB4 8001E6B4 1800B28F */  lw         $s2, 0x18($sp)
/* EEB8 8001E6B8 1400B18F */  lw         $s1, 0x14($sp)
/* EEBC 8001E6BC 1000B08F */  lw         $s0, 0x10($sp)
/* EEC0 8001E6C0 0800E003 */  jr         $ra
/* EEC4 8001E6C4 3000BD27 */   addiu     $sp, $sp, 0x30
.size SIGNAL_RelocateSignal, . - SIGNAL_RelocateSignal
