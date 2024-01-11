.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_HideEntry
/* 7B730 8008AF30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7B734 8008AF34 1000BFAF */  sw         $ra, 0x10($sp)
/* 7B738 8008AF38 3403020C */  jal        MON_PlayRandomIdle
/* 7B73C 8008AF3C 01000524 */   addiu     $a1, $zero, 0x1
/* 7B740 8008AF40 1000BF8F */  lw         $ra, 0x10($sp)
/* 7B744 8008AF44 00000000 */  nop
/* 7B748 8008AF48 0800E003 */  jr         $ra
/* 7B74C 8008AF4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_HideEntry, . - MON_HideEntry
