.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BDEFC
/* AE6FC 800BDEFC 0000888C */  lw         $t0, 0x0($a0)
/* AE700 800BDF00 0400898C */  lw         $t1, 0x4($a0)
/* AE704 800BDF04 08008A8C */  lw         $t2, 0x8($a0)
/* AE708 800BDF08 0C008B8C */  lw         $t3, 0xC($a0)
/* AE70C 800BDF0C 10008C8C */  lw         $t4, 0x10($a0)
/* AE710 800BDF10 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* AE714 800BDF14 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* AE718 800BDF18 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* AE71C 800BDF1C 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* AE720 800BDF20 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* AE724 800BDF24 0000A894 */  lhu        $t0, 0x0($a1)
/* AE728 800BDF28 0400A98C */  lw         $t1, 0x4($a1)
/* AE72C 800BDF2C 0C00AA8C */  lw         $t2, 0xC($a1)
/* AE730 800BDF30 FFFF013C */  lui        $at, (0xFFFF0000 >> 16)
/* AE734 800BDF34 24482101 */  and        $t1, $t1, $at
/* AE738 800BDF38 25400901 */  or         $t0, $t0, $t1
/* AE73C 800BDF3C 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AE740 800BDF40 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AE744 800BDF44 00000000 */  nop
/* AE748 800BDF48 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AE74C 800BDF4C 0200A894 */  lhu        $t0, 0x2($a1)
/* AE750 800BDF50 0800A98C */  lw         $t1, 0x8($a1)
/* AE754 800BDF54 0E00AA84 */  lh         $t2, 0xE($a1)
/* AE758 800BDF58 004C0900 */  sll        $t1, $t1, 16
/* AE75C 800BDF5C 25400901 */  or         $t0, $t0, $t1
/* AE760 800BDF60 00480B48 */  mfc2       $t3, $9 # handwritten instruction
/* AE764 800BDF64 00500C48 */  mfc2       $t4, $10 # handwritten instruction
/* AE768 800BDF68 00580D48 */  mfc2       $t5, $11 # handwritten instruction
/* AE76C 800BDF6C 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AE770 800BDF70 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AE774 800BDF74 00000000 */  nop
/* AE778 800BDF78 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AE77C 800BDF7C 0400A894 */  lhu        $t0, 0x4($a1)
/* AE780 800BDF80 0800A98C */  lw         $t1, 0x8($a1)
/* AE784 800BDF84 1000AA8C */  lw         $t2, 0x10($a1)
/* AE788 800BDF88 FFFF013C */  lui        $at, (0xFFFF0000 >> 16)
/* AE78C 800BDF8C 24482101 */  and        $t1, $t1, $at
/* AE790 800BDF90 25400901 */  or         $t0, $t0, $t1
/* AE794 800BDF94 00480E48 */  mfc2       $t6, $9 # handwritten instruction
/* AE798 800BDF98 00500F48 */  mfc2       $t7, $10 # handwritten instruction
/* AE79C 800BDF9C 00581848 */  mfc2       $t8, $11 # handwritten instruction
/* AE7A0 800BDFA0 00008848 */  mtc2       $t0, $0 # handwritten instruction
/* AE7A4 800BDFA4 00088A48 */  mtc2       $t2, $1 # handwritten instruction
/* AE7A8 800BDFA8 00000000 */  nop
/* AE7AC 800BDFAC 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AE7B0 800BDFB0 FFFF6B31 */  andi       $t3, $t3, 0xFFFF
/* AE7B4 800BDFB4 00740E00 */  sll        $t6, $t6, 16
/* AE7B8 800BDFB8 2570CB01 */  or         $t6, $t6, $t3
/* AE7BC 800BDFBC 0000CEAC */  sw         $t6, 0x0($a2)
/* AE7C0 800BDFC0 FFFFAD31 */  andi       $t5, $t5, 0xFFFF
/* AE7C4 800BDFC4 00C41800 */  sll        $t8, $t8, 16
/* AE7C8 800BDFC8 25C00D03 */  or         $t8, $t8, $t5
/* AE7CC 800BDFCC 0C00D8AC */  sw         $t8, 0xC($a2)
/* AE7D0 800BDFD0 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* AE7D4 800BDFD4 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* AE7D8 800BDFD8 FFFF0831 */  andi       $t0, $t0, 0xFFFF
/* AE7DC 800BDFDC 00640C00 */  sll        $t4, $t4, 16
/* AE7E0 800BDFE0 25400C01 */  or         $t0, $t0, $t4
/* AE7E4 800BDFE4 0400C8AC */  sw         $t0, 0x4($a2)
/* AE7E8 800BDFE8 FFFFEF31 */  andi       $t7, $t7, 0xFFFF
/* AE7EC 800BDFEC 004C0900 */  sll        $t1, $t1, 16
/* AE7F0 800BDFF0 25482F01 */  or         $t1, $t1, $t7
/* AE7F4 800BDFF4 0800C9AC */  sw         $t1, 0x8($a2)
/* AE7F8 800BDFF8 1000CBE8 */  swc2       $11, 0x10($a2)
/* AE7FC 800BDFFC 2110C000 */  addu       $v0, $a2, $zero
/* AE800 800BE000 0800E003 */  jr         $ra
/* AE804 800BE004 00000000 */   nop
/* AE808 800BE008 00000000 */  nop
.size func_800BDEFC, . - func_800BDEFC
