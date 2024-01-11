.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0580
/* B0D80 800C0580 67010308 */  j          .L800C059C
/* B0D84 800C0584 00000000 */   nop
.L800C0588:
/* B0D88 800C0588 FFFFC624 */  addiu      $a2, $a2, -0x1
/* B0D8C 800C058C 0300C01C */  bgtz       $a2, .L800C059C
/* B0D90 800C0590 0100A524 */   addiu     $a1, $a1, 0x1
/* B0D94 800C0594 71010308 */  j          .L800C05C4
/* B0D98 800C0598 21100000 */   addu      $v0, $zero, $zero
.L800C059C:
/* B0D9C 800C059C 00008390 */  lbu        $v1, 0x0($a0)
/* B0DA0 800C05A0 0000A290 */  lbu        $v0, 0x0($a1)
/* B0DA4 800C05A4 00000000 */  nop
/* B0DA8 800C05A8 F7FF6210 */  beq        $v1, $v0, .L800C0588
/* B0DAC 800C05AC 01008424 */   addiu     $a0, $a0, 0x1
/* B0DB0 800C05B0 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B0DB4 800C05B4 00008390 */  lbu        $v1, 0x0($a0)
/* B0DB8 800C05B8 0000A290 */  lbu        $v0, 0x0($a1)
/* B0DBC 800C05BC 00000000 */  nop
/* B0DC0 800C05C0 23106200 */  subu       $v0, $v1, $v0
.L800C05C4:
/* B0DC4 800C05C4 0800E003 */  jr         $ra
/* B0DC8 800C05C8 00000000 */   nop
/* B0DCC 800C05CC 00000000 */  nop
.size func_800C0580, . - func_800C0580
