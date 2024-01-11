.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExtractLevelNum
/* 28F54 80038754 0000A390 */  lbu        $v1, 0x0($a1)
/* 28F58 80038758 2D000224 */  addiu      $v0, $zero, 0x2D
/* 28F5C 8003875C 0A006210 */  beq        $v1, $v0, .L80038788
/* 28F60 80038760 21304000 */   addu      $a2, $v0, $zero
/* 28F64 80038764 D0FF6224 */  addiu      $v0, $v1, -0x30
.L80038768:
/* 28F68 80038768 0A00422C */  sltiu      $v0, $v0, 0xA
/* 28F6C 8003876C 09004014 */  bnez       $v0, .L80038794
/* 28F70 80038770 00000000 */   nop
/* 28F74 80038774 0100A524 */  addiu      $a1, $a1, 0x1
/* 28F78 80038778 0000A390 */  lbu        $v1, 0x0($a1)
/* 28F7C 8003877C 00000000 */  nop
/* 28F80 80038780 F9FF6614 */  bne        $v1, $a2, .L80038768
/* 28F84 80038784 D0FF6224 */   addiu     $v0, $v1, -0x30
.L80038788:
/* 28F88 80038788 0000A290 */  lbu        $v0, 0x0($a1)
/* 28F8C 8003878C EBE10008 */  j          .L800387AC
/* 28F90 80038790 D0FF4224 */   addiu     $v0, $v0, -0x30
.L80038794:
/* 28F94 80038794 0000A290 */  lbu        $v0, 0x0($a1)
/* 28F98 80038798 0100A524 */  addiu      $a1, $a1, 0x1
/* 28F9C 8003879C 000082A0 */  sb         $v0, 0x0($a0)
/* 28FA0 800387A0 0000A290 */  lbu        $v0, 0x0($a1)
/* 28FA4 800387A4 01008424 */  addiu      $a0, $a0, 0x1
/* 28FA8 800387A8 D0FF4224 */  addiu      $v0, $v0, -0x30
.L800387AC:
/* 28FAC 800387AC 0A00422C */  sltiu      $v0, $v0, 0xA
/* 28FB0 800387B0 F8FF4014 */  bnez       $v0, .L80038794
/* 28FB4 800387B4 00000000 */   nop
/* 28FB8 800387B8 0800E003 */  jr         $ra
/* 28FBC 800387BC 000080A0 */   sb        $zero, 0x0($a0)
.size ExtractLevelNum, . - ExtractLevelNum
