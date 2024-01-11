.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel RotMatrixZ
/* 698C8 800790C8 FF078230 */  andi       $v0, $a0, 0x7FF
/* 698CC 800790CC 40100200 */  sll        $v0, $v0, 1
/* 698D0 800790D0 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 698D4 800790D4 F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 698D8 800790D8 20186200 */  add        $v1, $v1, $v0 # handwritten instruction
/* 698DC 800790DC 00086284 */  lh         $v0, 0x800($v1)
/* 698E0 800790E0 00006384 */  lh         $v1, 0x0($v1)
/* 698E4 800790E4 00088430 */  andi       $a0, $a0, 0x800
/* 698E8 800790E8 03008010 */  beqz       $a0, .L800790F8
/* 698EC 800790EC 00000000 */   nop
/* 698F0 800790F0 22100200 */  sub        $v0, $zero, $v0 # handwritten instruction
/* 698F4 800790F4 22180300 */  sub        $v1, $zero, $v1 # handwritten instruction
.L800790F8:
/* 698F8 800790F8 0000A88C */  lw         $t0, 0x0($a1)
/* 698FC 800790FC 0400AA8C */  lw         $t2, 0x4($a1)
/* 69900 80079100 034C0800 */  sra        $t1, $t0, 16
/* 69904 80079104 00440800 */  sll        $t0, $t0, 16
/* 69908 80079108 03440800 */  sra        $t0, $t0, 16
/* 6990C 8007910C 035C0A00 */  sra        $t3, $t2, 16
/* 69910 80079110 00540A00 */  sll        $t2, $t2, 16
/* 69914 80079114 03540A00 */  sra        $t2, $t2, 16
/* 69918 80079118 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 6991C 8007911C 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 69920 80079120 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 69924 80079124 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 69928 80079128 0800AC8C */  lw         $t4, 0x8($a1)
/* 6992C 8007912C 00000000 */  nop
/* 69930 80079130 3D00984B */  GPF        1
/* 69934 80079134 036C0C00 */  sra        $t5, $t4, 16
/* 69938 80079138 00640C00 */  sll        $t4, $t4, 16
/* 6993C 8007913C 03640C00 */  sra        $t4, $t4, 16
/* 69940 80079140 00480E48 */  mfc2       $t6, $9 # handwritten instruction
/* 69944 80079144 00500F48 */  mfc2       $t7, $10 # handwritten instruction
/* 69948 80079148 00581848 */  mfc2       $t8, $11 # handwritten instruction
/* 6994C 8007914C 00408348 */  mtc2       $v1, $8 # handwritten instruction
/* 69950 80079150 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 69954 80079154 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 69958 80079158 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 6995C 8007915C 00000000 */  nop
/* 69960 80079160 00000000 */  nop
/* 69964 80079164 3D00984B */  GPF        1
/* 69968 80079168 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 6996C 8007916C 00500148 */  mfc2       $at, $10 # handwritten instruction
/* 69970 80079170 00580648 */  mfc2       $a2, $11 # handwritten instruction
/* 69974 80079174 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 69978 80079178 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 6997C 8007917C 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 69980 80079180 2270C401 */  sub        $t6, $t6, $a0 # handwritten instruction
/* 69984 80079184 00000000 */  nop
/* 69988 80079188 3D00984B */  GPF        1
/* 6998C 8007918C 2278E101 */  sub        $t7, $t7, $at # handwritten instruction
/* 69990 80079190 22C00603 */  sub        $t8, $t8, $a2 # handwritten instruction
/* 69994 80079194 007C0F00 */  sll        $t7, $t7, 16
/* 69998 80079198 FFFFCE31 */  andi       $t6, $t6, 0xFFFF
/* 6999C 8007919C 2570CF01 */  or         $t6, $t6, $t7
/* 699A0 800791A0 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 699A4 800791A4 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 699A8 800791A8 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 699AC 800791AC 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 699B0 800791B0 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 699B4 800791B4 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 699B8 800791B8 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 699BC 800791BC FFFF1833 */  andi       $t8, $t8, 0xFFFF
/* 699C0 800791C0 00000000 */  nop
/* 699C4 800791C4 3D00984B */  GPF        1
/* 699C8 800791C8 0000AEAC */  sw         $t6, 0x0($a1)
/* 699CC 800791CC 00480B48 */  mfc2       $t3, $9 # handwritten instruction
/* 699D0 800791D0 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* 699D4 800791D4 00580D48 */  mfc2       $t5, $11 # handwritten instruction
/* 699D8 800791D8 20400B01 */  add        $t0, $t0, $t3 # handwritten instruction
/* 699DC 800791DC 20482C01 */  add        $t1, $t1, $t4 # handwritten instruction
/* 699E0 800791E0 20504D01 */  add        $t2, $t2, $t5 # handwritten instruction
/* 699E4 800791E4 00440800 */  sll        $t0, $t0, 16
/* 699E8 800791E8 25C00803 */  or         $t8, $t8, $t0
/* 699EC 800791EC 00540A00 */  sll        $t2, $t2, 16
/* 699F0 800791F0 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 699F4 800791F4 25482A01 */  or         $t1, $t1, $t2
/* 699F8 800791F8 0400B8AC */  sw         $t8, 0x4($a1)
/* 699FC 800791FC 0800A9AC */  sw         $t1, 0x8($a1)
/* 69A00 80079200 0800E003 */  jr         $ra
/* 69A04 80079204 00000000 */   nop
.size RotMatrixZ, . - RotMatrixZ
