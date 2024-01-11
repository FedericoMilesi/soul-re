.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GetAnim
/* 703D0 8007FBD0 2128A600 */  addu       $a1, $a1, $a2
/* 703D4 8007FBD4 0000A580 */  lb         $a1, 0x0($a1)
/* 703D8 8007FBD8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 703DC 8007FBDC 0700A210 */  beq        $a1, $v0, .L8007FBFC
/* 703E0 8007FBE0 00000000 */   nop
/* 703E4 8007FBE4 2400828C */  lw         $v0, 0x24($a0)
/* 703E8 8007FBE8 00000000 */  nop
/* 703EC 8007FBEC 4000438C */  lw         $v1, 0x40($v0)
/* 703F0 8007FBF0 00110500 */  sll        $v0, $a1, 4
/* 703F4 8007FBF4 0800E003 */  jr         $ra
/* 703F8 8007FBF8 21106200 */   addu      $v0, $v1, $v0
.L8007FBFC:
/* 703FC 8007FBFC 0800E003 */  jr         $ra
/* 70400 8007FC00 21100000 */   addu      $v0, $zero, $zero
.size MON_GetAnim, . - MON_GetAnim
