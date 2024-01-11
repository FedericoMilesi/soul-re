.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel SetTransMatrix
/* AD128 800BC928 1400888C */  lw         $t0, 0x14($a0)
/* AD12C 800BC92C 1800898C */  lw         $t1, 0x18($a0)
/* AD130 800BC930 1C008A8C */  lw         $t2, 0x1C($a0)
/* AD134 800BC934 0028C848 */  ctc2       $t0, $5 # handwritten instruction
/* AD138 800BC938 0030C948 */  ctc2       $t1, $6 # handwritten instruction
/* AD13C 800BC93C 0038CA48 */  ctc2       $t2, $7 # handwritten instruction
/* AD140 800BC940 0800E003 */  jr         $ra
/* AD144 800BC944 00000000 */   nop
.size SetTransMatrix, . - SetTransMatrix
