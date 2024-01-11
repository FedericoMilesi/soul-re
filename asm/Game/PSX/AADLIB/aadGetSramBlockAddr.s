.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetSramBlockAddr
/* 43E74 80053674 80008228 */  slti       $v0, $a0, 0x80
/* 43E78 80053678 03004014 */  bnez       $v0, .L80053688
/* 43E7C 8005367C C0180400 */   sll       $v1, $a0, 3
/* 43E80 80053680 0800E003 */  jr         $ra
/* 43E84 80053684 21100000 */   addu      $v0, $zero, $zero
.L80053688:
/* 43E88 80053688 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 43E8C 8005368C 00000000 */  nop
/* 43E90 80053690 21186200 */  addu       $v1, $v1, $v0
/* 43E94 80053694 F2176294 */  lhu        $v0, 0x17F2($v1)
/* 43E98 80053698 0800E003 */  jr         $ra
/* 43E9C 8005369C C0100200 */   sll       $v0, $v0, 3
.size aadGetSramBlockAddr, . - aadGetSramBlockAddr
