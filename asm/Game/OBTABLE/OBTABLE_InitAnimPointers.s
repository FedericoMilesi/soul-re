.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_InitAnimPointers
/* 2EE04 8003E604 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2EE08 8003E608 2400B5AF */  sw         $s5, 0x24($sp)
/* 2EE0C 8003E60C 21A88000 */  addu       $s5, $a0, $zero
/* 2EE10 8003E610 2800BFAF */  sw         $ra, 0x28($sp)
/* 2EE14 8003E614 2000B4AF */  sw         $s4, 0x20($sp)
/* 2EE18 8003E618 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2EE1C 8003E61C 1800B2AF */  sw         $s2, 0x18($sp)
/* 2EE20 8003E620 1400B1AF */  sw         $s1, 0x14($sp)
/* 2EE24 8003E624 1000B0AF */  sw         $s0, 0x10($sp)
/* 2EE28 8003E628 1000B38E */  lw         $s3, 0x10($s5)
/* 2EE2C 8003E62C 00000000 */  nop
/* 2EE30 8003E630 2C00628E */  lw         $v0, 0x2C($s3)
/* 2EE34 8003E634 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 2EE38 8003E638 24104300 */  and        $v0, $v0, $v1
/* 2EE3C 8003E63C 48004010 */  beqz       $v0, .L8003E760
/* 2EE40 8003E640 00000000 */   nop
/* 2EE44 8003E644 0A007286 */  lh         $s2, 0xA($s3)
/* 2EE48 8003E648 1000718E */  lw         $s1, 0x10($s3)
/* 2EE4C 8003E64C 3E004012 */  beqz       $s2, .L8003E748
/* 2EE50 8003E650 21A00000 */   addu      $s4, $zero, $zero
.L8003E654:
/* 2EE54 8003E654 0000308E */  lw         $s0, 0x0($s1)
/* 2EE58 8003E658 AC0F033C */  lui        $v1, (0xFACE0FF >> 16)
/* 2EE5C 8003E65C 0000028E */  lw         $v0, 0x0($s0)
/* 2EE60 8003E660 FFE06334 */  ori        $v1, $v1, (0xFACE0FF & 0xFFFF)
/* 2EE64 8003E664 35004314 */  bne        $v0, $v1, .L8003E73C
/* 2EE68 8003E668 00000000 */   nop
/* 2EE6C 8003E66C 5C64010C */  jal        STREAM_GetObjectTracker
/* 2EE70 8003E670 06000426 */   addiu     $a0, $s0, 0x6
/* 2EE74 8003E674 21304000 */  addu       $a2, $v0, $zero
/* 2EE78 8003E678 3000C010 */  beqz       $a2, .L8003E73C
/* 2EE7C 8003E67C 00000000 */   nop
/* 2EE80 8003E680 0CBE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x44)($gp)
/* 2EE84 8003E684 00000000 */  nop
/* 2EE88 8003E688 2320A402 */  subu       $a0, $s5, $a0
/* 2EE8C 8003E68C C0180400 */  sll        $v1, $a0, 3
/* 2EE90 8003E690 23186400 */  subu       $v1, $v1, $a0
/* 2EE94 8003E694 80110300 */  sll        $v0, $v1, 6
/* 2EE98 8003E698 21186200 */  addu       $v1, $v1, $v0
/* 2EE9C 8003E69C C0180300 */  sll        $v1, $v1, 3
/* 2EEA0 8003E6A0 21186400 */  addu       $v1, $v1, $a0
/* 2EEA4 8003E6A4 C0130300 */  sll        $v0, $v1, 15
/* 2EEA8 8003E6A8 23104300 */  subu       $v0, $v0, $v1
/* 2EEAC 8003E6AC C0100200 */  sll        $v0, $v0, 3
/* 2EEB0 8003E6B0 21104400 */  addu       $v0, $v0, $a0
/* 2EEB4 8003E6B4 83200200 */  sra        $a0, $v0, 2
/* 2EEB8 8003E6B8 1C00C280 */  lb         $v0, 0x1C($a2)
/* 2EEBC 8003E6BC 1000C78C */  lw         $a3, 0x10($a2)
/* 2EEC0 8003E6C0 0C004018 */  blez       $v0, .L8003E6F4
/* 2EEC4 8003E6C4 21280000 */   addu      $a1, $zero, $zero
/* 2EEC8 8003E6C8 21184000 */  addu       $v1, $v0, $zero
/* 2EECC 8003E6CC 2110C500 */  addu       $v0, $a2, $a1
.L8003E6D0:
/* 2EED0 8003E6D0 1D004280 */  lb         $v0, 0x1D($v0)
/* 2EED4 8003E6D4 00000000 */  nop
/* 2EED8 8003E6D8 05004410 */  beq        $v0, $a0, .L8003E6F0
/* 2EEDC 8003E6DC 00000000 */   nop
/* 2EEE0 8003E6E0 0100A524 */  addiu      $a1, $a1, 0x1
/* 2EEE4 8003E6E4 2A10A300 */  slt        $v0, $a1, $v1
/* 2EEE8 8003E6E8 F9FF4014 */  bnez       $v0, .L8003E6D0
/* 2EEEC 8003E6EC 2110C500 */   addu      $v0, $a2, $a1
.L8003E6F0:
/* 2EEF0 8003E6F0 1C00C280 */  lb         $v0, 0x1C($a2)
.L8003E6F4:
/* 2EEF4 8003E6F4 1C00C390 */  lbu        $v1, 0x1C($a2)
/* 2EEF8 8003E6F8 0400A214 */  bne        $a1, $v0, .L8003E70C
/* 2EEFC 8003E6FC 01006224 */   addiu     $v0, $v1, 0x1
/* 2EF00 8003E700 1C00C2A0 */  sb         $v0, 0x1C($a2)
/* 2EF04 8003E704 2110C500 */  addu       $v0, $a2, $a1
/* 2EF08 8003E708 1D0044A0 */  sb         $a0, 0x1D($v0)
.L8003E70C:
/* 2EF0C 8003E70C 1400C384 */  lh         $v1, 0x14($a2)
/* 2EF10 8003E710 02000224 */  addiu      $v0, $zero, 0x2
/* 2EF14 8003E714 08006214 */  bne        $v1, $v0, .L8003E738
/* 2EF18 8003E718 00000000 */   nop
/* 2EF1C 8003E71C 04000286 */  lh         $v0, 0x4($s0)
/* 2EF20 8003E720 1000E38C */  lw         $v1, 0x10($a3)
/* 2EF24 8003E724 80100200 */  sll        $v0, $v0, 2
/* 2EF28 8003E728 21104300 */  addu       $v0, $v0, $v1
/* 2EF2C 8003E72C 0000428C */  lw         $v0, 0x0($v0)
/* 2EF30 8003E730 CFF90008 */  j          .L8003E73C
/* 2EF34 8003E734 000022AE */   sw        $v0, 0x0($s1)
.L8003E738:
/* 2EF38 8003E738 06001426 */  addiu      $s4, $s0, 0x6
.L8003E73C:
/* 2EF3C 8003E73C FFFF5226 */  addiu      $s2, $s2, -0x1
/* 2EF40 8003E740 C4FF4016 */  bnez       $s2, .L8003E654
/* 2EF44 8003E744 04003126 */   addiu     $s1, $s1, 0x4
.L8003E748:
/* 2EF48 8003E748 0C008016 */  bnez       $s4, .L8003E77C
/* 2EF4C 8003E74C FFEF033C */   lui       $v1, (0xEFFFFFFF >> 16)
/* 2EF50 8003E750 2C00628E */  lw         $v0, 0x2C($s3)
/* 2EF54 8003E754 FFFF6334 */  ori        $v1, $v1, (0xEFFFFFFF & 0xFFFF)
/* 2EF58 8003E758 24104300 */  and        $v0, $v0, $v1
/* 2EF5C 8003E75C 2C0062AE */  sw         $v0, 0x2C($s3)
.L8003E760:
/* 2EF60 8003E760 2C00628E */  lw         $v0, 0x2C($s3)
/* 2EF64 8003E764 0800033C */  lui        $v1, (0x80000 >> 16)
/* 2EF68 8003E768 24104300 */  and        $v0, $v0, $v1
/* 2EF6C 8003E76C 03004010 */  beqz       $v0, .L8003E77C
/* 2EF70 8003E770 00000000 */   nop
/* 2EF74 8003E774 56FB010C */  jal        MonsterTranslateAnim
/* 2EF78 8003E778 21206002 */   addu      $a0, $s3, $zero
.L8003E77C:
/* 2EF7C 8003E77C 2800BF8F */  lw         $ra, 0x28($sp)
/* 2EF80 8003E780 2400B58F */  lw         $s5, 0x24($sp)
/* 2EF84 8003E784 2000B48F */  lw         $s4, 0x20($sp)
/* 2EF88 8003E788 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2EF8C 8003E78C 1800B28F */  lw         $s2, 0x18($sp)
/* 2EF90 8003E790 1400B18F */  lw         $s1, 0x14($sp)
/* 2EF94 8003E794 1000B08F */  lw         $s0, 0x10($sp)
/* 2EF98 8003E798 0800E003 */  jr         $ra
/* 2EF9C 8003E79C 3000BD27 */   addiu     $sp, $sp, 0x30
.size OBTABLE_InitAnimPointers, . - OBTABLE_InitAnimPointers
