.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_SaveGame
/* A70F4 800B68F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A70F8 800B68F8 1000BFAF */  sw         $ra, 0x10($sp)
.L800B68FC:
/* A70FC 800B68FC 7580010C */  jal        STREAM_PollLoadQueue
/* A7100 800B6900 00000000 */   nop
/* A7104 800B6904 FDFF4014 */  bnez       $v0, .L800B68FC
/* A7108 800B6908 00000000 */   nop
/* A710C 800B690C 10DA020C */  jal        SAVE_SaveEverythingInMemory
/* A7110 800B6910 00000000 */   nop
/* A7114 800B6914 B7D9020C */  jal        SAVE_UpdateGlobalSaveTracker
/* A7118 800B6918 00000000 */   nop
/* A711C 800B691C E4FD8297 */  lhu        $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A7120 800B6920 E0FD8397 */  lhu        $v1, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A7124 800B6924 40A8848F */  lw         $a0, %gp_rel(GlobalSave)($gp)
/* A7128 800B6928 23104300 */  subu       $v0, $v0, $v1
/* A712C 800B692C 740082A4 */  sh         $v0, 0x74($a0)
/* A7130 800B6930 1000BF8F */  lw         $ra, 0x10($sp)
/* A7134 800B6934 00000000 */  nop
/* A7138 800B6938 0800E003 */  jr         $ra
/* A713C 800B693C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_SaveGame, . - SAVE_SaveGame
