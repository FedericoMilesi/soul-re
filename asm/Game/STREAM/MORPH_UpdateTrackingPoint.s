.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_UpdateTrackingPoint
/* 4E62C 8005DE2C B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 4E630 8005DE30 21308000 */  addu       $a2, $a0, $zero
/* 4E634 8005DE34 4000B2AF */  sw         $s2, 0x40($sp)
/* 4E638 8005DE38 2190A000 */  addu       $s2, $a1, $zero
/* 4E63C 8005DE3C 4400BFAF */  sw         $ra, 0x44($sp)
/* 4E640 8005DE40 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 4E644 8005DE44 5C00C010 */  beqz       $a2, .L8005DFB8
/* 4E648 8005DE48 3800B0AF */   sw        $s0, 0x38($sp)
/* 4E64C 8005DE4C 5A004012 */  beqz       $s2, .L8005DFB8
/* 4E650 8005DE50 00000000 */   nop
/* 4E654 8005DE54 0000C394 */  lhu        $v1, 0x0($a2)
/* 4E658 8005DE58 0000448E */  lw         $a0, 0x0($s2)
/* 4E65C 8005DE5C 40100300 */  sll        $v0, $v1, 1
/* 4E660 8005DE60 21104300 */  addu       $v0, $v0, $v1
/* 4E664 8005DE64 1C00848C */  lw         $a0, 0x1C($a0)
/* 4E668 8005DE68 80100200 */  sll        $v0, $v0, 2
/* 4E66C 8005DE6C 21108200 */  addu       $v0, $a0, $v0
/* 4E670 8005DE70 1000A2AF */  sw         $v0, 0x10($sp)
/* 4E674 8005DE74 0200C394 */  lhu        $v1, 0x2($a2)
/* 4E678 8005DE78 38C78787 */  lh         $a3, %gp_rel(MORPH_Track)($gp)
/* 4E67C 8005DE7C 40100300 */  sll        $v0, $v1, 1
/* 4E680 8005DE80 21104300 */  addu       $v0, $v0, $v1
/* 4E684 8005DE84 80100200 */  sll        $v0, $v0, 2
/* 4E688 8005DE88 21108200 */  addu       $v0, $a0, $v0
/* 4E68C 8005DE8C 1400A2AF */  sw         $v0, 0x14($sp)
/* 4E690 8005DE90 0400C394 */  lhu        $v1, 0x4($a2)
/* 4E694 8005DE94 0100E524 */  addiu      $a1, $a3, 0x1
/* 4E698 8005DE98 40100300 */  sll        $v0, $v1, 1
/* 4E69C 8005DE9C 21104300 */  addu       $v0, $v0, $v1
/* 4E6A0 8005DEA0 80100200 */  sll        $v0, $v0, 2
/* 4E6A4 8005DEA4 21208200 */  addu       $a0, $a0, $v0
/* 4E6A8 8005DEA8 0300A228 */  slti       $v0, $a1, 0x3
/* 4E6AC 8005DEAC 02004014 */  bnez       $v0, .L8005DEB8
/* 4E6B0 8005DEB0 1800A4AF */   sw        $a0, 0x18($sp)
/* 4E6B4 8005DEB4 21280000 */  addu       $a1, $zero, $zero
.L8005DEB8:
/* 4E6B8 8005DEB8 80100700 */  sll        $v0, $a3, 2
/* 4E6BC 8005DEBC 1000B027 */  addiu      $s0, $sp, 0x10
/* 4E6C0 8005DEC0 21100202 */  addu       $v0, $s0, $v0
/* 4E6C4 8005DEC4 0000448C */  lw         $a0, 0x0($v0)
/* 4E6C8 8005DEC8 80100500 */  sll        $v0, $a1, 2
/* 4E6CC 8005DECC 21100202 */  addu       $v0, $s0, $v0
/* 4E6D0 8005DED0 2000B127 */  addiu      $s1, $sp, 0x20
/* 4E6D4 8005DED4 0000458C */  lw         $a1, 0x0($v0)
/* 4E6D8 8005DED8 30C78687 */  lh         $a2, %gp_rel(MORPH_Component)($gp)
/* 4E6DC 8005DEDC 6D77010C */  jal        MORPH_AveragePoint
/* 4E6E0 8005DEE0 21382002 */   addu      $a3, $s1, $zero
/* 4E6E4 8005DEE4 3AC78387 */  lh         $v1, %gp_rel(MORPH_Track + 0x2)($gp)
/* 4E6E8 8005DEE8 00000000 */  nop
/* 4E6EC 8005DEEC 01006524 */  addiu      $a1, $v1, 0x1
/* 4E6F0 8005DEF0 0300A228 */  slti       $v0, $a1, 0x3
/* 4E6F4 8005DEF4 02004014 */  bnez       $v0, .L8005DF00
/* 4E6F8 8005DEF8 80100300 */   sll       $v0, $v1, 2
/* 4E6FC 8005DEFC 21280000 */  addu       $a1, $zero, $zero
.L8005DF00:
/* 4E700 8005DF00 21100202 */  addu       $v0, $s0, $v0
/* 4E704 8005DF04 0000448C */  lw         $a0, 0x0($v0)
/* 4E708 8005DF08 80100500 */  sll        $v0, $a1, 2
/* 4E70C 8005DF0C 21100202 */  addu       $v0, $s0, $v0
/* 4E710 8005DF10 2800B027 */  addiu      $s0, $sp, 0x28
/* 4E714 8005DF14 0000458C */  lw         $a1, 0x0($v0)
/* 4E718 8005DF18 32C78687 */  lh         $a2, %gp_rel(MORPH_Component + 0x2)($gp)
/* 4E71C 8005DF1C 6D77010C */  jal        MORPH_AveragePoint
/* 4E720 8005DF20 21380002 */   addu      $a3, $s0, $zero
/* 4E724 8005DF24 21202002 */  addu       $a0, $s1, $zero
/* 4E728 8005DF28 21280002 */  addu       $a1, $s0, $zero
/* 4E72C 8005DF2C 3000B027 */  addiu      $s0, $sp, 0x30
/* 4E730 8005DF30 34C78687 */  lh         $a2, %gp_rel(MORPH_Component + 0x4)($gp)
/* 4E734 8005DF34 6D77010C */  jal        MORPH_AveragePoint
/* 4E738 8005DF38 21380002 */   addu      $a3, $s0, $zero
/* 4E73C 8005DF3C F4BD868F */  lw         $a2, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E740 8005DF40 0000448E */  lw         $a0, 0x0($s2)
/* 4E744 8005DF44 C400C38C */  lw         $v1, 0xC4($a2)
/* 4E748 8005DF48 04000596 */  lhu        $a1, 0x4($s0)
/* 4E74C 8005DF4C C0100300 */  sll        $v0, $v1, 3
/* 4E750 8005DF50 21104300 */  addu       $v0, $v0, $v1
/* 4E754 8005DF54 80100200 */  sll        $v0, $v0, 2
/* 4E758 8005DF58 4800838C */  lw         $v1, 0x48($a0)
/* 4E75C 8005DF5C 02000496 */  lhu        $a0, 0x2($s0)
/* 4E760 8005DF60 21186200 */  addu       $v1, $v1, $v0
/* 4E764 8005DF64 0C006724 */  addiu      $a3, $v1, 0xC
/* 4E768 8005DF68 3000A297 */  lhu        $v0, 0x30($sp)
/* 4E76C 8005DF6C 0C006394 */  lhu        $v1, 0xC($v1)
/* 4E770 8005DF70 0200E894 */  lhu        $t0, 0x2($a3)
/* 4E774 8005DF74 0400E794 */  lhu        $a3, 0x4($a3)
/* 4E778 8005DF78 21104300 */  addu       $v0, $v0, $v1
/* 4E77C 8005DF7C 21208800 */  addu       $a0, $a0, $t0
/* 4E780 8005DF80 2128A700 */  addu       $a1, $a1, $a3
/* 4E784 8005DF84 3000A2A7 */  sh         $v0, 0x30($sp)
/* 4E788 8005DF88 020004A6 */  sh         $a0, 0x2($s0)
/* 4E78C 8005DF8C 040005A6 */  sh         $a1, 0x4($s0)
/* 4E790 8005DF90 5C00C2A4 */  sh         $v0, 0x5C($a2)
/* 4E794 8005DF94 5C00C624 */  addiu      $a2, $a2, 0x5C
/* 4E798 8005DF98 0200C4A4 */  sh         $a0, 0x2($a2)
/* 4E79C 8005DF9C 0400C5A4 */  sh         $a1, 0x4($a2)
/* 4E7A0 8005DFA0 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E7A4 8005DFA4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4E7A8 8005DFA8 C80062A4 */  sh         $v0, 0xC8($v1)
/* 4E7AC 8005DFAC F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E7B0 8005DFB0 00000000 */  nop
/* 4E7B4 8005DFB4 CC0040AC */  sw         $zero, 0xCC($v0)
.L8005DFB8:
/* 4E7B8 8005DFB8 4400BF8F */  lw         $ra, 0x44($sp)
/* 4E7BC 8005DFBC 4000B28F */  lw         $s2, 0x40($sp)
/* 4E7C0 8005DFC0 3C00B18F */  lw         $s1, 0x3C($sp)
/* 4E7C4 8005DFC4 3800B08F */  lw         $s0, 0x38($sp)
/* 4E7C8 8005DFC8 0800E003 */  jr         $ra
/* 4E7CC 8005DFCC 4800BD27 */   addiu     $sp, $sp, 0x48
.size MORPH_UpdateTrackingPoint, . - MORPH_UpdateTrackingPoint
