.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel MulMatrix2
/* AFC54 800BF454 0000888C */  lw         $t0, 0x0($a0)
/* AFC58 800BF458 0400898C */  lw         $t1, 0x4($a0)
/* AFC5C 800BF45C 08008A8C */  lw         $t2, 0x8($a0)
/* AFC60 800BF460 0C008B8C */  lw         $t3, 0xC($a0)
/* AFC64 800BF464 10008C8C */  lw         $t4, 0x10($a0)
/* AFC68 800BF468 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* AFC6C 800BF46C 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* AFC70 800BF470 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* AFC74 800BF474 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* AFC78 800BF478 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* AFC7C 800BF47C 0000A894 */  lhu        $t0, 0x0($a1)
/* AFC80 800BF480 0400A98C */  lw         $t1, 0x4($a1)
/* AFC84 800BF484 0C00AA8C */  lw         $t2, 0xC($a1)
/* AFC88 800BF488 FFFF013C */  lui        $at, (0xFFFF0000 >> 16)
/* AFC8C 800BF48C 24482101 */  and        $t1, $t1, $at
/* AFC90 800BF490 25400901 */  or         $t0, $t0, $t1
/* AFC94 800BF494 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AFC98 800BF498 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AFC9C 800BF49C 00000000 */  nop
/* AFCA0 800BF4A0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AFCA4 800BF4A4 0200A894 */  lhu        $t0, 0x2($a1)
/* AFCA8 800BF4A8 0800A98C */  lw         $t1, 0x8($a1)
/* AFCAC 800BF4AC 0E00AA84 */  lh         $t2, 0xE($a1)
/* AFCB0 800BF4B0 004C0900 */  sll        $t1, $t1, 16
/* AFCB4 800BF4B4 25400901 */  or         $t0, $t0, $t1
/* AFCB8 800BF4B8 00480B48 */  mfc2       $t3, $9 # handwritten instruction
/* AFCBC 800BF4BC 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* AFCC0 800BF4C0 00580D48 */  mfc2       $t5, $11 # handwritten instruction
/* AFCC4 800BF4C4 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AFCC8 800BF4C8 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AFCCC 800BF4CC 00000000 */  nop
/* AFCD0 800BF4D0 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AFCD4 800BF4D4 0400A894 */  lhu        $t0, 0x4($a1)
/* AFCD8 800BF4D8 0800A98C */  lw         $t1, 0x8($a1)
/* AFCDC 800BF4DC 1000AA8C */  lw         $t2, 0x10($a1)
/* AFCE0 800BF4E0 FFFF013C */  lui        $at, (0xFFFF0000 >> 16)
/* AFCE4 800BF4E4 24482101 */  and        $t1, $t1, $at
/* AFCE8 800BF4E8 25400901 */  or         $t0, $t0, $t1
/* AFCEC 800BF4EC 00480E48 */  mfc2       $t6, $9 # handwritten instruction
/* AFCF0 800BF4F0 00500F48 */  mfc2       $t7, $10 # handwritten instruction
/* AFCF4 800BF4F4 00581848 */  mfc2       $t8, $11 # handwritten instruction
/* AFCF8 800BF4F8 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AFCFC 800BF4FC 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AFD00 800BF500 00000000 */  nop
/* AFD04 800BF504 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AFD08 800BF508 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* AFD0C 800BF50C 00740E00 */  sll        $t6, $t6, 16
/* AFD10 800BF510 2570CB01 */  or         $t6, $t6, $t3
/* AFD14 800BF514 0000AEAC */  sw         $t6, 0x0($a1)
/* AFD18 800BF518 FFFFAD31 */  andi       $t5, $t5, 0xFFFF
/* AFD1C 800BF51C 00C41800 */  sll        $t8, $t8, 16
/* AFD20 800BF520 25C00D03 */  or         $t8, $t8, $t5
/* AFD24 800BF524 0C00B8AC */  sw         $t8, 0xC($a1)
/* AFD28 800BF528 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* AFD2C 800BF52C 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* AFD30 800BF530 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* AFD34 800BF534 00640C00 */  sll        $t4, $t4, 16
/* AFD38 800BF538 25400C01 */  or         $t0, $t0, $t4
/* AFD3C 800BF53C 0400A8AC */  sw         $t0, 0x4($a1)
/* AFD40 800BF540 FFFFEF31 */  andi       $t7, $t7, 0xFFFF
/* AFD44 800BF544 004C0900 */  sll        $t1, $t1, 16
/* AFD48 800BF548 25482F01 */  or         $t1, $t1, $t7
/* AFD4C 800BF54C 0800A9AC */  sw         $t1, 0x8($a1)
/* AFD50 800BF550 1000ABE8 */  swc2       $11, 0x10($a1)
/* AFD54 800BF554 2110A000 */  addu       $v0, $a1, $zero
/* AFD58 800BF558 0800E003 */  jr         $ra
/* AFD5C 800BF55C 00000000 */   nop
/* AFD60 800BF560 00000000 */  nop
.size MulMatrix2, . - MulMatrix2
