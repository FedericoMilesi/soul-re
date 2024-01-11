.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SetVoiceVolume
/* 30E24 80040624 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 30E28 80040628 02008214 */  bne        $a0, $v0, .L80040634
/* 30E2C 8004062C 00000000 */   nop
/* 30E30 80040630 84BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1BC)($gp)
.L80040634:
/* 30E34 80040634 00000000 */  nop
/* 30E38 80040638 84BF84AF */  sw         $a0, %gp_rel(gameTrackerX + 0x1BC)($gp)
/* 30E3C 8004063C 0800E003 */  jr         $ra
/* 30E40 80040640 00000000 */   nop
.size SOUND_SetVoiceVolume, . - SOUND_SetVoiceVolume
