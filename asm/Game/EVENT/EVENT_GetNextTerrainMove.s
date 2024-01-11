.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetNextTerrainMove
/* 51A94 80061294 21200000 */  addu       $a0, $zero, $zero
/* 51A98 80061298 60CB8327 */  addiu      $v1, $gp, %gp_rel(WaterLevelArray)
.L8006129C:
/* 51A9C 8006129C 0000628C */  lw         $v0, 0x0($v1)
/* 51AA0 800612A0 00000000 */  nop
/* 51AA4 800612A4 01004230 */  andi       $v0, $v0, 0x1
/* 51AA8 800612A8 03004014 */  bnez       $v0, .L800612B8
/* 51AAC 800612AC 01008424 */   addiu     $a0, $a0, 0x1
/* 51AB0 800612B0 0800E003 */  jr         $ra
/* 51AB4 800612B4 21106000 */   addu      $v0, $v1, $zero
.L800612B8:
/* 51AB8 800612B8 05008228 */  slti       $v0, $a0, 0x5
/* 51ABC 800612BC F7FF4014 */  bnez       $v0, .L8006129C
/* 51AC0 800612C0 1C006324 */   addiu     $v1, $v1, 0x1C
/* 51AC4 800612C4 0800E003 */  jr         $ra
/* 51AC8 800612C8 21100000 */   addu      $v0, $zero, $zero
.size EVENT_GetNextTerrainMove, . - EVENT_GetNextTerrainMove
