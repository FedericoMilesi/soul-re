.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DeMessageQueue
/* 6149C 80070C9C 0000858C */  lw         $a1, 0x0($a0)
/* 614A0 80070CA0 0400828C */  lw         $v0, 0x4($a0)
/* 614A4 80070CA4 00000000 */  nop
/* 614A8 80070CA8 0300A214 */  bne        $a1, $v0, .L80070CB8
/* 614AC 80070CAC 0100A324 */   addiu     $v1, $a1, 0x1
/* 614B0 80070CB0 0800E003 */  jr         $ra
/* 614B4 80070CB4 21100000 */   addu      $v0, $zero, $zero
.L80070CB8:
/* 614B8 80070CB8 10000224 */  addiu      $v0, $zero, 0x10
/* 614BC 80070CBC 02006214 */  bne        $v1, $v0, .L80070CC8
/* 614C0 80070CC0 000083AC */   sw        $v1, 0x0($a0)
/* 614C4 80070CC4 000080AC */  sw         $zero, 0x0($a0)
.L80070CC8:
/* 614C8 80070CC8 C0100500 */  sll        $v0, $a1, 3
/* 614CC 80070CCC 08004224 */  addiu      $v0, $v0, 0x8
/* 614D0 80070CD0 0800E003 */  jr         $ra
/* 614D4 80070CD4 21108200 */   addu      $v0, $a0, $v0
.size DeMessageQueue, . - DeMessageQueue
