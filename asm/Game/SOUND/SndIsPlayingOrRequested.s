.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndIsPlayingOrRequested
/* 30FF8 800407F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30FFC 800407FC 1000BFAF */  sw         $ra, 0x10($sp)
/* 31000 80040800 0E5C010C */  jal        aadIsSfxPlayingOrRequested
/* 31004 80040804 00000000 */   nop
/* 31008 80040808 1000BF8F */  lw         $ra, 0x10($sp)
/* 3100C 8004080C 00000000 */  nop
/* 31010 80040810 0800E003 */  jr         $ra
/* 31014 80040814 1800BD27 */   addiu     $sp, $sp, 0x18
.size SndIsPlayingOrRequested, . - SndIsPlayingOrRequested
