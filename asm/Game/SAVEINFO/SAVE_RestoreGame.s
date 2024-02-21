.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_RestoreGame
/* A7140 800B6940 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7144 800B6944 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* A7148 800B6948 2000033C */  lui        $v1, (0x200000 >> 16)
/* A714C 800B694C 1000BFAF */  sw         $ra, 0x10($sp)
/* A7150 800B6950 25104300 */  or         $v0, $v0, $v1
/* A7154 800B6954 0CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* A7158 800B6958 1DD9020C */  jal        SAVE_RestoreGlobalSavePointer
/* A715C 800B695C 00000000 */   nop
/* A7160 800B6960 DCD9020C */  jal        SAVE_RestoreGlobalSaveTracker
/* A7164 800B6964 00000000 */   nop
/* A7168 800B6968 0D80043C */  lui        $a0, %hi(D_800D1E9C)
/* A716C 800B696C 9C1E8424 */  addiu      $a0, $a0, %lo(D_800D1E9C)
/* A7170 800B6970 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* A7174 800B6974 00000000 */  nop
/* A7178 800B6978 74004384 */  lh         $v1, 0x74($v0)
/* A717C 800B697C E0FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A7180 800B6980 C8BD8627 */  addiu      $a2, $gp, %gp_rel(gameTrackerX)
/* A7184 800B6984 21104300 */  addu       $v0, $v0, $v1
/* A7188 800B6988 E4FD82AF */  sw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A718C 800B698C 56C4000C */  jal        GAMELOOP_RequestLevelChange
/* A7190 800B6990 01000524 */   addiu     $a1, $zero, 0x1
/* A7194 800B6994 1000BF8F */  lw         $ra, 0x10($sp)
/* A7198 800B6998 00000000 */  nop
/* A719C 800B699C 0800E003 */  jr         $ra
/* A71A0 800B69A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_RestoreGame, . - SAVE_RestoreGame
