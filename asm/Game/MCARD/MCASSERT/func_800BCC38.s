.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BCC38
/* AD438 800BCC38 0000888C */  lw         $t0, 0x0($a0)
/* AD43C 800BCC3C 0400898C */  lw         $t1, 0x4($a0)
/* AD440 800BCC40 08008A8C */  lw         $t2, 0x8($a0)
/* AD444 800BCC44 0C008B8C */  lw         $t3, 0xC($a0)
/* AD448 800BCC48 10008C8C */  lw         $t4, 0x10($a0)
/* AD44C 800BCC4C 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* AD450 800BCC50 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* AD454 800BCC54 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* AD458 800BCC58 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* AD45C 800BCC5C 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* AD460 800BCC60 0000A0C8 */  lwc2       $0, 0x0($a1)
/* AD464 800BCC64 0400A1C8 */  lwc2       $1, 0x4($a1)
/* AD468 800BCC68 00000000 */  nop
/* AD46C 800BCC6C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* AD470 800BCC70 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* AD474 800BCC74 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* AD478 800BCC78 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* AD47C 800BCC7C 0000C8A4 */  sh         $t0, 0x0($a2)
/* AD480 800BCC80 0200C9A4 */  sh         $t1, 0x2($a2)
/* AD484 800BCC84 0400CAA4 */  sh         $t2, 0x4($a2)
/* AD488 800BCC88 2110C000 */  addu       $v0, $a2, $zero
/* AD48C 800BCC8C 0800E003 */  jr         $ra
/* AD490 800BCC90 00000000 */   nop
/* AD494 800BCC94 00000000 */  nop
.size func_800BCC38, . - func_800BCC38
