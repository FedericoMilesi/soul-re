.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetSlotStatus
/* 45298 80054A98 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4529C 80054A9C 80200400 */  sll        $a0, $a0, 2
/* 452A0 80054AA0 21104400 */  addu       $v0, $v0, $a0
/* 452A4 80054AA4 3400428C */  lw         $v0, 0x34($v0)
/* 452A8 80054AA8 00000000 */  nop
/* 452AC 80054AAC 40054294 */  lhu        $v0, 0x540($v0)
/* 452B0 80054AB0 0800E003 */  jr         $ra
/* 452B4 80054AB4 00000000 */   nop
.size aadGetSlotStatus, . - aadGetSlotStatus
