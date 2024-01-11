.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MISSILE_FireAtInstance
/* 6E490 8007DC90 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6E494 8007DC94 1000BFAF */  sw         $ra, 0x10($sp)
/* 6E498 8007DC98 F4F6010C */  jal        MISSILE_Fire
/* 6E49C 8007DC9C 01000724 */   addiu     $a3, $zero, 0x1
/* 6E4A0 8007DCA0 1000BF8F */  lw         $ra, 0x10($sp)
/* 6E4A4 8007DCA4 00000000 */  nop
/* 6E4A8 8007DCA8 0800E003 */  jr         $ra
/* 6E4AC 8007DCAC 1800BD27 */   addiu     $sp, $sp, 0x18
.size MISSILE_FireAtInstance, . - MISSILE_FireAtInstance
