.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel voiceCmdNull
/* A78AC 800B70AC 0800E003 */  jr         $ra
/* A78B0 800B70B0 00000000 */   nop
.size voiceCmdNull, . - voiceCmdNull
