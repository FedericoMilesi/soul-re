.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel RotMatrixX
/* 69660 80078E60 FF078230 */  andi       $v0, $a0, 0x7FF
/* 69664 80078E64 40100200 */  sll        $v0, $v0, 1
/* 69668 80078E68 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 6966C 80078E6C F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 69670 80078E70 20186200 */  add        $v1, $v1, $v0 # handwritten instruction
/* 69674 80078E74 00086284 */  lh         $v0, 0x800($v1)
/* 69678 80078E78 00006384 */  lh         $v1, 0x0($v1)
/* 6967C 80078E7C 00088430 */  andi       $a0, $a0, 0x800
/* 69680 80078E80 03008010 */  beqz       $a0, .L80078E90
/* 69684 80078E84 00000000 */   nop
/* 69688 80078E88 22100200 */  sub        $v0, $zero, $v0 # handwritten instruction
/* 6968C 80078E8C 22180300 */  sub        $v1, $zero, $v1 # handwritten instruction
.L80078E90:
/* 69690 80078E90 0600A884 */  lh         $t0, 0x6($a1)
/* 69694 80078E94 0800A98C */  lw         $t1, 0x8($a1)
/* 69698 80078E98 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 6969C 80078E9C 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 696A0 80078EA0 03540900 */  sra        $t2, $t1, 16
/* 696A4 80078EA4 004C0900 */  sll        $t1, $t1, 16
/* 696A8 80078EA8 034C0900 */  sra        $t1, $t1, 16
/* 696AC 80078EAC 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 696B0 80078EB0 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 696B4 80078EB4 0C00AB8C */  lw         $t3, 0xC($a1)
/* 696B8 80078EB8 00000000 */  nop
/* 696BC 80078EBC 3D00984B */  GPF        1
/* 696C0 80078EC0 1000AD84 */  lh         $t5, 0x10($a1)
/* 696C4 80078EC4 03640B00 */  sra        $t4, $t3, 16
/* 696C8 80078EC8 005C0B00 */  sll        $t3, $t3, 16
/* 696CC 80078ECC 035C0B00 */  sra        $t3, $t3, 16
/* 696D0 80078ED0 00480E48 */  mfc2       $t6, $9 # handwritten instruction
/* 696D4 80078ED4 00500F48 */  mfc2       $t7, $10 # handwritten instruction
/* 696D8 80078ED8 00581848 */  mfc2       $t8, $11 # handwritten instruction
/* 696DC 80078EDC 00408348 */  mtc2       $v1, $8 # handwritten instruction
/* 696E0 80078EE0 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 696E4 80078EE4 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 696E8 80078EE8 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 696EC 80078EEC 00000000 */  nop
/* 696F0 80078EF0 00000000 */  nop
/* 696F4 80078EF4 3D00984B */  GPF        1
/* 696F8 80078EF8 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 696FC 80078EFC 00500148 */  mfc2       $at, $10 # handwritten instruction
/* 69700 80078F00 00580648 */  mfc2       $a2, $11 # handwritten instruction
/* 69704 80078F04 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 69708 80078F08 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 6970C 80078F0C 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 69710 80078F10 2270C401 */  sub        $t6, $t6, $a0 # handwritten instruction
/* 69714 80078F14 00000000 */  nop
/* 69718 80078F18 3D00984B */  GPF        1
/* 6971C 80078F1C 2278E101 */  sub        $t7, $t7, $at # handwritten instruction
/* 69720 80078F20 22C00603 */  sub        $t8, $t8, $a2 # handwritten instruction
/* 69724 80078F24 00C41800 */  sll        $t8, $t8, 16
/* 69728 80078F28 FFFFEF31 */  andi       $t7, $t7, 0xFFFF
/* 6972C 80078F2C 2578F801 */  or         $t7, $t7, $t8
/* 69730 80078F30 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 69734 80078F34 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 69738 80078F38 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 6973C 80078F3C 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 69740 80078F40 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 69744 80078F44 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 69748 80078F48 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 6974C 80078F4C 00000000 */  nop
/* 69750 80078F50 00000000 */  nop
/* 69754 80078F54 3D00984B */  GPF        1
/* 69758 80078F58 0600AEA4 */  sh         $t6, 0x6($a1)
/* 6975C 80078F5C 0800AFAC */  sw         $t7, 0x8($a1)
/* 69760 80078F60 00480B48 */  mfc2       $t3, $9 # handwritten instruction
/* 69764 80078F64 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* 69768 80078F68 00580D48 */  mfc2       $t5, $11 # handwritten instruction
/* 6976C 80078F6C 20400B01 */  add        $t0, $t0, $t3 # handwritten instruction
/* 69770 80078F70 20482C01 */  add        $t1, $t1, $t4 # handwritten instruction
/* 69774 80078F74 20504D01 */  add        $t2, $t2, $t5 # handwritten instruction
/* 69778 80078F78 004C0900 */  sll        $t1, $t1, 16
/* 6977C 80078F7C FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* 69780 80078F80 25400901 */  or         $t0, $t0, $t1
/* 69784 80078F84 0C00A8AC */  sw         $t0, 0xC($a1)
/* 69788 80078F88 1000AAA4 */  sh         $t2, 0x10($a1)
/* 6978C 80078F8C 0800E003 */  jr         $ra
/* 69790 80078F90 00000000 */   nop
.size RotMatrixX, . - RotMatrixX
