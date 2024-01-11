.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel isdigit
/* 43E8 80013BE8 D0FF8224 */  addiu      $v0, $a0, -0x30
/* 43EC 80013BEC FF004230 */  andi       $v0, $v0, 0xFF
/* 43F0 80013BF0 0800E003 */  jr         $ra
/* 43F4 80013BF4 0A00422C */   sltiu     $v0, $v0, 0xA
.size isdigit, . - isdigit
