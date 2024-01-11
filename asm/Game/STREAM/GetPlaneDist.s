.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPlaneDist
/* 4EE34 8005E634 90AC8227 */  addiu      $v0, $gp, %gp_rel(theCamera)
/* 4EE38 8005E638 40300500 */  sll        $a2, $a1, 1
/* 4EE3C 8005E63C 2130C500 */  addu       $a2, $a2, $a1
/* 4EE40 8005E640 40300600 */  sll        $a2, $a2, 1
/* 4EE44 8005E644 40210400 */  sll        $a0, $a0, 5
/* 4EE48 8005E648 2130C400 */  addu       $a2, $a2, $a0
/* 4EE4C 8005E64C 2130C200 */  addu       $a2, $a2, $v0
/* 4EE50 8005E650 0000E38C */  lw         $v1, 0x0($a3)
/* 4EE54 8005E654 90AC8887 */  lh         $t0, %gp_rel(theCamera)($gp)
/* 4EE58 8005E658 0800C284 */  lh         $v0, 0x8($a2)
/* 4EE5C 8005E65C 031B0300 */  sra        $v1, $v1, 12
/* 4EE60 8005E660 00410800 */  sll        $t0, $t0, 4
/* 4EE64 8005E664 23186800 */  subu       $v1, $v1, $t0
/* 4EE68 8005E668 18006200 */  mult       $v1, $v0
/* 4EE6C 8005E66C 0A00C484 */  lh         $a0, 0xA($a2)
/* 4EE70 8005E670 0400E28C */  lw         $v0, 0x4($a3)
/* 4EE74 8005E674 92AC8387 */  lh         $v1, %gp_rel(theCamera + 0x2)($gp)
/* 4EE78 8005E678 03130200 */  sra        $v0, $v0, 12
/* 4EE7C 8005E67C 12400000 */  mflo       $t0
/* 4EE80 8005E680 00190300 */  sll        $v1, $v1, 4
/* 4EE84 8005E684 23104300 */  subu       $v0, $v0, $v1
/* 4EE88 8005E688 18004400 */  mult       $v0, $a0
/* 4EE8C 8005E68C 94AC8387 */  lh         $v1, %gp_rel(theCamera + 0x4)($gp)
/* 4EE90 8005E690 00000000 */  nop
/* 4EE94 8005E694 00190300 */  sll        $v1, $v1, 4
/* 4EE98 8005E698 0800E28C */  lw         $v0, 0x8($a3)
/* 4EE9C 8005E69C 0C00C484 */  lh         $a0, 0xC($a2)
/* 4EEA0 8005E6A0 12280000 */  mflo       $a1
/* 4EEA4 8005E6A4 03130200 */  sra        $v0, $v0, 12
/* 4EEA8 8005E6A8 23104300 */  subu       $v0, $v0, $v1
/* 4EEAC 8005E6AC 18004400 */  mult       $v0, $a0
/* 4EEB0 8005E6B0 21100501 */  addu       $v0, $t0, $a1
/* 4EEB4 8005E6B4 12180000 */  mflo       $v1
/* 4EEB8 8005E6B8 0800E003 */  jr         $ra
/* 4EEBC 8005E6BC 21104300 */   addu      $v0, $v0, $v1
.size GetPlaneDist, . - GetPlaneDist
