.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_NumConnectionsForNode
/* 89A64 80099264 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 89A68 80099268 1000BFAF */  sw         $ra, 0x10($sp)
/* 89A6C 8009926C 0C00848C */  lw         $a0, 0xC($a0)
/* 89A70 80099270 8864020C */  jal        PLANPOOL_CountBitsSetInLong
/* 89A74 80099274 00000000 */   nop
/* 89A78 80099278 1000BF8F */  lw         $ra, 0x10($sp)
/* 89A7C 8009927C 00000000 */  nop
/* 89A80 80099280 0800E003 */  jr         $ra
/* 89A84 80099284 1800BD27 */   addiu     $sp, $sp, 0x18
.size PLANPOOL_NumConnectionsForNode, . - PLANPOOL_NumConnectionsForNode
