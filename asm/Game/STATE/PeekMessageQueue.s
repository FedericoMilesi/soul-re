.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PeekMessageQueue
/* 614E4 80070CE4 0000838C */  lw         $v1, 0x0($a0)
/* 614E8 80070CE8 0400828C */  lw         $v0, 0x4($a0)
/* 614EC 80070CEC 00000000 */  nop
/* 614F0 80070CF0 04006210 */  beq        $v1, $v0, .L80070D04
/* 614F4 80070CF4 C0100300 */   sll       $v0, $v1, 3
/* 614F8 80070CF8 08004224 */  addiu      $v0, $v0, 0x8
/* 614FC 80070CFC 0800E003 */  jr         $ra
/* 61500 80070D00 21108200 */   addu      $v0, $a0, $v0
.L80070D04:
/* 61504 80070D04 0800E003 */  jr         $ra
/* 61508 80070D08 21100000 */   addu      $v0, $zero, $zero
.size PeekMessageQueue, . - PeekMessageQueue
