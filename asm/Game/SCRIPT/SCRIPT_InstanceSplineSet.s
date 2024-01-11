.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_InstanceSplineSet
/* 2DCCC 8003D4CC 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 2DCD0 8003D4D0 5000B2AF */  sw         $s2, 0x50($sp)
/* 2DCD4 8003D4D4 21908000 */  addu       $s2, $a0, $zero
/* 2DCD8 8003D4D8 4800B0AF */  sw         $s0, 0x48($sp)
/* 2DCDC 8003D4DC 2180A000 */  addu       $s0, $a1, $zero
/* 2DCE0 8003D4E0 5800B4AF */  sw         $s4, 0x58($sp)
/* 2DCE4 8003D4E4 21A0C000 */  addu       $s4, $a2, $zero
/* 2DCE8 8003D4E8 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 2DCEC 8003D4EC 21A8E000 */  addu       $s5, $a3, $zero
/* 2DCF0 8003D4F0 6800BEAF */  sw         $fp, 0x68($sp)
/* 2DCF4 8003D4F4 21F00002 */  addu       $fp, $s0, $zero
/* 2DCF8 8003D4F8 4000A527 */  addiu      $a1, $sp, 0x40
/* 2DCFC 8003D4FC 6000B6AF */  sw         $s6, 0x60($sp)
/* 2DD00 8003D500 8000B68F */  lw         $s6, 0x80($sp)
/* 2DD04 8003D504 4400A627 */  addiu      $a2, $sp, 0x44
/* 2DD08 8003D508 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 2DD0C 8003D50C 6400B7AF */  sw         $s7, 0x64($sp)
/* 2DD10 8003D510 5400B3AF */  sw         $s3, 0x54($sp)
/* 2DD14 8003D514 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 2DD18 8003D518 4C00B1AF */   sw        $s1, 0x4C($sp)
/* 2DD1C 8003D51C 21884000 */  addu       $s1, $v0, $zero
/* 2DD20 8003D520 94002012 */  beqz       $s1, .L8003D774
/* 2DD24 8003D524 00141000 */   sll       $v0, $s0, 16
/* 2DD28 8003D528 03140200 */  sra        $v0, $v0, 16
/* 2DD2C 8003D52C FFFF0324 */  addiu      $v1, $zero, -0x1
/* 2DD30 8003D530 04004314 */  bne        $v0, $v1, .L8003D544
/* 2DD34 8003D534 00000000 */   nop
/* 2DD38 8003D538 E3F3000C */  jal        SCRIPTCountFramesInSpline
/* 2DD3C 8003D53C 21204002 */   addu      $a0, $s2, $zero
/* 2DD40 8003D540 21F04000 */  addu       $fp, $v0, $zero
.L8003D544:
/* 2DD44 8003D544 4000A28F */  lw         $v0, 0x40($sp)
/* 2DD48 8003D548 00000000 */  nop
/* 2DD4C 8003D54C 0B004014 */  bnez       $v0, .L8003D57C
/* 2DD50 8003D550 00000000 */   nop
/* 2DD54 8003D554 4400A28F */  lw         $v0, 0x44($sp)
/* 2DD58 8003D558 00000000 */  nop
/* 2DD5C 8003D55C 07004014 */  bnez       $v0, .L8003D57C
/* 2DD60 8003D560 00000000 */   nop
/* 2DD64 8003D564 17008016 */  bnez       $s4, .L8003D5C4
/* 2DD68 8003D568 00000000 */   nop
/* 2DD6C 8003D56C 1500A016 */  bnez       $s5, .L8003D5C4
/* 2DD70 8003D570 00000000 */   nop
/* 2DD74 8003D574 1300C016 */  bnez       $s6, .L8003D5C4
/* 2DD78 8003D578 00000000 */   nop
.L8003D57C:
/* 2DD7C 8003D57C 21204002 */  addu       $a0, $s2, $zero
/* 2DD80 8003D580 4000A68F */  lw         $a2, 0x40($sp)
/* 2DD84 8003D584 4400A78F */  lw         $a3, 0x44($sp)
/* 2DD88 8003D588 96F4000C */  jal        SCRIPT_GetPosSplineDef
/* 2DD8C 8003D58C 21282002 */   addu      $a1, $s1, $zero
/* 2DD90 8003D590 21A04000 */  addu       $s4, $v0, $zero
/* 2DD94 8003D594 21204002 */  addu       $a0, $s2, $zero
/* 2DD98 8003D598 4000A68F */  lw         $a2, 0x40($sp)
/* 2DD9C 8003D59C 4400A78F */  lw         $a3, 0x44($sp)
/* 2DDA0 8003D5A0 A1F4000C */  jal        SCRIPT_GetRotSplineDef
/* 2DDA4 8003D5A4 21282002 */   addu      $a1, $s1, $zero
/* 2DDA8 8003D5A8 21A84000 */  addu       $s5, $v0, $zero
/* 2DDAC 8003D5AC 21204002 */  addu       $a0, $s2, $zero
/* 2DDB0 8003D5B0 4000A68F */  lw         $a2, 0x40($sp)
/* 2DDB4 8003D5B4 4400A78F */  lw         $a3, 0x44($sp)
/* 2DDB8 8003D5B8 ACF4000C */  jal        SCRIPT_GetScaleSplineDef
/* 2DDBC 8003D5BC 21282002 */   addu      $a1, $s1, $zero
/* 2DDC0 8003D5C0 21B04000 */  addu       $s6, $v0, $zero
.L8003D5C4:
/* 2DDC4 8003D5C4 0000308E */  lw         $s0, 0x0($s1)
/* 2DDC8 8003D5C8 0400338E */  lw         $s3, 0x4($s1)
/* 2DDCC 8003D5CC 0800378E */  lw         $s7, 0x8($s1)
/* 2DDD0 8003D5D0 1B008012 */  beqz       $s4, .L8003D640
/* 2DDD4 8003D5D4 00000000 */   nop
/* 2DDD8 8003D5D8 19000012 */  beqz       $s0, .L8003D640
/* 2DDDC 8003D5DC 21200002 */   addu      $a0, $s0, $zero
/* 2DDE0 8003D5E0 21288002 */  addu       $a1, $s4, $zero
/* 2DDE4 8003D5E4 3B05010C */  jal        SplineSetDef2FrameNumber
/* 2DDE8 8003D5E8 FFFFC633 */   andi      $a2, $fp, 0xFFFF
/* 2DDEC 8003D5EC 21200002 */  addu       $a0, $s0, $zero
/* 2DDF0 8003D5F0 21288002 */  addu       $a1, $s4, $zero
/* 2DDF4 8003D5F4 F306010C */  jal        SplineGetData
/* 2DDF8 8003D5F8 1000A627 */   addiu     $a2, $sp, 0x10
/* 2DDFC 8003D5FC 4400A28F */  lw         $v0, 0x44($sp)
/* 2DE00 8003D600 00000000 */  nop
/* 2DE04 8003D604 05004010 */  beqz       $v0, .L8003D61C
/* 2DE08 8003D608 21204002 */   addu      $a0, $s2, $zero
/* 2DE0C 8003D60C B7F4000C */  jal        SCRIPT_RelativisticSpline
/* 2DE10 8003D610 1000A527 */   addiu     $a1, $sp, 0x10
/* 2DE14 8003D614 90F50008 */  j          .L8003D640
/* 2DE18 8003D618 00000000 */   nop
.L8003D61C:
/* 2DE1C 8003D61C 1000A297 */  lhu        $v0, 0x10($sp)
/* 2DE20 8003D620 00000000 */  nop
/* 2DE24 8003D624 5C0042A6 */  sh         $v0, 0x5C($s2)
/* 2DE28 8003D628 1200A297 */  lhu        $v0, 0x12($sp)
/* 2DE2C 8003D62C 00000000 */  nop
/* 2DE30 8003D630 5E0042A6 */  sh         $v0, 0x5E($s2)
/* 2DE34 8003D634 1400A297 */  lhu        $v0, 0x14($sp)
/* 2DE38 8003D638 00000000 */  nop
/* 2DE3C 8003D63C 600042A6 */  sh         $v0, 0x60($s2)
.L8003D640:
/* 2DE40 8003D640 3800A012 */  beqz       $s5, .L8003D724
/* 2DE44 8003D644 00000000 */   nop
/* 2DE48 8003D648 36006012 */  beqz       $s3, .L8003D724
/* 2DE4C 8003D64C 21206002 */   addu      $a0, $s3, $zero
/* 2DE50 8003D650 2128A002 */  addu       $a1, $s5, $zero
/* 2DE54 8003D654 3B05010C */  jal        SplineSetDef2FrameNumber
/* 2DE58 8003D658 FFFFC633 */   andi      $a2, $fp, 0xFFFF
/* 2DE5C 8003D65C 1400428E */  lw         $v0, 0x14($s2)
/* 2DE60 8003D660 00000000 */  nop
/* 2DE64 8003D664 01004230 */  andi       $v0, $v0, 0x1
/* 2DE68 8003D668 17004010 */  beqz       $v0, .L8003D6C8
/* 2DE6C 8003D66C 21206002 */   addu      $a0, $s3, $zero
/* 2DE70 8003D670 2128A002 */  addu       $a1, $s5, $zero
/* 2DE74 8003D674 1800B027 */  addiu      $s0, $sp, 0x18
/* 2DE78 8003D678 7707010C */  jal        SplineGetQuatData
/* 2DE7C 8003D67C 21300002 */   addu      $a2, $s0, $zero
/* 2DE80 8003D680 28004010 */  beqz       $v0, .L8003D724
/* 2DE84 8003D684 21200002 */   addu      $a0, $s0, $zero
/* 2DE88 8003D688 30003126 */  addiu      $s1, $s1, 0x30
/* 2DE8C 8003D68C 27E7010C */  jal        G2Quat_ToMatrix_S
/* 2DE90 8003D690 21282002 */   addu      $a1, $s1, $zero
/* 2DE94 8003D694 2000448E */  lw         $a0, 0x20($s2)
/* 2DE98 8003D698 00000000 */  nop
/* 2DE9C 8003D69C 21008010 */  beqz       $a0, .L8003D724
/* 2DEA0 8003D6A0 18008424 */   addiu     $a0, $a0, 0x18
/* 2DEA4 8003D6A4 2000B027 */  addiu      $s0, $sp, 0x20
/* 2DEA8 8003D6A8 3DE3010C */  jal        RotMatrix
/* 2DEAC 8003D6AC 21280002 */   addu      $a1, $s0, $zero
/* 2DEB0 8003D6B0 21202002 */  addu       $a0, $s1, $zero
/* 2DEB4 8003D6B4 21280002 */  addu       $a1, $s0, $zero
/* 2DEB8 8003D6B8 BFF7020C */  jal        MulMatrix0
/* 2DEBC 8003D6BC 21308000 */   addu      $a2, $a0, $zero
/* 2DEC0 8003D6C0 C9F50008 */  j          .L8003D724
/* 2DEC4 8003D6C4 00000000 */   nop
.L8003D6C8:
/* 2DEC8 8003D6C8 2128A002 */  addu       $a1, $s5, $zero
/* 2DECC 8003D6CC F306010C */  jal        SplineGetData
/* 2DED0 8003D6D0 1800A627 */   addiu     $a2, $sp, 0x18
/* 2DED4 8003D6D4 13004010 */  beqz       $v0, .L8003D724
/* 2DED8 8003D6D8 2000B127 */   addiu     $s1, $sp, 0x20
/* 2DEDC 8003D6DC 21202002 */  addu       $a0, $s1, $zero
/* 2DEE0 8003D6E0 1800A297 */  lhu        $v0, 0x18($sp)
/* 2DEE4 8003D6E4 2000468E */  lw         $a2, 0x20($s2)
/* 2DEE8 8003D6E8 74005026 */  addiu      $s0, $s2, 0x74
/* 2DEEC 8003D6EC 740042A6 */  sh         $v0, 0x74($s2)
/* 2DEF0 8003D6F0 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 2DEF4 8003D6F4 21280002 */  addu       $a1, $s0, $zero
/* 2DEF8 8003D6F8 760042A6 */  sh         $v0, 0x76($s2)
/* 2DEFC 8003D6FC 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 2DF00 8003D700 1800C624 */  addiu      $a2, $a2, 0x18
/* 2DF04 8003D704 2FF3000C */  jal        SCRIPT_CombineEulerAngles
/* 2DF08 8003D708 780042A6 */   sh        $v0, 0x78($s2)
/* 2DF0C 8003D70C 2000A297 */  lhu        $v0, 0x20($sp)
/* 2DF10 8003D710 02002396 */  lhu        $v1, 0x2($s1)
/* 2DF14 8003D714 04002496 */  lhu        $a0, 0x4($s1)
/* 2DF18 8003D718 740042A6 */  sh         $v0, 0x74($s2)
/* 2DF1C 8003D71C 020003A6 */  sh         $v1, 0x2($s0)
/* 2DF20 8003D720 040004A6 */  sh         $a0, 0x4($s0)
.L8003D724:
/* 2DF24 8003D724 1300C012 */  beqz       $s6, .L8003D774
/* 2DF28 8003D728 00000000 */   nop
/* 2DF2C 8003D72C 1100E012 */  beqz       $s7, .L8003D774
/* 2DF30 8003D730 2120E002 */   addu      $a0, $s7, $zero
/* 2DF34 8003D734 2128C002 */  addu       $a1, $s6, $zero
/* 2DF38 8003D738 3B05010C */  jal        SplineSetDef2FrameNumber
/* 2DF3C 8003D73C FFFFC633 */   andi      $a2, $fp, 0xFFFF
/* 2DF40 8003D740 2120E002 */  addu       $a0, $s7, $zero
/* 2DF44 8003D744 2128C002 */  addu       $a1, $s6, $zero
/* 2DF48 8003D748 F306010C */  jal        SplineGetData
/* 2DF4C 8003D74C 1800A627 */   addiu     $a2, $sp, 0x18
/* 2DF50 8003D750 1800A297 */  lhu        $v0, 0x18($sp)
/* 2DF54 8003D754 00000000 */  nop
/* 2DF58 8003D758 840042A6 */  sh         $v0, 0x84($s2)
/* 2DF5C 8003D75C 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 2DF60 8003D760 00000000 */  nop
/* 2DF64 8003D764 860042A6 */  sh         $v0, 0x86($s2)
/* 2DF68 8003D768 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 2DF6C 8003D76C 00000000 */  nop
/* 2DF70 8003D770 880042A6 */  sh         $v0, 0x88($s2)
.L8003D774:
/* 2DF74 8003D774 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 2DF78 8003D778 6800BE8F */  lw         $fp, 0x68($sp)
/* 2DF7C 8003D77C 6400B78F */  lw         $s7, 0x64($sp)
/* 2DF80 8003D780 6000B68F */  lw         $s6, 0x60($sp)
/* 2DF84 8003D784 5C00B58F */  lw         $s5, 0x5C($sp)
/* 2DF88 8003D788 5800B48F */  lw         $s4, 0x58($sp)
/* 2DF8C 8003D78C 5400B38F */  lw         $s3, 0x54($sp)
/* 2DF90 8003D790 5000B28F */  lw         $s2, 0x50($sp)
/* 2DF94 8003D794 4C00B18F */  lw         $s1, 0x4C($sp)
/* 2DF98 8003D798 4800B08F */  lw         $s0, 0x48($sp)
/* 2DF9C 8003D79C 0800E003 */  jr         $ra
/* 2DFA0 8003D7A0 7000BD27 */   addiu     $sp, $sp, 0x70
.size SCRIPT_InstanceSplineSet, . - SCRIPT_InstanceSplineSet
