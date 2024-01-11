.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_Combat
/* 7F6D0 8008EED0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7F6D4 8008EED4 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F6D8 8008EED8 1400BFAF */  sw         $ra, 0x14($sp)
/* 7F6DC 8008EEDC 8E27020C */  jal        MON_Combat
/* 7F6E0 8008EEE0 21808000 */   addu      $s0, $a0, $zero
/* 7F6E4 8008EEE4 8B3B020C */  jal        VWRAITH_VerticalMove
/* 7F6E8 8008EEE8 21200002 */   addu      $a0, $s0, $zero
/* 7F6EC 8008EEEC 1400BF8F */  lw         $ra, 0x14($sp)
/* 7F6F0 8008EEF0 1000B08F */  lw         $s0, 0x10($sp)
/* 7F6F4 8008EEF4 0800E003 */  jr         $ra
/* 7F6F8 8008EEF8 1800BD27 */   addiu     $sp, $sp, 0x18
.size VWRAITH_Combat, . - VWRAITH_Combat
