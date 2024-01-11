.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformConstrictAttribute
/* 52D20 80062520 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 52D24 80062524 2120A000 */  addu       $a0, $a1, $zero
/* 52D28 80062528 3A000224 */  addiu      $v0, $zero, 0x3A
/* 52D2C 8006252C 1000BFAF */  sw         $ra, 0x10($sp)
/* 52D30 80062530 0400858C */  lw         $a1, 0x4($a0)
/* 52D34 80062534 0600C210 */  beq        $a2, $v0, .L80062550
/* 52D38 80062538 21180000 */   addu      $v1, $zero, $zero
/* 52D3C 8006253C 3B000224 */  addiu      $v0, $zero, 0x3B
/* 52D40 80062540 0700C210 */  beq        $a2, $v0, .L80062560
/* 52D44 80062544 21300000 */   addu      $a2, $zero, $zero
/* 52D48 80062548 5F890108 */  j          .L8006257C
/* 52D4C 8006254C 00000000 */   nop
.L80062550:
/* 52D50 80062550 7001A584 */  lh         $a1, 0x170($a1)
/* 52D54 80062554 21300000 */  addu       $a2, $zero, $zero
/* 52D58 80062558 5C890108 */  j          .L80062570
/* 52D5C 8006255C FFFFA528 */   slti      $a1, $a1, -0x1
.L80062560:
/* 52D60 80062560 7001A584 */  lh         $a1, 0x170($a1)
/* 52D64 80062564 00000000 */  nop
/* 52D68 80062568 0200A528 */  slti       $a1, $a1, 0x2
/* 52D6C 8006256C 0100A538 */  xori       $a1, $a1, 0x1
.L80062570:
/* 52D70 80062570 9588010C */  jal        EVENT_ChangeOperandToNumber
/* 52D74 80062574 00000000 */   nop
/* 52D78 80062578 01000324 */  addiu      $v1, $zero, 0x1
.L8006257C:
/* 52D7C 8006257C 1000BF8F */  lw         $ra, 0x10($sp)
/* 52D80 80062580 21106000 */  addu       $v0, $v1, $zero
/* 52D84 80062584 0800E003 */  jr         $ra
/* 52D88 80062588 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformConstrictAttribute, . - EVENT_TransformConstrictAttribute
