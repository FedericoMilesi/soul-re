.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_ResetGameStates
/* 1E550 8002DD50 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1E554 8002DD54 1000BFAF */  sw         $ra, 0x10($sp)
/* 1E558 8002DD58 9284010C */  jal        EVENT_Init
/* 1E55C 8002DD5C 00000000 */   nop
/* 1E560 8002DD60 1000BF8F */  lw         $ra, 0x10($sp)
/* 1E564 8002DD64 00000000 */  nop
/* 1E568 8002DD68 0800E003 */  jr         $ra
/* 1E56C 8002DD6C 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_ResetGameStates, . - GAMELOOP_ResetGameStates
