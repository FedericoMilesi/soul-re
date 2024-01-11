.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_UndestroyInstance
/* A6DE0 800B65E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A6DE4 800B65E4 1000BFAF */  sw         $ra, 0x10($sp)
/* A6DE8 800B65E8 3C00848C */  lw         $a0, 0x3C($a0)
/* A6DEC 800B65EC ECD8020C */  jal        SAVE_SetDeadDeadBit
/* A6DF0 800B65F0 21280000 */   addu      $a1, $zero, $zero
/* A6DF4 800B65F4 1000BF8F */  lw         $ra, 0x10($sp)
/* A6DF8 800B65F8 00000000 */  nop
/* A6DFC 800B65FC 0800E003 */  jr         $ra
/* A6E00 800B6600 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_UndestroyInstance, . - SAVE_UndestroyInstance
