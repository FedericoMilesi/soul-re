.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_data_size
/* A9ED0 800B96D0 0800E003 */  jr         $ra
/* A9ED4 800B96D4 10000224 */   addiu     $v0, $zero, 0x10
.size memcard_data_size, . - memcard_data_size
