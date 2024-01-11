.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_WithinXYBounds
/* F7D0 8001EFD0 00008384 */  lh         $v1, 0x0($a0)
/* F7D4 8001EFD4 0400A284 */  lh         $v0, 0x4($a1)
/* F7D8 8001EFD8 00000000 */  nop
/* F7DC 8001EFDC 2A106200 */  slt        $v0, $v1, $v0
/* F7E0 8001EFE0 10004014 */  bnez       $v0, .L8001F024
/* F7E4 8001EFE4 21300000 */   addu      $a2, $zero, $zero
/* F7E8 8001EFE8 0A00A284 */  lh         $v0, 0xA($a1)
/* F7EC 8001EFEC 00000000 */  nop
/* F7F0 8001EFF0 2A104300 */  slt        $v0, $v0, $v1
/* F7F4 8001EFF4 0B004014 */  bnez       $v0, .L8001F024
/* F7F8 8001EFF8 00000000 */   nop
/* F7FC 8001EFFC 02008484 */  lh         $a0, 0x2($a0)
/* F800 8001F000 0600A284 */  lh         $v0, 0x6($a1)
/* F804 8001F004 00000000 */  nop
/* F808 8001F008 2A108200 */  slt        $v0, $a0, $v0
/* F80C 8001F00C 05004014 */  bnez       $v0, .L8001F024
/* F810 8001F010 00000000 */   nop
/* F814 8001F014 0C00A284 */  lh         $v0, 0xC($a1)
/* F818 8001F018 00000000 */  nop
/* F81C 8001F01C 2A104400 */  slt        $v0, $v0, $a0
/* F820 8001F020 01004638 */  xori       $a2, $v0, 0x1
.L8001F024:
/* F824 8001F024 0800E003 */  jr         $ra
/* F828 8001F028 2110C000 */   addu      $v0, $a2, $zero
.size COLLIDE_WithinXYBounds, . - COLLIDE_WithinXYBounds
