.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_EmbraceEntry
/* 7F6FC 8008EEFC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7F700 8008EF00 1000BFAF */  sw         $ra, 0x10($sp)
/* 7F704 8008EF04 F62E020C */  jal        MON_EmbraceEntry
/* 7F708 8008EF08 00000000 */   nop
/* 7F70C 8008EF0C 1000BF8F */  lw         $ra, 0x10($sp)
/* 7F710 8008EF10 00000000 */  nop
/* 7F714 8008EF14 0800E003 */  jr         $ra
/* 7F718 8008EF18 1800BD27 */   addiu     $sp, $sp, 0x18
.size VWRAITH_EmbraceEntry, . - VWRAITH_EmbraceEntry
