.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_MusicOff
/* 30F14 80040714 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 30F18 80040718 1000B0AF */  sw         $s0, 0x10($sp)
/* 30F1C 8004071C 01001024 */  addiu      $s0, $zero, 0x1
/* 30F20 80040720 1400B1AF */  sw         $s1, 0x14($sp)
/* 30F24 80040724 21880002 */  addu       $s1, $s0, $zero
/* 30F28 80040728 1800BFAF */  sw         $ra, 0x18($sp)
.L8004072C:
/* 30F2C 8004072C 5252010C */  jal        aadDisableSlot
/* 30F30 80040730 21200002 */   addu      $a0, $s0, $zero
/* 30F34 80040734 A652010C */  jal        aadGetSlotStatus
/* 30F38 80040738 21200002 */   addu      $a0, $s0, $zero
/* 30F3C 8004073C 05005114 */  bne        $v0, $s1, .L80040754
/* 30F40 80040740 00000000 */   nop
/* 30F44 80040744 1352010C */  jal        aadStopSlot
/* 30F48 80040748 21200002 */   addu      $a0, $s0, $zero
/* 30F4C 8004074C F451010C */  jal        aadStartSlot
/* 30F50 80040750 21200002 */   addu      $a0, $s0, $zero
.L80040754:
/* 30F54 80040754 01001026 */  addiu      $s0, $s0, 0x1
/* 30F58 80040758 0400022A */  slti       $v0, $s0, 0x4
/* 30F5C 8004075C F3FF4014 */  bnez       $v0, .L8004072C
/* 30F60 80040760 00000000 */   nop
/* 30F64 80040764 1800BF8F */  lw         $ra, 0x18($sp)
/* 30F68 80040768 1400B18F */  lw         $s1, 0x14($sp)
/* 30F6C 8004076C 1000B08F */  lw         $s0, 0x10($sp)
/* 30F70 80040770 0800E003 */  jr         $ra
/* 30F74 80040774 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUND_MusicOff, . - SOUND_MusicOff
