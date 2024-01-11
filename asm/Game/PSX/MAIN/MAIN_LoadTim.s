.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_LoadTim
/* 296E4 80038EE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 296E8 80038EE8 1000BFAF */  sw         $ra, 0x10($sp)
/* 296EC 80038EEC 3E82010C */  jal        LOAD_ReadFile
/* 296F0 80038EF0 0B000524 */   addiu     $a1, $zero, 0xB
/* 296F4 80038EF4 1000BF8F */  lw         $ra, 0x10($sp)
/* 296F8 80038EF8 00000000 */  nop
/* 296FC 80038EFC 0800E003 */  jr         $ra
/* 29700 80038F00 1800BD27 */   addiu     $sp, $sp, 0x18
.size MAIN_LoadTim, . - MAIN_LoadTim
