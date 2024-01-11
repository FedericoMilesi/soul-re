.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_Set24FPS
/* 20BA8 800303A8 01000224 */  addiu      $v0, $zero, 0x1
/* 20BAC 800303AC 34C082A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x26C)($gp)
/* 20BB0 800303B0 0800E003 */  jr         $ra
/* 20BB4 800303B4 00000000 */   nop
.size GAMELOOP_Set24FPS, . - GAMELOOP_Set24FPS
