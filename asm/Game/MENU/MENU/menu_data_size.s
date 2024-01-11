.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_data_size
/* A7EF8 800B76F8 0800E003 */  jr         $ra
/* A7EFC 800B76FC 88030224 */   addiu     $v0, $zero, 0x388
.size menu_data_size, . - menu_data_size
