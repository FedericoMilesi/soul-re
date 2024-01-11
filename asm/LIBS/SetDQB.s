.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetDQB
/* B2B88 800C2388 00E0C448 */  ctc2       $a0, $28 # handwritten instruction
/* B2B8C 800C238C 0800E003 */  jr         $ra
/* B2B90 800C2390 00000000 */   nop
.size SetDQB, . - SetDQB
