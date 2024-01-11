.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PlayAnimFromList
/* 705BC 8007FDBC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 705C0 8007FDC0 2128A600 */  addu       $a1, $a1, $a2
/* 705C4 8007FDC4 1000BFAF */  sw         $ra, 0x10($sp)
/* 705C8 8007FDC8 0000A580 */  lb         $a1, 0x0($a1)
/* 705CC 8007FDCC 01FF010C */  jal        MON_PlayAnimID
/* 705D0 8007FDD0 2130E000 */   addu      $a2, $a3, $zero
/* 705D4 8007FDD4 1000BF8F */  lw         $ra, 0x10($sp)
/* 705D8 8007FDD8 00000000 */  nop
/* 705DC 8007FDDC 0800E003 */  jr         $ra
/* 705E0 8007FDE0 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_PlayAnimFromList, . - MON_PlayAnimFromList
