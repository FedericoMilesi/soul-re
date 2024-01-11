.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndTypeIsPlayingOrRequested
/* 31018 80040818 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3101C 8004081C 1000BFAF */  sw         $ra, 0x10($sp)
/* 31020 80040820 595C010C */  jal        aadIsSfxTypePlayingOrRequested
/* 31024 80040824 00000000 */   nop
/* 31028 80040828 1000BF8F */  lw         $ra, 0x10($sp)
/* 3102C 8004082C 00000000 */  nop
/* 31030 80040830 0800E003 */  jr         $ra
/* 31034 80040834 1800BD27 */   addiu     $sp, $sp, 0x18
.size SndTypeIsPlayingOrRequested, . - SndTypeIsPlayingOrRequested
