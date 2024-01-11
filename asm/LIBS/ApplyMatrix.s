.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel ApplyMatrix
/* AD068 800BC868 0000888C */  lw         $t0, 0x0($a0)
/* AD06C 800BC86C 0400898C */  lw         $t1, 0x4($a0)
/* AD070 800BC870 08008A8C */  lw         $t2, 0x8($a0)
/* AD074 800BC874 0C008B8C */  lw         $t3, 0xC($a0)
/* AD078 800BC878 10008C8C */  lw         $t4, 0x10($a0)
/* AD07C 800BC87C 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* AD080 800BC880 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* AD084 800BC884 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* AD088 800BC888 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* AD08C 800BC88C 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* AD090 800BC890 0000A0C8 */  lwc2       $0, 0x0($a1)
/* AD094 800BC894 0400A1C8 */  lwc2       $1, 0x4($a1)
/* AD098 800BC898 00000000 */  nop
/* AD09C 800BC89C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AD0A0 800BC8A0 0000D9E8 */  swc2       $25, 0x0($a2)
/* AD0A4 800BC8A4 0400DAE8 */  swc2       $26, 0x4($a2) # handwritten instruction
/* AD0A8 800BC8A8 0800DBE8 */  swc2       $27, 0x8($a2) # handwritten instruction
/* AD0AC 800BC8AC 2110C000 */  addu       $v0, $a2, $zero
/* AD0B0 800BC8B0 0800E003 */  jr         $ra
/* AD0B4 800BC8B4 00000000 */   nop
.size ApplyMatrix, . - ApplyMatrix
