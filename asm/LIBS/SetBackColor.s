.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetBackColor
/* AE6AC 800BDEAC 00210400 */  sll        $a0, $a0, 4
/* AE6B0 800BDEB0 00290500 */  sll        $a1, $a1, 4
/* AE6B4 800BDEB4 00310600 */  sll        $a2, $a2, 4
/* AE6B8 800BDEB8 0068C448 */  ctc2       $a0, $13 # handwritten instruction
/* AE6BC 800BDEBC 0070C548 */  ctc2       $a1, $14 # handwritten instruction
/* AE6C0 800BDEC0 0078C648 */  ctc2       $a2, $15 # handwritten instruction
/* AE6C4 800BDEC4 0800E003 */  jr         $ra
/* AE6C8 800BDEC8 00000000 */   nop
.size SetBackColor, . - SetBackColor
