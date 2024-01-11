.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_GetTimeOfDayIdx
/* 1E744 8002DF44 A7FD8224 */  addiu      $v0, $a0, -0x259
/* 1E748 8002DF48 6300422C */  sltiu      $v0, $v0, 0x63
/* 1E74C 8002DF4C 03004010 */  beqz       $v0, .L8002DF5C
/* 1E750 8002DF50 44FD8224 */   addiu     $v0, $a0, -0x2BC
/* 1E754 8002DF54 0800E003 */  jr         $ra
/* 1E758 8002DF58 01000224 */   addiu     $v0, $zero, 0x1
.L8002DF5C:
/* 1E75C 8002DF5C 4C04422C */  sltiu      $v0, $v0, 0x44C
/* 1E760 8002DF60 07004014 */  bnez       $v0, .L8002DF80
/* 1E764 8002DF64 02000224 */   addiu     $v0, $zero, 0x2
/* 1E768 8002DF68 F8F88324 */  addiu      $v1, $a0, -0x708
/* 1E76C 8002DF6C 6400632C */  sltiu      $v1, $v1, 0x64
/* 1E770 8002DF70 03006014 */  bnez       $v1, .L8002DF80
/* 1E774 8002DF74 03000224 */   addiu     $v0, $zero, 0x3
/* 1E778 8002DF78 0800E003 */  jr         $ra
/* 1E77C 8002DF7C 21100000 */   addu      $v0, $zero, $zero
.L8002DF80:
/* 1E780 8002DF80 0800E003 */  jr         $ra
/* 1E784 8002DF84 00000000 */   nop
.size GAMELOOP_GetTimeOfDayIdx, . - GAMELOOP_GetTimeOfDayIdx
