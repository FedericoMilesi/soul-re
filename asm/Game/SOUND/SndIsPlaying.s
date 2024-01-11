.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndIsPlaying
/* 30FD8 800407D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30FDC 800407DC 1000BFAF */  sw         $ra, 0x10($sp)
/* 30FE0 800407E0 F25B010C */  jal        aadIsSfxPlaying
/* 30FE4 800407E4 00000000 */   nop
/* 30FE8 800407E8 1000BF8F */  lw         $ra, 0x10($sp)
/* 30FEC 800407EC 00000000 */  nop
/* 30FF0 800407F0 0800E003 */  jr         $ra
/* 30FF4 800407F4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SndIsPlaying, . - SndIsPlaying
