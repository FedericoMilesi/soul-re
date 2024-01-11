.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetLightMatrix
/* AE67C 800BDE7C 0000888C */  lw         $t0, 0x0($a0)
/* AE680 800BDE80 0400898C */  lw         $t1, 0x4($a0)
/* AE684 800BDE84 08008A8C */  lw         $t2, 0x8($a0)
/* AE688 800BDE88 0C008B8C */  lw         $t3, 0xC($a0)
/* AE68C 800BDE8C 10008C8C */  lw         $t4, 0x10($a0)
/* AE690 800BDE90 0040C848 */  ctc2       $t0, $8 # handwritten instruction
/* AE694 800BDE94 0048C948 */  ctc2       $t1, $9 # handwritten instruction
/* AE698 800BDE98 0050CA48 */  ctc2       $t2, $10 # handwritten instruction
/* AE69C 800BDE9C 0058CB48 */  ctc2       $t3, $11 # handwritten instruction
/* AE6A0 800BDEA0 0060CC48 */  ctc2       $t4, $12 # handwritten instruction
/* AE6A4 800BDEA4 0800E003 */  jr         $ra
/* AE6A8 800BDEA8 00000000 */   nop
.size SetLightMatrix, . - SetLightMatrix
