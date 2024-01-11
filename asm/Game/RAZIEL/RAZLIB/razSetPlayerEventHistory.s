.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetPlayerEventHistory
/* 98320 800A7B20 E0FB828F */  lw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* 98324 800A7B24 00000000 */  nop
/* 98328 800A7B28 25104400 */  or         $v0, $v0, $a0
/* 9832C 800A7B2C E0FB82AF */  sw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* 98330 800A7B30 0800E003 */  jr         $ra
/* 98334 800A7B34 00000000 */   nop
.size razSetPlayerEventHistory, . - razSetPlayerEventHistory
