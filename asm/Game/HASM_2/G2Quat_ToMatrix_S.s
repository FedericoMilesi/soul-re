.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel G2Quat_ToMatrix_S
/* 6A49C 80079C9C 00008E84 */  lh         $t6, 0x0($a0)
/* 6A4A0 80079CA0 06009984 */  lh         $t9, 0x6($a0)
/* 6A4A4 80079CA4 02008F84 */  lh         $t7, 0x2($a0)
/* 6A4A8 80079CA8 04009884 */  lh         $t8, 0x4($a0)
/* 6A4AC 80079CAC 40100E00 */  sll        $v0, $t6, 1
/* 6A4B0 80079CB0 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 6A4B4 80079CB4 00488E48 */  mtc2       $t6, $9 # handwritten instruction
/* 6A4B8 80079CB8 00509948 */  mtc2       $t9, $10 # handwritten instruction
/* 6A4BC 80079CBC 00588F48 */  mtc2       $t7, $11 # handwritten instruction
/* 6A4C0 80079CC0 00000000 */  nop
/* 6A4C4 80079CC4 00000000 */  nop
/* 6A4C8 80079CC8 3D00984B */  GPF        1
/* 6A4CC 80079CCC 00100424 */  addiu      $a0, $zero, 0x1000
/* 6A4D0 80079CD0 40100F00 */  sll        $v0, $t7, 1
/* 6A4D4 80079CD4 00C80848 */  mfc2       $t0, $25 # handwritten instruction
/* 6A4D8 80079CD8 00D00948 */  mfc2       $t1, $26 # handwritten instruction
/* 6A4DC 80079CDC 00D80A48 */  mfc2       $t2, $27 # handwritten instruction
/* 6A4E0 80079CE0 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 6A4E4 80079CE4 00488F48 */  mtc2       $t7, $9 # handwritten instruction
/* 6A4E8 80079CE8 00509948 */  mtc2       $t9, $10 # handwritten instruction
/* 6A4EC 80079CEC 00589848 */  mtc2       $t8, $11 # handwritten instruction
/* 6A4F0 80079CF0 00000000 */  nop
/* 6A4F4 80079CF4 00000000 */  nop
/* 6A4F8 80079CF8 3D00984B */  GPF        1
/* 6A4FC 80079CFC 40101800 */  sll        $v0, $t8, 1
/* 6A500 80079D00 00C80B48 */  mfc2       $t3, $25 # handwritten instruction
/* 6A504 80079D04 00D00C48 */  mfc2       $t4, $26 # handwritten instruction
/* 6A508 80079D08 00D80D48 */  mfc2       $t5, $27 # handwritten instruction
/* 6A50C 80079D0C 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 6A510 80079D10 00489848 */  mtc2       $t8, $9 # handwritten instruction
/* 6A514 80079D14 00509948 */  mtc2       $t9, $10 # handwritten instruction
/* 6A518 80079D18 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 6A51C 80079D1C 00000000 */  nop
/* 6A520 80079D20 00000000 */  nop
/* 6A524 80079D24 3D00984B */  GPF        1
/* 6A528 80079D28 2018A901 */  add        $v1, $t5, $t1 # handwritten instruction
/* 6A52C 80079D2C 20100B01 */  add        $v0, $t0, $t3 # handwritten instruction
/* 6A530 80079D30 22108200 */  sub        $v0, $a0, $v0 # handwritten instruction
/* 6A534 80079D34 0E00A3A4 */  sh         $v1, 0xE($a1)
/* 6A538 80079D38 1000A2A4 */  sh         $v0, 0x10($a1)
/* 6A53C 80079D3C 00C80E48 */  mfc2       $t6, $25 # handwritten instruction
/* 6A540 80079D40 00D00F48 */  mfc2       $t7, $26 # handwritten instruction
/* 6A544 80079D44 00D81848 */  mfc2       $t8, $27 # handwritten instruction
/* 6A548 80079D48 20106E01 */  add        $v0, $t3, $t6 # handwritten instruction
/* 6A54C 80079D4C 22108200 */  sub        $v0, $a0, $v0 # handwritten instruction
/* 6A550 80079D50 22184F01 */  sub        $v1, $t2, $t7 # handwritten instruction
/* 6A554 80079D54 0000A2A4 */  sh         $v0, 0x0($a1)
/* 6A558 80079D58 0200A3A4 */  sh         $v1, 0x2($a1)
/* 6A55C 80079D5C 20100C03 */  add        $v0, $t8, $t4 # handwritten instruction
/* 6A560 80079D60 20184F01 */  add        $v1, $t2, $t7 # handwritten instruction
/* 6A564 80079D64 0400A2A4 */  sh         $v0, 0x4($a1)
/* 6A568 80079D68 0600A3A4 */  sh         $v1, 0x6($a1)
/* 6A56C 80079D6C 20100E01 */  add        $v0, $t0, $t6 # handwritten instruction
/* 6A570 80079D70 22108200 */  sub        $v0, $a0, $v0 # handwritten instruction
/* 6A574 80079D74 2218A901 */  sub        $v1, $t5, $t1 # handwritten instruction
/* 6A578 80079D78 0800A2A4 */  sh         $v0, 0x8($a1)
/* 6A57C 80079D7C 0A00A3A4 */  sh         $v1, 0xA($a1)
/* 6A580 80079D80 22100C03 */  sub        $v0, $t8, $t4 # handwritten instruction
/* 6A584 80079D84 0800E003 */  jr         $ra
/* 6A588 80079D88 0C00A2A4 */   sh        $v0, 0xC($a1)
.size G2Quat_ToMatrix_S, . - G2Quat_ToMatrix_S
