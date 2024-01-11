.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_SetScreenWipe
/* 1ED44 8002E544 96BE85A7 */  sh         $a1, %gp_rel(gameTrackerX + 0xCE)($gp)
/* 1ED48 8002E548 94BE84A7 */  sh         $a0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 1ED4C 8002E54C 98BE86A7 */  sh         $a2, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 1ED50 8002E550 0800E003 */  jr         $ra
/* 1ED54 8002E554 00000000 */   nop
.size GAMELOOP_SetScreenWipe, . - GAMELOOP_SetScreenWipe
