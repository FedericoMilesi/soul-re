.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_TurnOnSphereCollisions
/* 74748 80083F48 26018284 */  lh         $v0, 0x126($a0)
/* 7474C 80083F4C 0001838C */  lw         $v1, 0x100($a0)
/* 74750 80083F50 C0100200 */  sll        $v0, $v0, 3
/* 74754 80083F54 21186200 */  addu       $v1, $v1, $v0
/* 74758 80083F58 0400648C */  lw         $a0, 0x4($v1)
/* 7475C 80083F5C 00000000 */  nop
/* 74760 80083F60 0E008010 */  beqz       $a0, .L80083F9C
/* 74764 80083F64 00000000 */   nop
/* 74768 80083F68 0000638C */  lw         $v1, 0x0($v1)
/* 7476C 80083F6C 00000000 */  nop
/* 74770 80083F70 01006290 */  lbu        $v0, 0x1($v1)
/* 74774 80083F74 00000000 */  nop
/* 74778 80083F78 20004230 */  andi       $v0, $v0, 0x20
/* 7477C 80083F7C 07004014 */  bnez       $v0, .L80083F9C
/* 74780 80083F80 01006324 */   addiu     $v1, $v1, 0x1
.L80083F84:
/* 74784 80083F84 00006290 */  lbu        $v0, 0x0($v1)
/* 74788 80083F88 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 7478C 80083F8C 20004234 */  ori        $v0, $v0, 0x20
/* 74790 80083F90 000062A0 */  sb         $v0, 0x0($v1)
/* 74794 80083F94 FBFF8014 */  bnez       $a0, .L80083F84
/* 74798 80083F98 08006324 */   addiu     $v1, $v1, 0x8
.L80083F9C:
/* 7479C 80083F9C 0800E003 */  jr         $ra
/* 747A0 80083FA0 00000000 */   nop
.size MON_TurnOnSphereCollisions, . - MON_TurnOnSphereCollisions
