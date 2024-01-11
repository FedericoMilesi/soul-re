.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _FX_BuildSplinters
/* 34E48 80044648 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 34E4C 8004464C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 34E50 80044650 7000B18F */  lw         $s1, 0x70($sp)
/* 34E54 80044654 3000B2AF */  sw         $s2, 0x30($sp)
/* 34E58 80044658 21908000 */  addu       $s2, $a0, $zero
/* 34E5C 8004465C 3800B4AF */  sw         $s4, 0x38($sp)
/* 34E60 80044660 21A0A000 */  addu       $s4, $a1, $zero
/* 34E64 80044664 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 34E68 80044668 21A8C000 */  addu       $s5, $a2, $zero
/* 34E6C 8004466C 4000B6AF */  sw         $s6, 0x40($sp)
/* 34E70 80044670 21B0E000 */  addu       $s6, $a3, $zero
/* 34E74 80044674 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 34E78 80044678 4800BEAF */  sw         $fp, 0x48($sp)
/* 34E7C 8004467C 4400B7AF */  sw         $s7, 0x44($sp)
/* 34E80 80044680 3400B3AF */  sw         $s3, 0x34($sp)
/* 34E84 80044684 2800B0AF */  sw         $s0, 0x28($sp)
/* 34E88 80044688 1C00448E */  lw         $a0, 0x1C($s2)
/* 34E8C 8004468C 6000B38F */  lw         $s3, 0x60($sp)
/* 34E90 80044690 6400B78F */  lw         $s7, 0x64($sp)
/* 34E94 80044694 6800BE8F */  lw         $fp, 0x68($sp)
/* 34E98 80044698 B841010C */  jal        MEMPACK_MemoryValidFunc
/* 34E9C 8004469C 21802002 */   addu      $s0, $s1, $zero
/* 34EA0 800446A0 32004010 */  beqz       $v0, .L8004476C
/* 34EA4 800446A4 00000000 */   nop
/* 34EA8 800446A8 08006012 */  beqz       $s3, .L800446CC
/* 34EAC 800446AC 00000000 */   nop
/* 34EB0 800446B0 00006296 */  lhu        $v0, 0x0($s3)
/* 34EB4 800446B4 02006486 */  lh         $a0, 0x2($s3)
/* 34EB8 800446B8 00000000 */  nop
/* 34EBC 800446BC 03008010 */  beqz       $a0, .L800446CC
/* 34EC0 800446C0 25805100 */   or        $s0, $v0, $s1
/* 34EC4 800446C4 0E02010C */  jal        SndPlay
/* 34EC8 800446C8 00000000 */   nop
.L800446CC:
/* 34ECC 800446CC 1C00438E */  lw         $v1, 0x1C($s2)
/* 34ED0 800446D0 26014286 */  lh         $v0, 0x126($s2)
/* 34ED4 800446D4 0C00638C */  lw         $v1, 0xC($v1)
/* 34ED8 800446D8 80100200 */  sll        $v0, $v0, 2
/* 34EDC 800446DC 21104300 */  addu       $v0, $v0, $v1
/* 34EE0 800446E0 0000428C */  lw         $v0, 0x0($v0)
/* 34EE4 800446E4 00000000 */  nop
/* 34EE8 800446E8 1800428C */  lw         $v0, 0x18($v0)
/* 34EEC 800446EC 00000000 */  nop
/* 34EF0 800446F0 04004228 */  slti       $v0, $v0, 0x4
/* 34EF4 800446F4 04004014 */  bnez       $v0, .L80044708
/* 34EF8 800446F8 21204002 */   addu      $a0, $s2, $zero
/* 34EFC 800446FC 20000232 */  andi       $v0, $s0, 0x20
/* 34F00 80044700 0F004010 */  beqz       $v0, .L80044740
/* 34F04 80044704 21288002 */   addu      $a1, $s4, $zero
.L80044708:
/* 34F08 80044708 21288002 */  addu       $a1, $s4, $zero
/* 34F0C 8004470C 2130A002 */  addu       $a2, $s5, $zero
/* 34F10 80044710 2138C002 */  addu       $a3, $s6, $zero
/* 34F14 80044714 00141000 */  sll        $v0, $s0, 16
/* 34F18 80044718 6C00A88F */  lw         $t0, 0x6C($sp)
/* 34F1C 8004471C 03140200 */  sra        $v0, $v0, 16
/* 34F20 80044720 1000B3AF */  sw         $s3, 0x10($sp)
/* 34F24 80044724 1400B7AF */  sw         $s7, 0x14($sp)
/* 34F28 80044728 1800BEAF */  sw         $fp, 0x18($sp)
/* 34F2C 8004472C 2000A2AF */  sw         $v0, 0x20($sp)
/* 34F30 80044730 970E010C */  jal        _FX_BuildNonSegmentedSplinters
/* 34F34 80044734 1C00A8AF */   sw        $t0, 0x1C($sp)
/* 34F38 80044738 DB110108 */  j          .L8004476C
/* 34F3C 8004473C 00000000 */   nop
.L80044740:
/* 34F40 80044740 2130A002 */  addu       $a2, $s5, $zero
/* 34F44 80044744 2138C002 */  addu       $a3, $s6, $zero
/* 34F48 80044748 00141000 */  sll        $v0, $s0, 16
/* 34F4C 8004474C 6C00A88F */  lw         $t0, 0x6C($sp)
/* 34F50 80044750 03140200 */  sra        $v0, $v0, 16
/* 34F54 80044754 1000B3AF */  sw         $s3, 0x10($sp)
/* 34F58 80044758 1400B7AF */  sw         $s7, 0x14($sp)
/* 34F5C 8004475C 1800BEAF */  sw         $fp, 0x18($sp)
/* 34F60 80044760 2000A2AF */  sw         $v0, 0x20($sp)
/* 34F64 80044764 F60B010C */  jal        _FX_BuildSegmentedSplinters
/* 34F68 80044768 1C00A8AF */   sw        $t0, 0x1C($sp)
.L8004476C:
/* 34F6C 8004476C 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 34F70 80044770 4800BE8F */  lw         $fp, 0x48($sp)
/* 34F74 80044774 4400B78F */  lw         $s7, 0x44($sp)
/* 34F78 80044778 4000B68F */  lw         $s6, 0x40($sp)
/* 34F7C 8004477C 3C00B58F */  lw         $s5, 0x3C($sp)
/* 34F80 80044780 3800B48F */  lw         $s4, 0x38($sp)
/* 34F84 80044784 3400B38F */  lw         $s3, 0x34($sp)
/* 34F88 80044788 3000B28F */  lw         $s2, 0x30($sp)
/* 34F8C 8004478C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 34F90 80044790 2800B08F */  lw         $s0, 0x28($sp)
/* 34F94 80044794 0800E003 */  jr         $ra
/* 34F98 80044798 5000BD27 */   addiu     $sp, $sp, 0x50
.size _FX_BuildSplinters, . - _FX_BuildSplinters
