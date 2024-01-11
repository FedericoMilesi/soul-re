.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MainG2_InitEngine
/* 866CC 80095ECC 0800E003 */  jr         $ra
/* 866D0 80095ED0 01000224 */   addiu     $v0, $zero, 0x1
.size MainG2_InitEngine, . - MainG2_InitEngine
