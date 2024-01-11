.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_LandInWater
/* 78D8C 8008858C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 78D90 80088590 1000BFAF */  sw         $ra, 0x10($sp)
/* 78D94 80088594 91FE010C */  jal        MON_SwitchState
/* 78D98 80088598 04000524 */   addiu     $a1, $zero, 0x4
/* 78D9C 8008859C 1000BF8F */  lw         $ra, 0x10($sp)
/* 78DA0 800885A0 00000000 */  nop
/* 78DA4 800885A4 0800E003 */  jr         $ra
/* 78DA8 800885A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_LandInWater, . - MON_LandInWater
