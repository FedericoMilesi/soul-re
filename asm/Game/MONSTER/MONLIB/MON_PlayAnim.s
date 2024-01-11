.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PlayAnim
/* 706D8 8007FED8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 706DC 8007FEDC 1000BFAF */  sw         $ra, 0x10($sp)
/* 706E0 8007FEE0 6C01828C */  lw         $v0, 0x16C($a0)
/* 706E4 8007FEE4 2138C000 */  addu       $a3, $a2, $zero
/* 706E8 8007FEE8 6801428C */  lw         $v0, 0x168($v0)
/* 706EC 8007FEEC 2130A000 */  addu       $a2, $a1, $zero
/* 706F0 8007FEF0 0000458C */  lw         $a1, 0x0($v0)
/* 706F4 8007FEF4 6FFF010C */  jal        MON_PlayAnimFromList
/* 706F8 8007FEF8 00000000 */   nop
/* 706FC 8007FEFC 1000BF8F */  lw         $ra, 0x10($sp)
/* 70700 8007FF00 00000000 */  nop
/* 70704 8007FF04 0800E003 */  jr         $ra
/* 70708 8007FF08 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_PlayAnim, . - MON_PlayAnim
