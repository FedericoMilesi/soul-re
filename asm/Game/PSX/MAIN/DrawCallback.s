.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DrawCallback
/* 2942C 80038C2C E4BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x11C)($gp)
/* 29430 80038C30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 29434 80038C34 0F004010 */  beqz       $v0, .L80038C74
/* 29438 80038C38 1000BFAF */   sw        $ra, 0x10($sp)
/* 2943C 80038C3C E8BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x120)($gp)
/* 29440 80038C40 93F7000C */  jal        TIMER_TimeDiff
/* 29444 80038C44 00000000 */   nop
/* 29448 80038C48 E4BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x11C)($gp)
/* 2944C 80038C4C 00000000 */  nop
/* 29450 80038C50 000062AC */  sw         $v0, 0x0($v1)
/* 29454 80038C54 CCBD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x4)($gp)
/* 29458 80038C58 E4BE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x11C)($gp)
/* 2945C 80038C5C 80100300 */  sll        $v0, $v1, 2
/* 29460 80038C60 21104300 */  addu       $v0, $v0, $v1
/* 29464 80038C64 ECBE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x124)($gp)
/* 29468 80038C68 80100200 */  sll        $v0, $v0, 2
/* 2946C 80038C6C 21186200 */  addu       $v1, $v1, $v0
/* 29470 80038C70 E0BE83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x118)($gp)
.L80038C74:
/* 29474 80038C74 1000BF8F */  lw         $ra, 0x10($sp)
/* 29478 80038C78 00000000 */  nop
/* 2947C 80038C7C 0800E003 */  jr         $ra
/* 29480 80038C80 1800BD27 */   addiu     $sp, $sp, 0x18
.size DrawCallback, . - DrawCallback
