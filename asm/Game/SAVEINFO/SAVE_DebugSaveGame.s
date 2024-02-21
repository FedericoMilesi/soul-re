.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_DebugSaveGame
/* A71A4 800B69A4 0800E003 */  jr         $ra
/* A71A8 800B69A8 00000000 */   nop
.size SAVE_DebugSaveGame, . - SAVE_DebugSaveGame
