.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SwitchToKeylistAtTime
/* 83D88 80093588 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 83D8C 8009358C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 83D90 80093590 21888000 */  addu       $s1, $a0, $zero
/* 83D94 80093594 2800B4AF */  sw         $s4, 0x28($sp)
/* 83D98 80093598 21A0A000 */  addu       $s4, $a1, $zero
/* 83D9C 8009359C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 83DA0 800935A0 21A8C000 */  addu       $s5, $a2, $zero
/* 83DA4 800935A4 2400B3AF */  sw         $s3, 0x24($sp)
/* 83DA8 800935A8 2198E000 */  addu       $s3, $a3, $zero
/* 83DAC 800935AC 3000BFAF */  sw         $ra, 0x30($sp)
/* 83DB0 800935B0 2000B2AF */  sw         $s2, 0x20($sp)
/* 83DB4 800935B4 3853020C */  jal        _G2AnimSection_GetAnim
/* 83DB8 800935B8 1800B0AF */   sw        $s0, 0x18($sp)
/* 83DBC 800935BC 02002392 */  lbu        $v1, 0x2($s1)
/* 83DC0 800935C0 00000000 */  nop
/* 83DC4 800935C4 23006014 */  bnez       $v1, .L80093654
/* 83DC8 800935C8 21904000 */   addu      $s2, $v0, $zero
/* 83DCC 800935CC 0E004296 */  lhu        $v0, 0xE($s2)
/* 83DD0 800935D0 00000000 */  nop
/* 83DD4 800935D4 01004234 */  ori        $v0, $v0, 0x1
/* 83DD8 800935D8 0E0042A6 */  sh         $v0, 0xE($s2)
/* 83DDC 800935DC 2400228E */  lw         $v0, 0x24($s1)
/* 83DE0 800935E0 00000000 */  nop
/* 83DE4 800935E4 0A004010 */  beqz       $v0, .L80093610
/* 83DE8 800935E8 00000000 */   nop
/* 83DEC 800935EC 06002586 */  lh         $a1, 0x6($s1)
/* 83DF0 800935F0 00000000 */  nop
/* 83DF4 800935F4 0600A004 */  bltz       $a1, .L80093610
/* 83DF8 800935F8 21204002 */   addu      $a0, $s2, $zero
/* 83DFC 800935FC 04002686 */  lh         $a2, 0x4($s1)
/* 83E00 80093600 E63E020C */  jal        G2Anim_GetRootMotionOverInterval
/* 83E04 80093604 1000A727 */   addiu     $a3, $sp, 0x10
/* 83E08 80093608 864D0208 */  j          .L80093618
/* 83E0C 8009360C 00000000 */   nop
.L80093610:
/* 83E10 80093610 1000A0AF */  sw         $zero, 0x10($sp)
/* 83E14 80093614 1400A0A7 */  sh         $zero, 0x14($sp)
.L80093618:
/* 83E18 80093618 1000A297 */  lhu        $v0, 0x10($sp)
/* 83E1C 8009361C 08004396 */  lhu        $v1, 0x8($s2)
/* 83E20 80093620 00000000 */  nop
/* 83E24 80093624 21104300 */  addu       $v0, $v0, $v1
/* 83E28 80093628 1000A2A7 */  sh         $v0, 0x10($sp)
/* 83E2C 8009362C 1200A297 */  lhu        $v0, 0x12($sp)
/* 83E30 80093630 0A004396 */  lhu        $v1, 0xA($s2)
/* 83E34 80093634 00000000 */  nop
/* 83E38 80093638 21104300 */  addu       $v0, $v0, $v1
/* 83E3C 8009363C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 83E40 80093640 1400A297 */  lhu        $v0, 0x14($sp)
/* 83E44 80093644 0C004396 */  lhu        $v1, 0xC($s2)
/* 83E48 80093648 00000000 */  nop
/* 83E4C 8009364C 21104300 */  addu       $v0, $v0, $v1
/* 83E50 80093650 1400A2A7 */  sh         $v0, 0x14($sp)
.L80093654:
/* 83E54 80093654 2C00308E */  lw         $s0, 0x2C($s1)
/* 83E58 80093658 00000000 */  nop
/* 83E5C 8009365C 09000012 */  beqz       $s0, .L80093684
/* 83E60 80093660 21202002 */   addu      $a0, $s1, $zero
/* 83E64 80093664 0800048E */  lw         $a0, 0x8($s0)
/* 83E68 80093668 00000000 */  nop
/* 83E6C 8009366C 04008010 */  beqz       $a0, .L80093680
/* 83E70 80093670 00000000 */   nop
/* 83E74 80093674 A94A020C */  jal        _G2Anim_FreeInterpStateBlockList
/* 83E78 80093678 00000000 */   nop
/* 83E7C 8009367C 080000AE */  sw         $zero, 0x8($s0)
.L80093680:
/* 83E80 80093680 21202002 */  addu       $a0, $s1, $zero
.L80093684:
/* 83E84 80093684 EB3F020C */  jal        G2AnimSection_ClearAlarm
/* 83E88 80093688 03000524 */   addiu     $a1, $zero, 0x3
/* 83E8C 8009368C 2400228E */  lw         $v0, 0x24($s1)
/* 83E90 80093690 00000000 */  nop
/* 83E94 80093694 07008212 */  beq        $s4, $v0, .L800936B4
/* 83E98 80093698 21108002 */   addu      $v0, $s4, $zero
/* 83E9C 8009369C 240034AE */  sw         $s4, 0x24($s1)
/* 83EA0 800936A0 140035A6 */  sh         $s5, 0x14($s1)
/* 83EA4 800936A4 06004294 */  lhu        $v0, 0x6($v0)
/* 83EA8 800936A8 00000000 */  nop
/* 83EAC 800936AC 23100200 */  negu       $v0, $v0
/* 83EB0 800936B0 060022A6 */  sh         $v0, 0x6($s1)
.L800936B4:
/* 83EB4 800936B4 21202002 */  addu       $a0, $s1, $zero
/* 83EB8 800936B8 002C1300 */  sll        $a1, $s3, 16
/* 83EBC 800936BC D04D020C */  jal        G2AnimSection_JumpToTime
/* 83EC0 800936C0 032C0500 */   sra       $a1, $a1, 16
/* 83EC4 800936C4 02002292 */  lbu        $v0, 0x2($s1)
/* 83EC8 800936C8 00000000 */  nop
/* 83ECC 800936CC 09004014 */  bnez       $v0, .L800936F4
/* 83ED0 800936D0 00000000 */   nop
/* 83ED4 800936D4 00002292 */  lbu        $v0, 0x0($s1)
/* 83ED8 800936D8 00000000 */  nop
/* 83EDC 800936DC 80004234 */  ori        $v0, $v0, 0x80
/* 83EE0 800936E0 000022A2 */  sb         $v0, 0x0($s1)
/* 83EE4 800936E4 1000A28F */  lw         $v0, 0x10($sp)
/* 83EE8 800936E8 1400A397 */  lhu        $v1, 0x14($sp)
/* 83EEC 800936EC 080042AE */  sw         $v0, 0x8($s2)
/* 83EF0 800936F0 0C0043A6 */  sh         $v1, 0xC($s2)
.L800936F4:
/* 83EF4 800936F4 00002292 */  lbu        $v0, 0x0($s1)
/* 83EF8 800936F8 00000000 */  nop
/* 83EFC 800936FC 02004230 */  andi       $v0, $v0, 0x2
/* 83F00 80093700 03004010 */  beqz       $v0, .L80093710
/* 83F04 80093704 00000000 */   nop
/* 83F08 80093708 6540020C */  jal        G2AnimSection_SetLoopRangeAll
/* 83F0C 8009370C 21202002 */   addu      $a0, $s1, $zero
.L80093710:
/* 83F10 80093710 8040020C */  jal        G2AnimSection_SetUnpaused
/* 83F14 80093714 21202002 */   addu      $a0, $s1, $zero
/* 83F18 80093718 0C0020AE */  sw         $zero, 0xC($s1)
/* 83F1C 8009371C 3000BF8F */  lw         $ra, 0x30($sp)
/* 83F20 80093720 2C00B58F */  lw         $s5, 0x2C($sp)
/* 83F24 80093724 2800B48F */  lw         $s4, 0x28($sp)
/* 83F28 80093728 2400B38F */  lw         $s3, 0x24($sp)
/* 83F2C 8009372C 2000B28F */  lw         $s2, 0x20($sp)
/* 83F30 80093730 1C00B18F */  lw         $s1, 0x1C($sp)
/* 83F34 80093734 1800B08F */  lw         $s0, 0x18($sp)
/* 83F38 80093738 0800E003 */  jr         $ra
/* 83F3C 8009373C 3800BD27 */   addiu     $sp, $sp, 0x38
.size G2AnimSection_SwitchToKeylistAtTime, . - G2AnimSection_SwitchToKeylistAtTime
