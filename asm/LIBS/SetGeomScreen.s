.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetGeomScreen
/* AD428 800BCC28 00D0C448 */  ctc2       $a0, $26 # handwritten instruction
/* AD42C 800BCC2C 0800E003 */  jr         $ra
/* AD430 800BCC30 00000000 */   nop
/* AD434 800BCC34 00000000 */  nop
.size SetGeomScreen, . - SetGeomScreen
