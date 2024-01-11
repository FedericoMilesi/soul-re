.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_ResumeAllSound
/* 30E74 80040674 8BBF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C3)($gp)
/* 30E78 80040678 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30E7C 8004067C 05004010 */  beqz       $v0, .L80040694
/* 30E80 80040680 1000BFAF */   sw        $ra, 0x10($sp)
/* 30E84 80040684 3151010C */  jal        aadInitReverb
/* 30E88 80040688 00000000 */   nop
/* 30E8C 8004068C 6353010C */  jal        aadResumeSound
/* 30E90 80040690 00000000 */   nop
.L80040694:
/* 30E94 80040694 1000BF8F */  lw         $ra, 0x10($sp)
/* 30E98 80040698 00000000 */  nop
/* 30E9C 8004069C 0800E003 */  jr         $ra
/* 30EA0 800406A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_ResumeAllSound, . - SOUND_ResumeAllSound
