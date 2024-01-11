.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMainTracker
/* 28E70 80038670 000080AC */  sw         $zero, 0x0($a0)
/* 28E74 80038674 040080AC */  sw         $zero, 0x4($a0)
/* 28E78 80038678 0800E003 */  jr         $ra
/* 28E7C 8003867C 0C0080AC */   sw        $zero, 0xC($a0)
.size InitMainTracker, . - InitMainTracker
