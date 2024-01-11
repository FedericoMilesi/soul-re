.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_NumNodesInPool
/* 88F18 80098718 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88F1C 8009871C 00000000 */  nop
/* 88F20 80098720 01004290 */  lbu        $v0, 0x1($v0)
/* 88F24 80098724 0800E003 */  jr         $ra
/* 88F28 80098728 00000000 */   nop
.size PLANAPI_NumNodesInPool, . - PLANAPI_NumNodesInPool
