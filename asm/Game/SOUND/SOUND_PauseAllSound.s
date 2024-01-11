.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_PauseAllSound
/* 30E44 80040644 8BBF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C3)($gp)
/* 30E48 80040648 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30E4C 8004064C 05004010 */  beqz       $v0, .L80040664
/* 30E50 80040650 1000BFAF */   sw        $ra, 0x10($sp)
/* 30E54 80040654 5251010C */  jal        aadShutdownReverb
/* 30E58 80040658 00000000 */   nop
/* 30E5C 8004065C 3653010C */  jal        aadPauseSound
/* 30E60 80040660 00000000 */   nop
.L80040664:
/* 30E64 80040664 1000BF8F */  lw         $ra, 0x10($sp)
/* 30E68 80040668 00000000 */  nop
/* 30E6C 8004066C 0800E003 */  jr         $ra
/* 30E70 80040670 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_PauseAllSound, . - SOUND_PauseAllSound
