.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_StartUsingWarpgate
/* 4BBEC 8005B3EC 18C7828F */  lw         $v0, %gp_rel(WarpGateLoadInfo)($gp)
/* 4BBF0 8005B3F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4BBF4 8005B3F4 06004014 */  bnez       $v0, .L8005B410
/* 4BBF8 8005B3F8 1000BFAF */   sw        $ra, 0x10($sp)
/* 4BBFC 8005B3FC 6F010424 */  addiu      $a0, $zero, 0x16F
/* 4BC00 8005B400 7F000524 */  addiu      $a1, $zero, 0x7F
/* 4BC04 8005B404 40000624 */  addiu      $a2, $zero, 0x40
/* 4BC08 8005B408 2402010C */  jal        SndPlayVolPan
/* 4BC0C 8005B40C 21380000 */   addu      $a3, $zero, $zero
.L8005B410:
/* 4BC10 8005B410 1000BF8F */  lw         $ra, 0x10($sp)
/* 4BC14 8005B414 01000224 */  addiu      $v0, $zero, 0x1
/* 4BC18 8005B418 18C782AF */  sw         $v0, %gp_rel(WarpGateLoadInfo)($gp)
/* 4BC1C 8005B41C 0800E003 */  jr         $ra
/* 4BC20 8005B420 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_StartUsingWarpgate, . - WARPGATE_StartUsingWarpgate
