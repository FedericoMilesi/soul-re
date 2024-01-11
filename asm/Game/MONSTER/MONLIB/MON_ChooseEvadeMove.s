.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ChooseEvadeMove
/* 7102C 8008082C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 71030 80080830 1000BFAF */  sw         $ra, 0x10($sp)
/* 71034 80080834 6C01828C */  lw         $v0, 0x16C($a0)
/* 71038 80080838 00000000 */  nop
/* 7103C 8008083C C400458C */  lw         $a1, 0xC4($v0)
/* 71040 80080840 E201020C */  jal        MON_ChooseLeftOrRight
/* 71044 80080844 00000000 */   nop
/* 71048 80080848 21184000 */  addu       $v1, $v0, $zero
/* 7104C 8008084C 07006014 */  bnez       $v1, .L8008086C
/* 71050 80080850 00000000 */   nop
/* 71054 80080854 3AF2020C */  jal        rand
/* 71058 80080858 00000000 */   nop
/* 7105C 8008085C 01004230 */  andi       $v0, $v0, 0x1
/* 71060 80080860 02004010 */  beqz       $v0, .L8008086C
/* 71064 80080864 FFFF0324 */   addiu     $v1, $zero, -0x1
/* 71068 80080868 01000324 */  addiu      $v1, $zero, 0x1
.L8008086C:
/* 7106C 8008086C 02006104 */  bgez       $v1, .L80080878
/* 71070 80080870 29000224 */   addiu     $v0, $zero, 0x29
/* 71074 80080874 28000224 */  addiu      $v0, $zero, 0x28
.L80080878:
/* 71078 80080878 1000BF8F */  lw         $ra, 0x10($sp)
/* 7107C 8008087C 00000000 */  nop
/* 71080 80080880 0800E003 */  jr         $ra
/* 71084 80080884 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_ChooseEvadeMove, . - MON_ChooseEvadeMove
