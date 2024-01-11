.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_SendCinematicSwitch
/* 38AC 800130AC 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 38B0 800130B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 38B4 800130B4 1000BFAF */  sw         $ra, 0x10($sp)
/* 38B8 800130B8 00024238 */  xori       $v0, $v0, 0x200
/* 38BC 800130BC 8CBE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 38C0 800130C0 00024230 */  andi       $v0, $v0, 0x200
/* 38C4 800130C4 06004010 */  beqz       $v0, .L800130E0
/* 38C8 800130C8 21200000 */   addu      $a0, $zero, $zero
/* 38CC 800130CC 0E000524 */  addiu      $a1, $zero, 0xE
/* 38D0 800130D0 0400063C */  lui        $a2, (0x40000 >> 16)
/* 38D4 800130D4 2530C500 */  or         $a2, $a2, $a1
/* 38D8 800130D8 3C4C0008 */  j          .L800130F0
/* 38DC 800130DC 01000724 */   addiu     $a3, $zero, 0x1
.L800130E0:
/* 38E0 800130E0 0E000524 */  addiu      $a1, $zero, 0xE
/* 38E4 800130E4 0400063C */  lui        $a2, (0x40000 >> 16)
/* 38E8 800130E8 2530C500 */  or         $a2, $a2, $a1
/* 38EC 800130EC 21388000 */  addu       $a3, $a0, $zero
.L800130F0:
/* 38F0 800130F0 BAD1000C */  jal        INSTANCE_Broadcast
/* 38F4 800130F4 00000000 */   nop
/* 38F8 800130F8 1000BF8F */  lw         $ra, 0x10($sp)
/* 38FC 800130FC 00000000 */  nop
/* 3900 80013100 0800E003 */  jr         $ra
/* 3904 80013104 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_SendCinematicSwitch, . - DEBUG_SendCinematicSwitch
