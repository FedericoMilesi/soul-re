.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_NormalizeMatrix
/* 2B4A4 8003ACA4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2B4A8 8003ACA8 2400B1AF */  sw         $s1, 0x24($sp)
/* 2B4AC 8003ACAC 21888000 */  addu       $s1, $a0, $zero
/* 2B4B0 8003ACB0 2000B0AF */  sw         $s0, 0x20($sp)
/* 2B4B4 8003ACB4 2180A000 */  addu       $s0, $a1, $zero
/* 2B4B8 8003ACB8 21200002 */  addu       $a0, $s0, $zero
/* 2B4BC 8003ACBC 2800BFAF */  sw         $ra, 0x28($sp)
/* 2B4C0 8003ACC0 1AEB000C */  jal        PIPE3D_MatrixColumnLength
/* 2B4C4 8003ACC4 21280000 */   addu      $a1, $zero, $zero
/* 2B4C8 8003ACC8 21184000 */  addu       $v1, $v0, $zero
/* 2B4CC 8003ACCC 03006010 */  beqz       $v1, .L8003ACDC
/* 2B4D0 8003ACD0 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 2B4D4 8003ACD4 1A004300 */  div        $zero, $v0, $v1
/* 2B4D8 8003ACD8 12180000 */  mflo       $v1
.L8003ACDC:
/* 2B4DC 8003ACDC 00000000 */  nop
/* 2B4E0 8003ACE0 1000A3AF */  sw         $v1, 0x10($sp)
/* 2B4E4 8003ACE4 21200002 */  addu       $a0, $s0, $zero
/* 2B4E8 8003ACE8 1AEB000C */  jal        PIPE3D_MatrixColumnLength
/* 2B4EC 8003ACEC 01000524 */   addiu     $a1, $zero, 0x1
/* 2B4F0 8003ACF0 21184000 */  addu       $v1, $v0, $zero
/* 2B4F4 8003ACF4 03006010 */  beqz       $v1, .L8003AD04
/* 2B4F8 8003ACF8 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 2B4FC 8003ACFC 1A004300 */  div        $zero, $v0, $v1
/* 2B500 8003AD00 12180000 */  mflo       $v1
.L8003AD04:
/* 2B504 8003AD04 00000000 */  nop
/* 2B508 8003AD08 1400A3AF */  sw         $v1, 0x14($sp)
/* 2B50C 8003AD0C 21200002 */  addu       $a0, $s0, $zero
/* 2B510 8003AD10 1AEB000C */  jal        PIPE3D_MatrixColumnLength
/* 2B514 8003AD14 02000524 */   addiu     $a1, $zero, 0x2
/* 2B518 8003AD18 21184000 */  addu       $v1, $v0, $zero
/* 2B51C 8003AD1C 03006010 */  beqz       $v1, .L8003AD2C
/* 2B520 8003AD20 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 2B524 8003AD24 1A004300 */  div        $zero, $v0, $v1
/* 2B528 8003AD28 12180000 */  mflo       $v1
.L8003AD2C:
/* 2B52C 8003AD2C 21202002 */  addu       $a0, $s1, $zero
/* 2B530 8003AD30 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B534 8003AD34 1800A3AF */  sw         $v1, 0x18($sp)
/* 2B538 8003AD38 1400068E */  lw         $a2, 0x14($s0)
/* 2B53C 8003AD3C 1800078E */  lw         $a3, 0x18($s0)
/* 2B540 8003AD40 1C00088E */  lw         $t0, 0x1C($s0)
/* 2B544 8003AD44 140086AC */  sw         $a2, 0x14($a0)
/* 2B548 8003AD48 180087AC */  sw         $a3, 0x18($a0)
/* 2B54C 8003AD4C 1C0088AC */  sw         $t0, 0x1C($a0)
/* 2B550 8003AD50 0000068E */  lw         $a2, 0x0($s0)
/* 2B554 8003AD54 0400078E */  lw         $a3, 0x4($s0)
/* 2B558 8003AD58 0800088E */  lw         $t0, 0x8($s0)
/* 2B55C 8003AD5C 0C00098E */  lw         $t1, 0xC($s0)
/* 2B560 8003AD60 000086AC */  sw         $a2, 0x0($a0)
/* 2B564 8003AD64 040087AC */  sw         $a3, 0x4($a0)
/* 2B568 8003AD68 080088AC */  sw         $t0, 0x8($a0)
/* 2B56C 8003AD6C 0C0089AC */  sw         $t1, 0xC($a0)
/* 2B570 8003AD70 1000068E */  lw         $a2, 0x10($s0)
/* 2B574 8003AD74 96E4010C */  jal        func_80079258
/* 2B578 8003AD78 100086AC */   sw        $a2, 0x10($a0)
/* 2B57C 8003AD7C 2800BF8F */  lw         $ra, 0x28($sp)
/* 2B580 8003AD80 2400B18F */  lw         $s1, 0x24($sp)
/* 2B584 8003AD84 2000B08F */  lw         $s0, 0x20($sp)
/* 2B588 8003AD88 0800E003 */  jr         $ra
/* 2B58C 8003AD8C 3000BD27 */   addiu     $sp, $sp, 0x30
.size PIPE3D_NormalizeMatrix, . - PIPE3D_NormalizeMatrix
