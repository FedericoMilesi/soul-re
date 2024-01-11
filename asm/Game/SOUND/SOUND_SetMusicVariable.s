.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SetMusicVariable
/* 30D9C 8004059C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30DA0 800405A0 1000BFAF */  sw         $ra, 0x10($sp)
/* 30DA4 800405A4 2153010C */  jal        aadSetUserVariable
/* 30DA8 800405A8 00000000 */   nop
/* 30DAC 800405AC 1000BF8F */  lw         $ra, 0x10($sp)
/* 30DB0 800405B0 00000000 */  nop
/* 30DB4 800405B4 0800E003 */  jr         $ra
/* 30DB8 800405B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_SetMusicVariable, . - SOUND_SetMusicVariable
