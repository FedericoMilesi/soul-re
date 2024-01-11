.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_GetGT
/* 21A38 80031238 C8BD8227 */  addiu      $v0, $gp, %gp_rel(gameTrackerX)
/* 21A3C 8003123C 0800E003 */  jr         $ra
/* 21A40 80031240 00000000 */   nop
.size GAMELOOP_GetGT, . - GAMELOOP_GetGT
