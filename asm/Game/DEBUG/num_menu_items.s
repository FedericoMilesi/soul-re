.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel num_menu_items
/* 3F2C 8001372C 0000838C */  lw         $v1, 0x0($a0)
/* 3F30 80013730 05000224 */  addiu      $v0, $zero, 0x5
/* 3F34 80013734 07006210 */  beq        $v1, $v0, .L80013754
/* 3F38 80013738 21280000 */   addu      $a1, $zero, $zero
/* 3F3C 8001373C 21184000 */  addu       $v1, $v0, $zero
.L80013740:
/* 3F40 80013740 18008424 */  addiu      $a0, $a0, 0x18
/* 3F44 80013744 0000828C */  lw         $v0, 0x0($a0)
/* 3F48 80013748 00000000 */  nop
/* 3F4C 8001374C FCFF4314 */  bne        $v0, $v1, .L80013740
/* 3F50 80013750 0100A524 */   addiu     $a1, $a1, 0x1
.L80013754:
/* 3F54 80013754 0800E003 */  jr         $ra
/* 3F58 80013758 2110A000 */   addu      $v0, $a1, $zero
.size num_menu_items, . - num_menu_items
