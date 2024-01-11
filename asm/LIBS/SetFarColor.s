.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetFarColor
/* ADAF0 800BD2F0 00210400 */  sll        $a0, $a0, 4
/* ADAF4 800BD2F4 00290500 */  sll        $a1, $a1, 4
/* ADAF8 800BD2F8 00310600 */  sll        $a2, $a2, 4
/* ADAFC 800BD2FC 00A8C448 */  ctc2       $a0, $21 # handwritten instruction
/* ADB00 800BD300 00B0C548 */  ctc2       $a1, $22 # handwritten instruction
/* ADB04 800BD304 00B8C648 */  ctc2       $a2, $23 # handwritten instruction
/* ADB08 800BD308 0800E003 */  jr         $ra
/* ADB0C 800BD30C 00000000 */   nop
.size SetFarColor, . - SetFarColor
