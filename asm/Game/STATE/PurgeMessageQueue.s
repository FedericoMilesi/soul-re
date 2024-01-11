.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PurgeMessageQueue
/* 614D8 80070CD8 040080AC */  sw         $zero, 0x4($a0)
/* 614DC 80070CDC 0800E003 */  jr         $ra
/* 614E0 80070CE0 000080AC */   sw        $zero, 0x0($a0)
.size PurgeMessageQueue, . - PurgeMessageQueue
