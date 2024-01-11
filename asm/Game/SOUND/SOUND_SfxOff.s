.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SfxOff
/* 30FB0 800407B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30FB4 800407B4 1000BFAF */  sw         $ra, 0x10($sp)
/* 30FB8 800407B8 E65B010C */  jal        aadStopAllSfx
/* 30FBC 800407BC 00000000 */   nop
/* 30FC0 800407C0 1000BF8F */  lw         $ra, 0x10($sp)
/* 30FC4 800407C4 00000000 */  nop
/* 30FC8 800407C8 0800E003 */  jr         $ra
/* 30FCC 800407CC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_SfxOff, . - SOUND_SfxOff
