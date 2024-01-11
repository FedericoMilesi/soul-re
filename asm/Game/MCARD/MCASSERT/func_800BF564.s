.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BF564
/* AFD64 800BF564 0000888C */  lw         $t0, 0x0($a0)
/* AFD68 800BF568 0400898C */  lw         $t1, 0x4($a0)
/* AFD6C 800BF56C 08008A8C */  lw         $t2, 0x8($a0)
/* AFD70 800BF570 0C008B8C */  lw         $t3, 0xC($a0)
/* AFD74 800BF574 10008C8C */  lw         $t4, 0x10($a0)
/* AFD78 800BF578 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* AFD7C 800BF57C 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* AFD80 800BF580 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* AFD84 800BF584 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* AFD88 800BF588 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* AFD8C 800BF58C 0000A894 */  lhu        $t0, 0x0($a1)
/* AFD90 800BF590 0400A98C */  lw         $t1, 0x4($a1)
/* AFD94 800BF594 0C00AA8C */  lw         $t2, 0xC($a1)
/* AFD98 800BF598 FFFF013C */  lui        $at, (0xFFFF0000 >> 16)
/* AFD9C 800BF59C 24482101 */  and        $t1, $t1, $at
/* AFDA0 800BF5A0 25400901 */  or         $t0, $t0, $t1
/* AFDA4 800BF5A4 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AFDA8 800BF5A8 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AFDAC 800BF5AC 00000000 */  nop
/* AFDB0 800BF5B0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AFDB4 800BF5B4 0200A894 */  lhu        $t0, 0x2($a1)
/* AFDB8 800BF5B8 0800A98C */  lw         $t1, 0x8($a1)
/* AFDBC 800BF5BC 0E00AA84 */  lh         $t2, 0xE($a1)
/* AFDC0 800BF5C0 004C0900 */  sll        $t1, $t1, 16
/* AFDC4 800BF5C4 25400901 */  or         $t0, $t0, $t1
/* AFDC8 800BF5C8 00480B48 */  mfc2       $t3, $9 # handwritten instruction
/* AFDCC 800BF5CC 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* AFDD0 800BF5D0 00580D48 */  mfc2       $t5, $11 # handwritten instruction
/* AFDD4 800BF5D4 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AFDD8 800BF5D8 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AFDDC 800BF5DC 00000000 */  nop
/* AFDE0 800BF5E0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AFDE4 800BF5E4 0400A894 */  lhu        $t0, 0x4($a1)
/* AFDE8 800BF5E8 0800A98C */  lw         $t1, 0x8($a1)
/* AFDEC 800BF5EC 1000AA8C */  lw         $t2, 0x10($a1)
/* AFDF0 800BF5F0 FFFF013C */  lui        $at, (0xFFFF0000 >> 16)
/* AFDF4 800BF5F4 24482101 */  and        $t1, $t1, $at
/* AFDF8 800BF5F8 25400901 */  or         $t0, $t0, $t1
/* AFDFC 800BF5FC 00480E48 */  mfc2       $t6, $9 # handwritten instruction
/* AFE00 800BF600 00500F48 */  mfc2       $t7, $10 # handwritten instruction
/* AFE04 800BF604 00581848 */  mfc2       $t8, $11 # handwritten instruction
/* AFE08 800BF608 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AFE0C 800BF60C 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AFE10 800BF610 00000000 */  nop
/* AFE14 800BF614 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AFE18 800BF618 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* AFE1C 800BF61C 00740E00 */  sll        $t6, $t6, 16
/* AFE20 800BF620 2570CB01 */  or         $t6, $t6, $t3
/* AFE24 800BF624 0000CEAC */  sw         $t6, 0x0($a2)
/* AFE28 800BF628 FFFFAD31 */  andi       $t5, $t5, 0xFFFF
/* AFE2C 800BF62C 00C41800 */  sll        $t8, $t8, 16
/* AFE30 800BF630 25C00D03 */  or         $t8, $t8, $t5
/* AFE34 800BF634 0C00D8AC */  sw         $t8, 0xC($a2)
/* AFE38 800BF638 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* AFE3C 800BF63C 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* AFE40 800BF640 1000CBE8 */  swc2       $11, 0x10($a2)
/* AFE44 800BF644 1400AD94 */  lhu        $t5, 0x14($a1)
/* AFE48 800BF648 1800AE8C */  lw         $t6, 0x18($a1)
/* AFE4C 800BF64C 1C00AA8C */  lw         $t2, 0x1C($a1)
/* AFE50 800BF650 00740E00 */  sll        $t6, $t6, 16
/* AFE54 800BF654 2568AE01 */  or         $t5, $t5, $t6
/* AFE58 800BF658 00008D48 */  mtc2       $t5, $0 # handwritten instruction
/* AFE5C 800BF65C 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AFE60 800BF660 00000000 */  nop
/* AFE64 800BF664 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AFE68 800BF668 00640C00 */  sll        $t4, $t4, 16
/* AFE6C 800BF66C FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* AFE70 800BF670 25400C01 */  or         $t0, $t0, $t4
/* AFE74 800BF674 0400C8AC */  sw         $t0, 0x4($a2)
/* AFE78 800BF678 FFFFEF31 */  andi       $t7, $t7, 0xFFFF
/* AFE7C 800BF67C 004C0900 */  sll        $t1, $t1, 16
/* AFE80 800BF680 25482F01 */  or         $t1, $t1, $t7
/* AFE84 800BF684 0800C9AC */  sw         $t1, 0x8($a2)
/* AFE88 800BF688 00C80848 */  mfc2       $t0, $25 # handwritten instruction
/* AFE8C 800BF68C 00D00948 */  mfc2       $t1, $26 # handwritten instruction
/* AFE90 800BF690 00D80A48 */  mfc2       $t2, $27 # handwritten instruction
/* AFE94 800BF694 14008B8C */  lw         $t3, 0x14($a0)
/* AFE98 800BF698 18008C8C */  lw         $t4, 0x18($a0)
/* AFE9C 800BF69C 1C008D8C */  lw         $t5, 0x1C($a0)
/* AFEA0 800BF6A0 20400B01 */  add        $t0, $t0, $t3 # handwritten instruction
/* AFEA4 800BF6A4 20482C01 */  add        $t1, $t1, $t4 # handwritten instruction
/* AFEA8 800BF6A8 20504D01 */  add        $t2, $t2, $t5 # handwritten instruction
/* AFEAC 800BF6AC 1400C8AC */  sw         $t0, 0x14($a2)
/* AFEB0 800BF6B0 1800C9AC */  sw         $t1, 0x18($a2)
/* AFEB4 800BF6B4 1C00CAAC */  sw         $t2, 0x1C($a2)
/* AFEB8 800BF6B8 2110C000 */  addu       $v0, $a2, $zero
/* AFEBC 800BF6BC 0800E003 */  jr         $ra
/* AFEC0 800BF6C0 00000000 */   nop
.size func_800BF564, . - func_800BF564
