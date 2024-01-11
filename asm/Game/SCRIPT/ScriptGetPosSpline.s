.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ScriptGetPosSpline
/* 2D8DC 8003D0DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2D8E0 8003D0E0 1000BFAF */  sw         $ra, 0x10($sp)
/* 2D8E4 8003D0E4 21280000 */  addu       $a1, $zero, $zero
/* 2D8E8 8003D0E8 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 2D8EC 8003D0EC 2130A000 */   addu      $a2, $a1, $zero
/* 2D8F0 8003D0F0 03004014 */  bnez       $v0, .L8003D100
/* 2D8F4 8003D0F4 00000000 */   nop
/* 2D8F8 8003D0F8 41F40008 */  j          .L8003D104
/* 2D8FC 8003D0FC 21100000 */   addu      $v0, $zero, $zero
.L8003D100:
/* 2D900 8003D100 0000428C */  lw         $v0, 0x0($v0)
.L8003D104:
/* 2D904 8003D104 1000BF8F */  lw         $ra, 0x10($sp)
/* 2D908 8003D108 00000000 */  nop
/* 2D90C 8003D10C 0800E003 */  jr         $ra
/* 2D910 8003D110 1800BD27 */   addiu     $sp, $sp, 0x18
.size ScriptGetPosSpline, . - ScriptGetPosSpline
