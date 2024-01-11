.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SetSfxVolume
/* 30DF0 800405F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30DF4 800405F4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 30DF8 800405F8 02008214 */  bne        $a0, $v0, .L80040604
/* 30DFC 800405FC 1000BFAF */   sw        $ra, 0x10($sp)
/* 30E00 80040600 80BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1B8)($gp)
.L80040604:
/* 30E04 80040604 00000000 */  nop
/* 30E08 80040608 80BF84AF */  sw         $a0, %gp_rel(gameTrackerX + 0x1B8)($gp)
/* 30E0C 8004060C 9547010C */  jal        aadSetSfxMasterVolume
/* 30E10 80040610 00000000 */   nop
/* 30E14 80040614 1000BF8F */  lw         $ra, 0x10($sp)
/* 30E18 80040618 00000000 */  nop
/* 30E1C 8004061C 0800E003 */  jr         $ra
/* 30E20 80040620 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_SetSfxVolume, . - SOUND_SetSfxVolume
