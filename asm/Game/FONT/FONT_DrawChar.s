.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_DrawChar
/* 1D8DC 8002D0DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1D8E0 8002D0E0 1000BFAF */  sw         $ra, 0x10($sp)
/* 1D8E4 8002D0E4 05008290 */  lbu        $v0, 0x5($a0)
/* 1D8E8 8002D0E8 04008390 */  lbu        $v1, 0x4($a0)
/* 1D8EC 8002D0EC 00008584 */  lh         $a1, 0x0($a0)
/* 1D8F0 8002D0F0 02008684 */  lh         $a2, 0x2($a0)
/* 1D8F4 8002D0F4 09BA82A3 */  sb         $v0, %gp_rel(fontTracker + 0x61D)($gp)
/* 1D8F8 8002D0F8 CAB4000C */  jal        FONT_DrawChar2D
/* 1D8FC 8002D0FC FF006430 */   andi      $a0, $v1, 0xFF
/* 1D900 8002D100 1000BF8F */  lw         $ra, 0x10($sp)
/* 1D904 8002D104 00000000 */  nop
/* 1D908 8002D108 0800E003 */  jr         $ra
/* 1D90C 8002D10C 1800BD27 */   addiu     $sp, $sp, 0x18
.size FONT_DrawChar, . - FONT_DrawChar
