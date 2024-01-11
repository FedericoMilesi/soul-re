.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_GetBigFileEntry
/* 28854 80038054 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28858 80038058 1000BFAF */  sw         $ra, 0x10($sp)
/* 2885C 8003805C 75DF000C */  jal        LOAD_HashName
/* 28860 80038060 00000000 */   nop
/* 28864 80038064 F3DF000C */  jal        LOAD_GetBigFileEntryByHash
/* 28868 80038068 21204000 */   addu      $a0, $v0, $zero
/* 2886C 8003806C 1000BF8F */  lw         $ra, 0x10($sp)
/* 28870 80038070 00000000 */  nop
/* 28874 80038074 0800E003 */  jr         $ra
/* 28878 80038078 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_GetBigFileEntry, . - LOAD_GetBigFileEntry
