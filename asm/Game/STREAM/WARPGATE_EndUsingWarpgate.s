.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_EndUsingWarpgate
/* 4BC24 8005B424 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4BC28 8005B428 18C7838F */  lw         $v1, %gp_rel(WarpGateLoadInfo)($gp)
/* 4BC2C 8005B42C 01000224 */  addiu      $v0, $zero, 0x1
/* 4BC30 8005B430 06006214 */  bne        $v1, $v0, .L8005B44C
/* 4BC34 8005B434 1000BFAF */   sw        $ra, 0x10($sp)
/* 4BC38 8005B438 82010424 */  addiu      $a0, $zero, 0x182
/* 4BC3C 8005B43C 7F000524 */  addiu      $a1, $zero, 0x7F
/* 4BC40 8005B440 40000624 */  addiu      $a2, $zero, 0x40
/* 4BC44 8005B444 2402010C */  jal        SndPlayVolPan
/* 4BC48 8005B448 21380000 */   addu      $a3, $zero, $zero
.L8005B44C:
/* 4BC4C 8005B44C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4BC50 8005B450 18C780AF */  sw         $zero, %gp_rel(WarpGateLoadInfo)($gp)
/* 4BC54 8005B454 0800E003 */  jr         $ra
/* 4BC58 8005B458 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_EndUsingWarpgate, . - WARPGATE_EndUsingWarpgate
