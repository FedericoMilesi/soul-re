.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_MusicOn
/* 30F78 80040778 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 30F7C 8004077C 1000B0AF */  sw         $s0, 0x10($sp)
/* 30F80 80040780 01001024 */  addiu      $s0, $zero, 0x1
/* 30F84 80040784 1400BFAF */  sw         $ra, 0x14($sp)
.L80040788:
/* 30F88 80040788 6652010C */  jal        aadEnableSlot
/* 30F8C 8004078C 21200002 */   addu      $a0, $s0, $zero
/* 30F90 80040790 01001026 */  addiu      $s0, $s0, 0x1
/* 30F94 80040794 0400022A */  slti       $v0, $s0, 0x4
/* 30F98 80040798 FBFF4014 */  bnez       $v0, .L80040788
/* 30F9C 8004079C 00000000 */   nop
/* 30FA0 800407A0 1400BF8F */  lw         $ra, 0x14($sp)
/* 30FA4 800407A4 1000B08F */  lw         $s0, 0x10($sp)
/* 30FA8 800407A8 0800E003 */  jr         $ra
/* 30FAC 800407AC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUND_MusicOn, . - SOUND_MusicOn
