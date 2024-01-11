.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_Init
/* 51A48 80061248 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 51A4C 8006124C 1000BFAF */  sw         $ra, 0x10($sp)
/* 51A50 80061250 7E84010C */  jal        EVENT_InitTerrainMovement
/* 51A54 80061254 00000000 */   nop
/* 51A58 80061258 7384010C */  jal        EVENT_InitTimers
/* 51A5C 8006125C 00000000 */   nop
/* 51A60 80061260 4B83010C */  jal        HINT_ResetHint
/* 51A64 80061264 00000000 */   nop
/* 51A68 80061268 0900023C */  lui        $v0, (0x96000 >> 16)
/* 51A6C 8006126C 00604234 */  ori        $v0, $v0, (0x96000 & 0xFFFF)
/* 51A70 80061270 1000BF8F */  lw         $ra, 0x10($sp)
/* 51A74 80061274 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 51A78 80061278 14CF83AF */  sw         $v1, %gp_rel(WaitingForVoiceNumber)($gp)
/* 51A7C 8006127C 34CE82AF */  sw         $v0, %gp_rel(WaitingToLoadSound)($gp)
/* 51A80 80061280 10CF82AF */  sw         $v0, %gp_rel(WaitingToLoadSFX)($gp)
/* 51A84 80061284 88CE80A7 */  sh         $zero, %gp_rel(MoviePlayed)($gp)
/* 51A88 80061288 8CCE83A7 */  sh         $v1, %gp_rel(MovieToPlay)($gp)
/* 51A8C 8006128C 0800E003 */  jr         $ra
/* 51A90 80061290 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_Init, . - EVENT_Init
