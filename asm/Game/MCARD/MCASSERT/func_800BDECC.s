.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BDECC
/* AE6CC 800BDECC 0000888C */  lw         $t0, 0x0($a0)
/* AE6D0 800BDED0 0400898C */  lw         $t1, 0x4($a0)
/* AE6D4 800BDED4 08008A8C */  lw         $t2, 0x8($a0)
/* AE6D8 800BDED8 0C008B8C */  lw         $t3, 0xC($a0)
/* AE6DC 800BDEDC 10008C8C */  lw         $t4, 0x10($a0)
/* AE6E0 800BDEE0 0080C848 */  ctc2       $t0, $16 # handwritten instruction
/* AE6E4 800BDEE4 0088C948 */  ctc2       $t1, $17 # handwritten instruction
/* AE6E8 800BDEE8 0090CA48 */  ctc2       $t2, $18 # handwritten instruction
/* AE6EC 800BDEEC 0098CB48 */  ctc2       $t3, $19 # handwritten instruction
/* AE6F0 800BDEF0 00A0CC48 */  ctc2       $t4, $20 # handwritten instruction
/* AE6F4 800BDEF4 0800E003 */  jr         $ra
/* AE6F8 800BDEF8 00000000 */   nop
.size func_800BDECC, . - func_800BDECC
