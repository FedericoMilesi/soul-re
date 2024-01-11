.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel MATH3D_SquareLength
/* 2AF9C 8003A79C 21108000 */  addu       $v0, $a0, $zero
/* 2AFA0 8003A7A0 00488248 */  mtc2       $v0, $9 # handwritten instruction
/* 2AFA4 8003A7A4 00508548 */  mtc2       $a1, $10 # handwritten instruction
/* 2AFA8 8003A7A8 00588648 */  mtc2       $a2, $11 # handwritten instruction
/* 2AFAC 8003A7AC 00000000 */  nop
/* 2AFB0 8003A7B0 2804A04A */  SQR        0
/* 2AFB4 8003A7B4 00C80248 */  mfc2       $v0, $25 # handwritten instruction
/* 2AFB8 8003A7B8 00D00548 */  mfc2       $a1, $26 # handwritten instruction
/* 2AFBC 8003A7BC 00D80648 */  mfc2       $a2, $27 # handwritten instruction
/* 2AFC0 8003A7C0 20104500 */  add        $v0, $v0, $a1 # handwritten instruction
/* 2AFC4 8003A7C4 20104600 */  add        $v0, $v0, $a2 # handwritten instruction
/* 2AFC8 8003A7C8 0800E003 */  jr         $ra
/* 2AFCC 8003A7CC 00000000 */   nop
.size MATH3D_SquareLength, . - MATH3D_SquareLength
