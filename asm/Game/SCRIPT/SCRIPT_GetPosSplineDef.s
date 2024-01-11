.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_GetPosSplineDef
/* 2DA58 8003D258 0300C014 */  bnez       $a2, .L8003D268
/* 2DA5C 8003D25C 00000000 */   nop
/* 2DA60 8003D260 0300E010 */  beqz       $a3, .L8003D270
/* 2DA64 8003D264 00000000 */   nop
.L8003D268:
/* 2DA68 8003D268 0800E003 */  jr         $ra
/* 2DA6C 8003D26C A0018224 */   addiu     $v0, $a0, 0x1A0
.L8003D270:
/* 2DA70 8003D270 0200A010 */  beqz       $a1, .L8003D27C
/* 2DA74 8003D274 21100000 */   addu      $v0, $zero, $zero
/* 2DA78 8003D278 1000A224 */  addiu      $v0, $a1, 0x10
.L8003D27C:
/* 2DA7C 8003D27C 0800E003 */  jr         $ra
/* 2DA80 8003D280 00000000 */   nop
.size SCRIPT_GetPosSplineDef, . - SCRIPT_GetPosSplineDef
