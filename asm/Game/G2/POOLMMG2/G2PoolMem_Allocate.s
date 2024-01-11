.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2PoolMem_Allocate
/* 86784 80095F84 21288000 */  addu       $a1, $a0, $zero
/* 86788 80095F88 0200A294 */  lhu        $v0, 0x2($a1)
/* 8678C 80095F8C 0400A394 */  lhu        $v1, 0x4($a1)
/* 86790 80095F90 00000000 */  nop
/* 86794 80095F94 2B104300 */  sltu       $v0, $v0, $v1
/* 86798 80095F98 0F004010 */  beqz       $v0, .L80095FD8
/* 8679C 80095F9C 00000000 */   nop
/* 867A0 80095FA0 0200A394 */  lhu        $v1, 0x2($a1)
/* 867A4 80095FA4 0800A48C */  lw         $a0, 0x8($a1)
/* 867A8 80095FA8 40100300 */  sll        $v0, $v1, 1
/* 867AC 80095FAC 21104400 */  addu       $v0, $v0, $a0
/* 867B0 80095FB0 00004494 */  lhu        $a0, 0x0($v0)
/* 867B4 80095FB4 0000A294 */  lhu        $v0, 0x0($a1)
/* 867B8 80095FB8 00000000 */  nop
/* 867BC 80095FBC 18004400 */  mult       $v0, $a0
/* 867C0 80095FC0 01006324 */  addiu      $v1, $v1, 0x1
/* 867C4 80095FC4 0200A3A4 */  sh         $v1, 0x2($a1)
/* 867C8 80095FC8 0C00A28C */  lw         $v0, 0xC($a1)
/* 867CC 80095FCC 12300000 */  mflo       $a2
/* 867D0 80095FD0 0800E003 */  jr         $ra
/* 867D4 80095FD4 21104600 */   addu      $v0, $v0, $a2
.L80095FD8:
/* 867D8 80095FD8 0800E003 */  jr         $ra
/* 867DC 80095FDC 21100000 */   addu      $v0, $zero, $zero
.size G2PoolMem_Allocate, . - G2PoolMem_Allocate
