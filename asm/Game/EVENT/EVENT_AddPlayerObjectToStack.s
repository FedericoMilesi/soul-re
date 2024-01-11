.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_AddPlayerObjectToStack
/* 526E8 80061EE8 21288000 */  addu       $a1, $a0, $zero
/* 526EC 80061EEC 0000A38C */  lw         $v1, 0x0($a1)
/* 526F0 80061EF0 00000000 */  nop
/* 526F4 80061EF4 20006228 */  slti       $v0, $v1, 0x20
/* 526F8 80061EF8 0F004010 */  beqz       $v0, .L80061F38
/* 526FC 80061EFC C0100300 */   sll       $v0, $v1, 3
/* 52700 80061F00 21104300 */  addu       $v0, $v0, $v1
/* 52704 80061F04 80100200 */  sll        $v0, $v0, 2
/* 52708 80061F08 04004224 */  addiu      $v0, $v0, 0x4
/* 5270C 80061F0C 2110A200 */  addu       $v0, $a1, $v0
/* 52710 80061F10 02000324 */  addiu      $v1, $zero, 0x2
/* 52714 80061F14 000043AC */  sw         $v1, 0x0($v0)
/* 52718 80061F18 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 5271C 80061F1C FFFF0324 */  addiu      $v1, $zero, -0x1
/* 52720 80061F20 080043AC */  sw         $v1, 0x8($v0)
/* 52724 80061F24 040044AC */  sw         $a0, 0x4($v0)
/* 52728 80061F28 0000A28C */  lw         $v0, 0x0($a1)
/* 5272C 80061F2C 00000000 */  nop
/* 52730 80061F30 01004224 */  addiu      $v0, $v0, 0x1
/* 52734 80061F34 0000A2AC */  sw         $v0, 0x0($a1)
.L80061F38:
/* 52738 80061F38 0800E003 */  jr         $ra
/* 5273C 80061F3C 00000000 */   nop
.size EVENT_AddPlayerObjectToStack, . - EVENT_AddPlayerObjectToStack
