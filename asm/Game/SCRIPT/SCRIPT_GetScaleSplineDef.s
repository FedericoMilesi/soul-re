.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_GetScaleSplineDef
/* 2DAB0 8003D2B0 0300C014 */  bnez       $a2, .L8003D2C0
/* 2DAB4 8003D2B4 00000000 */   nop
/* 2DAB8 8003D2B8 0300E010 */  beqz       $a3, .L8003D2C8
/* 2DABC 8003D2BC 00000000 */   nop
.L8003D2C0:
/* 2DAC0 8003D2C0 0800E003 */  jr         $ra
/* 2DAC4 8003D2C4 B0018224 */   addiu     $v0, $a0, 0x1B0
.L8003D2C8:
/* 2DAC8 8003D2C8 0200A010 */  beqz       $a1, .L8003D2D4
/* 2DACC 8003D2CC 21100000 */   addu      $v0, $zero, $zero
/* 2DAD0 8003D2D0 2000A224 */  addiu      $v0, $a1, 0x20
.L8003D2D4:
/* 2DAD4 8003D2D4 0800E003 */  jr         $ra
/* 2DAD8 8003D2D8 00000000 */   nop
.size SCRIPT_GetScaleSplineDef, . - SCRIPT_GetScaleSplineDef
