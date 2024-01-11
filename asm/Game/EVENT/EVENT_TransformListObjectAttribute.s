.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformListObjectAttribute
/* 53C80 80063480 1C00A38C */  lw         $v1, 0x1C($a1)
/* 53C84 80063484 00000000 */  nop
/* 53C88 80063488 05006228 */  slti       $v0, $v1, 0x5
/* 53C8C 8006348C 07004010 */  beqz       $v0, .L800634AC
/* 53C90 80063490 21200000 */   addu      $a0, $zero, $zero
/* 53C94 80063494 01000424 */  addiu      $a0, $zero, 0x1
/* 53C98 80063498 80100300 */  sll        $v0, $v1, 2
/* 53C9C 8006349C 2110A200 */  addu       $v0, $a1, $v0
/* 53CA0 800634A0 080046AC */  sw         $a2, 0x8($v0)
/* 53CA4 800634A4 21106400 */  addu       $v0, $v1, $a0
/* 53CA8 800634A8 1C00A2AC */  sw         $v0, 0x1C($a1)
.L800634AC:
/* 53CAC 800634AC 0800E003 */  jr         $ra
/* 53CB0 800634B0 21108000 */   addu      $v0, $a0, $zero
.size EVENT_TransformListObjectAttribute, . - EVENT_TransformListObjectAttribute
