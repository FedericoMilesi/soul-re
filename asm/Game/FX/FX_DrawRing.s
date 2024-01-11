.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawRing
/* 3ED40 8004E540 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3ED44 8004E544 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 3ED48 8004E548 5800B2AF */  sw         $s2, 0x58($sp)
/* 3ED4C 8004E54C 9C00B28F */  lw         $s2, 0x9C($sp)
/* 3ED50 8004E550 9CBF888F */  lw         $t0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 3ED54 8004E554 5000B0AF */  sw         $s0, 0x50($sp)
/* 3ED58 8004E558 21808000 */  addu       $s0, $a0, $zero
/* 3ED5C 8004E55C 5C00B3AF */  sw         $s3, 0x5C($sp)
/* 3ED60 8004E560 2198A000 */  addu       $s3, $a1, $zero
/* 3ED64 8004E564 6000B4AF */  sw         $s4, 0x60($sp)
/* 3ED68 8004E568 21A0C000 */  addu       $s4, $a2, $zero
/* 3ED6C 8004E56C 7400BFAF */  sw         $ra, 0x74($sp)
/* 3ED70 8004E570 7000BEAF */  sw         $fp, 0x70($sp)
/* 3ED74 8004E574 6C00B7AF */  sw         $s7, 0x6C($sp)
/* 3ED78 8004E578 6800B6AF */  sw         $s6, 0x68($sp)
/* 3ED7C 8004E57C 6400B5AF */  sw         $s5, 0x64($sp)
/* 3ED80 8004E580 5400B1AF */  sw         $s1, 0x54($sp)
/* 3ED84 8004E584 8400A7AF */  sw         $a3, 0x84($sp)
/* 3ED88 8004E588 0400518C */  lw         $s1, 0x4($v0)
/* 3ED8C 8004E58C 0800438C */  lw         $v1, 0x8($v0)
/* 3ED90 8004E590 21B00000 */  addu       $s6, $zero, $zero
/* 3ED94 8004E594 00092226 */  addiu      $v0, $s1, 0x900
/* 3ED98 8004E598 2B104300 */  sltu       $v0, $v0, $v1
/* 3ED9C 8004E59C 87004010 */  beqz       $v0, .L8004E7BC
/* 3EDA0 8004E5A0 4C00A8AF */   sw        $t0, 0x4C($sp)
/* 3EDA4 8004E5A4 CDFD020C */  jal        PushMatrix
/* 3EDA8 8004E5A8 00000000 */   nop
/* 3EDAC 8004E5AC 52F2020C */  jal        SetRotMatrix
/* 3EDB0 8004E5B0 21200002 */   addu      $a0, $s0, $zero
/* 3EDB4 8004E5B4 4AF2020C */  jal        SetTransMatrix
/* 3EDB8 8004E5B8 21200002 */   addu      $a0, $s0, $zero
/* 3EDBC 8004E5BC 3A39010C */  jal        fx_get_startz
/* 3EDC0 8004E5C0 21206002 */   addu      $a0, $s3, $zero
/* 3EDC4 8004E5C4 21208002 */  addu       $a0, $s4, $zero
/* 3EDC8 8004E5C8 52F2020C */  jal        SetRotMatrix
/* 3EDCC 8004E5CC 21B84000 */   addu      $s7, $v0, $zero
/* 3EDD0 8004E5D0 9000A28F */  lw         $v0, 0x90($sp)
/* 3EDD4 8004E5D4 8400A68F */  lw         $a2, 0x84($sp)
/* 3EDD8 8004E5D8 8800A78F */  lw         $a3, 0x88($sp)
/* 3EDDC 8004E5DC 8C00A88F */  lw         $t0, 0x8C($sp)
/* 3EDE0 8004E5E0 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 3EDE4 8004E5E4 9400A28F */  lw         $v0, 0x94($sp)
/* 3EDE8 8004E5E8 1800A427 */  addiu      $a0, $sp, 0x18
/* 3EDEC 8004E5EC 2400A2A7 */  sh         $v0, 0x24($sp)
/* 3EDF0 8004E5F0 9800A28F */  lw         $v0, 0x98($sp)
/* 3EDF4 8004E5F4 2128C002 */  addu       $a1, $s6, $zero
/* 3EDF8 8004E5F8 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* 3EDFC 8004E5FC F638010C */  jal        fx_calc_points
/* 3EE00 8004E600 1000A8AF */   sw        $t0, 0x10($sp)
/* 3EE04 8004E604 003A023C */  lui        $v0, (0x3A000000 >> 16)
/* 3EE08 8004E608 25904202 */  or         $s2, $s2, $v0
/* 3EE0C 8004E60C 21A04000 */  addu       $s4, $v0, $zero
/* 3EE10 8004E610 3000A427 */  addiu      $a0, $sp, 0x30
/* 3EE14 8004E614 3400A327 */  addiu      $v1, $sp, 0x34
/* 3EE18 8004E618 3800A227 */  addiu      $v0, $sp, 0x38
/* 3EE1C 8004E61C 00008CE8 */  swc2       $12, 0x0($a0)
/* 3EE20 8004E620 00006DE8 */  swc2       $13, 0x0($v1)
/* 3EE24 8004E624 00004EE8 */  swc2       $14, 0x0($v0)
/* 3EE28 8004E628 2198C002 */  addu       $s3, $s6, $zero
/* 3EE2C 8004E62C 21F08000 */  addu       $fp, $a0, $zero
/* 3EE30 8004E630 FF00153C */  lui        $s5, (0xFFFFFF >> 16)
/* 3EE34 8004E634 FFFFB536 */  ori        $s5, $s5, (0xFFFFFF & 0xFFFF)
/* 3EE38 8004E638 44003026 */  addiu      $s0, $s1, 0x44
/* 3EE3C 8004E63C 8000D626 */  addiu      $s6, $s6, 0x80
.L8004E640:
/* 3EE40 8004E640 1800A427 */  addiu      $a0, $sp, 0x18
/* 3EE44 8004E644 8400A68F */  lw         $a2, 0x84($sp)
/* 3EE48 8004E648 8800A78F */  lw         $a3, 0x88($sp)
/* 3EE4C 8004E64C 8C00A88F */  lw         $t0, 0x8C($sp)
/* 3EE50 8004E650 2128C002 */  addu       $a1, $s6, $zero
/* 3EE54 8004E654 F638010C */  jal        fx_calc_points
/* 3EE58 8004E658 1000A8AF */   sw        $t0, 0x10($sp)
/* 3EE5C 8004E65C FCFF14AE */  sw         $s4, -0x4($s0)
/* 3EE60 8004E660 F4FF14AE */  sw         $s4, -0xC($s0)
/* 3EE64 8004E664 CCFF14AE */  sw         $s4, -0x34($s0)
/* 3EE68 8004E668 C4FF14AE */  sw         $s4, -0x3C($s0)
/* 3EE6C 8004E66C DCFF12AE */  sw         $s2, -0x24($s0)
/* 3EE70 8004E670 D4FF12AE */  sw         $s2, -0x2C($s0)
/* 3EE74 8004E674 ECFF12AE */  sw         $s2, -0x14($s0)
/* 3EE78 8004E678 E4FF12AE */  sw         $s2, -0x1C($s0)
/* 3EE7C 8004E67C 3800A28F */  lw         $v0, 0x38($sp)
/* 3EE80 8004E680 00000000 */  nop
/* 3EE84 8004E684 C8FF02AE */  sw         $v0, -0x38($s0)
/* 3EE88 8004E688 3400A28F */  lw         $v0, 0x34($sp)
/* 3EE8C 8004E68C 00000000 */  nop
/* 3EE90 8004E690 D8FF02AE */  sw         $v0, -0x28($s0)
/* 3EE94 8004E694 3400A28F */  lw         $v0, 0x34($sp)
/* 3EE98 8004E698 00E1033C */  lui        $v1, (0xE1000620 >> 16)
/* 3EE9C 8004E69C E8FF02AE */  sw         $v0, -0x18($s0)
/* 3EEA0 8004E6A0 3000A28F */  lw         $v0, 0x30($sp)
/* 3EEA4 8004E6A4 20066334 */  ori        $v1, $v1, (0xE1000620 & 0xFFFF)
/* 3EEA8 8004E6A8 C0FF03AE */  sw         $v1, -0x40($s0)
/* 3EEAC 8004E6AC 3400A327 */  addiu      $v1, $sp, 0x34
/* 3EEB0 8004E6B0 F8FF02AE */  sw         $v0, -0x8($s0)
/* 3EEB4 8004E6B4 3800A227 */  addiu      $v0, $sp, 0x38
/* 3EEB8 8004E6B8 0000CCEB */  swc2       $12, 0x0($fp)
/* 3EEBC 8004E6BC 00006DE8 */  swc2       $13, 0x0($v1)
/* 3EEC0 8004E6C0 00004EE8 */  swc2       $14, 0x0($v0)
/* 3EEC4 8004E6C4 4000A427 */  addiu      $a0, $sp, 0x40
/* 3EEC8 8004E6C8 4400A327 */  addiu      $v1, $sp, 0x44
/* 3EECC 8004E6CC 4800A227 */  addiu      $v0, $sp, 0x48
/* 3EED0 8004E6D0 000091E8 */  swc2       $17, 0x0($a0)
/* 3EED4 8004E6D4 000072E8 */  swc2       $18, 0x0($v1)
/* 3EED8 8004E6D8 000053E8 */  swc2       $19, 0x0($v0)
/* 3EEDC 8004E6DC 3800A28F */  lw         $v0, 0x38($sp)
/* 3EEE0 8004E6E0 00000000 */  nop
/* 3EEE4 8004E6E4 D0FF02AE */  sw         $v0, -0x30($s0)
/* 3EEE8 8004E6E8 3400A28F */  lw         $v0, 0x34($sp)
/* 3EEEC 8004E6EC 00000000 */  nop
/* 3EEF0 8004E6F0 E0FF02AE */  sw         $v0, -0x20($s0)
/* 3EEF4 8004E6F4 3400A28F */  lw         $v0, 0x34($sp)
/* 3EEF8 8004E6F8 00000000 */  nop
/* 3EEFC 8004E6FC F0FF02AE */  sw         $v0, -0x10($s0)
/* 3EF00 8004E700 3000A28F */  lw         $v0, 0x30($sp)
/* 3EF04 8004E704 00000000 */  nop
/* 3EF08 8004E708 000002AE */  sw         $v0, 0x0($s0)
/* 3EF0C 8004E70C 4800A38F */  lw         $v1, 0x48($sp)
/* 3EF10 8004E710 4000A28F */  lw         $v0, 0x40($sp)
/* 3EF14 8004E714 00000000 */  nop
/* 3EF18 8004E718 2A106200 */  slt        $v0, $v1, $v0
/* 3EF1C 8004E71C 02004010 */  beqz       $v0, .L8004E728
/* 3EF20 8004E720 00000000 */   nop
/* 3EF24 8004E724 4000A3AF */  sw         $v1, 0x40($sp)
.L8004E728:
/* 3EF28 8004E728 4000A28F */  lw         $v0, 0x40($sp)
/* 3EF2C 8004E72C 00000000 */  nop
/* 3EF30 8004E730 1B004018 */  blez       $v0, .L8004E7A0
/* 3EF34 8004E734 83100200 */   sra       $v0, $v0, 2
/* 3EF38 8004E738 A000A88F */  lw         $t0, 0xA0($sp)
/* 3EF3C 8004E73C 00000000 */  nop
/* 3EF40 8004E740 06000015 */  bnez       $t0, .L8004E75C
/* 3EF44 8004E744 4000A2AF */   sw        $v0, 0x40($sp)
/* 3EF48 8004E748 2A10E202 */  slt        $v0, $s7, $v0
/* 3EF4C 8004E74C 02004014 */  bnez       $v0, .L8004E758
/* 3EF50 8004E750 1000E226 */   addiu     $v0, $s7, 0x10
/* 3EF54 8004E754 01000224 */  addiu      $v0, $zero, 0x1
.L8004E758:
/* 3EF58 8004E758 4000A2AF */  sw         $v0, 0x40($sp)
.L8004E75C:
/* 3EF5C 8004E75C 4000A48F */  lw         $a0, 0x40($sp)
/* 3EF60 8004E760 00000000 */  nop
/* 3EF64 8004E764 FFFF8224 */  addiu      $v0, $a0, -0x1
/* 3EF68 8004E768 FF0B422C */  sltiu      $v0, $v0, 0xBFF
/* 3EF6C 8004E76C 0C004010 */  beqz       $v0, .L8004E7A0
/* 3EF70 8004E770 80200400 */   sll       $a0, $a0, 2
/* 3EF74 8004E774 4C00A88F */  lw         $t0, 0x4C($sp)
/* 3EF78 8004E778 48001026 */  addiu      $s0, $s0, 0x48
/* 3EF7C 8004E77C 21208800 */  addu       $a0, $a0, $t0
/* 3EF80 8004E780 0000838C */  lw         $v1, 0x0($a0)
/* 3EF84 8004E784 0011023C */  lui        $v0, (0x11000000 >> 16)
/* 3EF88 8004E788 24187500 */  and        $v1, $v1, $s5
/* 3EF8C 8004E78C 25186200 */  or         $v1, $v1, $v0
/* 3EF90 8004E790 24103502 */  and        $v0, $s1, $s5
/* 3EF94 8004E794 000023AE */  sw         $v1, 0x0($s1)
/* 3EF98 8004E798 48003126 */  addiu      $s1, $s1, 0x48
/* 3EF9C 8004E79C 000082AC */  sw         $v0, 0x0($a0)
.L8004E7A0:
/* 3EFA0 8004E7A0 01007326 */  addiu      $s3, $s3, 0x1
/* 3EFA4 8004E7A4 2000622A */  slti       $v0, $s3, 0x20
/* 3EFA8 8004E7A8 A5FF4014 */  bnez       $v0, .L8004E640
/* 3EFAC 8004E7AC 8000D626 */   addiu     $s6, $s6, 0x80
/* 3EFB0 8004E7B0 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3EFB4 8004E7B4 F6FD020C */  jal        PopMatrix
/* 3EFB8 8004E7B8 040051AC */   sw        $s1, 0x4($v0)
.L8004E7BC:
/* 3EFBC 8004E7BC 7400BF8F */  lw         $ra, 0x74($sp)
/* 3EFC0 8004E7C0 7000BE8F */  lw         $fp, 0x70($sp)
/* 3EFC4 8004E7C4 6C00B78F */  lw         $s7, 0x6C($sp)
/* 3EFC8 8004E7C8 6800B68F */  lw         $s6, 0x68($sp)
/* 3EFCC 8004E7CC 6400B58F */  lw         $s5, 0x64($sp)
/* 3EFD0 8004E7D0 6000B48F */  lw         $s4, 0x60($sp)
/* 3EFD4 8004E7D4 5C00B38F */  lw         $s3, 0x5C($sp)
/* 3EFD8 8004E7D8 5800B28F */  lw         $s2, 0x58($sp)
/* 3EFDC 8004E7DC 5400B18F */  lw         $s1, 0x54($sp)
/* 3EFE0 8004E7E0 5000B08F */  lw         $s0, 0x50($sp)
/* 3EFE4 8004E7E4 0800E003 */  jr         $ra
/* 3EFE8 8004E7E8 7800BD27 */   addiu     $sp, $sp, 0x78
.size FX_DrawRing, . - FX_DrawRing
