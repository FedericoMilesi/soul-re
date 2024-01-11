.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_ExitGame
/* 4C80 80014480 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4C84 80014484 1000BFAF */  sw         $ra, 0x10($sp)
/* 4C88 80014488 A901010C */  jal        SOUND_StopAllSound
/* 4C8C 8001448C 00000000 */   nop
/* 4C90 80014490 01000224 */  addiu      $v0, $zero, 0x1
/* 4C94 80014494 36BF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x16E)($gp)
/* 4C98 80014498 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4C9C 8001449C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4CA0 800144A0 02000324 */  addiu      $v1, $zero, 0x2
/* 4CA4 800144A4 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 4CA8 800144A8 34BF83A7 */  sh         $v1, %gp_rel(gameTrackerX + 0x16C)($gp)
/* 4CAC 800144AC 01004234 */  ori        $v0, $v0, 0x1
/* 4CB0 800144B0 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4CB4 800144B4 0800E003 */  jr         $ra
/* 4CB8 800144B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_ExitGame, . - DEBUG_ExitGame
