.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExecuteFlip
/* 5EDE8 8006E5E8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 5EDEC 8006E5EC 1400B1AF */  sw         $s1, 0x14($sp)
/* 5EDF0 8006E5F0 21888000 */  addu       $s1, $a0, $zero
/* 5EDF4 8006E5F4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 5EDF8 8006E5F8 1800B2AF */  sw         $s2, 0x18($sp)
/* 5EDFC 8006E5FC 1000B0AF */  sw         $s0, 0x10($sp)
/* 5EE00 8006E600 6C01308E */  lw         $s0, 0x16C($s1)
/* 5EE04 8006E604 00000000 */  nop
/* 5EE08 8006E608 0000038E */  lw         $v1, 0x0($s0)
/* 5EE0C 8006E60C 00000000 */  nop
/* 5EE10 8006E610 02006230 */  andi       $v0, $v1, 0x2
/* 5EE14 8006E614 04004010 */  beqz       $v0, .L8006E628
/* 5EE18 8006E618 FDFF0224 */   addiu     $v0, $zero, -0x3
/* 5EE1C 8006E61C 24106200 */  and        $v0, $v1, $v0
/* 5EE20 8006E620 000002AE */  sw         $v0, 0x0($s0)
/* 5EE24 8006E624 0000038E */  lw         $v1, 0x0($s0)
.L8006E628:
/* 5EE28 8006E628 1000023C */  lui        $v0, (0x100000 >> 16)
/* 5EE2C 8006E62C 24106200 */  and        $v0, $v1, $v0
/* 5EE30 8006E630 21004010 */  beqz       $v0, .L8006E6B8
/* 5EE34 8006E634 0004123C */   lui       $s2, (0x4000000 >> 16)
/* 5EE38 8006E638 24107200 */  and        $v0, $v1, $s2
/* 5EE3C 8006E63C 09004010 */  beqz       $v0, .L8006E664
/* 5EE40 8006E640 EFFB023C */   lui       $v0, (0xFBEFEEB5 >> 16)
/* 5EE44 8006E644 B5EE4234 */  ori        $v0, $v0, (0xFBEFEEB5 & 0xFFFF)
/* 5EE48 8006E648 24206200 */  and        $a0, $v1, $v0
/* 5EE4C 8006E64C 04006230 */  andi       $v0, $v1, 0x4
/* 5EE50 8006E650 1B004014 */  bnez       $v0, .L8006E6C0
/* 5EE54 8006E654 000004AE */   sw        $a0, 0x0($s0)
/* 5EE58 8006E658 01008234 */  ori        $v0, $a0, 0x1
/* 5EE5C 8006E65C B0B90108 */  j          .L8006E6C0
/* 5EE60 8006E660 000002AE */   sw        $v0, 0x0($s0)
.L8006E664:
/* 5EE64 8006E664 28000386 */  lh         $v1, 0x28($s0)
/* 5EE68 8006E668 0E000224 */  addiu      $v0, $zero, 0xE
/* 5EE6C 8006E66C 02006214 */  bne        $v1, $v0, .L8006E678
/* 5EE70 8006E670 CEFF0224 */   addiu     $v0, $zero, -0x32
/* 5EE74 8006E674 7C0122AE */  sw         $v0, 0x17C($s1)
.L8006E678:
/* 5EE78 8006E678 A9A7010C */  jal        ResetOrientation
/* 5EE7C 8006E67C 21202002 */   addu      $a0, $s1, $zero
/* 5EE80 8006E680 0000028E */  lw         $v0, 0x0($s0)
/* 5EE84 8006E684 FFEF0324 */  addiu      $v1, $zero, -0x1001
/* 5EE88 8006E688 080000AE */  sw         $zero, 0x8($s0)
/* 5EE8C 8006E68C 24104300 */  and        $v0, $v0, $v1
/* 5EE90 8006E690 25105200 */  or         $v0, $v0, $s2
/* 5EE94 8006E694 000002AE */  sw         $v0, 0x0($s0)
/* 5EE98 8006E698 5F00258A */  lwl        $a1, 0x5F($s1)
/* 5EE9C 8006E69C 5C00259A */  lwr        $a1, 0x5C($s1)
/* 5EEA0 8006E6A0 60002686 */  lh         $a2, 0x60($s1)
/* 5EEA4 8006E6A4 710025AA */  swl        $a1, 0x71($s1)
/* 5EEA8 8006E6A8 6E0025BA */  swr        $a1, 0x6E($s1)
/* 5EEAC 8006E6AC 720026A6 */  sh         $a2, 0x72($s1)
/* 5EEB0 8006E6B0 B0B90108 */  j          .L8006E6C0
/* 5EEB4 8006E6B4 00000000 */   nop
.L8006E6B8:
/* 5EEB8 8006E6B8 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 5EEBC 8006E6BC 21202002 */   addu      $a0, $s1, $zero
.L8006E6C0:
/* 5EEC0 8006E6C0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 5EEC4 8006E6C4 1800B28F */  lw         $s2, 0x18($sp)
/* 5EEC8 8006E6C8 1400B18F */  lw         $s1, 0x14($sp)
/* 5EECC 8006E6CC 1000B08F */  lw         $s0, 0x10($sp)
/* 5EED0 8006E6D0 0800E003 */  jr         $ra
/* 5EED4 8006E6D4 2000BD27 */   addiu     $sp, $sp, 0x20
.size ExecuteFlip, . - ExecuteFlip
