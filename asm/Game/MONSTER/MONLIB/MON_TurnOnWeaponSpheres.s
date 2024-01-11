.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOnWeaponSpheres
/* 6FED0 8007F6D0 6C01868C */  lw         $a2, 0x16C($a0)
/* 6FED4 8007F6D4 00000000 */  nop
/* 6FED8 8007F6D8 0000C28C */  lw         $v0, 0x0($a2)
/* 6FEDC 8007F6DC 00000000 */  nop
/* 6FEE0 8007F6E0 00404230 */  andi       $v0, $v0, 0x4000
/* 6FEE4 8007F6E4 26004014 */  bnez       $v0, .L8007F780
/* 6FEE8 8007F6E8 00000000 */   nop
/* 6FEEC 8007F6EC 0001838C */  lw         $v1, 0x100($a0)
/* 6FEF0 8007F6F0 00000000 */  nop
/* 6FEF4 8007F6F4 22006010 */  beqz       $v1, .L8007F780
/* 6FEF8 8007F6F8 00000000 */   nop
/* 6FEFC 8007F6FC 26018284 */  lh         $v0, 0x126($a0)
/* 6FF00 8007F700 00000000 */  nop
/* 6FF04 8007F704 C0100200 */  sll        $v0, $v0, 3
/* 6FF08 8007F708 21106200 */  addu       $v0, $v1, $v0
/* 6FF0C 8007F70C 0400458C */  lw         $a1, 0x4($v0)
/* 6FF10 8007F710 0000448C */  lw         $a0, 0x0($v0)
/* 6FF14 8007F714 1600A010 */  beqz       $a1, .L8007F770
/* 6FF18 8007F718 01000824 */   addiu     $t0, $zero, 0x1
/* 6FF1C 8007F71C 09000724 */  addiu      $a3, $zero, 0x9
/* 6FF20 8007F720 04008324 */  addiu      $v1, $a0, 0x4
.L8007F724:
/* 6FF24 8007F724 FEFF6290 */  lbu        $v0, -0x2($v1)
/* 6FF28 8007F728 00000000 */  nop
/* 6FF2C 8007F72C 0C004814 */  bne        $v0, $t0, .L8007F760
/* 6FF30 8007F730 00000000 */   nop
/* 6FF34 8007F734 0000628C */  lw         $v0, 0x0($v1)
/* 6FF38 8007F738 00000000 */  nop
/* 6FF3C 8007F73C 04004290 */  lbu        $v0, 0x4($v0)
/* 6FF40 8007F740 00000000 */  nop
/* 6FF44 8007F744 07004714 */  bne        $v0, $a3, .L8007F764
/* 6FF48 8007F748 FFFFA524 */   addiu     $a1, $a1, -0x1
/* 6FF4C 8007F74C 00008290 */  lbu        $v0, 0x0($a0)
/* 6FF50 8007F750 00000000 */  nop
/* 6FF54 8007F754 01004234 */  ori        $v0, $v0, 0x1
/* 6FF58 8007F758 DCFD0108 */  j          .L8007F770
/* 6FF5C 8007F75C 000082A0 */   sb        $v0, 0x0($a0)
.L8007F760:
/* 6FF60 8007F760 FFFFA524 */  addiu      $a1, $a1, -0x1
.L8007F764:
/* 6FF64 8007F764 08006324 */  addiu      $v1, $v1, 0x8
/* 6FF68 8007F768 EEFFA014 */  bnez       $a1, .L8007F724
/* 6FF6C 8007F76C 08008424 */   addiu     $a0, $a0, 0x8
.L8007F770:
/* 6FF70 8007F770 0000C28C */  lw         $v0, 0x0($a2)
/* 6FF74 8007F774 00000000 */  nop
/* 6FF78 8007F778 00404234 */  ori        $v0, $v0, 0x4000
/* 6FF7C 8007F77C 0000C2AC */  sw         $v0, 0x0($a2)
.L8007F780:
/* 6FF80 8007F780 0800E003 */  jr         $ra
/* 6FF84 8007F784 00000000 */   nop
.size MON_TurnOnWeaponSpheres, . - MON_TurnOnWeaponSpheres
