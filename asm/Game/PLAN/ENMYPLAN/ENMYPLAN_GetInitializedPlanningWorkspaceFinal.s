.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_GetInitializedPlanningWorkspaceFinal
/* 86F44 80096744 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 86F48 80096748 1000B0AF */  sw         $s0, 0x10($sp)
/* 86F4C 8009674C DCBF908F */  lw         $s0, %gp_rel(gameTrackerX + 0x214)($gp)
/* 86F50 80096750 1400BFAF */  sw         $ra, 0x14($sp)
/* 86F54 80096754 C159020C */  jal        ENMYPLAN_GetNextAvailablePlanningSlot
/* 86F58 80096758 00000000 */   nop
/* 86F5C 8009675C 21204000 */  addu       $a0, $v0, $zero
/* 86F60 80096760 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 86F64 80096764 09008210 */  beq        $a0, $v0, .L8009678C
/* 86F68 80096768 40100400 */   sll       $v0, $a0, 1
/* 86F6C 8009676C 21104400 */  addu       $v0, $v0, $a0
/* 86F70 80096770 00110200 */  sll        $v0, $v0, 4
/* 86F74 80096774 23104400 */  subu       $v0, $v0, $a0
/* 86F78 80096778 40100200 */  sll        $v0, $v0, 1
/* 86F7C 8009677C 21105000 */  addu       $v0, $v0, $s0
/* 86F80 80096780 01000324 */  addiu      $v1, $zero, 0x1
/* 86F84 80096784 000043A0 */  sb         $v1, 0x0($v0)
/* 86F88 80096788 010040A0 */  sb         $zero, 0x1($v0)
.L8009678C:
/* 86F8C 8009678C 1400BF8F */  lw         $ra, 0x14($sp)
/* 86F90 80096790 1000B08F */  lw         $s0, 0x10($sp)
/* 86F94 80096794 21108000 */  addu       $v0, $a0, $zero
/* 86F98 80096798 0800E003 */  jr         $ra
/* 86F9C 8009679C 1800BD27 */   addiu     $sp, $sp, 0x18
.size ENMYPLAN_GetInitializedPlanningWorkspaceFinal, . - ENMYPLAN_GetInitializedPlanningWorkspaceFinal
