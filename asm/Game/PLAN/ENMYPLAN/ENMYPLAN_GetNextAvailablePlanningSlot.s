.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_GetNextAvailablePlanningSlot
/* 86F04 80096704 FFFF0524 */  addiu      $a1, $zero, -0x1
/* 86F08 80096708 21180000 */  addu       $v1, $zero, $zero
/* 86F0C 8009670C DCBF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x214)($gp)
.L80096710:
/* 86F10 80096710 00000000 */  nop
/* 86F14 80096714 00008280 */  lb         $v0, 0x0($a0)
/* 86F18 80096718 00000000 */  nop
/* 86F1C 8009671C 03004014 */  bnez       $v0, .L8009672C
/* 86F20 80096720 00000000 */   nop
/* 86F24 80096724 CF590208 */  j          .L8009673C
/* 86F28 80096728 21286000 */   addu      $a1, $v1, $zero
.L8009672C:
/* 86F2C 8009672C 01006324 */  addiu      $v1, $v1, 0x1
/* 86F30 80096730 0A006228 */  slti       $v0, $v1, 0xA
/* 86F34 80096734 F6FF4014 */  bnez       $v0, .L80096710
/* 86F38 80096738 5E008424 */   addiu     $a0, $a0, 0x5E
.L8009673C:
/* 86F3C 8009673C 0800E003 */  jr         $ra
/* 86F40 80096740 2110A000 */   addu      $v0, $a1, $zero
.size ENMYPLAN_GetNextAvailablePlanningSlot, . - ENMYPLAN_GetNextAvailablePlanningSlot
