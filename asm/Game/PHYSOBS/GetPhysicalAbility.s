.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPhysicalAbility
/* 59780 80068F80 2400858C */  lw         $a1, 0x24($a0)
/* 59784 80068F84 00000000 */  nop
/* 59788 80068F88 1100A010 */  beqz       $a1, .L80068FD0
/* 5978C 80068F8C 0BB00234 */   ori       $v0, $zero, 0xB00B
/* 59790 80068F90 0400A394 */  lhu        $v1, 0x4($a1)
/* 59794 80068F94 00000000 */  nop
/* 59798 80068F98 0D006214 */  bne        $v1, $v0, .L80068FD0
/* 5979C 80068F9C 03000224 */   addiu     $v0, $zero, 0x3
/* 597A0 80068FA0 0200A394 */  lhu        $v1, 0x2($a1)
/* 597A4 80068FA4 00000000 */  nop
/* 597A8 80068FA8 06006214 */  bne        $v1, $v0, .L80068FC4
/* 597AC 80068FAC 00000000 */   nop
/* 597B0 80068FB0 6C01828C */  lw         $v0, 0x16C($a0)
/* 597B4 80068FB4 00000000 */  nop
/* 597B8 80068FB8 04004284 */  lh         $v0, 0x4($v0)
/* 597BC 80068FBC 0800E003 */  jr         $ra
/* 597C0 80068FC0 00000000 */   nop
.L80068FC4:
/* 597C4 80068FC4 0600A294 */  lhu        $v0, 0x6($a1)
/* 597C8 80068FC8 0800E003 */  jr         $ra
/* 597CC 80068FCC 00000000 */   nop
.L80068FD0:
/* 597D0 80068FD0 0800E003 */  jr         $ra
/* 597D4 80068FD4 21100000 */   addu      $v0, $zero, $zero
.size GetPhysicalAbility, . - GetPhysicalAbility
