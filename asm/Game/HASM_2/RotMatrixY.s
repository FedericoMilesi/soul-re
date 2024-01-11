.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel RotMatrixY
/* 69794 80078F94 FF078230 */  andi       $v0, $a0, 0x7FF
/* 69798 80078F98 40100200 */  sll        $v0, $v0, 1
/* 6979C 80078F9C 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 697A0 80078FA0 F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 697A4 80078FA4 20186200 */  add        $v1, $v1, $v0 # handwritten instruction
/* 697A8 80078FA8 00086284 */  lh         $v0, 0x800($v1)
/* 697AC 80078FAC 00006384 */  lh         $v1, 0x0($v1)
/* 697B0 80078FB0 00088430 */  andi       $a0, $a0, 0x800
/* 697B4 80078FB4 03008010 */  beqz       $a0, .L80078FC4
/* 697B8 80078FB8 00000000 */   nop
/* 697BC 80078FBC 22100200 */  sub        $v0, $zero, $v0 # handwritten instruction
/* 697C0 80078FC0 22180300 */  sub        $v1, $zero, $v1 # handwritten instruction
.L80078FC4:
/* 697C4 80078FC4 0400AA84 */  lh         $t2, 0x4($a1)
/* 697C8 80078FC8 0000A88C */  lw         $t0, 0x0($a1)
/* 697CC 80078FCC 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 697D0 80078FD0 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 697D4 80078FD4 034C0800 */  sra        $t1, $t0, 16
/* 697D8 80078FD8 00440800 */  sll        $t0, $t0, 16
/* 697DC 80078FDC 03440800 */  sra        $t0, $t0, 16
/* 697E0 80078FE0 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 697E4 80078FE4 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 697E8 80078FE8 0C00AB8C */  lw         $t3, 0xC($a1)
/* 697EC 80078FEC 00000000 */  nop
/* 697F0 80078FF0 3D00984B */  GPF        1
/* 697F4 80078FF4 1000AD84 */  lh         $t5, 0x10($a1)
/* 697F8 80078FF8 03640B00 */  sra        $t4, $t3, 16
/* 697FC 80078FFC 005C0B00 */  sll        $t3, $t3, 16
/* 69800 80079000 035C0B00 */  sra        $t3, $t3, 16
/* 69804 80079004 00480E48 */  mfc2       $t6, $9 # handwritten instruction
/* 69808 80079008 00500F48 */  mfc2       $t7, $10 # handwritten instruction
/* 6980C 8007900C 00581848 */  mfc2       $t8, $11 # handwritten instruction
/* 69810 80079010 00408348 */  mtc2       $v1, $8 # handwritten instruction
/* 69814 80079014 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 69818 80079018 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 6981C 8007901C 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 69820 80079020 00000000 */  nop
/* 69824 80079024 00000000 */  nop
/* 69828 80079028 3D00984B */  GPF        1
/* 6982C 8007902C 00480448 */  mfc2       $a0, $9 # handwritten instruction
/* 69830 80079030 00500148 */  mfc2       $at, $10 # handwritten instruction
/* 69834 80079034 00580648 */  mfc2       $a2, $11 # handwritten instruction
/* 69838 80079038 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 6983C 8007903C 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 69840 80079040 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 69844 80079044 2070C401 */  add        $t6, $t6, $a0 # handwritten instruction
/* 69848 80079048 00000000 */  nop
/* 6984C 8007904C 3D00984B */  GPF        1
/* 69850 80079050 2078E101 */  add        $t7, $t7, $at # handwritten instruction
/* 69854 80079054 20C00603 */  add        $t8, $t8, $a2 # handwritten instruction
/* 69858 80079058 007C0F00 */  sll        $t7, $t7, 16
/* 6985C 8007905C FFFFCE31 */  andi       $t6, $t6, 0xFFFF
/* 69860 80079060 2570CF01 */  or         $t6, $t6, $t7
/* 69864 80079064 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 69868 80079068 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 6986C 8007906C 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 69870 80079070 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 69874 80079074 00488B48 */  mtc2       $t3, $9 # handwritten instruction
/* 69878 80079078 00508C48 */  mtc2       $t4, $10 # handwritten instruction
/* 6987C 8007907C 00588D48 */  mtc2       $t5, $11 # handwritten instruction
/* 69880 80079080 00000000 */  nop
/* 69884 80079084 00000000 */  nop
/* 69888 80079088 3D00984B */  GPF        1
/* 6988C 8007908C 0000AEAC */  sw         $t6, 0x0($a1)
/* 69890 80079090 0400B8A4 */  sh         $t8, 0x4($a1)
/* 69894 80079094 00480B48 */  mfc2       $t3, $9 # handwritten instruction
/* 69898 80079098 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* 6989C 8007909C 00580D48 */  mfc2       $t5, $11 # handwritten instruction
/* 698A0 800790A0 22406801 */  sub        $t0, $t3, $t0 # handwritten instruction
/* 698A4 800790A4 22488901 */  sub        $t1, $t4, $t1 # handwritten instruction
/* 698A8 800790A8 2250AA01 */  sub        $t2, $t5, $t2 # handwritten instruction
/* 698AC 800790AC 004C0900 */  sll        $t1, $t1, 16
/* 698B0 800790B0 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* 698B4 800790B4 25400901 */  or         $t0, $t0, $t1
/* 698B8 800790B8 0C00A8AC */  sw         $t0, 0xC($a1)
/* 698BC 800790BC 1000AAA4 */  sh         $t2, 0x10($a1)
/* 698C0 800790C0 0800E003 */  jr         $ra
/* 698C4 800790C4 00000000 */   nop
.size RotMatrixY, . - RotMatrixY
