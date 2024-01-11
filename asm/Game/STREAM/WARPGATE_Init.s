.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_Init
/* 4BBA4 8005B3A4 0D000424 */  addiu      $a0, $zero, 0xD
/* 4BBA8 8005B3A8 04A28327 */  addiu      $v1, $gp, %gp_rel(WarpRoomArray + 0x104)
/* 4BBAC 8005B3AC 00100224 */  addiu      $v0, $zero, 0x1000
/* 4BBB0 8005B3B0 1EC782A7 */  sh         $v0, %gp_rel(WarpGateLoadInfo + 0x6)($gp)
/* 4BBB4 8005B3B4 00F00234 */  ori        $v0, $zero, 0xF000
/* 4BBB8 8005B3B8 18C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo)($gp)
/* 4BBBC 8005B3BC 1CC780A3 */  sb         $zero, %gp_rel(WarpGateLoadInfo + 0x4)($gp)
/* 4BBC0 8005B3C0 1DC780A3 */  sb         $zero, %gp_rel(WarpGateLoadInfo + 0x5)($gp)
/* 4BBC4 8005B3C4 20C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x8)($gp)
/* 4BBC8 8005B3C8 24C782AF */  sw         $v0, %gp_rel(WarpGateLoadInfo + 0xC)($gp)
/* 4BBCC 8005B3CC 28C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4BBD0 8005B3D0 FCA080AF */  sw         $zero, %gp_rel(CurrentWarpNumber)($gp)
.L8005B3D4:
/* 4BBD4 8005B3D4 100060AC */  sw         $zero, 0x10($v1)
/* 4BBD8 8005B3D8 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 4BBDC 8005B3DC FDFF8104 */  bgez       $a0, .L8005B3D4
/* 4BBE0 8005B3E0 ECFF6324 */   addiu     $v1, $v1, -0x14
/* 4BBE4 8005B3E4 0800E003 */  jr         $ra
/* 4BBE8 8005B3E8 00000000 */   nop
.size WARPGATE_Init, . - WARPGATE_Init
