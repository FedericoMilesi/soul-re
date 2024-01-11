.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUD_Init
/* 6CC4C 8007C44C 18FC0224 */  addiu      $v0, $zero, -0x3E8
/* 6CC50 8007C450 F4EC80A7 */  sh         $zero, %gp_rel(HUD_Rotation)($gp)
/* 6CC54 8007C454 F6EC80A7 */  sh         $zero, %gp_rel(HUD_Rot_vel)($gp)
/* 6CC58 8007C458 FAEC80A7 */  sh         $zero, %gp_rel(HUD_Pos_vel)($gp)
/* 6CC5C 8007C45C FCEC80A7 */  sh         $zero, %gp_rel(HUD_State)($gp)
/* 6CC60 8007C460 FEEC80A7 */  sh         $zero, %gp_rel(HUD_Wait)($gp)
/* 6CC64 8007C464 F8EC82A7 */  sh         $v0, %gp_rel(HUD_Position)($gp)
/* 6CC68 8007C468 E2EC80A7 */  sh         $zero, %gp_rel(HUD_Count)($gp)
/* 6CC6C 8007C46C E4EC80A7 */  sh         $zero, %gp_rel(HUD_Count_Overall)($gp)
/* 6CC70 8007C470 10ED80AF */  sw         $zero, %gp_rel(warpDraw)($gp)
/* 6CC74 8007C474 14ED80AF */  sw         $zero, %gp_rel(glowdeg)($gp)
/* 6CC78 8007C478 18ED80AF */  sw         $zero, %gp_rel(hud_warp_arrow_flash)($gp)
/* 6CC7C 8007C47C 0800E003 */  jr         $ra
/* 6CC80 8007C480 00000000 */   nop
.size HUD_Init, . - HUD_Init
