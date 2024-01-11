.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_AnimPlayingFromList
/* 70658 8007FE58 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7065C 8007FE5C 2128A600 */  addu       $a1, $a1, $a2
/* 70660 8007FE60 1000BFAF */  sw         $ra, 0x10($sp)
/* 70664 8007FE64 0000A580 */  lb         $a1, 0x0($a1)
/* 70668 8007FE68 79FF010C */  jal        MON_AnimIDPlaying
/* 7066C 8007FE6C 00000000 */   nop
/* 70670 8007FE70 1000BF8F */  lw         $ra, 0x10($sp)
/* 70674 8007FE74 00000000 */  nop
/* 70678 8007FE78 0800E003 */  jr         $ra
/* 7067C 8007FE7C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_AnimPlayingFromList, . - MON_AnimPlayingFromList
