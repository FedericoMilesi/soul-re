.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SetMusicVolume
/* 30DBC 800405BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30DC0 800405C0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 30DC4 800405C4 02008214 */  bne        $a0, $v0, .L800405D0
/* 30DC8 800405C8 1000BFAF */   sw        $ra, 0x10($sp)
/* 30DCC 800405CC 7CBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1B4)($gp)
.L800405D0:
/* 30DD0 800405D0 00000000 */  nop
/* 30DD4 800405D4 7CBF84AF */  sw         $a0, %gp_rel(gameTrackerX + 0x1B4)($gp)
/* 30DD8 800405D8 9947010C */  jal        aadSetMusicMasterVolume
/* 30DDC 800405DC 00000000 */   nop
/* 30DE0 800405E0 1000BF8F */  lw         $ra, 0x10($sp)
/* 30DE4 800405E4 00000000 */  nop
/* 30DE8 800405E8 0800E003 */  jr         $ra
/* 30DEC 800405EC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_SetMusicVolume, . - SOUND_SetMusicVolume
