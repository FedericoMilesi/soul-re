.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_LoadSaveGame
/* A71AC 800B69AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A71B0 800B69B0 2000033C */  lui        $v1, (0x200000 >> 16)
/* A71B4 800B69B4 0D80043C */  lui        $a0, %hi(SaveArraySize + 0xB8)
/* A71B8 800B69B8 9C1E8424 */  addiu      $a0, $a0, %lo(SaveArraySize + 0xB8)
/* A71BC 800B69BC 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* A71C0 800B69C0 C8BD8627 */  addiu      $a2, $gp, %gp_rel(gameTrackerX)
/* A71C4 800B69C4 1000BFAF */  sw         $ra, 0x10($sp)
/* A71C8 800B69C8 25104300 */  or         $v0, $v0, $v1
/* A71CC 800B69CC 0CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* A71D0 800B69D0 56C4000C */  jal        GAMELOOP_RequestLevelChange
/* A71D4 800B69D4 01000524 */   addiu     $a1, $zero, 0x1
/* A71D8 800B69D8 1000BF8F */  lw         $ra, 0x10($sp)
/* A71DC 800B69DC 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* A71E0 800B69E0 0800E003 */  jr         $ra
/* A71E4 800B69E4 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_LoadSaveGame, . - SAVE_LoadSaveGame
