.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strcmp
/* AE60C 800BDE0C 03008010 */  beqz       $a0, .L800BDE1C
/* AE610 800BDE10 00000000 */   nop
/* AE614 800BDE14 0B00A014 */  bnez       $a1, .L800BDE44
/* AE618 800BDE18 00000000 */   nop
.L800BDE1C:
/* AE61C 800BDE1C 12008510 */  beq        $a0, $a1, .L800BDE68
/* AE620 800BDE20 21100000 */   addu      $v0, $zero, $zero
/* AE624 800BDE24 10008010 */  beqz       $a0, .L800BDE68
/* AE628 800BDE28 FFFF0224 */   addiu     $v0, $zero, -0x1
/* AE62C 800BDE2C 9AF70208 */  j          .L800BDE68
/* AE630 800BDE30 01000224 */   addiu     $v0, $zero, 0x1
.L800BDE34:
/* AE634 800BDE34 9AF70208 */  j          .L800BDE68
/* AE638 800BDE38 21100000 */   addu      $v0, $zero, $zero
.L800BDE3C:
/* AE63C 800BDE3C FDFFC010 */  beqz       $a2, .L800BDE34
/* AE640 800BDE40 01008424 */   addiu     $a0, $a0, 0x1
.L800BDE44:
/* AE644 800BDE44 0000A380 */  lb         $v1, 0x0($a1)
/* AE648 800BDE48 00008280 */  lb         $v0, 0x0($a0)
/* AE64C 800BDE4C 00008690 */  lbu        $a2, 0x0($a0)
/* AE650 800BDE50 FAFF4310 */  beq        $v0, $v1, .L800BDE3C
/* AE654 800BDE54 0100A524 */   addiu     $a1, $a1, 0x1
/* AE658 800BDE58 00008380 */  lb         $v1, 0x0($a0)
/* AE65C 800BDE5C FFFFA280 */  lb         $v0, -0x1($a1)
/* AE660 800BDE60 00000000 */  nop
/* AE664 800BDE64 23106200 */  subu       $v0, $v1, $v0
.L800BDE68:
/* AE668 800BDE68 0800E003 */  jr         $ra
/* AE66C 800BDE6C 00000000 */   nop
/* AE670 800BDE70 00000000 */  nop
/* AE674 800BDE74 00000000 */  nop
/* AE678 800BDE78 00000000 */  nop
.size strcmp, . - strcmp
