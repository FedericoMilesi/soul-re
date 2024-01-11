.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Wander
/* 7B4B8 8008ACB8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7B4BC 8008ACBC 1800B2AF */  sw         $s2, 0x18($sp)
/* 7B4C0 8008ACC0 21908000 */  addu       $s2, $a0, $zero
/* 7B4C4 8008ACC4 2000BFAF */  sw         $ra, 0x20($sp)
/* 7B4C8 8008ACC8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7B4CC 8008ACCC 1400B1AF */  sw         $s1, 0x14($sp)
/* 7B4D0 8008ACD0 1000B0AF */  sw         $s0, 0x10($sp)
/* 7B4D4 8008ACD4 6C01518E */  lw         $s1, 0x16C($s2)
/* 7B4D8 8008ACD8 00000000 */  nop
/* 7B4DC 8008ACDC 0000238E */  lw         $v1, 0x0($s1)
/* 7B4E0 8008ACE0 00000000 */  nop
/* 7B4E4 8008ACE4 04006230 */  andi       $v0, $v1, 0x4
/* 7B4E8 8008ACE8 18004010 */  beqz       $v0, .L8008AD4C
/* 7B4EC 8008ACEC 0400133C */   lui       $s3, (0x40000 >> 16)
/* 7B4F0 8008ACF0 6801228E */  lw         $v0, 0x168($s1)
/* 7B4F4 8008ACF4 00000000 */  nop
/* 7B4F8 8008ACF8 1E004684 */  lh         $a2, 0x1E($v0)
/* 7B4FC 8008ACFC 6604020C */  jal        MON_TurnToPosition
/* 7B500 8008AD00 24012526 */   addiu     $a1, $s1, 0x124
/* 7B504 8008AD04 5C004286 */  lh         $v0, 0x5C($s2)
/* 7B508 8008AD08 24012486 */  lh         $a0, 0x124($s1)
/* 7B50C 8008AD0C 5E004386 */  lh         $v1, 0x5E($s2)
/* 7B510 8008AD10 26012586 */  lh         $a1, 0x126($s1)
/* 7B514 8008AD14 28012686 */  lh         $a2, 0x128($s1)
/* 7B518 8008AD18 23204400 */  subu       $a0, $v0, $a0
/* 7B51C 8008AD1C 60004286 */  lh         $v0, 0x60($s2)
/* 7B520 8008AD20 23286500 */  subu       $a1, $v1, $a1
/* 7B524 8008AD24 B7E6000C */  jal        MATH3D_LengthXYZ
/* 7B528 8008AD28 23304600 */   subu      $a2, $v0, $a2
/* 7B52C 8008AD2C 2C014228 */  slti       $v0, $v0, 0x12C
/* 7B530 8008AD30 40004010 */  beqz       $v0, .L8008AE34
/* 7B534 8008AD34 00000000 */   nop
.L8008AD38:
/* 7B538 8008AD38 21204002 */  addu       $a0, $s2, $zero
/* 7B53C 8008AD3C 91FE010C */  jal        MON_SwitchState
/* 7B540 8008AD40 02000524 */   addiu     $a1, $zero, 0x2
/* 7B544 8008AD44 8D2B0208 */  j          .L8008AE34
/* 7B548 8008AD48 00000000 */   nop
.L8008AD4C:
/* 7B54C 8008AD4C 24107300 */  and        $v0, $v1, $s3
/* 7B550 8008AD50 3C004014 */  bnez       $v0, .L8008AE44
/* 7B554 8008AD54 21204002 */   addu      $a0, $s2, $zero
/* 7B558 8008AD58 9006020C */  jal        MON_GetTime
/* 7B55C 8008AD5C 21204002 */   addu      $a0, $s2, $zero
/* 7B560 8008AD60 1401238E */  lw         $v1, 0x114($s1)
/* 7B564 8008AD64 00000000 */  nop
/* 7B568 8008AD68 2B186200 */  sltu       $v1, $v1, $v0
/* 7B56C 8008AD6C F2FF6014 */  bnez       $v1, .L8008AD38
/* 7B570 8008AD70 03000224 */   addiu     $v0, $zero, 0x3
/* 7B574 8008AD74 5A012392 */  lbu        $v1, 0x15A($s1)
/* 7B578 8008AD78 00000000 */  nop
/* 7B57C 8008AD7C 1C006214 */  bne        $v1, $v0, .L8008ADF0
/* 7B580 8008AD80 00000000 */   nop
/* 7B584 8008AD84 A001228E */  lw         $v0, 0x1A0($s1)
/* 7B588 8008AD88 00000000 */  nop
/* 7B58C 8008AD8C 29004010 */  beqz       $v0, .L8008AE34
/* 7B590 8008AD90 00000000 */   nop
/* 7B594 8008AD94 00005084 */  lh         $s0, 0x0($v0)
/* 7B598 8008AD98 02004224 */  addiu      $v0, $v0, 0x2
/* 7B59C 8008AD9C A00122AE */  sw         $v0, 0x1A0($s1)
/* 7B5A0 8008ADA0 3800448E */  lw         $a0, 0x38($s2)
/* 7B5A4 8008ADA4 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 7B5A8 8008ADA8 00000000 */   nop
/* 7B5AC 8008ADAC 21204000 */  addu       $a0, $v0, $zero
/* 7B5B0 8008ADB0 24012526 */  addiu      $a1, $s1, 0x124
/* 7B5B4 8008ADB4 21300002 */  addu       $a2, $s0, $zero
/* 7B5B8 8008ADB8 2E62020C */  jal        PLANAPI_FindNodePositionInUnit
/* 7B5BC 8008ADBC 21380000 */   addu      $a3, $zero, $zero
/* 7B5C0 8008ADC0 A001228E */  lw         $v0, 0x1A0($s1)
/* 7B5C4 8008ADC4 00000000 */  nop
/* 7B5C8 8008ADC8 00004284 */  lh         $v0, 0x0($v0)
/* 7B5CC 8008ADCC 00000000 */  nop
/* 7B5D0 8008ADD0 02004014 */  bnez       $v0, .L8008ADDC
/* 7B5D4 8008ADD4 88012226 */   addiu     $v0, $s1, 0x188
/* 7B5D8 8008ADD8 A00122AE */  sw         $v0, 0x1A0($s1)
.L8008ADDC:
/* 7B5DC 8008ADDC 0000228E */  lw         $v0, 0x0($s1)
/* 7B5E0 8008ADE0 00000000 */  nop
/* 7B5E4 8008ADE4 25105300 */  or         $v0, $v0, $s3
/* 7B5E8 8008ADE8 8D2B0208 */  j          .L8008AE34
/* 7B5EC 8008ADEC 000022AE */   sw        $v0, 0x0($s1)
.L8008ADF0:
/* 7B5F0 8008ADF0 C800238E */  lw         $v1, 0xC8($s1)
/* 7B5F4 8008ADF4 3A012696 */  lhu        $a2, 0x13A($s1)
/* 7B5F8 8008ADF8 05006010 */  beqz       $v1, .L8008AE10
/* 7B5FC 8008ADFC 21280000 */   addu      $a1, $zero, $zero
/* 7B600 8008AE00 0400628C */  lw         $v0, 0x4($v1)
/* 7B604 8008AE04 20030624 */  addiu      $a2, $zero, 0x320
/* 7B608 8008AE08 892B0208 */  j          .L8008AE24
/* 7B60C 8008AE0C 5C004524 */   addiu     $a1, $v0, 0x5C
.L8008AE10:
/* 7B610 8008AE10 2000438E */  lw         $v1, 0x20($s2)
/* 7B614 8008AE14 00000000 */  nop
/* 7B618 8008AE18 02006010 */  beqz       $v1, .L8008AE24
/* 7B61C 8008AE1C 00000000 */   nop
/* 7B620 8008AE20 20006524 */  addiu      $a1, $v1, 0x20
.L8008AE24:
/* 7B624 8008AE24 21204002 */  addu       $a0, $s2, $zero
/* 7B628 8008AE28 00340600 */  sll        $a2, $a2, 16
/* 7B62C 8008AE2C D803020C */  jal        MON_GetRandomDestinationInWorld
/* 7B630 8008AE30 03340600 */   sra       $a2, $a2, 16
.L8008AE34:
/* 7B634 8008AE34 6112020C */  jal        MON_GroundMoveQueueHandler
/* 7B638 8008AE38 21204002 */   addu      $a0, $s2, $zero
/* 7B63C 8008AE3C B52B0208 */  j          .L8008AED4
/* 7B640 8008AE40 00000000 */   nop
.L8008AE44:
/* 7B644 8008AE44 02000524 */  addiu      $a1, $zero, 0x2
/* 7B648 8008AE48 DA08020C */  jal        MON_DefaultPlanMovement
/* 7B64C 8008AE4C 64000624 */   addiu     $a2, $zero, 0x64
/* 7B650 8008AE50 21184000 */  addu       $v1, $v0, $zero
/* 7B654 8008AE54 0700622C */  sltiu      $v0, $v1, 0x7
/* 7B658 8008AE58 19004010 */  beqz       $v0, .L8008AEC0
/* 7B65C 8008AE5C FFFF0524 */   addiu     $a1, $zero, -0x1
/* 7B660 8008AE60 0180023C */  lui        $v0, %hi(jtbl_80012088)
/* 7B664 8008AE64 88204224 */  addiu      $v0, $v0, %lo(jtbl_80012088)
/* 7B668 8008AE68 80180300 */  sll        $v1, $v1, 2
/* 7B66C 8008AE6C 21186200 */  addu       $v1, $v1, $v0
/* 7B670 8008AE70 0000628C */  lw         $v0, 0x0($v1)
/* 7B674 8008AE74 00000000 */  nop
/* 7B678 8008AE78 08004000 */  jr         $v0
/* 7B67C 8008AE7C 00000000 */   nop
jlabel .L8008AE80
/* 7B680 8008AE80 5A012392 */  lbu        $v1, 0x15A($s1)
/* 7B684 8008AE84 04000224 */  addiu      $v0, $zero, 0x4
/* 7B688 8008AE88 0D006210 */  beq        $v1, $v0, .L8008AEC0
/* 7B68C 8008AE8C 14000524 */   addiu     $a1, $zero, 0x14
/* 7B690 8008AE90 3AF2020C */  jal        func_800BC8E8
/* 7B694 8008AE94 00000000 */   nop
/* 7B698 8008AE98 03004230 */  andi       $v0, $v0, 0x3
/* 7B69C 8008AE9C 08004014 */  bnez       $v0, .L8008AEC0
/* 7B6A0 8008AEA0 02000524 */   addiu     $a1, $zero, 0x2
/* 7B6A4 8008AEA4 9006020C */  jal        MON_GetTime
/* 7B6A8 8008AEA8 21204002 */   addu      $a0, $s2, $zero
/* 7B6AC 8008AEAC E8034224 */  addiu      $v0, $v0, 0x3E8
/* 7B6B0 8008AEB0 140122AE */  sw         $v0, 0x114($s1)
/* 7B6B4 8008AEB4 B02B0208 */  j          .L8008AEC0
/* 7B6B8 8008AEB8 05000524 */   addiu     $a1, $zero, 0x5
jlabel .L8008AEBC
/* 7B6BC 8008AEBC 02000524 */  addiu      $a1, $zero, 0x2
jlabel .L8008AEC0
/* 7B6C0 8008AEC0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7B6C4 8008AEC4 0300A210 */  beq        $a1, $v0, .L8008AED4
/* 7B6C8 8008AEC8 00000000 */   nop
/* 7B6CC 8008AECC 91FE010C */  jal        MON_SwitchState
/* 7B6D0 8008AED0 21204002 */   addu      $a0, $s2, $zero
.L8008AED4:
/* 7B6D4 8008AED4 C400228E */  lw         $v0, 0xC4($s1)
/* 7B6D8 8008AED8 00000000 */  nop
/* 7B6DC 8008AEDC 0D004010 */  beqz       $v0, .L8008AF14
/* 7B6E0 8008AEE0 00000000 */   nop
/* 7B6E4 8008AEE4 DD0C020C */  jal        MON_ShouldIFlee
/* 7B6E8 8008AEE8 21204002 */   addu      $a0, $s2, $zero
/* 7B6EC 8008AEEC 03004010 */  beqz       $v0, .L8008AEFC
/* 7B6F0 8008AEF0 21204002 */   addu      $a0, $s2, $zero
/* 7B6F4 8008AEF4 91FE010C */  jal        MON_SwitchState
/* 7B6F8 8008AEF8 13000524 */   addiu     $a1, $zero, 0x13
.L8008AEFC:
/* 7B6FC 8008AEFC C400228E */  lw         $v0, 0xC4($s1)
/* 7B700 8008AF00 00000000 */  nop
/* 7B704 8008AF04 0400428C */  lw         $v0, 0x4($v0)
/* 7B708 8008AF08 00000000 */  nop
/* 7B70C 8008AF0C 5C004224 */  addiu      $v0, $v0, 0x5C
/* 7B710 8008AF10 200122AE */  sw         $v0, 0x120($s1)
.L8008AF14:
/* 7B714 8008AF14 2000BF8F */  lw         $ra, 0x20($sp)
/* 7B718 8008AF18 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7B71C 8008AF1C 1800B28F */  lw         $s2, 0x18($sp)
/* 7B720 8008AF20 1400B18F */  lw         $s1, 0x14($sp)
/* 7B724 8008AF24 1000B08F */  lw         $s0, 0x10($sp)
/* 7B728 8008AF28 0800E003 */  jr         $ra
/* 7B72C 8008AF2C 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_Wander, . - MON_Wander
