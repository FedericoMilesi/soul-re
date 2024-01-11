.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_HalvePlaneInstanceTransformAndDraw
/* 2CC60 8003C460 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 2CC64 8003C464 C000B2AF */  sw         $s2, 0xC0($sp)
/* 2CC68 8003C468 21908000 */  addu       $s2, $a0, $zero
/* 2CC6C 8003C46C BC00B1AF */  sw         $s1, 0xBC($sp)
/* 2CC70 8003C470 2188A000 */  addu       $s1, $a1, $zero
/* 2CC74 8003C474 D800BFAF */  sw         $ra, 0xD8($sp)
/* 2CC78 8003C478 D400B7AF */  sw         $s7, 0xD4($sp)
/* 2CC7C 8003C47C D000B6AF */  sw         $s6, 0xD0($sp)
/* 2CC80 8003C480 CC00B5AF */  sw         $s5, 0xCC($sp)
/* 2CC84 8003C484 C800B4AF */  sw         $s4, 0xC8($sp)
/* 2CC88 8003C488 C400B3AF */  sw         $s3, 0xC4($sp)
/* 2CC8C 8003C48C B800B0AF */  sw         $s0, 0xB8($sp)
/* 2CC90 8003C490 1C00438E */  lw         $v1, 0x1C($s2)
/* 2CC94 8003C494 26014286 */  lh         $v0, 0x126($s2)
/* 2CC98 8003C498 4000548E */  lw         $s4, 0x40($s2)
/* 2CC9C 8003C49C 0C00638C */  lw         $v1, 0xC($v1)
/* 2CCA0 8003C4A0 80100200 */  sll        $v0, $v0, 2
/* 2CCA4 8003C4A4 21104300 */  addu       $v0, $v0, $v1
/* 2CCA8 8003C4A8 0000538C */  lw         $s3, 0x0($v0)
/* 2CCAC 8003C4AC 34014296 */  lhu        $v0, 0x134($s2)
/* 2CCB0 8003C4B0 0400778E */  lw         $s7, 0x4($s3)
/* 2CCB4 8003C4B4 21B0C000 */  addu       $s6, $a2, $zero
/* 2CCB8 8003C4B8 A800A2A7 */  sh         $v0, 0xA8($sp)
/* 2CCBC 8003C4BC 36014496 */  lhu        $a0, 0x136($s2)
/* 2CCC0 8003C4C0 A800A527 */  addiu      $a1, $sp, 0xA8
/* 2CCC4 8003C4C4 0200A4A4 */  sh         $a0, 0x2($a1)
/* 2CCC8 8003C4C8 38014696 */  lhu        $a2, 0x138($s2)
/* 2CCCC 8003C4CC 00140200 */  sll        $v0, $v0, 16
/* 2CCD0 8003C4D0 0400A6A4 */  sh         $a2, 0x4($a1)
/* 2CCD4 8003C4D4 3C01438E */  lw         $v1, 0x13C($s2)
/* 2CCD8 8003C4D8 03140200 */  sra        $v0, $v0, 16
/* 2CCDC 8003C4DC 18004300 */  mult       $v0, $v1
/* 2CCE0 8003C4E0 00240400 */  sll        $a0, $a0, 16
/* 2CCE4 8003C4E4 12400000 */  mflo       $t0
/* 2CCE8 8003C4E8 03130800 */  sra        $v0, $t0, 12
/* 2CCEC 8003C4EC 23100200 */  negu       $v0, $v0
/* 2CCF0 8003C4F0 B000A2A7 */  sh         $v0, 0xB0($sp)
/* 2CCF4 8003C4F4 3C01428E */  lw         $v0, 0x13C($s2)
/* 2CCF8 8003C4F8 03240400 */  sra        $a0, $a0, 16
/* 2CCFC 8003C4FC 18008200 */  mult       $a0, $v0
/* 2CD00 8003C500 00340600 */  sll        $a2, $a2, 16
/* 2CD04 8003C504 12400000 */  mflo       $t0
/* 2CD08 8003C508 03130800 */  sra        $v0, $t0, 12
/* 2CD0C 8003C50C 23100200 */  negu       $v0, $v0
/* 2CD10 8003C510 B200A2A7 */  sh         $v0, 0xB2($sp)
/* 2CD14 8003C514 3C01428E */  lw         $v0, 0x13C($s2)
/* 2CD18 8003C518 03340600 */  sra        $a2, $a2, 16
/* 2CD1C 8003C51C 1800C200 */  mult       $a2, $v0
/* 2CD20 8003C520 21A8E000 */  addu       $s5, $a3, $zero
/* 2CD24 8003C524 2800A427 */  addiu      $a0, $sp, 0x28
/* 2CD28 8003C528 B000A627 */  addiu      $a2, $sp, 0xB0
/* 2CD2C 8003C52C 12400000 */  mflo       $t0
/* 2CD30 8003C530 03130800 */  sra        $v0, $t0, 12
/* 2CD34 8003C534 23100200 */  negu       $v0, $v0
/* 2CD38 8003C538 85EE000C */  jal        PIPE3D_CalcWorldToSplitPlaneTransform
/* 2CD3C 8003C53C B400A2A7 */   sh        $v0, 0xB4($sp)
/* 2CD40 8003C540 4800B027 */  addiu      $s0, $sp, 0x48
/* 2CD44 8003C544 21200002 */  addu       $a0, $s0, $zero
/* 2CD48 8003C548 F5EA000C */  jal        PIPE3D_InvertTransform
/* 2CD4C 8003C54C 2800A527 */   addiu     $a1, $sp, 0x28
/* 2CD50 8003C550 21202002 */  addu       $a0, $s1, $zero
/* 2CD54 8003C554 21280002 */  addu       $a1, $s0, $zero
/* 2CD58 8003C558 59FD020C */  jal        CompMatrix
/* 2CD5C 8003C55C 6800A627 */   addiu     $a2, $sp, 0x68
/* 2CD60 8003C560 31008012 */  beqz       $s4, .L8003C628
/* 2CD64 8003C564 21204002 */   addu      $a0, $s2, $zero
/* 2CD68 8003C568 00080524 */  addiu      $a1, $zero, 0x800
/* 2CD6C 8003C56C 8800B027 */  addiu      $s0, $sp, 0x88
/* 2CD70 8003C570 90D7000C */  jal        LIGHT_PresetInstanceLight
/* 2CD74 8003C574 21300002 */   addu      $a2, $s0, $zero
/* 2CD78 8003C578 39D6000C */  jal        INSTANCE_GetFadeValue
/* 2CD7C 8003C57C 21204002 */   addu      $a0, $s2, $zero
/* 2CD80 8003C580 2120E002 */  addu       $a0, $s7, $zero
/* 2CD84 8003C584 2128C002 */  addu       $a1, $s6, $zero
/* 2CD88 8003C588 F400A38F */  lw         $v1, 0xF4($sp)
/* 2CD8C 8003C58C 21306002 */  addu       $a2, $s3, $zero
/* 2CD90 8003C590 1000B4AF */  sw         $s4, 0x10($sp)
/* 2CD94 8003C594 1800B0AF */  sw         $s0, 0x18($sp)
/* 2CD98 8003C598 1400A3AF */  sw         $v1, 0x14($sp)
/* 2CD9C 8003C59C 8010C326 */  addiu      $v1, $s6, 0x1080
/* 2CDA0 8003C5A0 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 2CDA4 8003C5A4 9802438E */  lw         $v1, 0x298($s2)
/* 2CDA8 8003C5A8 2800A727 */  addiu      $a3, $sp, 0x28
/* 2CDAC 8003C5AC 5C9082AF */  sw         $v0, %gp_rel(modelFadeValue)($gp)
/* 2CDB0 8003C5B0 BAEE000C */  jal        PIPE3D_TransformAnimatedSplitInstanceVertices
/* 2CDB4 8003C5B4 2000A3AF */   sw        $v1, 0x20($sp)
/* 2CDB8 8003C5B8 1000628E */  lw         $v0, 0x10($s3)
/* 2CDBC 8003C5BC 0800A48E */  lw         $a0, 0x8($s5)
/* 2CDC0 8003C5C0 40180200 */  sll        $v1, $v0, 1
/* 2CDC4 8003C5C4 21186200 */  addu       $v1, $v1, $v0
/* 2CDC8 8003C5C8 0400A28E */  lw         $v0, 0x4($s5)
/* 2CDCC 8003C5CC 00190300 */  sll        $v1, $v1, 4
/* 2CDD0 8003C5D0 21104300 */  addu       $v0, $v0, $v1
/* 2CDD4 8003C5D4 2B104400 */  sltu       $v0, $v0, $a0
/* 2CDD8 8003C5D8 13004010 */  beqz       $v0, .L8003C628
/* 2CDDC 8003C5DC 00000000 */   nop
/* 2CDE0 8003C5E0 3A014296 */  lhu        $v0, 0x13A($s2)
/* 2CDE4 8003C5E4 00000000 */  nop
/* 2CDE8 8003C5E8 02004230 */  andi       $v0, $v0, 0x2
/* 2CDEC 8003C5EC 04004010 */  beqz       $v0, .L8003C600
/* 2CDF0 8003C5F0 01000224 */   addiu     $v0, $zero, 0x1
/* 2CDF4 8003C5F4 6C9082AF */  sw         $v0, %gp_rel(draw_belowSplit)($gp)
/* 2CDF8 8003C5F8 82F10008 */  j          .L8003C608
/* 2CDFC 8003C5FC 21206002 */   addu      $a0, $s3, $zero
.L8003C600:
/* 2CE00 8003C600 6C9080AF */  sw         $zero, %gp_rel(draw_belowSplit)($gp)
/* 2CE04 8003C604 21206002 */  addu       $a0, $s3, $zero
.L8003C608:
/* 2CE08 8003C608 21284002 */  addu       $a1, $s2, $zero
/* 2CE0C 8003C60C 2130C002 */  addu       $a2, $s6, $zero
/* 2CE10 8003C610 F000A28F */  lw         $v0, 0xF0($sp)
/* 2CE14 8003C614 6800A727 */  addiu      $a3, $sp, 0x68
/* 2CE18 8003C618 1000B5AF */  sw         $s5, 0x10($sp)
/* 2CE1C 8003C61C E3A1000C */  jal        DRAW_SplitModel_S
/* 2CE20 8003C620 1400A2AF */   sw        $v0, 0x14($sp)
/* 2CE24 8003C624 0400A2AE */  sw         $v0, 0x4($s5)
.L8003C628:
/* 2CE28 8003C628 D800BF8F */  lw         $ra, 0xD8($sp)
/* 2CE2C 8003C62C D400B78F */  lw         $s7, 0xD4($sp)
/* 2CE30 8003C630 D000B68F */  lw         $s6, 0xD0($sp)
/* 2CE34 8003C634 CC00B58F */  lw         $s5, 0xCC($sp)
/* 2CE38 8003C638 C800B48F */  lw         $s4, 0xC8($sp)
/* 2CE3C 8003C63C C400B38F */  lw         $s3, 0xC4($sp)
/* 2CE40 8003C640 C000B28F */  lw         $s2, 0xC0($sp)
/* 2CE44 8003C644 BC00B18F */  lw         $s1, 0xBC($sp)
/* 2CE48 8003C648 B800B08F */  lw         $s0, 0xB8($sp)
/* 2CE4C 8003C64C 0800E003 */  jr         $ra
/* 2CE50 8003C650 E000BD27 */   addiu     $sp, $sp, 0xE0
.size PIPE3D_HalvePlaneInstanceTransformAndDraw, . - PIPE3D_HalvePlaneInstanceTransformAndDraw
