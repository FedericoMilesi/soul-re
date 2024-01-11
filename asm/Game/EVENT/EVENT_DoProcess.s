.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoProcess
/* 51BFC 800613FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 51C00 80061400 1000BFAF */  sw         $ra, 0x10($sp)
/* 51C04 80061404 B384010C */  jal        EVENT_ProcessMovingWater
/* 51C08 80061408 00000000 */   nop
/* 51C0C 8006140C 9583010C */  jal        EVENT_ProcessTimers
/* 51C10 80061410 00000000 */   nop
/* 51C14 80061414 1000BF8F */  lw         $ra, 0x10($sp)
/* 51C18 80061418 00000000 */  nop
/* 51C1C 8006141C 0800E003 */  jr         $ra
/* 51C20 80061420 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_DoProcess, . - EVENT_DoProcess
