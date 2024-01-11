.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_RelocatableType
/* 409CC 800501CC FFFF8224 */  addiu      $v0, $a0, -0x1
/* 409D0 800501D0 0200422C */  sltiu      $v0, $v0, 0x2
/* 409D4 800501D4 07004014 */  bnez       $v0, .L800501F4
/* 409D8 800501D8 2C000224 */   addiu     $v0, $zero, 0x2C
/* 409DC 800501DC 05008210 */  beq        $a0, $v0, .L800501F4
/* 409E0 800501E0 2F000224 */   addiu     $v0, $zero, 0x2F
/* 409E4 800501E4 03008210 */  beq        $a0, $v0, .L800501F4
/* 409E8 800501E8 04000224 */   addiu     $v0, $zero, 0x4
/* 409EC 800501EC 03008214 */  bne        $a0, $v0, .L800501FC
/* 409F0 800501F0 00000000 */   nop
.L800501F4:
/* 409F4 800501F4 0800E003 */  jr         $ra
/* 409F8 800501F8 01000224 */   addiu     $v0, $zero, 0x1
.L800501FC:
/* 409FC 800501FC 0800E003 */  jr         $ra
/* 40A00 80050200 21100000 */   addu      $v0, $zero, $zero
.size MEMPACK_RelocatableType, . - MEMPACK_RelocatableType
