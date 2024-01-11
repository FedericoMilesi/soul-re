.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerMoveToPosition
/* 8B4A8 8009ACA8 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 8B4AC 8009ACAC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8B4B0 8009ACB0 21888000 */  addu       $s1, $a0, $zero
/* 8B4B4 8009ACB4 2000B2AF */  sw         $s2, 0x20($sp)
/* 8B4B8 8009ACB8 2190A000 */  addu       $s2, $a1, $zero
/* 8B4BC 8009ACBC 3000B6AF */  sw         $s6, 0x30($sp)
/* 8B4C0 8009ACC0 21B0C000 */  addu       $s6, $a2, $zero
/* 8B4C4 8009ACC4 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 8B4C8 8009ACC8 01001524 */  addiu      $s5, $zero, 0x1
/* 8B4CC 8009ACCC C0101200 */  sll        $v0, $s2, 3
/* 8B4D0 8009ACD0 21105200 */  addu       $v0, $v0, $s2
/* 8B4D4 8009ACD4 C0100200 */  sll        $v0, $v0, 3
/* 8B4D8 8009ACD8 23105200 */  subu       $v0, $v0, $s2
/* 8B4DC 8009ACDC 80100200 */  sll        $v0, $v0, 2
/* 8B4E0 8009ACE0 08004224 */  addiu      $v0, $v0, 0x8
/* 8B4E4 8009ACE4 2800B4AF */  sw         $s4, 0x28($sp)
/* 8B4E8 8009ACE8 21A02202 */  addu       $s4, $s1, $v0
/* 8B4EC 8009ACEC 2400B3AF */  sw         $s3, 0x24($sp)
/* 8B4F0 8009ACF0 7CFB9327 */  addiu      $s3, $gp, %gp_rel(Raziel + 0x54C)
/* 8B4F4 8009ACF4 3400BFAF */  sw         $ra, 0x34($sp)
/* 8B4F8 8009ACF8 1800B0AF */  sw         $s0, 0x18($sp)
.L8009ACFC:
/* 8B4FC 8009ACFC 39C3010C */  jal        PeekMessageQueue
/* 8B500 8009AD00 04008426 */   addiu     $a0, $s4, 0x4
/* 8B504 8009AD04 21804000 */  addu       $s0, $v0, $zero
/* 8B508 8009AD08 67000012 */  beqz       $s0, .L8009AEA8
/* 8B50C 8009AD0C 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8B510 8009AD10 0000038E */  lw         $v1, 0x0($s0)
/* 8B514 8009AD14 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8B518 8009AD18 24006210 */  beq        $v1, $v0, .L8009ADAC
/* 8B51C 8009AD1C 2A104300 */   slt       $v0, $v0, $v1
/* 8B520 8009AD20 11004014 */  bnez       $v0, .L8009AD68
/* 8B524 8009AD24 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 8B528 8009AD28 0400023C */  lui        $v0, (0x40016 >> 16)
/* 8B52C 8009AD2C 16004234 */  ori        $v0, $v0, (0x40016 & 0xFFFF)
/* 8B530 8009AD30 3E006210 */  beq        $v1, $v0, .L8009AE2C
/* 8B534 8009AD34 2A104300 */   slt       $v0, $v0, $v1
/* 8B538 8009AD38 07004014 */  bnez       $v0, .L8009AD58
/* 8B53C 8009AD3C 1000023C */   lui       $v0, (0x100000 >> 16)
/* 8B540 8009AD40 0400023C */  lui        $v0, (0x4000C >> 16)
/* 8B544 8009AD44 0C004234 */  ori        $v0, $v0, (0x4000C & 0xFFFF)
/* 8B548 8009AD48 41006210 */  beq        $v1, $v0, .L8009AE50
/* 8B54C 8009AD4C 21202002 */   addu      $a0, $s1, $zero
/* 8B550 8009AD50 A46B0208 */  j          .L8009AE90
/* 8B554 8009AD54 21284002 */   addu      $a1, $s2, $zero
.L8009AD58:
/* 8B558 8009AD58 28006210 */  beq        $v1, $v0, .L8009ADFC
/* 8B55C 8009AD5C 21202002 */   addu      $a0, $s1, $zero
/* 8B560 8009AD60 A46B0208 */  j          .L8009AE90
/* 8B564 8009AD64 21284002 */   addu      $a1, $s2, $zero
.L8009AD68:
/* 8B568 8009AD68 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 8B56C 8009AD6C 41006210 */  beq        $v1, $v0, .L8009AE74
/* 8B570 8009AD70 2A104300 */   slt       $v0, $v0, $v1
/* 8B574 8009AD74 06004014 */  bnez       $v0, .L8009AD90
/* 8B578 8009AD78 0104023C */   lui       $v0, (0x4010400 >> 16)
/* 8B57C 8009AD7C 0001023C */  lui        $v0, (0x1000400 >> 16)
/* 8B580 8009AD80 45006210 */  beq        $v1, $v0, .L8009AE98
/* 8B584 8009AD84 21202002 */   addu      $a0, $s1, $zero
/* 8B588 8009AD88 A46B0208 */  j          .L8009AE90
/* 8B58C 8009AD8C 21284002 */   addu      $a1, $s2, $zero
.L8009AD90:
/* 8B590 8009AD90 00044234 */  ori        $v0, $v0, (0x1000400 & 0xFFFF)
/* 8B594 8009AD94 40006210 */  beq        $v1, $v0, .L8009AE98
/* 8B598 8009AD98 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 8B59C 8009AD9C 3E006210 */  beq        $v1, $v0, .L8009AE98
/* 8B5A0 8009ADA0 21202002 */   addu      $a0, $s1, $zero
/* 8B5A4 8009ADA4 A46B0208 */  j          .L8009AE90
/* 8B5A8 8009ADA8 21284002 */   addu      $a1, $s2, $zero
.L8009ADAC:
/* 8B5AC 8009ADAC 3A004016 */  bnez       $s2, .L8009AE98
/* 8B5B0 8009ADB0 21286002 */   addu      $a1, $s3, $zero
/* 8B5B4 8009ADB4 0400028E */  lw         $v0, 0x4($s0)
/* 8B5B8 8009ADB8 00000000 */  nop
/* 8B5BC 8009ADBC 00004394 */  lhu        $v1, 0x0($v0)
/* 8B5C0 8009ADC0 02004494 */  lhu        $a0, 0x2($v0)
/* 8B5C4 8009ADC4 04004294 */  lhu        $v0, 0x4($v0)
/* 8B5C8 8009ADC8 21300000 */  addu       $a2, $zero, $zero
/* 8B5CC 8009ADCC 7CFB83A7 */  sh         $v1, %gp_rel(Raziel + 0x54C)($gp)
/* 8B5D0 8009ADD0 020064A6 */  sh         $a0, 0x2($s3)
/* 8B5D4 8009ADD4 040062A6 */  sh         $v0, 0x4($s3)
/* 8B5D8 8009ADD8 0000248E */  lw         $a0, 0x0($s1)
/* 8B5DC 8009ADDC BB94020C */  jal        razAlignYRotInterp
/* 8B5E0 8009ADE0 04000724 */   addiu     $a3, $zero, 0x4
/* 8B5E4 8009ADE4 0000248E */  lw         $a0, 0x0($s1)
/* 8B5E8 8009ADE8 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 8B5EC 8009ADEC 938B020C */  jal        SteerSwitchMode
/* 8B5F0 8009ADF0 21280000 */   addu      $a1, $zero, $zero
/* 8B5F4 8009ADF4 A66B0208 */  j          .L8009AE98
/* 8B5F8 8009ADF8 00000000 */   nop
.L8009ADFC:
/* 8B5FC 8009ADFC 21200000 */  addu       $a0, $zero, $zero
/* 8B600 8009AE00 21288000 */  addu       $a1, $a0, $zero
/* 8B604 8009AE04 4FC6010C */  jal        SetControlInitIdleData
/* 8B608 8009AE08 03000624 */   addiu     $a2, $zero, 0x3
/* 8B60C 8009AE0C 21202002 */  addu       $a0, $s1, $zero
/* 8B610 8009AE10 21284002 */  addu       $a1, $s2, $zero
/* 8B614 8009AE14 0A80063C */  lui        $a2, %hi(StateHandlerPuppetShow)
/* 8B618 8009AE18 0CA9C624 */  addiu      $a2, $a2, %lo(StateHandlerPuppetShow)
/* 8B61C 8009AE1C C1CA010C */  jal        StateSwitchStateData
/* 8B620 8009AE20 21384000 */   addu      $a3, $v0, $zero
/* 8B624 8009AE24 A66B0208 */  j          .L8009AE98
/* 8B628 8009AE28 21A80000 */   addu      $s5, $zero, $zero
.L8009AE2C:
/* 8B62C 8009AE2C 21202002 */  addu       $a0, $s1, $zero
/* 8B630 8009AE30 21284002 */  addu       $a1, $s2, $zero
/* 8B634 8009AE34 7B000624 */  addiu      $a2, $zero, 0x7B
/* 8B638 8009AE38 21380000 */  addu       $a3, $zero, $zero
/* 8B63C 8009AE3C 04000224 */  addiu      $v0, $zero, 0x4
/* 8B640 8009AE40 1000A2AF */  sw         $v0, 0x10($sp)
/* 8B644 8009AE44 02000224 */  addiu      $v0, $zero, 0x2
/* 8B648 8009AE48 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8B64C 8009AE4C 1400A2AF */   sw        $v0, 0x14($sp)
.L8009AE50:
/* 8B650 8009AE50 0400028E */  lw         $v0, 0x4($s0)
/* 8B654 8009AE54 00000000 */  nop
/* 8B658 8009AE58 00004394 */  lhu        $v1, 0x0($v0)
/* 8B65C 8009AE5C 02004494 */  lhu        $a0, 0x2($v0)
/* 8B660 8009AE60 04004294 */  lhu        $v0, 0x4($v0)
/* 8B664 8009AE64 7CFB83A7 */  sh         $v1, %gp_rel(Raziel + 0x54C)($gp)
/* 8B668 8009AE68 020064A6 */  sh         $a0, 0x2($s3)
/* 8B66C 8009AE6C A66B0208 */  j          .L8009AE98
/* 8B670 8009AE70 040062A6 */   sh        $v0, 0x4($s3)
.L8009AE74:
/* 8B674 8009AE74 0000248E */  lw         $a0, 0x0($s1)
/* 8B678 8009AE78 30F68527 */  addiu      $a1, $gp, %gp_rel(Raziel)
/* 8B67C 8009AE7C 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 8B680 8009AE80 1069020C */  jal        SetDropPhysics
/* 8B684 8009AE84 00000000 */   nop
/* 8B688 8009AE88 A66B0208 */  j          .L8009AE98
/* 8B68C 8009AE8C 00000000 */   nop
.L8009AE90:
/* 8B690 8009AE90 D46B020C */  jal        DefaultPuppetStateHandler
/* 8B694 8009AE94 2130C002 */   addu      $a2, $s6, $zero
.L8009AE98:
/* 8B698 8009AE98 27C3010C */  jal        DeMessageQueue
/* 8B69C 8009AE9C 04008426 */   addiu     $a0, $s4, 0x4
/* 8B6A0 8009AEA0 3F6B0208 */  j          .L8009ACFC
/* 8B6A4 8009AEA4 00000000 */   nop
.L8009AEA8:
/* 8B6A8 8009AEA8 1F00A012 */  beqz       $s5, .L8009AF28
/* 8B6AC 8009AEAC 00000000 */   nop
/* 8B6B0 8009AEB0 06004016 */  bnez       $s2, .L8009AECC
/* 8B6B4 8009AEB4 00000000 */   nop
/* 8B6B8 8009AEB8 0000248E */  lw         $a0, 0x0($s1)
/* 8B6BC 8009AEBC 7CFB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x54C)
/* 8B6C0 8009AEC0 21300000 */  addu       $a2, $zero, $zero
/* 8B6C4 8009AEC4 BB94020C */  jal        razAlignYRotInterp
/* 8B6C8 8009AEC8 04000724 */   addiu     $a3, $zero, 0x4
.L8009AECC:
/* 8B6CC 8009AECC 0000228E */  lw         $v0, 0x0($s1)
/* 8B6D0 8009AED0 7CFB8487 */  lh         $a0, %gp_rel(Raziel + 0x54C)($gp)
/* 8B6D4 8009AED4 7EFB8587 */  lh         $a1, %gp_rel(Raziel + 0x54E)($gp)
/* 8B6D8 8009AED8 5C004384 */  lh         $v1, 0x5C($v0)
/* 8B6DC 8009AEDC 80FB8687 */  lh         $a2, %gp_rel(Raziel + 0x550)($gp)
/* 8B6E0 8009AEE0 23206400 */  subu       $a0, $v1, $a0
/* 8B6E4 8009AEE4 5E004384 */  lh         $v1, 0x5E($v0)
/* 8B6E8 8009AEE8 60004284 */  lh         $v0, 0x60($v0)
/* 8B6EC 8009AEEC 23286500 */  subu       $a1, $v1, $a1
/* 8B6F0 8009AEF0 B7E6000C */  jal        MATH3D_LengthXYZ
/* 8B6F4 8009AEF4 23304600 */   subu      $a2, $v0, $a2
/* 8B6F8 8009AEF8 21202002 */  addu       $a0, $s1, $zero
/* 8B6FC 8009AEFC 21284002 */  addu       $a1, $s2, $zero
/* 8B700 8009AF00 AF9A020C */  jal        razApplyMotion
/* 8B704 8009AF04 21804000 */   addu      $s0, $v0, $zero
/* 8B708 8009AF08 07004016 */  bnez       $s2, .L8009AF28
/* 8B70C 8009AF0C 40100200 */   sll       $v0, $v0, 1
/* 8B710 8009AF10 2A100202 */  slt        $v0, $s0, $v0
/* 8B714 8009AF14 04004010 */  beqz       $v0, .L8009AF28
/* 8B718 8009AF18 1000053C */   lui       $a1, (0x100000 >> 16)
/* 8B71C 8009AF1C 0000248E */  lw         $a0, 0x0($s1)
/* 8B720 8009AF20 A1D1000C */  jal        INSTANCE_Post
/* 8B724 8009AF24 21300000 */   addu      $a2, $zero, $zero
.L8009AF28:
/* 8B728 8009AF28 3400BF8F */  lw         $ra, 0x34($sp)
/* 8B72C 8009AF2C 3000B68F */  lw         $s6, 0x30($sp)
/* 8B730 8009AF30 2C00B58F */  lw         $s5, 0x2C($sp)
/* 8B734 8009AF34 2800B48F */  lw         $s4, 0x28($sp)
/* 8B738 8009AF38 2400B38F */  lw         $s3, 0x24($sp)
/* 8B73C 8009AF3C 2000B28F */  lw         $s2, 0x20($sp)
/* 8B740 8009AF40 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8B744 8009AF44 1800B08F */  lw         $s0, 0x18($sp)
/* 8B748 8009AF48 0800E003 */  jr         $ra
/* 8B74C 8009AF4C 3800BD27 */   addiu     $sp, $sp, 0x38
.size StateHandlerMoveToPosition, . - StateHandlerMoveToPosition
