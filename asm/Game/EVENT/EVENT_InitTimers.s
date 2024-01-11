.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_InitTimers
/* 519CC 800611CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 519D0 800611D0 F0CB8427 */  addiu      $a0, $gp, %gp_rel(eventTimerArray)
/* 519D4 800611D4 21280000 */  addu       $a1, $zero, $zero
/* 519D8 800611D8 1000BFAF */  sw         $ra, 0x10($sp)
/* 519DC 800611DC 30CE80AF */  sw         $zero, %gp_rel(numActiveEventTimers)($gp)
/* 519E0 800611E0 2EF2020C */  jal        func_800BC8B8
/* 519E4 800611E4 40020624 */   addiu     $a2, $zero, 0x240
/* 519E8 800611E8 1000BF8F */  lw         $ra, 0x10($sp)
/* 519EC 800611EC 00000000 */  nop
/* 519F0 800611F0 0800E003 */  jr         $ra
/* 519F4 800611F4 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_InitTimers, . - EVENT_InitTimers
