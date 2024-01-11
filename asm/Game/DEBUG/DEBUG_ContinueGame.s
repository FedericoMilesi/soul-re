.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_ContinueGame
/* 4C68 80014468 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4C6C 8001446C 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 4C70 80014470 25104300 */  or         $v0, $v0, $v1
/* 4C74 80014474 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 4C78 80014478 0800E003 */  jr         $ra
/* 4C7C 8001447C 00000000 */   nop
.size DEBUG_ContinueGame, . - DEBUG_ContinueGame
