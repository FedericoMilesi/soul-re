.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel ApplyMatrix_S
/* 69A08 80079208 0000888C */  lw         $t0, 0x0($a0)
/* 69A0C 8007920C 0400898C */  lw         $t1, 0x4($a0)
/* 69A10 80079210 08008A8C */  lw         $t2, 0x8($a0)
/* 69A14 80079214 0C008B8C */  lw         $t3, 0xC($a0)
/* 69A18 80079218 10008C94 */  lhu        $t4, 0x10($a0)
/* 69A1C 8007921C 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* 69A20 80079220 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* 69A24 80079224 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* 69A28 80079228 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* 69A2C 8007922C 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* 69A30 80079230 0000A0C8 */  lwc2       $0, 0x0($a1)
/* 69A34 80079234 0400A1C8 */  lwc2       $1, 0x4($a1)
/* 69A38 80079238 00000000 */  nop
/* 69A3C 8007923C 00000000 */  nop
/* 69A40 80079240 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 69A44 80079244 2110C000 */  addu       $v0, $a2, $zero
/* 69A48 80079248 0000D9E8 */  swc2       $25, 0x0($a2)
/* 69A4C 8007924C 0400DAE8 */  swc2       $26, 0x4($a2) # handwritten instruction
/* 69A50 80079250 0800E003 */  jr         $ra
/* 69A54 80079254 0800DBE8 */   swc2      $27, 0x8($a2) # handwritten instruction
.size ApplyMatrix_S, . - ApplyMatrix_S
