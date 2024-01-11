.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitMessageQueue
/* 61490 80070C90 000080AC */  sw         $zero, 0x0($a0)
/* 61494 80070C94 0800E003 */  jr         $ra
/* 61498 80070C98 040080AC */   sw        $zero, 0x4($a0)
.size InitMessageQueue, . - InitMessageQueue
