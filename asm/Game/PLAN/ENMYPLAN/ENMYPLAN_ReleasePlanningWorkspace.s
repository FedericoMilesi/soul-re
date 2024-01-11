.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_ReleasePlanningWorkspace
/* 86FA0 800967A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 86FA4 800967A4 1400B1AF */  sw         $s1, 0x14($sp)
/* 86FA8 800967A8 DCBF918F */  lw         $s1, %gp_rel(gameTrackerX + 0x214)($gp)
/* 86FAC 800967AC 1000B0AF */  sw         $s0, 0x10($sp)
/* 86FB0 800967B0 21808000 */  addu       $s0, $a0, $zero
/* 86FB4 800967B4 0F000006 */  bltz       $s0, .L800967F4
/* 86FB8 800967B8 1800BFAF */   sw        $ra, 0x18($sp)
/* 86FBC 800967BC 0A00022A */  slti       $v0, $s0, 0xA
/* 86FC0 800967C0 0C004010 */  beqz       $v0, .L800967F4
/* 86FC4 800967C4 00000000 */   nop
/* 86FC8 800967C8 0160020C */  jal        PLANAPI_DeleteNodesFromPoolByType
/* 86FCC 800967CC 02000424 */   addiu     $a0, $zero, 0x2
/* 86FD0 800967D0 0160020C */  jal        PLANAPI_DeleteNodesFromPoolByType
/* 86FD4 800967D4 03000424 */   addiu     $a0, $zero, 0x3
/* 86FD8 800967D8 40101000 */  sll        $v0, $s0, 1
/* 86FDC 800967DC 21105000 */  addu       $v0, $v0, $s0
/* 86FE0 800967E0 00110200 */  sll        $v0, $v0, 4
/* 86FE4 800967E4 23105000 */  subu       $v0, $v0, $s0
/* 86FE8 800967E8 40100200 */  sll        $v0, $v0, 1
/* 86FEC 800967EC 21105100 */  addu       $v0, $v0, $s1
/* 86FF0 800967F0 000040A0 */  sb         $zero, 0x0($v0)
.L800967F4:
/* 86FF4 800967F4 1800BF8F */  lw         $ra, 0x18($sp)
/* 86FF8 800967F8 1400B18F */  lw         $s1, 0x14($sp)
/* 86FFC 800967FC 1000B08F */  lw         $s0, 0x10($sp)
/* 87000 80096800 0800E003 */  jr         $ra
/* 87004 80096804 2000BD27 */   addiu     $sp, $sp, 0x20
.size ENMYPLAN_ReleasePlanningWorkspace, . - ENMYPLAN_ReleasePlanningWorkspace
