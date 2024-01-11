.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_last_menu_line
/* 3EFC 800136FC 0000838C */  lw         $v1, 0x0($a0)
/* 3F00 80013700 05000224 */  addiu      $v0, $zero, 0x5
/* 3F04 80013704 07006210 */  beq        $v1, $v0, .L80013724
/* 3F08 80013708 21184000 */   addu      $v1, $v0, $zero
/* 3F0C 8001370C 18008424 */  addiu      $a0, $a0, 0x18
.L80013710:
/* 3F10 80013710 0000828C */  lw         $v0, 0x0($a0)
/* 3F14 80013714 00000000 */  nop
/* 3F18 80013718 FDFF4314 */  bne        $v0, $v1, .L80013710
/* 3F1C 8001371C 18008424 */   addiu     $a0, $a0, 0x18
/* 3F20 80013720 E8FF8424 */  addiu      $a0, $a0, -0x18
.L80013724:
/* 3F24 80013724 0800E003 */  jr         $ra
/* 3F28 80013728 21108000 */   addu      $v0, $a0, $zero
.size get_last_menu_line, . - get_last_menu_line
