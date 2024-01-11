.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_WithinXZBounds
/* F774 8001EF74 00008384 */  lh         $v1, 0x0($a0)
/* F778 8001EF78 0400A284 */  lh         $v0, 0x4($a1)
/* F77C 8001EF7C 00000000 */  nop
/* F780 8001EF80 2A106200 */  slt        $v0, $v1, $v0
/* F784 8001EF84 10004014 */  bnez       $v0, .L8001EFC8
/* F788 8001EF88 21300000 */   addu      $a2, $zero, $zero
/* F78C 8001EF8C 0A00A284 */  lh         $v0, 0xA($a1)
/* F790 8001EF90 00000000 */  nop
/* F794 8001EF94 2A104300 */  slt        $v0, $v0, $v1
/* F798 8001EF98 0B004014 */  bnez       $v0, .L8001EFC8
/* F79C 8001EF9C 00000000 */   nop
/* F7A0 8001EFA0 04008484 */  lh         $a0, 0x4($a0)
/* F7A4 8001EFA4 0800A284 */  lh         $v0, 0x8($a1)
/* F7A8 8001EFA8 00000000 */  nop
/* F7AC 8001EFAC 2A108200 */  slt        $v0, $a0, $v0
/* F7B0 8001EFB0 05004014 */  bnez       $v0, .L8001EFC8
/* F7B4 8001EFB4 00000000 */   nop
/* F7B8 8001EFB8 0E00A284 */  lh         $v0, 0xE($a1)
/* F7BC 8001EFBC 00000000 */  nop
/* F7C0 8001EFC0 2A104400 */  slt        $v0, $v0, $a0
/* F7C4 8001EFC4 01004638 */  xori       $a2, $v0, 0x1
.L8001EFC8:
/* F7C8 8001EFC8 0800E003 */  jr         $ra
/* F7CC 8001EFCC 2110C000 */   addu      $v0, $a2, $zero
.size COLLIDE_WithinXZBounds, . - COLLIDE_WithinXZBounds
