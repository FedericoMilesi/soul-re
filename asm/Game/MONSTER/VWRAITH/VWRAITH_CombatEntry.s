.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_CombatEntry
/* 7F6B0 8008EEB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7F6B4 8008EEB4 1000BFAF */  sw         $ra, 0x10($sp)
/* 7F6B8 8008EEB8 8327020C */  jal        MON_CombatEntry
/* 7F6BC 8008EEBC 00000000 */   nop
/* 7F6C0 8008EEC0 1000BF8F */  lw         $ra, 0x10($sp)
/* 7F6C4 8008EEC4 00000000 */  nop
/* 7F6C8 8008EEC8 0800E003 */  jr         $ra
/* 7F6CC 8008EECC 1800BD27 */   addiu     $sp, $sp, 0x18
.size VWRAITH_CombatEntry, . - VWRAITH_CombatEntry
