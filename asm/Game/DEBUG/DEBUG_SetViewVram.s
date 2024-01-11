.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_SetViewVram
/* 4E1C 8001461C 07000224 */  addiu      $v0, $zero, 0x7
/* 4E20 80014620 3ABF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x172)($gp)
/* 4E24 80014624 0800E003 */  jr         $ra
/* 4E28 80014628 00000000 */   nop
.size DEBUG_SetViewVram, . - DEBUG_SetViewVram
