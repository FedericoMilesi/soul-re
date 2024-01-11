.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExtractWorldName
/* 28F08 80038708 0000A390 */  lbu        $v1, 0x0($a1)
/* 28F0C 8003870C 2D000224 */  addiu      $v0, $zero, 0x2D
/* 28F10 80038710 0E006210 */  beq        $v1, $v0, .L8003874C
/* 28F14 80038714 21304000 */   addu      $a2, $v0, $zero
.L80038718:
/* 28F18 80038718 BFFF6224 */  addiu      $v0, $v1, -0x41
/* 28F1C 8003871C 1A00422C */  sltiu      $v0, $v0, 0x1A
/* 28F20 80038720 04004014 */  bnez       $v0, .L80038734
/* 28F24 80038724 9FFF6224 */   addiu     $v0, $v1, -0x61
/* 28F28 80038728 1A00422C */  sltiu      $v0, $v0, 0x1A
/* 28F2C 8003872C 07004010 */  beqz       $v0, .L8003874C
/* 28F30 80038730 00000000 */   nop
.L80038734:
/* 28F34 80038734 0100A524 */  addiu      $a1, $a1, 0x1
/* 28F38 80038738 000083A0 */  sb         $v1, 0x0($a0)
/* 28F3C 8003873C 0000A390 */  lbu        $v1, 0x0($a1)
/* 28F40 80038740 00000000 */  nop
/* 28F44 80038744 F4FF6614 */  bne        $v1, $a2, .L80038718
/* 28F48 80038748 01008424 */   addiu     $a0, $a0, 0x1
.L8003874C:
/* 28F4C 8003874C 0800E003 */  jr         $ra
/* 28F50 80038750 000080A0 */   sb        $zero, 0x0($a0)
.size ExtractWorldName, . - ExtractWorldName
