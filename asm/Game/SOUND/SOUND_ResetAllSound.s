.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_ResetAllSound
/* 30EE4 800406E4 8BBF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C3)($gp)
/* 30EE8 800406E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30EEC 800406EC 05004010 */  beqz       $v0, .L80040704
/* 30EF0 800406F0 1000BFAF */   sw        $ra, 0x10($sp)
/* 30EF4 800406F4 A901010C */  jal        SOUND_StopAllSound
/* 30EF8 800406F8 00000000 */   nop
/* 30EFC 800406FC 3151010C */  jal        aadInitReverb
/* 30F00 80040700 00000000 */   nop
.L80040704:
/* 30F04 80040704 1000BF8F */  lw         $ra, 0x10($sp)
/* 30F08 80040708 00000000 */  nop
/* 30F0C 8004070C 0800E003 */  jr         $ra
/* 30F10 80040710 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_ResetAllSound, . - SOUND_ResetAllSound
