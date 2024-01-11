.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_NumConnectionsExaminedForNode
/* 89A40 80099240 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 89A44 80099244 1000BFAF */  sw         $ra, 0x10($sp)
/* 89A48 80099248 0800848C */  lw         $a0, 0x8($a0)
/* 89A4C 8009924C 8864020C */  jal        PLANPOOL_CountBitsSetInLong
/* 89A50 80099250 00000000 */   nop
/* 89A54 80099254 1000BF8F */  lw         $ra, 0x10($sp)
/* 89A58 80099258 00000000 */  nop
/* 89A5C 8009925C 0800E003 */  jr         $ra
/* 89A60 80099260 1800BD27 */   addiu     $sp, $sp, 0x18
.size PLANPOOL_NumConnectionsExaminedForNode, . - PLANPOOL_NumConnectionsExaminedForNode
