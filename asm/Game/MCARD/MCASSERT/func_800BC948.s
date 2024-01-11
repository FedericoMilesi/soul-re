.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BC948
/* AD148 800BC948 0000888C */  lw         $t0, 0x0($a0)
/* AD14C 800BC94C 0400898C */  lw         $t1, 0x4($a0)
/* AD150 800BC950 08008A8C */  lw         $t2, 0x8($a0)
/* AD154 800BC954 0C008B8C */  lw         $t3, 0xC($a0)
/* AD158 800BC958 10008C8C */  lw         $t4, 0x10($a0)
/* AD15C 800BC95C 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* AD160 800BC960 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* AD164 800BC964 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* AD168 800BC968 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* AD16C 800BC96C 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* AD170 800BC970 0800E003 */  jr         $ra
/* AD174 800BC974 00000000 */   nop
.size func_800BC948, . - func_800BC948
