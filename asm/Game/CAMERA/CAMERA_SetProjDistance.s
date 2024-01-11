.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetProjDistance
/* 572C 80014F2C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5730 80014F30 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 5734 80014F34 21988000 */  addu       $s3, $a0, $zero
/* 5738 80014F38 1000B0AF */  sw         $s0, 0x10($sp)
/* 573C 80014F3C 2180A000 */  addu       $s0, $a1, $zero
/* 5740 80014F40 21200002 */  addu       $a0, $s0, $zero
/* 5744 80014F44 2400BFAF */  sw         $ra, 0x24($sp)
/* 5748 80014F48 2000B4AF */  sw         $s4, 0x20($sp)
/* 574C 80014F4C 1800B2AF */  sw         $s2, 0x18($sp)
/* 5750 80014F50 0AF3020C */  jal        SetGeomScreen
/* 5754 80014F54 1400B1AF */   sw        $s1, 0x14($sp)
/* 5758 80014F58 21206002 */  addu       $a0, $s3, $zero
/* 575C 80014F5C A952000C */  jal        CAMERA_CalculateViewVolumeNormals
/* 5760 80014F60 680070AE */   sw        $s0, 0x68($s3)
/* 5764 80014F64 21900000 */  addu       $s2, $zero, $zero
/* 5768 80014F68 02001424 */  addiu      $s4, $zero, 0x2
/* 576C 80014F6C 3CC79127 */  addiu      $s1, $gp, %gp_rel(StreamTracker)
.L80014F70:
/* 5770 80014F70 04002286 */  lh         $v0, 0x4($s1)
/* 5774 80014F74 00000000 */  nop
/* 5778 80014F78 09005414 */  bne        $v0, $s4, .L80014FA0
/* 577C 80014F7C 00000000 */   nop
/* 5780 80014F80 0800308E */  lw         $s0, 0x8($s1)
/* 5784 80014F84 6800668E */  lw         $a2, 0x68($s3)
/* 5788 80014F88 46000496 */  lhu        $a0, 0x46($s0)
/* 578C 80014F8C 44000596 */  lhu        $a1, 0x44($s0)
/* 5790 80014F90 C8F3020C */  jal        SetFogNearFar
/* 5794 80014F94 00000000 */   nop
/* 5798 80014F98 6DDC000C */  jal        LIGHT_CalcDQPTable
/* 579C 80014F9C 21200002 */   addu      $a0, $s0, $zero
.L80014FA0:
/* 57A0 80014FA0 01005226 */  addiu      $s2, $s2, 0x1
/* 57A4 80014FA4 1000422A */  slti       $v0, $s2, 0x10
/* 57A8 80014FA8 F1FF4014 */  bnez       $v0, .L80014F70
/* 57AC 80014FAC 40003126 */   addiu     $s1, $s1, 0x40
/* 57B0 80014FB0 2400BF8F */  lw         $ra, 0x24($sp)
/* 57B4 80014FB4 2000B48F */  lw         $s4, 0x20($sp)
/* 57B8 80014FB8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 57BC 80014FBC 1800B28F */  lw         $s2, 0x18($sp)
/* 57C0 80014FC0 1400B18F */  lw         $s1, 0x14($sp)
/* 57C4 80014FC4 1000B08F */  lw         $s0, 0x10($sp)
/* 57C8 80014FC8 0800E003 */  jr         $ra
/* 57CC 80014FCC 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_SetProjDistance, . - CAMERA_SetProjDistance
