.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_RemoveFromArray
/* 4BB74 8005B374 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4BB78 8005B378 1000BFAF */  sw         $ra, 0x10($sp)
/* 4BB7C 8005B37C B26C010C */  jal        WARPGATE_GetWarpRoomIndex
/* 4BB80 8005B380 0C008424 */   addiu     $a0, $a0, 0xC
/* 4BB84 8005B384 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 4BB88 8005B388 02004314 */  bne        $v0, $v1, .L8005B394
/* 4BB8C 8005B38C 00000000 */   nop
/* 4BB90 8005B390 FCA080AF */  sw         $zero, %gp_rel(CurrentWarpNumber)($gp)
.L8005B394:
/* 4BB94 8005B394 1000BF8F */  lw         $ra, 0x10($sp)
/* 4BB98 8005B398 00000000 */  nop
/* 4BB9C 8005B39C 0800E003 */  jr         $ra
/* 4BBA0 8005B3A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_RemoveFromArray, . - WARPGATE_RemoveFromArray
