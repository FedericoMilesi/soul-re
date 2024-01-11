.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_DeleteOutOfRangeNodesOfSource
/* 88144 80097944 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88148 80097948 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8814C 8009794C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 88150 80097950 21988000 */  addu       $s3, $a0, $zero
/* 88154 80097954 1800B2AF */  sw         $s2, 0x18($sp)
/* 88158 80097958 2190A000 */  addu       $s2, $a1, $zero
/* 8815C 8009795C 2000B4AF */  sw         $s4, 0x20($sp)
/* 88160 80097960 21A0C000 */  addu       $s4, $a2, $zero
/* 88164 80097964 2400B5AF */  sw         $s5, 0x24($sp)
/* 88168 80097968 21A8E000 */  addu       $s5, $a3, $zero
/* 8816C 8009796C 2800BFAF */  sw         $ra, 0x28($sp)
/* 88170 80097970 1400B1AF */  sw         $s1, 0x14($sp)
/* 88174 80097974 1000B0AF */  sw         $s0, 0x10($sp)
/* 88178 80097978 01004290 */  lbu        $v0, 0x1($v0)
/* 8817C 8009797C 00000000 */  nop
/* 88180 80097980 1D004010 */  beqz       $v0, .L800979F8
/* 88184 80097984 21880000 */   addu      $s1, $zero, $zero
/* 88188 80097988 21806002 */  addu       $s0, $s3, $zero
.L8009798C:
/* 8818C 8009798C 14000296 */  lhu        $v0, 0x14($s0)
/* 88190 80097990 00000000 */  nop
/* 88194 80097994 07004230 */  andi       $v0, $v0, 0x7
/* 88198 80097998 10005414 */  bne        $v0, $s4, .L800979DC
/* 8819C 8009799C 00000000 */   nop
/* 881A0 800979A0 00004286 */  lh         $v0, 0x0($s2)
/* 881A4 800979A4 00000486 */  lh         $a0, 0x0($s0)
/* 881A8 800979A8 02004386 */  lh         $v1, 0x2($s2)
/* 881AC 800979AC 02000586 */  lh         $a1, 0x2($s0)
/* 881B0 800979B0 04000686 */  lh         $a2, 0x4($s0)
/* 881B4 800979B4 23204400 */  subu       $a0, $v0, $a0
/* 881B8 800979B8 04004286 */  lh         $v0, 0x4($s2)
/* 881BC 800979BC 23286500 */  subu       $a1, $v1, $a1
/* 881C0 800979C0 B7E6000C */  jal        MATH3D_LengthXYZ
/* 881C4 800979C4 23304600 */   subu      $a2, $v0, $a2
/* 881C8 800979C8 2A10A202 */  slt        $v0, $s5, $v0
/* 881CC 800979CC 03004010 */  beqz       $v0, .L800979DC
/* 881D0 800979D0 21200002 */   addu      $a0, $s0, $zero
/* 881D4 800979D4 EB66020C */  jal        PLANPOOL_DeleteNodeFromPool
/* 881D8 800979D8 21286002 */   addu      $a1, $s3, $zero
.L800979DC:
/* 881DC 800979DC ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 881E0 800979E0 00000000 */  nop
/* 881E4 800979E4 01004290 */  lbu        $v0, 0x1($v0)
/* 881E8 800979E8 01003126 */  addiu      $s1, $s1, 0x1
/* 881EC 800979EC 2A102202 */  slt        $v0, $s1, $v0
/* 881F0 800979F0 E6FF4014 */  bnez       $v0, .L8009798C
/* 881F4 800979F4 1C001026 */   addiu     $s0, $s0, 0x1C
.L800979F8:
/* 881F8 800979F8 2800BF8F */  lw         $ra, 0x28($sp)
/* 881FC 800979FC 2400B58F */  lw         $s5, 0x24($sp)
/* 88200 80097A00 2000B48F */  lw         $s4, 0x20($sp)
/* 88204 80097A04 1C00B38F */  lw         $s3, 0x1C($sp)
/* 88208 80097A08 1800B28F */  lw         $s2, 0x18($sp)
/* 8820C 80097A0C 1400B18F */  lw         $s1, 0x14($sp)
/* 88210 80097A10 1000B08F */  lw         $s0, 0x10($sp)
/* 88214 80097A14 0800E003 */  jr         $ra
/* 88218 80097A18 3000BD27 */   addiu     $sp, $sp, 0x30
.size PLAN_DeleteOutOfRangeNodesOfSource, . - PLAN_DeleteOutOfRangeNodesOfSource
