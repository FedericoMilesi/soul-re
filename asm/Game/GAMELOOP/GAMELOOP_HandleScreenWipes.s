.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_HandleScreenWipes
/* 1ED58 8002E558 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 1ED5C 8002E55C B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 1ED60 8002E560 4800B4AF */  sw         $s4, 0x48($sp)
/* 1ED64 8002E564 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 1ED68 8002E568 4400B3AF */  sw         $s3, 0x44($sp)
/* 1ED6C 8002E56C 4000B2AF */  sw         $s2, 0x40($sp)
/* 1ED70 8002E570 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 1ED74 8002E574 3800B0AF */  sw         $s0, 0x38($sp)
/* 1ED78 8002E578 04004294 */  lhu        $v0, 0x4($v0)
/* 1ED7C 8002E57C 08BE938F */  lw         $s3, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1ED80 8002E580 01004230 */  andi       $v0, $v0, 0x1
/* 1ED84 8002E584 1E004010 */  beqz       $v0, .L8002E600
/* 1ED88 8002E588 21A08000 */   addu      $s4, $a0, $zero
/* 1ED8C 8002E58C 90BE8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0xC8)
/* 1ED90 8002E590 21280000 */  addu       $a1, $zero, $zero
/* 1ED94 8002E594 2130A000 */  addu       $a2, $a1, $zero
/* 1ED98 8002E598 00020724 */  addiu      $a3, $zero, 0x200
/* 1ED9C 8002E59C 1E000224 */  addiu      $v0, $zero, 0x1E
/* 1EDA0 8002E5A0 2180E000 */  addu       $s0, $a3, $zero
/* 1EDA4 8002E5A4 1000A0AF */  sw         $zero, 0x10($sp)
/* 1EDA8 8002E5A8 1400A0AF */  sw         $zero, 0x14($sp)
/* 1EDAC 8002E5AC 1800A2AF */  sw         $v0, 0x18($sp)
/* 1EDB0 8002E5B0 1C00B0AF */  sw         $s0, 0x1C($sp)
/* 1EDB4 8002E5B4 2000A2AF */  sw         $v0, 0x20($sp)
/* 1EDB8 8002E5B8 2400B3AF */  sw         $s3, 0x24($sp)
/* 1EDBC 8002E5BC 05AB000C */  jal        DRAW_FlatQuad
/* 1EDC0 8002E5C0 2800B4AF */   sw        $s4, 0x28($sp)
/* 1EDC4 8002E5C4 08BE8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x40)
/* 1EDC8 8002E5C8 88008424 */  addiu      $a0, $a0, 0x88
/* 1EDCC 8002E5CC 21280000 */  addu       $a1, $zero, $zero
/* 1EDD0 8002E5D0 D2000624 */  addiu      $a2, $zero, 0xD2
/* 1EDD4 8002E5D4 00020724 */  addiu      $a3, $zero, 0x200
/* 1EDD8 8002E5D8 2110C000 */  addu       $v0, $a2, $zero
/* 1EDDC 8002E5DC 1000A2AF */  sw         $v0, 0x10($sp)
/* 1EDE0 8002E5E0 F0000224 */  addiu      $v0, $zero, 0xF0
/* 1EDE4 8002E5E4 1400A0AF */  sw         $zero, 0x14($sp)
/* 1EDE8 8002E5E8 1800A2AF */  sw         $v0, 0x18($sp)
/* 1EDEC 8002E5EC 1C00B0AF */  sw         $s0, 0x1C($sp)
/* 1EDF0 8002E5F0 2000A2AF */  sw         $v0, 0x20($sp)
/* 1EDF4 8002E5F4 2400B3AF */  sw         $s3, 0x24($sp)
/* 1EDF8 8002E5F8 05AB000C */  jal        DRAW_FlatQuad
/* 1EDFC 8002E5FC 2800B4AF */   sw        $s4, 0x28($sp)
.L8002E600:
/* 1EE00 8002E600 94BE8587 */  lh         $a1, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 1EE04 8002E604 00000000 */  nop
/* 1EE08 8002E608 5C00A018 */  blez       $a1, .L8002E77C
/* 1EE0C 8002E60C 0A000224 */   addiu     $v0, $zero, 0xA
/* 1EE10 8002E610 98BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 1EE14 8002E614 00000000 */  nop
/* 1EE18 8002E618 05006210 */  beq        $v1, $v0, .L8002E630
/* 1EE1C 8002E61C 0B000224 */   addiu     $v0, $zero, 0xB
/* 1EE20 8002E620 1E006210 */  beq        $v1, $v0, .L8002E69C
/* 1EE24 8002E624 00120500 */   sll       $v0, $a1, 8
/* 1EE28 8002E628 D5B90008 */  j          .L8002E754
/* 1EE2C 8002E62C 00000000 */   nop
.L8002E630:
/* 1EE30 8002E630 00120500 */  sll        $v0, $a1, 8
/* 1EE34 8002E634 96BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 1EE38 8002E638 23104500 */  subu       $v0, $v0, $a1
/* 1EE3C 8002E63C 1A004300 */  div        $zero, $v0, $v1
/* 1EE40 8002E640 12800000 */  mflo       $s0
/* 1EE44 8002E644 21200000 */  addu       $a0, $zero, $zero
/* 1EE48 8002E648 21288000 */  addu       $a1, $a0, $zero
/* 1EE4C 8002E64C 00020624 */  addiu      $a2, $zero, 0x200
/* 1EE50 8002E650 21388000 */  addu       $a3, $a0, $zero
/* 1EE54 8002E654 1000A0AF */  sw         $zero, 0x10($sp)
/* 1EE58 8002E658 3000B3AF */  sw         $s3, 0x30($sp)
/* 1EE5C 8002E65C 3400B4AF */  sw         $s4, 0x34($sp)
/* 1EE60 8002E660 F0000324 */  addiu      $v1, $zero, 0xF0
/* 1EE64 8002E664 2110C000 */  addu       $v0, $a2, $zero
/* 1EE68 8002E668 1800A2AF */  sw         $v0, 0x18($sp)
/* 1EE6C 8002E66C 02000224 */  addiu      $v0, $zero, 0x2
/* 1EE70 8002E670 1400A3AF */  sw         $v1, 0x14($sp)
/* 1EE74 8002E674 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 1EE78 8002E678 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 1EE7C 8002E67C 00141000 */  sll        $v0, $s0, 16
/* 1EE80 8002E680 03140200 */  sra        $v0, $v0, 16
/* 1EE84 8002E684 2000A2AF */  sw         $v0, 0x20($sp)
/* 1EE88 8002E688 2400A2AF */  sw         $v0, 0x24($sp)
/* 1EE8C 8002E68C 2FAB000C */  jal        DRAW_TranslucentQuad
/* 1EE90 8002E690 2800A2AF */   sw        $v0, 0x28($sp)
/* 1EE94 8002E694 D5B90008 */  j          .L8002E754
/* 1EE98 8002E698 00000000 */   nop
.L8002E69C:
/* 1EE9C 8002E69C 96BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 1EEA0 8002E6A0 23104500 */  subu       $v0, $v0, $a1
/* 1EEA4 8002E6A4 1A004300 */  div        $zero, $v0, $v1
/* 1EEA8 8002E6A8 12800000 */  mflo       $s0
/* 1EEAC 8002E6AC 21200000 */  addu       $a0, $zero, $zero
/* 1EEB0 8002E6B0 21288000 */  addu       $a1, $a0, $zero
/* 1EEB4 8002E6B4 00020624 */  addiu      $a2, $zero, 0x200
/* 1EEB8 8002E6B8 21388000 */  addu       $a3, $a0, $zero
/* 1EEBC 8002E6BC 2188C000 */  addu       $s1, $a2, $zero
/* 1EEC0 8002E6C0 02001224 */  addiu      $s2, $zero, 0x2
/* 1EEC4 8002E6C4 1000A0AF */  sw         $zero, 0x10($sp)
/* 1EEC8 8002E6C8 1800B1AF */  sw         $s1, 0x18($sp)
/* 1EECC 8002E6CC 2C00B2AF */  sw         $s2, 0x2C($sp)
/* 1EED0 8002E6D0 3000B3AF */  sw         $s3, 0x30($sp)
/* 1EED4 8002E6D4 3400B4AF */  sw         $s4, 0x34($sp)
/* 1EED8 8002E6D8 1E000224 */  addiu      $v0, $zero, 0x1E
/* 1EEDC 8002E6DC 1400A2AF */  sw         $v0, 0x14($sp)
/* 1EEE0 8002E6E0 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1EEE4 8002E6E4 00841000 */  sll        $s0, $s0, 16
/* 1EEE8 8002E6E8 03841000 */  sra        $s0, $s0, 16
/* 1EEEC 8002E6EC 2000B0AF */  sw         $s0, 0x20($sp)
/* 1EEF0 8002E6F0 2400B0AF */  sw         $s0, 0x24($sp)
/* 1EEF4 8002E6F4 2FAB000C */  jal        DRAW_TranslucentQuad
/* 1EEF8 8002E6F8 2800B0AF */   sw        $s0, 0x28($sp)
/* 1EEFC 8002E6FC 21200000 */  addu       $a0, $zero, $zero
/* 1EF00 8002E700 D2000524 */  addiu      $a1, $zero, 0xD2
/* 1EF04 8002E704 00020624 */  addiu      $a2, $zero, 0x200
/* 1EF08 8002E708 2138A000 */  addu       $a3, $a1, $zero
/* 1EF0C 8002E70C F0000224 */  addiu      $v0, $zero, 0xF0
/* 1EF10 8002E710 1000A0AF */  sw         $zero, 0x10($sp)
/* 1EF14 8002E714 1400A2AF */  sw         $v0, 0x14($sp)
/* 1EF18 8002E718 1800B1AF */  sw         $s1, 0x18($sp)
/* 1EF1C 8002E71C 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1EF20 8002E720 2000B0AF */  sw         $s0, 0x20($sp)
/* 1EF24 8002E724 2400B0AF */  sw         $s0, 0x24($sp)
/* 1EF28 8002E728 2800B0AF */  sw         $s0, 0x28($sp)
/* 1EF2C 8002E72C 2C00B2AF */  sw         $s2, 0x2C($sp)
/* 1EF30 8002E730 3000B3AF */  sw         $s3, 0x30($sp)
/* 1EF34 8002E734 2FAB000C */  jal        DRAW_TranslucentQuad
/* 1EF38 8002E738 3400B4AF */   sw        $s4, 0x34($sp)
/* 1EF3C 8002E73C 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* 1EF40 8002E740 00000000 */  nop
/* 1EF44 8002E744 04006294 */  lhu        $v0, 0x4($v1)
/* 1EF48 8002E748 00000000 */  nop
/* 1EF4C 8002E74C FEFF4230 */  andi       $v0, $v0, 0xFFFE
/* 1EF50 8002E750 040062A4 */  sh         $v0, 0x4($v1)
.L8002E754:
/* 1EF54 8002E754 28C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x260)($gp)
/* 1EF58 8002E758 00000000 */  nop
/* 1EF5C 8002E75C 8E004010 */  beqz       $v0, .L8002E998
/* 1EF60 8002E760 00000000 */   nop
/* 1EF64 8002E764 94BE8297 */  lhu        $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 1EF68 8002E768 00000000 */  nop
/* 1EF6C 8002E76C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 1EF70 8002E770 94BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 1EF74 8002E774 66BA0008 */  j          .L8002E998
/* 1EF78 8002E778 00000000 */   nop
.L8002E77C:
/* 1EF7C 8002E77C FFFFA228 */  slti       $v0, $a1, -0x1
/* 1EF80 8002E780 65004010 */  beqz       $v0, .L8002E918
/* 1EF84 8002E784 0A000224 */   addiu     $v0, $zero, 0xA
/* 1EF88 8002E788 98BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 1EF8C 8002E78C 00000000 */  nop
/* 1EF90 8002E790 05006210 */  beq        $v1, $v0, .L8002E7A8
/* 1EF94 8002E794 0B000224 */   addiu     $v0, $zero, 0xB
/* 1EF98 8002E798 21006210 */  beq        $v1, $v0, .L8002E820
/* 1EF9C 8002E79C 00020624 */   addiu     $a2, $zero, 0x200
/* 1EFA0 8002E7A0 3CBA0008 */  j          .L8002E8F0
/* 1EFA4 8002E7A4 00000000 */   nop
.L8002E7A8:
/* 1EFA8 8002E7A8 96BE8487 */  lh         $a0, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 1EFAC 8002E7AC 00000000 */  nop
/* 1EFB0 8002E7B0 21188500 */  addu       $v1, $a0, $a1
/* 1EFB4 8002E7B4 02006324 */  addiu      $v1, $v1, 0x2
/* 1EFB8 8002E7B8 00120300 */  sll        $v0, $v1, 8
/* 1EFBC 8002E7BC 23104300 */  subu       $v0, $v0, $v1
/* 1EFC0 8002E7C0 1A004400 */  div        $zero, $v0, $a0
/* 1EFC4 8002E7C4 12800000 */  mflo       $s0
/* 1EFC8 8002E7C8 00020624 */  addiu      $a2, $zero, 0x200
/* 1EFCC 8002E7CC 1000A0AF */  sw         $zero, 0x10($sp)
/* 1EFD0 8002E7D0 3000B3AF */  sw         $s3, 0x30($sp)
/* 1EFD4 8002E7D4 3400B4AF */  sw         $s4, 0x34($sp)
/* 1EFD8 8002E7D8 21200000 */  addu       $a0, $zero, $zero
/* 1EFDC 8002E7DC 21288000 */  addu       $a1, $a0, $zero
/* 1EFE0 8002E7E0 21388000 */  addu       $a3, $a0, $zero
/* 1EFE4 8002E7E4 F0000324 */  addiu      $v1, $zero, 0xF0
/* 1EFE8 8002E7E8 2110C000 */  addu       $v0, $a2, $zero
/* 1EFEC 8002E7EC 1800A2AF */  sw         $v0, 0x18($sp)
/* 1EFF0 8002E7F0 02000224 */  addiu      $v0, $zero, 0x2
/* 1EFF4 8002E7F4 1400A3AF */  sw         $v1, 0x14($sp)
/* 1EFF8 8002E7F8 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 1EFFC 8002E7FC 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 1F000 8002E800 00141000 */  sll        $v0, $s0, 16
/* 1F004 8002E804 03140200 */  sra        $v0, $v0, 16
/* 1F008 8002E808 2000A2AF */  sw         $v0, 0x20($sp)
/* 1F00C 8002E80C 2400A2AF */  sw         $v0, 0x24($sp)
/* 1F010 8002E810 2FAB000C */  jal        DRAW_TranslucentQuad
/* 1F014 8002E814 2800A2AF */   sw        $v0, 0x28($sp)
/* 1F018 8002E818 3CBA0008 */  j          .L8002E8F0
/* 1F01C 8002E81C 00000000 */   nop
.L8002E820:
/* 1F020 8002E820 96BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 1F024 8002E824 00000000 */  nop
/* 1F028 8002E828 21206500 */  addu       $a0, $v1, $a1
/* 1F02C 8002E82C 00120400 */  sll        $v0, $a0, 8
/* 1F030 8002E830 23104400 */  subu       $v0, $v0, $a0
/* 1F034 8002E834 1A004300 */  div        $zero, $v0, $v1
/* 1F038 8002E838 12800000 */  mflo       $s0
/* 1F03C 8002E83C 2188C000 */  addu       $s1, $a2, $zero
/* 1F040 8002E840 02001224 */  addiu      $s2, $zero, 0x2
/* 1F044 8002E844 1000A0AF */  sw         $zero, 0x10($sp)
/* 1F048 8002E848 1800B1AF */  sw         $s1, 0x18($sp)
/* 1F04C 8002E84C 2C00B2AF */  sw         $s2, 0x2C($sp)
/* 1F050 8002E850 3000B3AF */  sw         $s3, 0x30($sp)
/* 1F054 8002E854 3400B4AF */  sw         $s4, 0x34($sp)
/* 1F058 8002E858 21200000 */  addu       $a0, $zero, $zero
/* 1F05C 8002E85C 21288000 */  addu       $a1, $a0, $zero
/* 1F060 8002E860 21388000 */  addu       $a3, $a0, $zero
/* 1F064 8002E864 1E000224 */  addiu      $v0, $zero, 0x1E
/* 1F068 8002E868 1400A2AF */  sw         $v0, 0x14($sp)
/* 1F06C 8002E86C 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1F070 8002E870 00841000 */  sll        $s0, $s0, 16
/* 1F074 8002E874 03841000 */  sra        $s0, $s0, 16
/* 1F078 8002E878 2000B0AF */  sw         $s0, 0x20($sp)
/* 1F07C 8002E87C 2400B0AF */  sw         $s0, 0x24($sp)
/* 1F080 8002E880 2FAB000C */  jal        DRAW_TranslucentQuad
/* 1F084 8002E884 2800B0AF */   sw        $s0, 0x28($sp)
/* 1F088 8002E888 21200000 */  addu       $a0, $zero, $zero
/* 1F08C 8002E88C D2000524 */  addiu      $a1, $zero, 0xD2
/* 1F090 8002E890 00020624 */  addiu      $a2, $zero, 0x200
/* 1F094 8002E894 2138A000 */  addu       $a3, $a1, $zero
/* 1F098 8002E898 F0000224 */  addiu      $v0, $zero, 0xF0
/* 1F09C 8002E89C 1000A0AF */  sw         $zero, 0x10($sp)
/* 1F0A0 8002E8A0 1400A2AF */  sw         $v0, 0x14($sp)
/* 1F0A4 8002E8A4 1800B1AF */  sw         $s1, 0x18($sp)
/* 1F0A8 8002E8A8 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1F0AC 8002E8AC 2000B0AF */  sw         $s0, 0x20($sp)
/* 1F0B0 8002E8B0 2400B0AF */  sw         $s0, 0x24($sp)
/* 1F0B4 8002E8B4 2800B0AF */  sw         $s0, 0x28($sp)
/* 1F0B8 8002E8B8 2C00B2AF */  sw         $s2, 0x2C($sp)
/* 1F0BC 8002E8BC 3000B3AF */  sw         $s3, 0x30($sp)
/* 1F0C0 8002E8C0 2FAB000C */  jal        DRAW_TranslucentQuad
/* 1F0C4 8002E8C4 3400B4AF */   sw        $s4, 0x34($sp)
/* 1F0C8 8002E8C8 94BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 1F0CC 8002E8CC FEFF0224 */  addiu      $v0, $zero, -0x2
/* 1F0D0 8002E8D0 07006214 */  bne        $v1, $v0, .L8002E8F0
/* 1F0D4 8002E8D4 00000000 */   nop
/* 1F0D8 8002E8D8 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* 1F0DC 8002E8DC 00000000 */  nop
/* 1F0E0 8002E8E0 04006294 */  lhu        $v0, 0x4($v1)
/* 1F0E4 8002E8E4 00000000 */  nop
/* 1F0E8 8002E8E8 01004234 */  ori        $v0, $v0, 0x1
/* 1F0EC 8002E8EC 040062A4 */  sh         $v0, 0x4($v1)
.L8002E8F0:
/* 1F0F0 8002E8F0 28C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x260)($gp)
/* 1F0F4 8002E8F4 00000000 */  nop
/* 1F0F8 8002E8F8 27004010 */  beqz       $v0, .L8002E998
/* 1F0FC 8002E8FC 00000000 */   nop
/* 1F100 8002E900 94BE8297 */  lhu        $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 1F104 8002E904 00000000 */  nop
/* 1F108 8002E908 01004224 */  addiu      $v0, $v0, 0x1
/* 1F10C 8002E90C 94BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 1F110 8002E910 66BA0008 */  j          .L8002E998
/* 1F114 8002E914 00000000 */   nop
.L8002E918:
/* 1F118 8002E918 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 1F11C 8002E91C 1B00A214 */  bne        $a1, $v0, .L8002E98C
/* 1F120 8002E920 00100224 */   addiu     $v0, $zero, 0x1000
/* 1F124 8002E924 98BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 1F128 8002E928 0B000224 */  addiu      $v0, $zero, 0xB
/* 1F12C 8002E92C 08006214 */  bne        $v1, $v0, .L8002E950
/* 1F130 8002E930 21280000 */   addu      $a1, $zero, $zero
/* 1F134 8002E934 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* 1F138 8002E938 00000000 */  nop
/* 1F13C 8002E93C 04006294 */  lhu        $v0, 0x4($v1)
/* 1F140 8002E940 00000000 */  nop
/* 1F144 8002E944 01004234 */  ori        $v0, $v0, 0x1
/* 1F148 8002E948 66BA0008 */  j          .L8002E998
/* 1F14C 8002E94C 040062A4 */   sh        $v0, 0x4($v1)
.L8002E950:
/* 1F150 8002E950 90BE8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0xC8)
/* 1F154 8002E954 2130A000 */  addu       $a2, $a1, $zero
/* 1F158 8002E958 00020724 */  addiu      $a3, $zero, 0x200
/* 1F15C 8002E95C F0000324 */  addiu      $v1, $zero, 0xF0
/* 1F160 8002E960 2110E000 */  addu       $v0, $a3, $zero
/* 1F164 8002E964 1000A0AF */  sw         $zero, 0x10($sp)
/* 1F168 8002E968 1400A0AF */  sw         $zero, 0x14($sp)
/* 1F16C 8002E96C 1800A3AF */  sw         $v1, 0x18($sp)
/* 1F170 8002E970 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1F174 8002E974 2000A3AF */  sw         $v1, 0x20($sp)
/* 1F178 8002E978 2400B3AF */  sw         $s3, 0x24($sp)
/* 1F17C 8002E97C 05AB000C */  jal        DRAW_FlatQuad
/* 1F180 8002E980 2800B4AF */   sw        $s4, 0x28($sp)
/* 1F184 8002E984 66BA0008 */  j          .L8002E998
/* 1F188 8002E988 00000000 */   nop
.L8002E98C:
/* 1F18C 8002E98C 4EAD82A7 */  sh         $v0, %gp_rel(theCamera + 0xBE)($gp)
/* 1F190 8002E990 4CAD82A7 */  sh         $v0, %gp_rel(theCamera + 0xBC)($gp)
/* 1F194 8002E994 4AAD82A7 */  sh         $v0, %gp_rel(theCamera + 0xBA)($gp)
.L8002E998:
/* 1F198 8002E998 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 1F19C 8002E99C 4800B48F */  lw         $s4, 0x48($sp)
/* 1F1A0 8002E9A0 4400B38F */  lw         $s3, 0x44($sp)
/* 1F1A4 8002E9A4 4000B28F */  lw         $s2, 0x40($sp)
/* 1F1A8 8002E9A8 3C00B18F */  lw         $s1, 0x3C($sp)
/* 1F1AC 8002E9AC 3800B08F */  lw         $s0, 0x38($sp)
/* 1F1B0 8002E9B0 0800E003 */  jr         $ra
/* 1F1B4 8002E9B4 5000BD27 */   addiu     $sp, $sp, 0x50
.size GAMELOOP_HandleScreenWipes, . - GAMELOOP_HandleScreenWipes
