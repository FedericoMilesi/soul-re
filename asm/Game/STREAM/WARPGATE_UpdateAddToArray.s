.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_UpdateAddToArray
/* 4BB28 8005B328 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4BB2C 8005B32C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4BB30 8005B330 21808000 */  addu       $s0, $a0, $zero
/* 4BB34 8005B334 1400BFAF */  sw         $ra, 0x14($sp)
/* 4BB38 8005B338 B26C010C */  jal        WARPGATE_GetWarpRoomIndex
/* 4BB3C 8005B33C 0C000426 */   addiu     $a0, $s0, 0xC
/* 4BB40 8005B340 21184000 */  addu       $v1, $v0, $zero
/* 4BB44 8005B344 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4BB48 8005B348 06006210 */  beq        $v1, $v0, .L8005B364
/* 4BB4C 8005B34C 80100300 */   sll       $v0, $v1, 2
/* 4BB50 8005B350 21104300 */  addu       $v0, $v0, $v1
/* 4BB54 8005B354 80100200 */  sll        $v0, $v0, 2
/* 4BB58 8005B358 00A18327 */  addiu      $v1, $gp, %gp_rel(WarpRoomArray)
/* 4BB5C 8005B35C 21104300 */  addu       $v0, $v0, $v1
/* 4BB60 8005B360 100050AC */  sw         $s0, 0x10($v0)
.L8005B364:
/* 4BB64 8005B364 1400BF8F */  lw         $ra, 0x14($sp)
/* 4BB68 8005B368 1000B08F */  lw         $s0, 0x10($sp)
/* 4BB6C 8005B36C 0800E003 */  jr         $ra
/* 4BB70 8005B370 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_UpdateAddToArray, . - WARPGATE_UpdateAddToArray
