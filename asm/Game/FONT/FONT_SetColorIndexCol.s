.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_SetColorIndexCol
/* 1E304 8002DB04 40100400 */  sll        $v0, $a0, 1
/* 1E308 8002DB08 21104400 */  addu       $v0, $v0, $a0
/* 1E30C 8002DB0C 80100200 */  sll        $v0, $v0, 2
/* 1E310 8002DB10 A0908327 */  addiu      $v1, $gp, %gp_rel(the_font_color_table)
/* 1E314 8002DB14 21104300 */  addu       $v0, $v0, $v1
/* 1E318 8002DB18 000045AC */  sw         $a1, 0x0($v0)
/* 1E31C 8002DB1C 040046AC */  sw         $a2, 0x4($v0)
/* 1E320 8002DB20 0800E003 */  jr         $ra
/* 1E324 8002DB24 080047AC */   sw        $a3, 0x8($v0)
.size FONT_SetColorIndexCol, . - FONT_SetColorIndexCol
