.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOffSphereCollisions
/* 746EC 80083EEC 26018284 */  lh         $v0, 0x126($a0)
/* 746F0 80083EF0 0001838C */  lw         $v1, 0x100($a0)
/* 746F4 80083EF4 C0100200 */  sll        $v0, $v0, 3
/* 746F8 80083EF8 21186200 */  addu       $v1, $v1, $v0
/* 746FC 80083EFC 0400648C */  lw         $a0, 0x4($v1)
/* 74700 80083F00 00000000 */  nop
/* 74704 80083F04 0E008010 */  beqz       $a0, .L80083F40
/* 74708 80083F08 00000000 */   nop
/* 7470C 80083F0C 0000638C */  lw         $v1, 0x0($v1)
/* 74710 80083F10 00000000 */  nop
/* 74714 80083F14 01006290 */  lbu        $v0, 0x1($v1)
/* 74718 80083F18 00000000 */  nop
/* 7471C 80083F1C 20004230 */  andi       $v0, $v0, 0x20
/* 74720 80083F20 07004010 */  beqz       $v0, .L80083F40
/* 74724 80083F24 01006324 */   addiu     $v1, $v1, 0x1
.L80083F28:
/* 74728 80083F28 00006290 */  lbu        $v0, 0x0($v1)
/* 7472C 80083F2C FFFF8424 */  addiu      $a0, $a0, -0x1
/* 74730 80083F30 DF004230 */  andi       $v0, $v0, 0xDF
/* 74734 80083F34 000062A0 */  sb         $v0, 0x0($v1)
/* 74738 80083F38 FBFF8014 */  bnez       $a0, .L80083F28
/* 7473C 80083F3C 08006324 */   addiu     $v1, $v1, 0x8
.L80083F40:
/* 74740 80083F40 0800E003 */  jr         $ra
/* 74744 80083F44 00000000 */   nop
.size MON_TurnOffSphereCollisions, . - MON_TurnOffSphereCollisions
