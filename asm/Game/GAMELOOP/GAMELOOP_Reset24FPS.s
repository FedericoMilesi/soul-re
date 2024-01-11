.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_Reset24FPS
/* 20BB8 800303B8 34C080A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x26C)($gp)
/* 20BBC 800303BC 0800E003 */  jr         $ra
/* 20BC0 800303C0 00000000 */   nop
.size GAMELOOP_Reset24FPS, . - GAMELOOP_Reset24FPS
