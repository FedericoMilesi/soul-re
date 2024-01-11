.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_Replan
/* 87224 80096A24 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 87228 80096A28 1000BFAF */  sw         $ra, 0x10($sp)
/* 8722C 80096A2C 010080A0 */  sb         $zero, 0x1($a0)
/* 87230 80096A30 0160020C */  jal        PLANAPI_DeleteNodesFromPoolByType
/* 87234 80096A34 02000424 */   addiu     $a0, $zero, 0x2
/* 87238 80096A38 0160020C */  jal        PLANAPI_DeleteNodesFromPoolByType
/* 8723C 80096A3C 03000424 */   addiu     $a0, $zero, 0x3
/* 87240 80096A40 1000BF8F */  lw         $ra, 0x10($sp)
/* 87244 80096A44 00000000 */  nop
/* 87248 80096A48 0800E003 */  jr         $ra
/* 8724C 80096A4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size ENMYPLAN_Replan, . - ENMYPLAN_Replan
