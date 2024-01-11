.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_StopAllSound
/* 30EA4 800406A4 8BBF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C3)($gp)
/* 30EA8 800406A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30EAC 800406AC 09004010 */  beqz       $v0, .L800406D4
/* 30EB0 800406B0 1000BFAF */   sw        $ra, 0x10($sp)
/* 30EB4 800406B4 E65B010C */  jal        aadStopAllSfx
/* 30EB8 800406B8 00000000 */   nop
/* 30EBC 800406BC 2E52010C */  jal        aadStopAllSlots
/* 30EC0 800406C0 00000000 */   nop
/* 30EC4 800406C4 5251010C */  jal        aadShutdownReverb
/* 30EC8 800406C8 00000000 */   nop
/* 30ECC 800406CC 5C53010C */  jal        aadCancelPauseSound
/* 30ED0 800406D0 00000000 */   nop
.L800406D4:
/* 30ED4 800406D4 1000BF8F */  lw         $ra, 0x10($sp)
/* 30ED8 800406D8 00000000 */  nop
/* 30EDC 800406DC 0800E003 */  jr         $ra
/* 30EE0 800406E0 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_StopAllSound, . - SOUND_StopAllSound
