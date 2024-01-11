.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetDQA
/* B2B7C 800C237C 00D8C448 */  ctc2       $a0, $27 # handwritten instruction
/* B2B80 800C2380 0800E003 */  jr         $ra
/* B2B84 800C2384 00000000 */   nop
.size SetDQA, . - SetDQA
