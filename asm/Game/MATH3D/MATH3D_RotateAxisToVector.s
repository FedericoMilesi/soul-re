.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_RotateAxisToVector
/* 2ABE8 8003A3E8 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 2ABEC 8003A3EC 4400B3AF */  sw         $s3, 0x44($sp)
/* 2ABF0 8003A3F0 21988000 */  addu       $s3, $a0, $zero
/* 2ABF4 8003A3F4 4000B2AF */  sw         $s2, 0x40($sp)
/* 2ABF8 8003A3F8 2190A000 */  addu       $s2, $a1, $zero
/* 2ABFC 8003A3FC 0300E22C */  sltiu      $v0, $a3, 0x3
/* 2AC00 8003A400 4800BFAF */  sw         $ra, 0x48($sp)
/* 2AC04 8003A404 3C00B1AF */  sw         $s1, 0x3C($sp)
/* 2AC08 8003A408 0C004014 */  bnez       $v0, .L8003A43C
/* 2AC0C 8003A40C 3800B0AF */   sw        $s0, 0x38($sp)
/* 2AC10 8003A410 FDFFE724 */  addiu      $a3, $a3, -0x3
/* 2AC14 8003A414 40100700 */  sll        $v0, $a3, 1
/* 2AC18 8003A418 21104202 */  addu       $v0, $s2, $v0
/* 2AC1C 8003A41C 00004384 */  lh         $v1, 0x0($v0)
/* 2AC20 8003A420 00000000 */  nop
/* 2AC24 8003A424 23380300 */  negu       $a3, $v1
/* 2AC28 8003A428 06004384 */  lh         $v1, 0x6($v0)
/* 2AC2C 8003A42C 0C004284 */  lh         $v0, 0xC($v0)
/* 2AC30 8003A430 23180300 */  negu       $v1, $v1
/* 2AC34 8003A434 14E90008 */  j          .L8003A450
/* 2AC38 8003A438 23280200 */   negu      $a1, $v0
.L8003A43C:
/* 2AC3C 8003A43C 40100700 */  sll        $v0, $a3, 1
/* 2AC40 8003A440 21104202 */  addu       $v0, $s2, $v0
/* 2AC44 8003A444 00004784 */  lh         $a3, 0x0($v0)
/* 2AC48 8003A448 06004384 */  lh         $v1, 0x6($v0)
/* 2AC4C 8003A44C 0C004584 */  lh         $a1, 0xC($v0)
.L8003A450:
/* 2AC50 8003A450 0400C284 */  lh         $v0, 0x4($a2)
/* 2AC54 8003A454 00000000 */  nop
/* 2AC58 8003A458 18006200 */  mult       $v1, $v0
/* 2AC5C 8003A45C 12200000 */  mflo       $a0
/* 2AC60 8003A460 0200C284 */  lh         $v0, 0x2($a2)
/* 2AC64 8003A464 00000000 */  nop
/* 2AC68 8003A468 1800A200 */  mult       $a1, $v0
/* 2AC6C 8003A46C 12480000 */  mflo       $t1
/* 2AC70 8003A470 23108900 */  subu       $v0, $a0, $t1
/* 2AC74 8003A474 02004104 */  bgez       $v0, .L8003A480
/* 2AC78 8003A478 00000000 */   nop
/* 2AC7C 8003A47C FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8003A480:
/* 2AC80 8003A480 03130200 */  sra        $v0, $v0, 12
/* 2AC84 8003A484 3000A2A7 */  sh         $v0, 0x30($sp)
/* 2AC88 8003A488 0000C284 */  lh         $v0, 0x0($a2)
/* 2AC8C 8003A48C 00000000 */  nop
/* 2AC90 8003A490 1800A200 */  mult       $a1, $v0
/* 2AC94 8003A494 12200000 */  mflo       $a0
/* 2AC98 8003A498 0400C284 */  lh         $v0, 0x4($a2)
/* 2AC9C 8003A49C 00000000 */  nop
/* 2ACA0 8003A4A0 1800E200 */  mult       $a3, $v0
/* 2ACA4 8003A4A4 12480000 */  mflo       $t1
/* 2ACA8 8003A4A8 23108900 */  subu       $v0, $a0, $t1
/* 2ACAC 8003A4AC 02004104 */  bgez       $v0, .L8003A4B8
/* 2ACB0 8003A4B0 00000000 */   nop
/* 2ACB4 8003A4B4 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8003A4B8:
/* 2ACB8 8003A4B8 03130200 */  sra        $v0, $v0, 12
/* 2ACBC 8003A4BC 3200A2A7 */  sh         $v0, 0x32($sp)
/* 2ACC0 8003A4C0 0200C284 */  lh         $v0, 0x2($a2)
/* 2ACC4 8003A4C4 00000000 */  nop
/* 2ACC8 8003A4C8 1800E200 */  mult       $a3, $v0
/* 2ACCC 8003A4CC 12200000 */  mflo       $a0
/* 2ACD0 8003A4D0 0000C284 */  lh         $v0, 0x0($a2)
/* 2ACD4 8003A4D4 00000000 */  nop
/* 2ACD8 8003A4D8 18006200 */  mult       $v1, $v0
/* 2ACDC 8003A4DC 12480000 */  mflo       $t1
/* 2ACE0 8003A4E0 23108900 */  subu       $v0, $a0, $t1
/* 2ACE4 8003A4E4 02004104 */  bgez       $v0, .L8003A4F0
/* 2ACE8 8003A4E8 00000000 */   nop
/* 2ACEC 8003A4EC FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8003A4F0:
/* 2ACF0 8003A4F0 03130200 */  sra        $v0, $v0, 12
/* 2ACF4 8003A4F4 3400A2A7 */  sh         $v0, 0x34($sp)
/* 2ACF8 8003A4F8 0000C284 */  lh         $v0, 0x0($a2)
/* 2ACFC 8003A4FC 00000000 */  nop
/* 2AD00 8003A500 1800E200 */  mult       $a3, $v0
/* 2AD04 8003A504 12200000 */  mflo       $a0
/* 2AD08 8003A508 0200C284 */  lh         $v0, 0x2($a2)
/* 2AD0C 8003A50C 00000000 */  nop
/* 2AD10 8003A510 18006200 */  mult       $v1, $v0
/* 2AD14 8003A514 12180000 */  mflo       $v1
/* 2AD18 8003A518 0400C284 */  lh         $v0, 0x4($a2)
/* 2AD1C 8003A51C 00000000 */  nop
/* 2AD20 8003A520 1800A200 */  mult       $a1, $v0
/* 2AD24 8003A524 21108300 */  addu       $v0, $a0, $v1
/* 2AD28 8003A528 12480000 */  mflo       $t1
/* 2AD2C 8003A52C 21104900 */  addu       $v0, $v0, $t1
/* 2AD30 8003A530 02004104 */  bgez       $v0, .L8003A53C
/* 2AD34 8003A534 00000000 */   nop
/* 2AD38 8003A538 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8003A53C:
/* 2AD3C 8003A53C E8E4010C */  jal        MATH3D_racos_S
/* 2AD40 8003A540 03230200 */   sra       $a0, $v0, 12
/* 2AD44 8003A544 00140200 */  sll        $v0, $v0, 16
/* 2AD48 8003A548 031C0200 */  sra        $v1, $v0, 16
/* 2AD4C 8003A54C C2170200 */  srl        $v0, $v0, 31
/* 2AD50 8003A550 21186200 */  addu       $v1, $v1, $v0
/* 2AD54 8003A554 3000A487 */  lh         $a0, 0x30($sp)
/* 2AD58 8003A558 3200A587 */  lh         $a1, 0x32($sp)
/* 2AD5C 8003A55C 3400A687 */  lh         $a2, 0x34($sp)
/* 2AD60 8003A560 E7E9000C */  jal        MATH3D_SquareLength
/* 2AD64 8003A564 43880300 */   sra       $s1, $v1, 1
/* 2AD68 8003A568 21804000 */  addu       $s0, $v0, $zero
/* 2AD6C 8003A56C 0300001E */  bgtz       $s0, .L8003A57C
/* 2AD70 8003A570 00000000 */   nop
/* 2AD74 8003A574 62E90008 */  j          .L8003A588
/* 2AD78 8003A578 00101024 */   addiu     $s0, $zero, 0x1000
.L8003A57C:
/* 2AD7C 8003A57C A6E7000C */  jal        MATH3D_FastSqrt0
/* 2AD80 8003A580 21200002 */   addu      $a0, $s0, $zero
/* 2AD84 8003A584 21804000 */  addu       $s0, $v0, $zero
.L8003A588:
/* 2AD88 8003A588 D0E4010C */  jal        rsin
/* 2AD8C 8003A58C 21202002 */   addu      $a0, $s1, $zero
/* 2AD90 8003A590 3000A387 */  lh         $v1, 0x30($sp)
/* 2AD94 8003A594 00000000 */  nop
/* 2AD98 8003A598 18006200 */  mult       $v1, $v0
/* 2AD9C 8003A59C 12180000 */  mflo       $v1
/* 2ADA0 8003A5A0 00000000 */  nop
/* 2ADA4 8003A5A4 00000000 */  nop
/* 2ADA8 8003A5A8 1A007000 */  div        $zero, $v1, $s0
/* 2ADAC 8003A5AC 12300000 */  mflo       $a2
/* 2ADB0 8003A5B0 3200A387 */  lh         $v1, 0x32($sp)
/* 2ADB4 8003A5B4 00000000 */  nop
/* 2ADB8 8003A5B8 18006200 */  mult       $v1, $v0
/* 2ADBC 8003A5BC 12180000 */  mflo       $v1
/* 2ADC0 8003A5C0 00000000 */  nop
/* 2ADC4 8003A5C4 00000000 */  nop
/* 2ADC8 8003A5C8 1A007000 */  div        $zero, $v1, $s0
/* 2ADCC 8003A5CC 12280000 */  mflo       $a1
/* 2ADD0 8003A5D0 3400A387 */  lh         $v1, 0x34($sp)
/* 2ADD4 8003A5D4 00000000 */  nop
/* 2ADD8 8003A5D8 18006200 */  mult       $v1, $v0
/* 2ADDC 8003A5DC 12180000 */  mflo       $v1
/* 2ADE0 8003A5E0 00000000 */  nop
/* 2ADE4 8003A5E4 00000000 */  nop
/* 2ADE8 8003A5E8 1A007000 */  div        $zero, $v1, $s0
/* 2ADEC 8003A5EC 12100000 */  mflo       $v0
/* 2ADF0 8003A5F0 21202002 */  addu       $a0, $s1, $zero
/* 2ADF4 8003A5F4 3000A6A7 */  sh         $a2, 0x30($sp)
/* 2ADF8 8003A5F8 3200A5A7 */  sh         $a1, 0x32($sp)
/* 2ADFC 8003A5FC DCE4010C */  jal        rcos
/* 2AE00 8003A600 3400A2A7 */   sh        $v0, 0x34($sp)
/* 2AE04 8003A604 3000A427 */  addiu      $a0, $sp, 0x30
/* 2AE08 8003A608 1000A527 */  addiu      $a1, $sp, 0x10
/* 2AE0C 8003A60C 27E7010C */  jal        G2Quat_ToMatrix_S
/* 2AE10 8003A610 3600A2A7 */   sh        $v0, 0x36($sp)
/* 2AE14 8003A614 21204002 */  addu       $a0, $s2, $zero
/* 2AE18 8003A618 1000A527 */  addiu      $a1, $sp, 0x10
/* 2AE1C 8003A61C BFF7020C */  jal        MulMatrix0
/* 2AE20 8003A620 21306002 */   addu      $a2, $s3, $zero
/* 2AE24 8003A624 4800BF8F */  lw         $ra, 0x48($sp)
/* 2AE28 8003A628 4400B38F */  lw         $s3, 0x44($sp)
/* 2AE2C 8003A62C 4000B28F */  lw         $s2, 0x40($sp)
/* 2AE30 8003A630 3C00B18F */  lw         $s1, 0x3C($sp)
/* 2AE34 8003A634 3800B08F */  lw         $s0, 0x38($sp)
/* 2AE38 8003A638 0800E003 */  jr         $ra
/* 2AE3C 8003A63C 5000BD27 */   addiu     $sp, $sp, 0x50
.size MATH3D_RotateAxisToVector, . - MATH3D_RotateAxisToVector
