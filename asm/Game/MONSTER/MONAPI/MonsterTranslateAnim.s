.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterTranslateAnim
/* 6F558 8007ED58 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6F55C 8007ED5C 1400B1AF */  sw         $s1, 0x14($sp)
/* 6F560 8007ED60 21888000 */  addu       $s1, $a0, $zero
/* 6F564 8007ED64 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 6F568 8007ED68 1800BFAF */  sw         $ra, 0x18($sp)
/* 6F56C 8007ED6C 1000B0AF */  sw         $s0, 0x10($sp)
/* 6F570 8007ED70 2C00228E */  lw         $v0, 0x2C($s1)
/* 6F574 8007ED74 1C00308E */  lw         $s0, 0x1C($s1)
/* 6F578 8007ED78 24104300 */  and        $v0, $v0, $v1
/* 6F57C 8007ED7C 5F004014 */  bnez       $v0, .L8007EEFC
/* 6F580 8007ED80 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 6F584 8007ED84 0000228E */  lw         $v0, 0x0($s1)
/* 6F588 8007ED88 00000000 */  nop
/* 6F58C 8007ED8C 24104300 */  and        $v0, $v0, $v1
/* 6F590 8007ED90 0C004010 */  beqz       $v0, .L8007EDC4
/* 6F594 8007ED94 00000000 */   nop
/* 6F598 8007ED98 4000228E */  lw         $v0, 0x40($s1)
/* 6F59C 8007ED9C 00000000 */  nop
/* 6F5A0 8007EDA0 06004010 */  beqz       $v0, .L8007EDBC
/* 6F5A4 8007EDA4 00000000 */   nop
/* 6F5A8 8007EDA8 1800438C */  lw         $v1, 0x18($v0)
/* 6F5AC 8007EDAC 0D80023C */  lui        $v0, %hi(monVersion)
/* 6F5B0 8007EDB0 A41E4224 */  addiu      $v0, $v0, %lo(monVersion)
/* 6F5B4 8007EDB4 05006210 */  beq        $v1, $v0, .L8007EDCC
/* 6F5B8 8007EDB8 00000000 */   nop
.L8007EDBC:
/* 6F5BC 8007EDBC BFFB0108 */  j          .L8007EEFC
/* 6F5C0 8007EDC0 1C0020AE */   sw        $zero, 0x1C($s1)
.L8007EDC4:
/* 6F5C4 8007EDC4 1134020C */  jal        MONTABLE_SetupTablePointer
/* 6F5C8 8007EDC8 21202002 */   addu      $a0, $s1, $zero
.L8007EDCC:
/* 6F5CC 8007EDCC 4B000012 */  beqz       $s0, .L8007EEFC
/* 6F5D0 8007EDD0 E0AC033C */   lui       $v1, (0xACE00065 >> 16)
/* 6F5D4 8007EDD4 0000028E */  lw         $v0, 0x0($s0)
/* 6F5D8 8007EDD8 65006334 */  ori        $v1, $v1, (0xACE00065 & 0xFFFF)
/* 6F5DC 8007EDDC 47004314 */  bne        $v0, $v1, .L8007EEFC
/* 6F5E0 8007EDE0 00000000 */   nop
/* 6F5E4 8007EDE4 4000058E */  lw         $a1, 0x40($s0)
/* 6F5E8 8007EDE8 2C000682 */  lb         $a2, 0x2C($s0)
/* 6F5EC 8007EDEC 17FB010C */  jal        TranslateAnimList
/* 6F5F0 8007EDF0 21202002 */   addu      $a0, $s1, $zero
/* 6F5F4 8007EDF4 2A000282 */  lb         $v0, 0x2A($s0)
/* 6F5F8 8007EDF8 00000000 */  nop
/* 6F5FC 8007EDFC 15004018 */  blez       $v0, .L8007EE54
/* 6F600 8007EE00 21380000 */   addu      $a3, $zero, $zero
.L8007EE04:
/* 6F604 8007EE04 3800028E */  lw         $v0, 0x38($s0)
/* 6F608 8007EE08 40190700 */  sll        $v1, $a3, 5
/* 6F60C 8007EE0C 21184300 */  addu       $v1, $v0, $v1
/* 6F610 8007EE10 0A006280 */  lb         $v0, 0xA($v1)
/* 6F614 8007EE14 0E006480 */  lb         $a0, 0xE($v1)
/* 6F618 8007EE18 00000000 */  nop
/* 6F61C 8007EE1C 2A104400 */  slt        $v0, $v0, $a0
/* 6F620 8007EE20 06004010 */  beqz       $v0, .L8007EE3C
/* 6F624 8007EE24 00000000 */   nop
/* 6F628 8007EE28 0C006280 */  lb         $v0, 0xC($v1)
/* 6F62C 8007EE2C 00000000 */  nop
/* 6F630 8007EE30 2A104400 */  slt        $v0, $v0, $a0
/* 6F634 8007EE34 02004014 */  bnez       $v0, .L8007EE40
/* 6F638 8007EE38 00000000 */   nop
.L8007EE3C:
/* 6F63C 8007EE3C 1C0020AE */  sw         $zero, 0x1C($s1)
.L8007EE40:
/* 6F640 8007EE40 2A000282 */  lb         $v0, 0x2A($s0)
/* 6F644 8007EE44 0100E724 */  addiu      $a3, $a3, 0x1
/* 6F648 8007EE48 2A10E200 */  slt        $v0, $a3, $v0
/* 6F64C 8007EE4C EDFF4014 */  bnez       $v0, .L8007EE04
/* 6F650 8007EE50 00000000 */   nop
.L8007EE54:
/* 6F654 8007EE54 29000282 */  lb         $v0, 0x29($s0)
/* 6F658 8007EE58 00000000 */  nop
/* 6F65C 8007EE5C 27004018 */  blez       $v0, .L8007EEFC
/* 6F660 8007EE60 21380000 */   addu      $a3, $zero, $zero
.L8007EE64:
/* 6F664 8007EE64 3400028E */  lw         $v0, 0x34($s0)
/* 6F668 8007EE68 80180700 */  sll        $v1, $a3, 2
/* 6F66C 8007EE6C 21186200 */  addu       $v1, $v1, $v0
/* 6F670 8007EE70 0000638C */  lw         $v1, 0x0($v1)
/* 6F674 8007EE74 00000000 */  nop
/* 6F678 8007EE78 0A006284 */  lh         $v0, 0xA($v1)
/* 6F67C 8007EE7C 00000000 */  nop
/* 6F680 8007EE80 19004014 */  bnez       $v0, .L8007EEE8
/* 6F684 8007EE84 00000000 */   nop
/* 6F688 8007EE88 21280000 */  addu       $a1, $zero, $zero
/* 6F68C 8007EE8C 1D006280 */  lb         $v0, 0x1D($v1)
/* 6F690 8007EE90 00000000 */  nop
/* 6F694 8007EE94 12004018 */  blez       $v0, .L8007EEE0
/* 6F698 8007EE98 2130A000 */   addu      $a2, $a1, $zero
/* 6F69C 8007EE9C 3800098E */  lw         $t1, 0x38($s0)
/* 6F6A0 8007EEA0 21404000 */  addu       $t0, $v0, $zero
/* 6F6A4 8007EEA4 21106500 */  addu       $v0, $v1, $a1
.L8007EEA8:
/* 6F6A8 8007EEA8 2C004280 */  lb         $v0, 0x2C($v0)
/* 6F6AC 8007EEAC 00000000 */  nop
/* 6F6B0 8007EEB0 40110200 */  sll        $v0, $v0, 5
/* 6F6B4 8007EEB4 21102201 */  addu       $v0, $t1, $v0
/* 6F6B8 8007EEB8 00004484 */  lh         $a0, 0x0($v0)
/* 6F6BC 8007EEBC 00000000 */  nop
/* 6F6C0 8007EEC0 2A10C400 */  slt        $v0, $a2, $a0
/* 6F6C4 8007EEC4 02004010 */  beqz       $v0, .L8007EED0
/* 6F6C8 8007EEC8 00000000 */   nop
/* 6F6CC 8007EECC 21308000 */  addu       $a2, $a0, $zero
.L8007EED0:
/* 6F6D0 8007EED0 0100A524 */  addiu      $a1, $a1, 0x1
/* 6F6D4 8007EED4 2A10A800 */  slt        $v0, $a1, $t0
/* 6F6D8 8007EED8 F3FF4014 */  bnez       $v0, .L8007EEA8
/* 6F6DC 8007EEDC 21106500 */   addu      $v0, $v1, $a1
.L8007EEE0:
/* 6F6E0 8007EEE0 C800C224 */  addiu      $v0, $a2, 0xC8
/* 6F6E4 8007EEE4 0A0062A4 */  sh         $v0, 0xA($v1)
.L8007EEE8:
/* 6F6E8 8007EEE8 29000282 */  lb         $v0, 0x29($s0)
/* 6F6EC 8007EEEC 0100E724 */  addiu      $a3, $a3, 0x1
/* 6F6F0 8007EEF0 2A10E200 */  slt        $v0, $a3, $v0
/* 6F6F4 8007EEF4 DBFF4014 */  bnez       $v0, .L8007EE64
/* 6F6F8 8007EEF8 00000000 */   nop
.L8007EEFC:
/* 6F6FC 8007EEFC 1800BF8F */  lw         $ra, 0x18($sp)
/* 6F700 8007EF00 1400B18F */  lw         $s1, 0x14($sp)
/* 6F704 8007EF04 1000B08F */  lw         $s0, 0x10($sp)
/* 6F708 8007EF08 0800E003 */  jr         $ra
/* 6F70C 8007EF0C 2000BD27 */   addiu     $sp, $sp, 0x20
.size MonsterTranslateAnim, . - MonsterTranslateAnim
