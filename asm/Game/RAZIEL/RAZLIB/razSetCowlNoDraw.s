.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetCowlNoDraw
/* 97EC4 800A76C4 21408000 */  addu       $t0, $a0, $zero
/* 97EC8 800A76C8 A4A68627 */  addiu      $a2, $gp, %gp_rel(cowlList)
/* 97ECC 800A76CC CAA68727 */  addiu      $a3, $gp, %gp_rel(D_800D1C62)
.L800A76D0:
/* 97ED0 800A76D0 11000011 */  beqz       $t0, .L800A7718
/* 97ED4 800A76D4 00000000 */   nop
/* 97ED8 800A76D8 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97EDC 800A76DC 0000C594 */  lhu        $a1, 0x0($a2)
/* 97EE0 800A76E0 26014484 */  lh         $a0, 0x126($v0)
/* 97EE4 800A76E4 1C00428C */  lw         $v0, 0x1C($v0)
/* 97EE8 800A76E8 40180500 */  sll        $v1, $a1, 1
/* 97EEC 800A76EC 0C00428C */  lw         $v0, 0xC($v0)
/* 97EF0 800A76F0 80200400 */  sll        $a0, $a0, 2
/* 97EF4 800A76F4 21208200 */  addu       $a0, $a0, $v0
/* 97EF8 800A76F8 0000828C */  lw         $v0, 0x0($a0)
/* 97EFC 800A76FC 21186500 */  addu       $v1, $v1, $a1
/* 97F00 800A7700 1400428C */  lw         $v0, 0x14($v0)
/* 97F04 800A7704 80180300 */  sll        $v1, $v1, 2
/* 97F08 800A7708 21186200 */  addu       $v1, $v1, $v0
/* 97F0C 800A770C 07006290 */  lbu        $v0, 0x7($v1)
/* 97F10 800A7710 D69D0208 */  j          .L800A7758
/* 97F14 800A7714 10004234 */   ori       $v0, $v0, 0x10
.L800A7718:
/* 97F18 800A7718 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 97F1C 800A771C 0000C594 */  lhu        $a1, 0x0($a2)
/* 97F20 800A7720 26014484 */  lh         $a0, 0x126($v0)
/* 97F24 800A7724 1C00428C */  lw         $v0, 0x1C($v0)
/* 97F28 800A7728 40180500 */  sll        $v1, $a1, 1
/* 97F2C 800A772C 0C00428C */  lw         $v0, 0xC($v0)
/* 97F30 800A7730 80200400 */  sll        $a0, $a0, 2
/* 97F34 800A7734 21208200 */  addu       $a0, $a0, $v0
/* 97F38 800A7738 0000828C */  lw         $v0, 0x0($a0)
/* 97F3C 800A773C 21186500 */  addu       $v1, $v1, $a1
/* 97F40 800A7740 1400428C */  lw         $v0, 0x14($v0)
/* 97F44 800A7744 80180300 */  sll        $v1, $v1, 2
/* 97F48 800A7748 21186200 */  addu       $v1, $v1, $v0
/* 97F4C 800A774C 07006290 */  lbu        $v0, 0x7($v1)
/* 97F50 800A7750 00000000 */  nop
/* 97F54 800A7754 EF004230 */  andi       $v0, $v0, 0xEF
.L800A7758:
/* 97F58 800A7758 070062A0 */  sb         $v0, 0x7($v1)
/* 97F5C 800A775C 0200C624 */  addiu      $a2, $a2, 0x2
/* 97F60 800A7760 2A10C700 */  slt        $v0, $a2, $a3
/* 97F64 800A7764 DAFF4014 */  bnez       $v0, .L800A76D0
/* 97F68 800A7768 00000000 */   nop
/* 97F6C 800A776C 0800E003 */  jr         $ra
/* 97F70 800A7770 00000000 */   nop
.size razSetCowlNoDraw, . - razSetCowlNoDraw
