.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Flee
/* 7EE04 8008E604 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7EE08 8008E608 1000B0AF */  sw         $s0, 0x10($sp)
/* 7EE0C 8008E60C 21808000 */  addu       $s0, $a0, $zero
/* 7EE10 8008E610 1800BFAF */  sw         $ra, 0x18($sp)
/* 7EE14 8008E614 1400B1AF */  sw         $s1, 0x14($sp)
/* 7EE18 8008E618 6C01028E */  lw         $v0, 0x16C($s0)
/* 7EE1C 8008E61C 00000000 */  nop
/* 7EE20 8008E620 C400428C */  lw         $v0, 0xC4($v0)
/* 7EE24 8008E624 00000000 */  nop
/* 7EE28 8008E628 05004014 */  bnez       $v0, .L8008E640
/* 7EE2C 8008E62C 5C000526 */   addiu     $a1, $s0, 0x5C
/* 7EE30 8008E630 91FE010C */  jal        MON_SwitchState
/* 7EE34 8008E634 02000524 */   addiu     $a1, $zero, 0x2
/* 7EE38 8008E638 C9390208 */  j          .L8008E724
/* 7EE3C 8008E63C 00000000 */   nop
.L8008E640:
/* 7EE40 8008E640 0400448C */  lw         $a0, 0x4($v0)
/* 7EE44 8008E644 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 7EE48 8008E648 5C008424 */   addiu     $a0, $a0, 0x5C
/* 7EE4C 8008E64C 21200002 */  addu       $a0, $s0, $zero
/* 7EE50 8008E650 00140200 */  sll        $v0, $v0, 16
/* 7EE54 8008E654 032C0200 */  sra        $a1, $v0, 16
/* 7EE58 8008E658 E81B020C */  jal        MONSENSE_GetClosestFreeDirection
/* 7EE5C 8008E65C F4010624 */   addiu     $a2, $zero, 0x1F4
/* 7EE60 8008E660 00140200 */  sll        $v0, $v0, 16
/* 7EE64 8008E664 038C0200 */  sra        $s1, $v0, 16
/* 7EE68 8008E668 D0E4010C */  jal        func_80079340
/* 7EE6C 8008E66C 21202002 */   addu      $a0, $s1, $zero
/* 7EE70 8008E670 40190200 */  sll        $v1, $v0, 5
/* 7EE74 8008E674 23186200 */  subu       $v1, $v1, $v0
/* 7EE78 8008E678 80180300 */  sll        $v1, $v1, 2
/* 7EE7C 8008E67C 21186200 */  addu       $v1, $v1, $v0
/* 7EE80 8008E680 00110300 */  sll        $v0, $v1, 4
/* 7EE84 8008E684 02004104 */  bgez       $v0, .L8008E690
/* 7EE88 8008E688 21202002 */   addu      $a0, $s1, $zero
/* 7EE8C 8008E68C FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8008E690:
/* 7EE90 8008E690 DCE4010C */  jal        func_80079370
/* 7EE94 8008E694 038B0200 */   sra       $s1, $v0, 12
/* 7EE98 8008E698 40190200 */  sll        $v1, $v0, 5
/* 7EE9C 8008E69C 23186200 */  subu       $v1, $v1, $v0
/* 7EEA0 8008E6A0 80180300 */  sll        $v1, $v1, 2
/* 7EEA4 8008E6A4 21186200 */  addu       $v1, $v1, $v0
/* 7EEA8 8008E6A8 00190300 */  sll        $v1, $v1, 4
/* 7EEAC 8008E6AC 23180300 */  negu       $v1, $v1
/* 7EEB0 8008E6B0 02006104 */  bgez       $v1, .L8008E6BC
/* 7EEB4 8008E6B4 00000000 */   nop
/* 7EEB8 8008E6B8 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8008E6BC:
/* 7EEBC 8008E6BC 7401028E */  lw         $v0, 0x174($s0)
/* 7EEC0 8008E6C0 00000000 */  nop
/* 7EEC4 8008E6C4 23102202 */  subu       $v0, $s1, $v0
/* 7EEC8 8008E6C8 800102AE */  sw         $v0, 0x180($s0)
/* 7EECC 8008E6CC 03130300 */  sra        $v0, $v1, 12
/* 7EED0 8008E6D0 7801038E */  lw         $v1, 0x178($s0)
/* 7EED4 8008E6D4 8001048E */  lw         $a0, 0x180($s0)
/* 7EED8 8008E6D8 23104300 */  subu       $v0, $v0, $v1
/* 7EEDC 8008E6DC 840102AE */  sw         $v0, 0x184($s0)
/* 7EEE0 8008E6E0 FEFF8228 */  slti       $v0, $a0, -0x2
/* 7EEE4 8008E6E4 04004014 */  bnez       $v0, .L8008E6F8
/* 7EEE8 8008E6E8 FEFF0224 */   addiu     $v0, $zero, -0x2
/* 7EEEC 8008E6EC 03008228 */  slti       $v0, $a0, 0x3
/* 7EEF0 8008E6F0 02004014 */  bnez       $v0, .L8008E6FC
/* 7EEF4 8008E6F4 02000224 */   addiu     $v0, $zero, 0x2
.L8008E6F8:
/* 7EEF8 8008E6F8 800102AE */  sw         $v0, 0x180($s0)
.L8008E6FC:
/* 7EEFC 8008E6FC 8401038E */  lw         $v1, 0x184($s0)
/* 7EF00 8008E700 00000000 */  nop
/* 7EF04 8008E704 FEFF6228 */  slti       $v0, $v1, -0x2
/* 7EF08 8008E708 04004014 */  bnez       $v0, .L8008E71C
/* 7EF0C 8008E70C FEFF0224 */   addiu     $v0, $zero, -0x2
/* 7EF10 8008E710 03006228 */  slti       $v0, $v1, 0x3
/* 7EF14 8008E714 02004014 */  bnez       $v0, .L8008E720
/* 7EF18 8008E718 02000224 */   addiu     $v0, $zero, 0x2
.L8008E71C:
/* 7EF1C 8008E71C 840102AE */  sw         $v0, 0x184($s0)
.L8008E720:
/* 7EF20 8008E720 880100AE */  sw         $zero, 0x188($s0)
.L8008E724:
/* 7EF24 8008E724 08C0858F */  lw         $a1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7EF28 8008E728 4B36020C */  jal        SOUL_Physics
/* 7EF2C 8008E72C 21200002 */   addu      $a0, $s0, $zero
/* 7EF30 8008E730 2436020C */  jal        SOUL_QueueHandler
/* 7EF34 8008E734 21200002 */   addu      $a0, $s0, $zero
/* 7EF38 8008E738 1800028E */  lw         $v0, 0x18($s0)
/* 7EF3C 8008E73C 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 7EF40 8008E740 24104300 */  and        $v0, $v0, $v1
/* 7EF44 8008E744 03004014 */  bnez       $v0, .L8008E754
/* 7EF48 8008E748 00000000 */   nop
/* 7EF4C 8008E74C 6336020C */  jal        SOUL_Fade
/* 7EF50 8008E750 21200002 */   addu      $a0, $s0, $zero
.L8008E754:
/* 7EF54 8008E754 1800BF8F */  lw         $ra, 0x18($sp)
/* 7EF58 8008E758 1400B18F */  lw         $s1, 0x14($sp)
/* 7EF5C 8008E75C 1000B08F */  lw         $s0, 0x10($sp)
/* 7EF60 8008E760 0800E003 */  jr         $ra
/* 7EF64 8008E764 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_Flee, . - SOUL_Flee
