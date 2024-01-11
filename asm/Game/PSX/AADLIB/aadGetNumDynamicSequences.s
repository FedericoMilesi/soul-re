.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadGetNumDynamicSequences
/* 44DC0 800545C0 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 44DC4 800545C4 80200400 */  sll        $a0, $a0, 2
/* 44DC8 800545C8 21204400 */  addu       $a0, $v0, $a0
/* 44DCC 800545CC 0005838C */  lw         $v1, 0x500($a0)
/* 44DD0 800545D0 02000224 */  addiu      $v0, $zero, 0x2
/* 44DD4 800545D4 04006214 */  bne        $v1, $v0, .L800545E8
/* 44DD8 800545D8 21100000 */   addu      $v0, $zero, $zero
/* 44DDC 800545DC D004828C */  lw         $v0, 0x4D0($a0)
/* 44DE0 800545E0 00000000 */  nop
/* 44DE4 800545E4 1800428C */  lw         $v0, 0x18($v0)
.L800545E8:
/* 44DE8 800545E8 0800E003 */  jr         $ra
/* 44DEC 800545EC 00000000 */   nop
.size aadGetNumDynamicSequences, . - aadGetNumDynamicSequences
