.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_GetRotSplineDef
/* 2DA84 8003D284 0300C014 */  bnez       $a2, .L8003D294
/* 2DA88 8003D288 00000000 */   nop
/* 2DA8C 8003D28C 0300E010 */  beqz       $a3, .L8003D29C
/* 2DA90 8003D290 00000000 */   nop
.L8003D294:
/* 2DA94 8003D294 0800E003 */  jr         $ra
/* 2DA98 8003D298 A8018224 */   addiu     $v0, $a0, 0x1A8
.L8003D29C:
/* 2DA9C 8003D29C 0200A010 */  beqz       $a1, .L8003D2A8
/* 2DAA0 8003D2A0 21100000 */   addu      $v0, $zero, $zero
/* 2DAA4 8003D2A4 1800A224 */  addiu      $v0, $a1, 0x18
.L8003D2A8:
/* 2DAA8 8003D2A8 0800E003 */  jr         $ra
/* 2DAAC 8003D2AC 00000000 */   nop
.size SCRIPT_GetRotSplineDef, . - SCRIPT_GetRotSplineDef
