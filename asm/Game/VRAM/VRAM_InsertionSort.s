.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VRAM_InsertionSort
/* 6445C 80073C5C 21300000 */  addu       $a2, $zero, $zero
/* 64460 80073C60 0C008010 */  beqz       $a0, .L80073C94
/* 64464 80073C64 21188000 */   addu      $v1, $a0, $zero
/* 64468 80073C68 1400A78C */  lw         $a3, 0x14($a1)
.L80073C6C:
/* 6446C 80073C6C 1400628C */  lw         $v0, 0x14($v1)
/* 64470 80073C70 00000000 */  nop
/* 64474 80073C74 2A10E200 */  slt        $v0, $a3, $v0
/* 64478 80073C78 06004010 */  beqz       $v0, .L80073C94
/* 6447C 80073C7C 00000000 */   nop
/* 64480 80073C80 21306000 */  addu       $a2, $v1, $zero
/* 64484 80073C84 0000C38C */  lw         $v1, 0x0($a2)
/* 64488 80073C88 00000000 */  nop
/* 6448C 80073C8C F7FF6014 */  bnez       $v1, .L80073C6C
/* 64490 80073C90 00000000 */   nop
.L80073C94:
/* 64494 80073C94 0400C014 */  bnez       $a2, .L80073CA8
/* 64498 80073C98 00000000 */   nop
/* 6449C 80073C9C 0000A4AC */  sw         $a0, 0x0($a1)
/* 644A0 80073CA0 2CCF0108 */  j          .L80073CB0
/* 644A4 80073CA4 2120A000 */   addu      $a0, $a1, $zero
.L80073CA8:
/* 644A8 80073CA8 0000A3AC */  sw         $v1, 0x0($a1)
/* 644AC 80073CAC 0000C5AC */  sw         $a1, 0x0($a2)
.L80073CB0:
/* 644B0 80073CB0 0800E003 */  jr         $ra
/* 644B4 80073CB4 21108000 */   addu      $v0, $a0, $zero
.size VRAM_InsertionSort, . - VRAM_InsertionSort
