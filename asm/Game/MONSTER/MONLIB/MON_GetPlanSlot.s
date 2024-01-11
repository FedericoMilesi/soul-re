.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GetPlanSlot
/* 72B24 80082324 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 72B28 80082328 1000B0AF */  sw         $s0, 0x10($sp)
/* 72B2C 8008232C 21808000 */  addu       $s0, $a0, $zero
/* 72B30 80082330 1400BFAF */  sw         $ra, 0x14($sp)
/* 72B34 80082334 66010482 */  lb         $a0, 0x166($s0)
/* 72B38 80082338 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 72B3C 8008233C 03008210 */  beq        $a0, $v0, .L8008234C
/* 72B40 80082340 00000000 */   nop
/* 72B44 80082344 E859020C */  jal        ENMYPLAN_ReleasePlanningWorkspace
/* 72B48 80082348 00000000 */   nop
.L8008234C:
/* 72B4C 8008234C D159020C */  jal        ENMYPLAN_GetInitializedPlanningWorkspaceFinal
/* 72B50 80082350 00000000 */   nop
/* 72B54 80082354 660102A2 */  sb         $v0, 0x166($s0)
/* 72B58 80082358 1400BF8F */  lw         $ra, 0x14($sp)
/* 72B5C 8008235C 1000B08F */  lw         $s0, 0x10($sp)
/* 72B60 80082360 0800E003 */  jr         $ra
/* 72B64 80082364 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_GetPlanSlot, . - MON_GetPlanSlot
