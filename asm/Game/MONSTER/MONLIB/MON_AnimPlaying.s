.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_AnimPlaying
/* 7070C 8007FF0C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 70710 8007FF10 1000BFAF */  sw         $ra, 0x10($sp)
/* 70714 8007FF14 6C01828C */  lw         $v0, 0x16C($a0)
/* 70718 8007FF18 00000000 */  nop
/* 7071C 8007FF1C 6801428C */  lw         $v0, 0x168($v0)
/* 70720 8007FF20 2130A000 */  addu       $a2, $a1, $zero
/* 70724 8007FF24 0000458C */  lw         $a1, 0x0($v0)
/* 70728 8007FF28 96FF010C */  jal        MON_AnimPlayingFromList
/* 7072C 8007FF2C 00000000 */   nop
/* 70730 8007FF30 1000BF8F */  lw         $ra, 0x10($sp)
/* 70734 8007FF34 00000000 */  nop
/* 70738 8007FF38 0800E003 */  jr         $ra
/* 7073C 8007FF3C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_AnimPlaying, . - MON_AnimPlaying
