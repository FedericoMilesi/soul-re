.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_SetCursor
/* 1E0F0 8002D8F0 00240400 */  sll        $a0, $a0, 16
/* 1E0F4 8002D8F4 03240400 */  sra        $a0, $a0, 16
/* 1E0F8 8002D8F8 002C0500 */  sll        $a1, $a1, 16
/* 1E0FC 8002D8FC 032C0500 */  sra        $a1, $a1, 16
/* 1E100 8002D900 ECB984AF */  sw         $a0, %gp_rel(fontTracker + 0x600)($gp)
/* 1E104 8002D904 F0B985AF */  sw         $a1, %gp_rel(fontTracker + 0x604)($gp)
/* 1E108 8002D908 0800E003 */  jr         $ra
/* 1E10C 8002D90C 00000000 */   nop
.size FONT_SetCursor, . - FONT_SetCursor
