.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ApplyPhysics
/* 71B3C 8008133C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 71B40 80081340 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 71B44 80081344 1000BFAF */  sw         $ra, 0x10($sp)
/* 71B48 80081348 4FDE010C */  jal        PhysicsMove
/* 71B4C 8008134C 5C008524 */   addiu     $a1, $a0, 0x5C
/* 71B50 80081350 1000BF8F */  lw         $ra, 0x10($sp)
/* 71B54 80081354 00000000 */  nop
/* 71B58 80081358 0800E003 */  jr         $ra
/* 71B5C 8008135C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_ApplyPhysics, . - MON_ApplyPhysics
