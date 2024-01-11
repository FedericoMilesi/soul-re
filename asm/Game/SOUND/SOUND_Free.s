.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_Free
/* 30D78 80040578 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30D7C 8004057C 1000BFAF */  sw         $ra, 0x10($sp)
/* 30D80 80040580 8BBF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C3)($gp)
/* 30D84 80040584 B847010C */  jal        aadShutdown
/* 30D88 80040588 00000000 */   nop
/* 30D8C 8004058C 1000BF8F */  lw         $ra, 0x10($sp)
/* 30D90 80040590 00000000 */  nop
/* 30D94 80040594 0800E003 */  jr         $ra
/* 30D98 80040598 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_Free, . - SOUND_Free
