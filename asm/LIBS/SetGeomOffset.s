.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetGeomOffset
/* AFAA4 800BF2A4 00240400 */  sll        $a0, $a0, 16
/* AFAA8 800BF2A8 002C0500 */  sll        $a1, $a1, 16
/* AFAAC 800BF2AC 00C0C448 */  ctc2       $a0, $24 # handwritten instruction
/* AFAB0 800BF2B0 00C8C548 */  ctc2       $a1, $25 # handwritten instruction
/* AFAB4 800BF2B4 0800E003 */  jr         $ra
/* AFAB8 800BF2B8 00000000 */   nop
/* AFABC 800BF2BC 00000000 */  nop
/* AFAC0 800BF2C0 00000000 */  nop
.size SetGeomOffset, . - SetGeomOffset
