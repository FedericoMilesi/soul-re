.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _G2AnimSection_InterpStateToQuat
/* 82EF0 800926F0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 82EF4 800926F4 3800BFAF */  sw         $ra, 0x38($sp)
/* 82EF8 800926F8 3400B5AF */  sw         $s5, 0x34($sp)
/* 82EFC 800926FC 3000B4AF */  sw         $s4, 0x30($sp)
/* 82F00 80092700 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 82F04 80092704 2800B2AF */  sw         $s2, 0x28($sp)
/* 82F08 80092708 2400B1AF */  sw         $s1, 0x24($sp)
/* 82F0C 8009270C 2000B0AF */  sw         $s0, 0x20($sp)
/* 82F10 80092710 2C00908C */  lw         $s0, 0x2C($a0)
/* 82F14 80092714 04008284 */  lh         $v0, 0x4($a0)
/* 82F18 80092718 00000386 */  lh         $v1, 0x0($s0)
/* 82F1C 8009271C 00130200 */  sll        $v0, $v0, 12
/* 82F20 80092720 1A004300 */  div        $zero, $v0, $v1
/* 82F24 80092724 12880000 */  mflo       $s1
/* 82F28 80092728 04001224 */  addiu      $s2, $zero, 0x4
/* 82F2C 8009272C 03009490 */  lbu        $s4, 0x3($a0)
/* 82F30 80092730 0400048E */  lw         $a0, 0x4($s0)
/* 82F34 80092734 9B53020C */  jal        _G2AnimAlphaTable_GetValue
/* 82F38 80092738 21282002 */   addu      $a1, $s1, $zero
/* 82F3C 8009273C 0800138E */  lw         $s3, 0x8($s0)
/* 82F40 80092740 21884000 */  addu       $s1, $v0, $zero
/* 82F44 80092744 4500801A */  blez       $s4, .L8009285C
/* 82F48 80092748 21807202 */   addu      $s0, $s3, $s2
/* 82F4C 8009274C 1800B527 */  addiu      $s5, $sp, 0x18
/* 82F50 80092750 21202002 */  addu       $a0, $s1, $zero
.L80092754:
/* 82F54 80092754 21280002 */  addu       $a1, $s0, $zero
/* 82F58 80092758 08000626 */  addiu      $a2, $s0, 0x8
/* 82F5C 8009275C 1800A727 */  addiu      $a3, $sp, 0x18
/* 82F60 80092760 0D59020C */  jal        G2Quat_Slerp_VM
/* 82F64 80092764 1000A0AF */   sw        $zero, 0x10($sp)
/* 82F68 80092768 0400A38E */  lw         $v1, 0x4($s5)
/* 82F6C 8009276C 1800A28F */  lw         $v0, 0x18($sp)
/* 82F70 80092770 040003AE */  sw         $v1, 0x4($s0)
/* 82F74 80092774 10000326 */  addiu      $v1, $s0, 0x10
/* 82F78 80092778 000002AE */  sw         $v0, 0x0($s0)
/* 82F7C 8009277C 16000226 */  addiu      $v0, $s0, 0x16
/* 82F80 80092780 00006C94 */  lhu        $t4, 0x0($v1)
/* 82F84 80092784 02006D94 */  lhu        $t5, 0x2($v1)
/* 82F88 80092788 04006E94 */  lhu        $t6, 0x4($v1)
/* 82F8C 8009278C 00C88C48 */  mtc2       $t4, $25 # handwritten instruction
/* 82F90 80092790 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 82F94 80092794 00D88E48 */  mtc2       $t6, $27 # handwritten instruction
/* 82F98 80092798 00004C94 */  lhu        $t4, 0x0($v0)
/* 82F9C 8009279C 02004D94 */  lhu        $t5, 0x2($v0)
/* 82FA0 800927A0 04004E94 */  lhu        $t6, 0x4($v0)
/* 82FA4 800927A4 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 82FA8 800927A8 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 82FAC 800927AC 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 82FB0 800927B0 00409148 */  mtc2       $s1, $8 # handwritten instruction
/* 82FB4 800927B4 00000000 */  nop
/* 82FB8 800927B8 00000000 */  nop
/* 82FBC 800927BC 3E00A84B */  GPL        1
/* 82FC0 800927C0 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 82FC4 800927C4 00D00D48 */  mfc2       $t5, $26 # handwritten instruction
/* 82FC8 800927C8 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 82FCC 800927CC 00006CA4 */  sh         $t4, 0x0($v1)
/* 82FD0 800927D0 02006DA4 */  sh         $t5, 0x2($v1)
/* 82FD4 800927D4 04006EA4 */  sh         $t6, 0x4($v1)
/* 82FD8 800927D8 1C000326 */  addiu      $v1, $s0, 0x1C
/* 82FDC 800927DC 22000226 */  addiu      $v0, $s0, 0x22
/* 82FE0 800927E0 00006C94 */  lhu        $t4, 0x0($v1)
/* 82FE4 800927E4 02006D94 */  lhu        $t5, 0x2($v1)
/* 82FE8 800927E8 04006E94 */  lhu        $t6, 0x4($v1)
/* 82FEC 800927EC 00C88C48 */  mtc2       $t4, $25 # handwritten instruction
/* 82FF0 800927F0 00D08D48 */  mtc2       $t5, $26 # handwritten instruction
/* 82FF4 800927F4 00D88E48 */  mtc2       $t6, $27 # handwritten instruction
/* 82FF8 800927F8 00004C94 */  lhu        $t4, 0x0($v0)
/* 82FFC 800927FC 02004D94 */  lhu        $t5, 0x2($v0)
/* 83000 80092800 04004E94 */  lhu        $t6, 0x4($v0)
/* 83004 80092804 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 83008 80092808 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 8300C 8009280C 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 83010 80092810 00409148 */  mtc2       $s1, $8 # handwritten instruction
/* 83014 80092814 00000000 */  nop
/* 83018 80092818 00000000 */  nop
/* 8301C 8009281C 3E00A84B */  GPL        1
/* 83020 80092820 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 83024 80092824 00D00D48 */  mfc2       $t5, $26 # handwritten instruction
/* 83028 80092828 00D80E48 */  mfc2       $t6, $27 # handwritten instruction
/* 8302C 8009282C 00006CA4 */  sh         $t4, 0x0($v1)
/* 83030 80092830 02006DA4 */  sh         $t5, 0x2($v1)
/* 83034 80092834 04006EA4 */  sh         $t6, 0x4($v1)
/* 83038 80092838 FFFF9426 */  addiu      $s4, $s4, -0x1
/* 8303C 8009283C FFFF5226 */  addiu      $s2, $s2, -0x1
/* 83040 80092840 04004016 */  bnez       $s2, .L80092854
/* 83044 80092844 28001026 */   addiu     $s0, $s0, 0x28
/* 83048 80092848 0000738E */  lw         $s3, 0x0($s3)
/* 8304C 8009284C 04001224 */  addiu      $s2, $zero, 0x4
/* 83050 80092850 21807202 */  addu       $s0, $s3, $s2
.L80092854:
/* 83054 80092854 BFFF801E */  bgtz       $s4, .L80092754
/* 83058 80092858 21202002 */   addu      $a0, $s1, $zero
.L8009285C:
/* 8305C 8009285C 3800BF8F */  lw         $ra, 0x38($sp)
/* 83060 80092860 3400B58F */  lw         $s5, 0x34($sp)
/* 83064 80092864 3000B48F */  lw         $s4, 0x30($sp)
/* 83068 80092868 2C00B38F */  lw         $s3, 0x2C($sp)
/* 8306C 8009286C 2800B28F */  lw         $s2, 0x28($sp)
/* 83070 80092870 2400B18F */  lw         $s1, 0x24($sp)
/* 83074 80092874 2000B08F */  lw         $s0, 0x20($sp)
/* 83078 80092878 0800E003 */  jr         $ra
/* 8307C 8009287C 4000BD27 */   addiu     $sp, $sp, 0x40
.size _G2AnimSection_InterpStateToQuat, . - _G2AnimSection_InterpStateToQuat
