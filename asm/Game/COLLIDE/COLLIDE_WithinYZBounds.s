.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_WithinYZBounds
/* F718 8001EF18 02008384 */  lh         $v1, 0x2($a0)
/* F71C 8001EF1C 0600A284 */  lh         $v0, 0x6($a1)
/* F720 8001EF20 00000000 */  nop
/* F724 8001EF24 2A106200 */  slt        $v0, $v1, $v0
/* F728 8001EF28 10004014 */  bnez       $v0, .L8001EF6C
/* F72C 8001EF2C 21300000 */   addu      $a2, $zero, $zero
/* F730 8001EF30 0C00A284 */  lh         $v0, 0xC($a1)
/* F734 8001EF34 00000000 */  nop
/* F738 8001EF38 2A104300 */  slt        $v0, $v0, $v1
/* F73C 8001EF3C 0B004014 */  bnez       $v0, .L8001EF6C
/* F740 8001EF40 00000000 */   nop
/* F744 8001EF44 04008484 */  lh         $a0, 0x4($a0)
/* F748 8001EF48 0800A284 */  lh         $v0, 0x8($a1)
/* F74C 8001EF4C 00000000 */  nop
/* F750 8001EF50 2A108200 */  slt        $v0, $a0, $v0
/* F754 8001EF54 05004014 */  bnez       $v0, .L8001EF6C
/* F758 8001EF58 00000000 */   nop
/* F75C 8001EF5C 0E00A284 */  lh         $v0, 0xE($a1)
/* F760 8001EF60 00000000 */  nop
/* F764 8001EF64 2A104400 */  slt        $v0, $v0, $a0
/* F768 8001EF68 01004638 */  xori       $a2, $v0, 0x1
.L8001EF6C:
/* F76C 8001EF6C 0800E003 */  jr         $ra
/* F770 8001EF70 2110C000 */   addu      $v0, $a2, $zero
.size COLLIDE_WithinYZBounds, . - COLLIDE_WithinYZBounds
