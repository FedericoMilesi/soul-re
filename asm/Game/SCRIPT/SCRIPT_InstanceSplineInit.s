.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_InstanceSplineInit
/* 2D53C 8003CD3C A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 2D540 8003CD40 4800B2AF */  sw         $s2, 0x48($sp)
/* 2D544 8003CD44 21908000 */  addu       $s2, $a0, $zero
/* 2D548 8003CD48 3800A527 */  addiu      $a1, $sp, 0x38
/* 2D54C 8003CD4C 3C00A627 */  addiu      $a2, $sp, 0x3C
/* 2D550 8003CD50 5C00BFAF */  sw         $ra, 0x5C($sp)
/* 2D554 8003CD54 5800B6AF */  sw         $s6, 0x58($sp)
/* 2D558 8003CD58 5400B5AF */  sw         $s5, 0x54($sp)
/* 2D55C 8003CD5C 5000B4AF */  sw         $s4, 0x50($sp)
/* 2D560 8003CD60 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 2D564 8003CD64 4400B1AF */  sw         $s1, 0x44($sp)
/* 2D568 8003CD68 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 2D56C 8003CD6C 4000B0AF */   sw        $s0, 0x40($sp)
/* 2D570 8003CD70 21804000 */  addu       $s0, $v0, $zero
/* 2D574 8003CD74 7B000012 */  beqz       $s0, .L8003CF64
/* 2D578 8003CD78 21204002 */   addu      $a0, $s2, $zero
/* 2D57C 8003CD7C 3800A68F */  lw         $a2, 0x38($sp)
/* 2D580 8003CD80 3C00A78F */  lw         $a3, 0x3C($sp)
/* 2D584 8003CD84 96F4000C */  jal        SCRIPT_GetPosSplineDef
/* 2D588 8003CD88 21280002 */   addu      $a1, $s0, $zero
/* 2D58C 8003CD8C 21204002 */  addu       $a0, $s2, $zero
/* 2D590 8003CD90 21280002 */  addu       $a1, $s0, $zero
/* 2D594 8003CD94 3800A68F */  lw         $a2, 0x38($sp)
/* 2D598 8003CD98 3C00A78F */  lw         $a3, 0x3C($sp)
/* 2D59C 8003CD9C A1F4000C */  jal        SCRIPT_GetRotSplineDef
/* 2D5A0 8003CDA0 21A84000 */   addu      $s5, $v0, $zero
/* 2D5A4 8003CDA4 21204002 */  addu       $a0, $s2, $zero
/* 2D5A8 8003CDA8 21280002 */  addu       $a1, $s0, $zero
/* 2D5AC 8003CDAC 3800A68F */  lw         $a2, 0x38($sp)
/* 2D5B0 8003CDB0 3C00A78F */  lw         $a3, 0x3C($sp)
/* 2D5B4 8003CDB4 ACF4000C */  jal        SCRIPT_GetScaleSplineDef
/* 2D5B8 8003CDB8 21884000 */   addu      $s1, $v0, $zero
/* 2D5BC 8003CDBC 0000138E */  lw         $s3, 0x0($s0)
/* 2D5C0 8003CDC0 0400048E */  lw         $a0, 0x4($s0)
/* 2D5C4 8003CDC4 0800148E */  lw         $s4, 0x8($s0)
/* 2D5C8 8003CDC8 34008010 */  beqz       $a0, .L8003CE9C
/* 2D5CC 8003CDCC 21B04000 */   addu      $s6, $v0, $zero
/* 2D5D0 8003CDD0 C405010C */  jal        SplineGetFirstRot
/* 2D5D4 8003CDD4 21282002 */   addu      $a1, $s1, $zero
/* 2D5D8 8003CDD8 3800A38F */  lw         $v1, 0x38($sp)
/* 2D5DC 8003CDDC 00000000 */  nop
/* 2D5E0 8003CDE0 18006014 */  bnez       $v1, .L8003CE44
/* 2D5E4 8003CDE4 21204000 */   addu      $a0, $v0, $zero
/* 2D5E8 8003CDE8 3C00A28F */  lw         $v0, 0x3C($sp)
/* 2D5EC 8003CDEC 00000000 */  nop
/* 2D5F0 8003CDF0 15004014 */  bnez       $v0, .L8003CE48
/* 2D5F4 8003CDF4 1000A527 */   addiu     $a1, $sp, 0x10
/* 2D5F8 8003CDF8 30001126 */  addiu      $s1, $s0, 0x30
/* 2D5FC 8003CDFC 27E7010C */  jal        G2Quat_ToMatrix_S
/* 2D600 8003CE00 21282002 */   addu      $a1, $s1, $zero
/* 2D604 8003CE04 2000448E */  lw         $a0, 0x20($s2)
/* 2D608 8003CE08 00000000 */  nop
/* 2D60C 8003CE0C 08008010 */  beqz       $a0, .L8003CE30
/* 2D610 8003CE10 18008424 */   addiu     $a0, $a0, 0x18
/* 2D614 8003CE14 1800B027 */  addiu      $s0, $sp, 0x18
/* 2D618 8003CE18 3DE3010C */  jal        RotMatrix
/* 2D61C 8003CE1C 21280002 */   addu      $a1, $s0, $zero
/* 2D620 8003CE20 21202002 */  addu       $a0, $s1, $zero
/* 2D624 8003CE24 21280002 */  addu       $a1, $s0, $zero
/* 2D628 8003CE28 BFF7020C */  jal        MulMatrix0
/* 2D62C 8003CE2C 21308000 */   addu      $a2, $a0, $zero
.L8003CE30:
/* 2D630 8003CE30 1400428E */  lw         $v0, 0x14($s2)
/* 2D634 8003CE34 00000000 */  nop
/* 2D638 8003CE38 01004234 */  ori        $v0, $v0, 0x1
/* 2D63C 8003CE3C A7F30008 */  j          .L8003CE9C
/* 2D640 8003CE40 140042AE */   sw        $v0, 0x14($s2)
.L8003CE44:
/* 2D644 8003CE44 1000A527 */  addiu      $a1, $sp, 0x10
.L8003CE48:
/* 2D648 8003CE48 0658020C */  jal        G2Quat_ToEuler
/* 2D64C 8003CE4C 21300000 */   addu      $a2, $zero, $zero
/* 2D650 8003CE50 1800B127 */  addiu      $s1, $sp, 0x18
/* 2D654 8003CE54 21202002 */  addu       $a0, $s1, $zero
/* 2D658 8003CE58 1000A297 */  lhu        $v0, 0x10($sp)
/* 2D65C 8003CE5C 2000468E */  lw         $a2, 0x20($s2)
/* 2D660 8003CE60 74005026 */  addiu      $s0, $s2, 0x74
/* 2D664 8003CE64 740042A6 */  sh         $v0, 0x74($s2)
/* 2D668 8003CE68 1200A297 */  lhu        $v0, 0x12($sp)
/* 2D66C 8003CE6C 21280002 */  addu       $a1, $s0, $zero
/* 2D670 8003CE70 760042A6 */  sh         $v0, 0x76($s2)
/* 2D674 8003CE74 1400A297 */  lhu        $v0, 0x14($sp)
/* 2D678 8003CE78 1800C624 */  addiu      $a2, $a2, 0x18
/* 2D67C 8003CE7C 2FF3000C */  jal        SCRIPT_CombineEulerAngles
/* 2D680 8003CE80 780042A6 */   sh        $v0, 0x78($s2)
/* 2D684 8003CE84 1800A297 */  lhu        $v0, 0x18($sp)
/* 2D688 8003CE88 02002396 */  lhu        $v1, 0x2($s1)
/* 2D68C 8003CE8C 04002496 */  lhu        $a0, 0x4($s1)
/* 2D690 8003CE90 740042A6 */  sh         $v0, 0x74($s2)
/* 2D694 8003CE94 020003A6 */  sh         $v1, 0x2($s0)
/* 2D698 8003CE98 040004A6 */  sh         $a0, 0x4($s0)
.L8003CE9C:
/* 2D69C 8003CE9C 21006012 */  beqz       $s3, .L8003CF24
/* 2D6A0 8003CEA0 21206002 */   addu      $a0, $s3, $zero
/* 2D6A4 8003CEA4 CE05010C */  jal        SplineGetFirstPoint
/* 2D6A8 8003CEA8 2128A002 */   addu      $a1, $s5, $zero
/* 2D6AC 8003CEAC 21384000 */  addu       $a3, $v0, $zero
/* 2D6B0 8003CEB0 1C00E010 */  beqz       $a3, .L8003CF24
/* 2D6B4 8003CEB4 00000000 */   nop
/* 2D6B8 8003CEB8 3C00A28F */  lw         $v0, 0x3C($sp)
/* 2D6BC 8003CEBC 00000000 */  nop
/* 2D6C0 8003CEC0 0F004010 */  beqz       $v0, .L8003CF00
/* 2D6C4 8003CEC4 6E004326 */   addiu     $v1, $s2, 0x6E
/* 2D6C8 8003CEC8 6E004296 */  lhu        $v0, 0x6E($s2)
/* 2D6CC 8003CECC 02006494 */  lhu        $a0, 0x2($v1)
/* 2D6D0 8003CED0 04006394 */  lhu        $v1, 0x4($v1)
/* 2D6D4 8003CED4 0000E594 */  lhu        $a1, 0x0($a3)
/* 2D6D8 8003CED8 0200E694 */  lhu        $a2, 0x2($a3)
/* 2D6DC 8003CEDC 0400E794 */  lhu        $a3, 0x4($a3)
/* 2D6E0 8003CEE0 21104500 */  addu       $v0, $v0, $a1
/* 2D6E4 8003CEE4 5C0042A6 */  sh         $v0, 0x5C($s2)
/* 2D6E8 8003CEE8 5C004226 */  addiu      $v0, $s2, 0x5C
/* 2D6EC 8003CEEC 21208600 */  addu       $a0, $a0, $a2
/* 2D6F0 8003CEF0 21186700 */  addu       $v1, $v1, $a3
/* 2D6F4 8003CEF4 020044A4 */  sh         $a0, 0x2($v0)
/* 2D6F8 8003CEF8 C9F30008 */  j          .L8003CF24
/* 2D6FC 8003CEFC 040043A4 */   sh        $v1, 0x4($v0)
.L8003CF00:
/* 2D700 8003CF00 0000E294 */  lhu        $v0, 0x0($a3)
/* 2D704 8003CF04 00000000 */  nop
/* 2D708 8003CF08 5C0042A6 */  sh         $v0, 0x5C($s2)
/* 2D70C 8003CF0C 0200E294 */  lhu        $v0, 0x2($a3)
/* 2D710 8003CF10 00000000 */  nop
/* 2D714 8003CF14 5E0042A6 */  sh         $v0, 0x5E($s2)
/* 2D718 8003CF18 0400E294 */  lhu        $v0, 0x4($a3)
/* 2D71C 8003CF1C 00000000 */  nop
/* 2D720 8003CF20 600042A6 */  sh         $v0, 0x60($s2)
.L8003CF24:
/* 2D724 8003CF24 0F008012 */  beqz       $s4, .L8003CF64
/* 2D728 8003CF28 21208002 */   addu      $a0, $s4, $zero
/* 2D72C 8003CF2C CE05010C */  jal        SplineGetFirstPoint
/* 2D730 8003CF30 2128C002 */   addu      $a1, $s6, $zero
/* 2D734 8003CF34 21184000 */  addu       $v1, $v0, $zero
/* 2D738 8003CF38 0A006010 */  beqz       $v1, .L8003CF64
/* 2D73C 8003CF3C 00000000 */   nop
/* 2D740 8003CF40 00006294 */  lhu        $v0, 0x0($v1)
/* 2D744 8003CF44 00000000 */  nop
/* 2D748 8003CF48 840042A6 */  sh         $v0, 0x84($s2)
/* 2D74C 8003CF4C 02006294 */  lhu        $v0, 0x2($v1)
/* 2D750 8003CF50 00000000 */  nop
/* 2D754 8003CF54 860042A6 */  sh         $v0, 0x86($s2)
/* 2D758 8003CF58 04006294 */  lhu        $v0, 0x4($v1)
/* 2D75C 8003CF5C 00000000 */  nop
/* 2D760 8003CF60 880042A6 */  sh         $v0, 0x88($s2)
.L8003CF64:
/* 2D764 8003CF64 5C00BF8F */  lw         $ra, 0x5C($sp)
/* 2D768 8003CF68 5800B68F */  lw         $s6, 0x58($sp)
/* 2D76C 8003CF6C 5400B58F */  lw         $s5, 0x54($sp)
/* 2D770 8003CF70 5000B48F */  lw         $s4, 0x50($sp)
/* 2D774 8003CF74 4C00B38F */  lw         $s3, 0x4C($sp)
/* 2D778 8003CF78 4800B28F */  lw         $s2, 0x48($sp)
/* 2D77C 8003CF7C 4400B18F */  lw         $s1, 0x44($sp)
/* 2D780 8003CF80 4000B08F */  lw         $s0, 0x40($sp)
/* 2D784 8003CF84 0800E003 */  jr         $ra
/* 2D788 8003CF88 6000BD27 */   addiu     $sp, $sp, 0x60
.size SCRIPT_InstanceSplineInit, . - SCRIPT_InstanceSplineInit
