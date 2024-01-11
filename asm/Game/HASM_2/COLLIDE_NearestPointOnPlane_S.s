.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel COLLIDE_NearestPointOnPlane_S
/* 68BCC 800783CC 0000EB8C */  lw         $t3, 0x0($a3)
/* 68BD0 800783D0 0400ED84 */  lh         $t5, 0x4($a3)
/* 68BD4 800783D4 0000A88C */  lw         $t0, 0x0($a1)
/* 68BD8 800783D8 0400AA84 */  lh         $t2, 0x4($a1)
/* 68BDC 800783DC 0000CB48 */  ctc2       $t3, $0 # handwritten instruction
/* 68BE0 800783E0 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 68BE4 800783E4 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* 68BE8 800783E8 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* 68BEC 800783EC 034C0800 */  sra        $t1, $t0, 16
/* 68BF0 800783F0 00000000 */  nop
/* 68BF4 800783F4 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 68BF8 800783F8 00440800 */  sll        $t0, $t0, 16
/* 68BFC 800783FC 03440800 */  sra        $t0, $t0, 16
/* 68C00 80078400 00C80C48 */  mfc2       $t4, $25 # handwritten instruction
/* 68C04 80078404 00000000 */  nop
/* 68C08 80078408 2260CC00 */  sub        $t4, $a2, $t4 # handwritten instruction
/* 68C0C 8007840C 00408C48 */  mtc2       $t4, $8 # handwritten instruction
/* 68C10 80078410 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 68C14 80078414 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 68C18 80078418 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 68C1C 8007841C 03640B00 */  sra        $t4, $t3, 16
/* 68C20 80078420 00000000 */  nop
/* 68C24 80078424 3D00984B */  GPF        1
/* 68C28 80078428 005C0B00 */  sll        $t3, $t3, 16
/* 68C2C 8007842C 035C0B00 */  sra        $t3, $t3, 16
/* 68C30 80078430 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 68C34 80078434 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 68C38 80078438 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 68C3C 8007843C 20400B01 */  add        $t0, $t0, $t3 # handwritten instruction
/* 68C40 80078440 20482C01 */  add        $t1, $t1, $t4 # handwritten instruction
/* 68C44 80078444 20504D01 */  add        $t2, $t2, $t5 # handwritten instruction
/* 68C48 80078448 000088A4 */  sh         $t0, 0x0($a0)
/* 68C4C 8007844C 020089A4 */  sh         $t1, 0x2($a0)
/* 68C50 80078450 0800E003 */  jr         $ra
/* 68C54 80078454 04008AA4 */   sh        $t2, 0x4($a0)
.size COLLIDE_NearestPointOnPlane_S, . - COLLIDE_NearestPointOnPlane_S
