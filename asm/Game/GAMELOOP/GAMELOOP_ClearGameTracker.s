.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_ClearGameTracker
/* 1E570 8002DD70 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 1E574 8002DD74 D0BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 1E578 8002DD78 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 1E57C 8002DD7C 0400033C */  lui        $v1, (0x40000 >> 16)
/* 1E580 8002DD80 F4BF80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x22C)($gp)
/* 1E584 8002DD84 18C080AF */  sw         $zero, %gp_rel(gameTrackerX + 0x250)($gp)
/* 1E588 8002DD88 08BF80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x140)($gp)
/* 1E58C 8002DD8C F4BE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 1E590 8002DD90 F8BE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x130)($gp)
/* 1E594 8002DD94 3CBF80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x174)($gp)
/* 1E598 8002DD98 44BF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x17C)($gp)
/* 1E59C 8002DD9C C8BD80AF */  sw         $zero, %gp_rel(gameTrackerX)($gp)
/* 1E5A0 8002DDA0 3CBA80A7 */  sh         $zero, %gp_rel(pause_redraw_flag)($gp)
/* 1E5A4 8002DDA4 40BA80AF */  sw         $zero, %gp_rel(pause_redraw_prim)($gp)
/* 1E5A8 8002DDA8 25104300 */  or         $v0, $v0, $v1
/* 1E5AC 8002DDAC 88BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 1E5B0 8002DDB0 0800E003 */  jr         $ra
/* 1E5B4 8002DDB4 00000000 */   nop
.size GAMELOOP_ClearGameTracker, . - GAMELOOP_ClearGameTracker
