.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LimitRotation
/* 8ED50 8009E550 21288000 */  addu       $a1, $a0, $zero
/* 8ED54 8009E554 0400A294 */  lhu        $v0, 0x4($a1)
/* 8ED58 8009E558 00000000 */  nop
/* 8ED5C 8009E55C FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 8ED60 8009E560 0400A2A4 */  sh         $v0, 0x4($a1)
/* 8ED64 8009E564 0000A294 */  lhu        $v0, 0x0($a1)
/* 8ED68 8009E568 0400A384 */  lh         $v1, 0x4($a1)
/* 8ED6C 8009E56C FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 8ED70 8009E570 21206000 */  addu       $a0, $v1, $zero
/* 8ED74 8009E574 01106328 */  slti       $v1, $v1, 0x1001
/* 8ED78 8009E578 09006014 */  bnez       $v1, .L8009E5A0
/* 8ED7C 8009E57C 0000A2A4 */   sh        $v0, 0x0($a1)
/* 8ED80 8009E580 00F08224 */  addiu      $v0, $a0, -0x1000
.L8009E584:
/* 8ED84 8009E584 0400A2A4 */  sh         $v0, 0x4($a1)
/* 8ED88 8009E588 21204000 */  addu       $a0, $v0, $zero
/* 8ED8C 8009E58C 00140200 */  sll        $v0, $v0, 16
/* 8ED90 8009E590 03140200 */  sra        $v0, $v0, 16
/* 8ED94 8009E594 01104228 */  slti       $v0, $v0, 0x1001
/* 8ED98 8009E598 FAFF4010 */  beqz       $v0, .L8009E584
/* 8ED9C 8009E59C 00F08224 */   addiu     $v0, $a0, -0x1000
.L8009E5A0:
/* 8EDA0 8009E5A0 0400A484 */  lh         $a0, 0x4($a1)
/* 8EDA4 8009E5A4 0400A294 */  lhu        $v0, 0x4($a1)
/* 8EDA8 8009E5A8 10008018 */  blez       $a0, .L8009E5EC
/* 8EDAC 8009E5AC 00104224 */   addiu     $v0, $v0, 0x1000
/* 8EDB0 8009E5B0 00088228 */  slti       $v0, $a0, 0x800
/* 8EDB4 8009E5B4 07004010 */  beqz       $v0, .L8009E5D4
/* 8EDB8 8009E5B8 00000000 */   nop
/* 8EDBC 8009E5BC 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8EDC0 8009E5C0 00000000 */  nop
/* 8EDC4 8009E5C4 14006284 */  lh         $v0, 0x14($v1)
/* 8EDC8 8009E5C8 14006394 */  lhu        $v1, 0x14($v1)
/* 8EDCC 8009E5CC 82790208 */  j          .L8009E608
/* 8EDD0 8009E5D0 2A104400 */   slt       $v0, $v0, $a0
.L8009E5D4:
/* 8EDD4 8009E5D4 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8EDD8 8009E5D8 00000000 */  nop
/* 8EDDC 8009E5DC 16006284 */  lh         $v0, 0x16($v1)
/* 8EDE0 8009E5E0 16006394 */  lhu        $v1, 0x16($v1)
/* 8EDE4 8009E5E4 82790208 */  j          .L8009E608
/* 8EDE8 8009E5E8 2A108200 */   slt       $v0, $a0, $v0
.L8009E5EC:
/* 8EDEC 8009E5EC 0400A2A4 */  sh         $v0, 0x4($a1)
/* 8EDF0 8009E5F0 94FA848F */  lw         $a0, %gp_rel(Raziel + 0x464)($gp)
/* 8EDF4 8009E5F4 00140200 */  sll        $v0, $v0, 16
/* 8EDF8 8009E5F8 16008384 */  lh         $v1, 0x16($a0)
/* 8EDFC 8009E5FC 03140200 */  sra        $v0, $v0, 16
/* 8EE00 8009E600 2A104300 */  slt        $v0, $v0, $v1
/* 8EE04 8009E604 16008394 */  lhu        $v1, 0x16($a0)
.L8009E608:
/* 8EE08 8009E608 02004010 */  beqz       $v0, .L8009E614
/* 8EE0C 8009E60C 00000000 */   nop
/* 8EE10 8009E610 0400A3A4 */  sh         $v1, 0x4($a1)
.L8009E614:
/* 8EE14 8009E614 0000A284 */  lh         $v0, 0x0($a1)
/* 8EE18 8009E618 00000000 */  nop
/* 8EE1C 8009E61C 21184000 */  addu       $v1, $v0, $zero
/* 8EE20 8009E620 01104228 */  slti       $v0, $v0, 0x1001
/* 8EE24 8009E624 08004014 */  bnez       $v0, .L8009E648
/* 8EE28 8009E628 00F06224 */   addiu     $v0, $v1, -0x1000
.L8009E62C:
/* 8EE2C 8009E62C 0000A2A4 */  sh         $v0, 0x0($a1)
/* 8EE30 8009E630 21184000 */  addu       $v1, $v0, $zero
/* 8EE34 8009E634 00140200 */  sll        $v0, $v0, 16
/* 8EE38 8009E638 03140200 */  sra        $v0, $v0, 16
/* 8EE3C 8009E63C 01104228 */  slti       $v0, $v0, 0x1001
/* 8EE40 8009E640 FAFF4010 */  beqz       $v0, .L8009E62C
/* 8EE44 8009E644 00F06224 */   addiu     $v0, $v1, -0x1000
.L8009E648:
/* 8EE48 8009E648 0000A484 */  lh         $a0, 0x0($a1)
/* 8EE4C 8009E64C 0000A294 */  lhu        $v0, 0x0($a1)
/* 8EE50 8009E650 10008018 */  blez       $a0, .L8009E694
/* 8EE54 8009E654 00104224 */   addiu     $v0, $v0, 0x1000
/* 8EE58 8009E658 00088228 */  slti       $v0, $a0, 0x800
/* 8EE5C 8009E65C 07004010 */  beqz       $v0, .L8009E67C
/* 8EE60 8009E660 00000000 */   nop
/* 8EE64 8009E664 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8EE68 8009E668 00000000 */  nop
/* 8EE6C 8009E66C 10006284 */  lh         $v0, 0x10($v1)
/* 8EE70 8009E670 10006394 */  lhu        $v1, 0x10($v1)
/* 8EE74 8009E674 AC790208 */  j          .L8009E6B0
/* 8EE78 8009E678 2A104400 */   slt       $v0, $v0, $a0
.L8009E67C:
/* 8EE7C 8009E67C 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8EE80 8009E680 00000000 */  nop
/* 8EE84 8009E684 12006284 */  lh         $v0, 0x12($v1)
/* 8EE88 8009E688 12006394 */  lhu        $v1, 0x12($v1)
/* 8EE8C 8009E68C AC790208 */  j          .L8009E6B0
/* 8EE90 8009E690 2A108200 */   slt       $v0, $a0, $v0
.L8009E694:
/* 8EE94 8009E694 0000A2A4 */  sh         $v0, 0x0($a1)
/* 8EE98 8009E698 94FA848F */  lw         $a0, %gp_rel(Raziel + 0x464)($gp)
/* 8EE9C 8009E69C 00140200 */  sll        $v0, $v0, 16
/* 8EEA0 8009E6A0 12008384 */  lh         $v1, 0x12($a0)
/* 8EEA4 8009E6A4 03140200 */  sra        $v0, $v0, 16
/* 8EEA8 8009E6A8 2A104300 */  slt        $v0, $v0, $v1
/* 8EEAC 8009E6AC 12008394 */  lhu        $v1, 0x12($a0)
.L8009E6B0:
/* 8EEB0 8009E6B0 02004010 */  beqz       $v0, .L8009E6BC
/* 8EEB4 8009E6B4 00000000 */   nop
/* 8EEB8 8009E6B8 0000A3A4 */  sh         $v1, 0x0($a1)
.L8009E6BC:
/* 8EEBC 8009E6BC 0800E003 */  jr         $ra
/* 8EEC0 8009E6C0 00000000 */   nop
.size LimitRotation, . - LimitRotation
