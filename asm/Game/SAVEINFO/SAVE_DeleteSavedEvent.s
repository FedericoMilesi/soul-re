.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_DeleteSavedEvent
/* A6118 800B5918 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A611C 800B591C 1000BFAF */  sw         $ra, 0x10($sp)
/* A6120 800B5920 1CD6020C */  jal        SAVE_GetSavedEvent
/* A6124 800B5924 00000000 */   nop
/* A6128 800B5928 03004010 */  beqz       $v0, .L800B5938
/* A612C 800B592C 00000000 */   nop
/* A6130 800B5930 08D8020C */  jal        SAVE_DeleteBlock
/* A6134 800B5934 21204000 */   addu      $a0, $v0, $zero
.L800B5938:
/* A6138 800B5938 1000BF8F */  lw         $ra, 0x10($sp)
/* A613C 800B593C 00000000 */  nop
/* A6140 800B5940 0800E003 */  jr         $ra
/* A6144 800B5944 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_DeleteSavedEvent, . - SAVE_DeleteSavedEvent
