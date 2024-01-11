.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_AddNodeOfTypeToPool
/* 88724 80097F24 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 88728 80097F28 3000B0AF */  sw         $s0, 0x30($sp)
/* 8872C 80097F2C 21808000 */  addu       $s0, $a0, $zero
/* 88730 80097F30 3800B2AF */  sw         $s2, 0x38($sp)
/* 88734 80097F34 3400B1AF */  sw         $s1, 0x34($sp)
/* 88738 80097F38 D8BF918F */  lw         $s1, %gp_rel(gameTrackerX + 0x210)($gp)
/* 8873C 80097F3C 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 88740 80097F40 F962020C */  jal        PLANCOLL_CheckUnderwaterPoint
/* 88744 80097F44 2190A000 */   addu      $s2, $a1, $zero
/* 88748 80097F48 21184000 */  addu       $v1, $v0, $zero
/* 8874C 80097F4C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 88750 80097F50 07006210 */  beq        $v1, $v0, .L80097F70
/* 88754 80097F54 21200002 */   addu      $a0, $s0, $zero
/* 88758 80097F58 1000A3AF */  sw         $v1, 0x10($sp)
/* 8875C 80097F5C 21282002 */  addu       $a1, $s1, $zero
/* 88760 80097F60 07004632 */  andi       $a2, $s2, 0x7
/* 88764 80097F64 1800C634 */  ori        $a2, $a2, 0x18
/* 88768 80097F68 F85F0208 */  j          .L80097FE0
/* 8876C 80097F6C 21380000 */   addu      $a3, $zero, $zero
.L80097F70:
/* 88770 80097F70 1800A427 */  addiu      $a0, $sp, 0x18
/* 88774 80097F74 2800A527 */  addiu      $a1, $sp, 0x28
/* 88778 80097F78 00010624 */  addiu      $a2, $zero, 0x100
/* 8877C 80097F7C 80FD0724 */  addiu      $a3, $zero, -0x280
/* 88780 80097F80 00000296 */  lhu        $v0, 0x0($s0)
/* 88784 80097F84 02000396 */  lhu        $v1, 0x2($s0)
/* 88788 80097F88 04000896 */  lhu        $t0, 0x4($s0)
/* 8878C 80097F8C 2000B027 */  addiu      $s0, $sp, 0x20
/* 88790 80097F90 2000A2A7 */  sh         $v0, 0x20($sp)
/* 88794 80097F94 05000224 */  addiu      $v0, $zero, 0x5
/* 88798 80097F98 020003A6 */  sh         $v1, 0x2($s0)
/* 8879C 80097F9C 040008A6 */  sh         $t0, 0x4($s0)
/* 887A0 80097FA0 1000A0AF */  sw         $zero, 0x10($sp)
/* 887A4 80097FA4 5463020C */  jal        PLANCOLL_FindTerrainHitFinal
/* 887A8 80097FA8 1400A2AF */   sw        $v0, 0x14($sp)
/* 887AC 80097FAC 03004014 */  bnez       $v0, .L80097FBC
/* 887B0 80097FB0 21200002 */   addu      $a0, $s0, $zero
/* 887B4 80097FB4 FB5F0208 */  j          .L80097FEC
/* 887B8 80097FB8 21100000 */   addu      $v0, $zero, $zero
.L80097FBC:
/* 887BC 80097FBC 21282002 */  addu       $a1, $s1, $zero
/* 887C0 80097FC0 21380000 */  addu       $a3, $zero, $zero
/* 887C4 80097FC4 07004232 */  andi       $v0, $s2, 0x7
/* 887C8 80097FC8 2800A697 */  lhu        $a2, 0x28($sp)
/* 887CC 80097FCC 1800A38F */  lw         $v1, 0x18($sp)
/* 887D0 80097FD0 0300C630 */  andi       $a2, $a2, 0x3
/* 887D4 80097FD4 C0300600 */  sll        $a2, $a2, 3
/* 887D8 80097FD8 2530C200 */  or         $a2, $a2, $v0
/* 887DC 80097FDC 1000A3AF */  sw         $v1, 0x10($sp)
.L80097FE0:
/* 887E0 80097FE0 AE66020C */  jal        PLANPOOL_AddNodeToPool
/* 887E4 80097FE4 00000000 */   nop
/* 887E8 80097FE8 01000224 */  addiu      $v0, $zero, 0x1
.L80097FEC:
/* 887EC 80097FEC 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 887F0 80097FF0 3800B28F */  lw         $s2, 0x38($sp)
/* 887F4 80097FF4 3400B18F */  lw         $s1, 0x34($sp)
/* 887F8 80097FF8 3000B08F */  lw         $s0, 0x30($sp)
/* 887FC 80097FFC 0800E003 */  jr         $ra
/* 88800 80098000 4000BD27 */   addiu     $sp, $sp, 0x40
.size PLANAPI_AddNodeOfTypeToPool, . - PLANAPI_AddNodeOfTypeToPool
