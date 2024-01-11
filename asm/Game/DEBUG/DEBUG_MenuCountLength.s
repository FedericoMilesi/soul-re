.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_MenuCountLength
/* 3E38 80013638 08008010 */  beqz       $a0, .L8001365C
/* 3E3C 8001363C 21180000 */   addu      $v1, $zero, $zero
/* 3E40 80013640 05000524 */  addiu      $a1, $zero, 0x5
.L80013644:
/* 3E44 80013644 0000828C */  lw         $v0, 0x0($a0)
/* 3E48 80013648 00000000 */  nop
/* 3E4C 8001364C 03004510 */  beq        $v0, $a1, .L8001365C
/* 3E50 80013650 18008424 */   addiu     $a0, $a0, 0x18
/* 3E54 80013654 FBFF8014 */  bnez       $a0, .L80013644
/* 3E58 80013658 01006324 */   addiu     $v1, $v1, 0x1
.L8001365C:
/* 3E5C 8001365C 0800E003 */  jr         $ra
/* 3E60 80013660 21106000 */   addu      $v0, $v1, $zero
.size DEBUG_MenuCountLength, . - DEBUG_MenuCountLength
