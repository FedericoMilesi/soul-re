.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_save
/* AA1D0 800B99D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA1D4 800B99D4 1000BFAF */  sw         $ra, 0x10($sp)
/* AA1D8 800B99D8 3DDA020C */  jal        SAVE_SaveGame
/* AA1DC 800B99DC 00000000 */   nop
/* AA1E0 800B99E0 1000BF8F */  lw         $ra, 0x10($sp)
/* AA1E4 800B99E4 00000000 */  nop
/* AA1E8 800B99E8 0800E003 */  jr         $ra
/* AA1EC 800B99EC 1800BD27 */   addiu     $sp, $sp, 0x18
.size memcard_save, . - memcard_save
