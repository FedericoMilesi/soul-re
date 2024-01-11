.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memmove
/* B0EF4 800C06F4 21388000 */  addu       $a3, $a0, $zero
/* B0EF8 800C06F8 2B10E500 */  sltu       $v0, $a3, $a1
/* B0EFC 800C06FC 0C004014 */  bnez       $v0, .L800C0730
/* B0F00 800C0700 2110C000 */   addu      $v0, $a2, $zero
/* B0F04 800C0704 13004018 */  blez       $v0, .L800C0754
/* B0F08 800C0708 FFFFC624 */   addiu     $a2, $a2, -0x1
.L800C070C:
/* B0F0C 800C070C 2120E600 */  addu       $a0, $a3, $a2
/* B0F10 800C0710 2110A600 */  addu       $v0, $a1, $a2
/* B0F14 800C0714 2118C000 */  addu       $v1, $a2, $zero
/* B0F18 800C0718 00004290 */  lbu        $v0, 0x0($v0)
/* B0F1C 800C071C FFFFC624 */  addiu      $a2, $a2, -0x1
/* B0F20 800C0720 FAFF601C */  bgtz       $v1, .L800C070C
/* B0F24 800C0724 000082A0 */   sb        $v0, 0x0($a0)
/* B0F28 800C0728 D6010308 */  j          .L800C0758
/* B0F2C 800C072C 2110E000 */   addu      $v0, $a3, $zero
.L800C0730:
/* B0F30 800C0730 08004018 */  blez       $v0, .L800C0754
/* B0F34 800C0734 FFFFC624 */   addiu     $a2, $a2, -0x1
.L800C0738:
/* B0F38 800C0738 0000A290 */  lbu        $v0, 0x0($a1)
/* B0F3C 800C073C 0100A524 */  addiu      $a1, $a1, 0x1
/* B0F40 800C0740 2118C000 */  addu       $v1, $a2, $zero
/* B0F44 800C0744 FFFFC624 */  addiu      $a2, $a2, -0x1
/* B0F48 800C0748 0000E2A0 */  sb         $v0, 0x0($a3)
/* B0F4C 800C074C FAFF601C */  bgtz       $v1, .L800C0738
/* B0F50 800C0750 0100E724 */   addiu     $a3, $a3, 0x1
.L800C0754:
/* B0F54 800C0754 2110E000 */  addu       $v0, $a3, $zero
.L800C0758:
/* B0F58 800C0758 0800E003 */  jr         $ra
/* B0F5C 800C075C 00000000 */   nop
/* B0F60 800C0760 00000000 */  nop
.size memmove, . - memmove
