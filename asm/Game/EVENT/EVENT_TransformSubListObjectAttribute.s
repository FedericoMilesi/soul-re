.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformSubListObjectAttribute
/* 53C4C 8006344C 0C00A38C */  lw         $v1, 0xC($a1)
/* 53C50 80063450 00000000 */  nop
/* 53C54 80063454 05006228 */  slti       $v0, $v1, 0x5
/* 53C58 80063458 07004010 */  beqz       $v0, .L80063478
/* 53C5C 8006345C 21200000 */   addu      $a0, $zero, $zero
/* 53C60 80063460 01000424 */  addiu      $a0, $zero, 0x1
/* 53C64 80063464 80100300 */  sll        $v0, $v1, 2
/* 53C68 80063468 2110A200 */  addu       $v0, $a1, $v0
/* 53C6C 8006346C 100046AC */  sw         $a2, 0x10($v0)
/* 53C70 80063470 21106400 */  addu       $v0, $v1, $a0
/* 53C74 80063474 0C00A2AC */  sw         $v0, 0xC($a1)
.L80063478:
/* 53C78 80063478 0800E003 */  jr         $ra
/* 53C7C 8006347C 21108000 */   addu      $v0, $a0, $zero
.size EVENT_TransformSubListObjectAttribute, . - EVENT_TransformSubListObjectAttribute
