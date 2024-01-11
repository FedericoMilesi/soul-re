.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_GetClosestUnexploredValidNeighbor
/* 8A0F0 800998F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8A0F4 800998F4 1400B1AF */  sw         $s1, 0x14($sp)
/* 8A0F8 800998F8 21888000 */  addu       $s1, $a0, $zero
/* 8A0FC 800998FC 2800B6AF */  sw         $s6, 0x28($sp)
/* 8A100 80099900 21B0A000 */  addu       $s6, $a1, $zero
/* 8A104 80099904 2400B5AF */  sw         $s5, 0x24($sp)
/* 8A108 80099908 FFFF1524 */  addiu      $s5, $zero, -0x1
/* 8A10C 8009990C 2000B4AF */  sw         $s4, 0x20($sp)
/* 8A110 80099910 21A00000 */  addu       $s4, $zero, $zero
/* 8A114 80099914 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 8A118 80099918 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8A11C 8009991C 1800B2AF */  sw         $s2, 0x18($sp)
/* 8A120 80099920 2C002012 */  beqz       $s1, .L800999D4
/* 8A124 80099924 1000B0AF */   sw        $s0, 0x10($sp)
/* 8A128 80099928 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8A12C 8009992C 00000000 */  nop
/* 8A130 80099930 01004290 */  lbu        $v0, 0x1($v0)
/* 8A134 80099934 0800328E */  lw         $s2, 0x8($s1)
/* 8A138 80099938 2A108202 */  slt        $v0, $s4, $v0
/* 8A13C 8009993C 25004010 */  beqz       $v0, .L800999D4
/* 8A140 80099940 21980000 */   addu      $s3, $zero, $zero
/* 8A144 80099944 2180C002 */  addu       $s0, $s6, $zero
.L80099948:
/* 8A148 80099948 01004232 */  andi       $v0, $s2, 0x1
/* 8A14C 8009994C 19004014 */  bnez       $v0, .L800999B4
/* 8A150 80099950 21202002 */   addu      $a0, $s1, $zero
/* 8A154 80099954 6D65020C */  jal        PLANPOOL_AppropriatePair
/* 8A158 80099958 21280002 */   addu      $a1, $s0, $zero
/* 8A15C 8009995C 12004010 */  beqz       $v0, .L800999A8
/* 8A160 80099960 21202002 */   addu      $a0, $s1, $zero
/* 8A164 80099964 00002286 */  lh         $v0, 0x0($s1)
/* 8A168 80099968 00000486 */  lh         $a0, 0x0($s0)
/* 8A16C 8009996C 02002386 */  lh         $v1, 0x2($s1)
/* 8A170 80099970 02000586 */  lh         $a1, 0x2($s0)
/* 8A174 80099974 04000686 */  lh         $a2, 0x4($s0)
/* 8A178 80099978 23204400 */  subu       $a0, $v0, $a0
/* 8A17C 8009997C 04002286 */  lh         $v0, 0x4($s1)
/* 8A180 80099980 23286500 */  subu       $a1, $v1, $a1
/* 8A184 80099984 B7E6000C */  jal        MATH3D_LengthXYZ
/* 8A188 80099988 23304600 */   subu      $a2, $v0, $a2
/* 8A18C 8009998C 21184000 */  addu       $v1, $v0, $zero
/* 8A190 80099990 2B107500 */  sltu       $v0, $v1, $s5
/* 8A194 80099994 07004010 */  beqz       $v0, .L800999B4
/* 8A198 80099998 00000000 */   nop
/* 8A19C 8009999C 21A86000 */  addu       $s5, $v1, $zero
/* 8A1A0 800999A0 6D660208 */  j          .L800999B4
/* 8A1A4 800999A4 21A00002 */   addu      $s4, $s0, $zero
.L800999A8:
/* 8A1A8 800999A8 21280002 */  addu       $a1, $s0, $zero
/* 8A1AC 800999AC 2566020C */  jal        PLANPOOL_MarkTwoNodesAsNotConnected
/* 8A1B0 800999B0 2130C002 */   addu      $a2, $s6, $zero
.L800999B4:
/* 8A1B4 800999B4 42901200 */  srl        $s2, $s2, 1
/* 8A1B8 800999B8 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8A1BC 800999BC 00000000 */  nop
/* 8A1C0 800999C0 01004290 */  lbu        $v0, 0x1($v0)
/* 8A1C4 800999C4 01007326 */  addiu      $s3, $s3, 0x1
/* 8A1C8 800999C8 2A106202 */  slt        $v0, $s3, $v0
/* 8A1CC 800999CC DEFF4014 */  bnez       $v0, .L80099948
/* 8A1D0 800999D0 1C001026 */   addiu     $s0, $s0, 0x1C
.L800999D4:
/* 8A1D4 800999D4 21108002 */  addu       $v0, $s4, $zero
/* 8A1D8 800999D8 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 8A1DC 800999DC 2800B68F */  lw         $s6, 0x28($sp)
/* 8A1E0 800999E0 2400B58F */  lw         $s5, 0x24($sp)
/* 8A1E4 800999E4 2000B48F */  lw         $s4, 0x20($sp)
/* 8A1E8 800999E8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8A1EC 800999EC 1800B28F */  lw         $s2, 0x18($sp)
/* 8A1F0 800999F0 1400B18F */  lw         $s1, 0x14($sp)
/* 8A1F4 800999F4 1000B08F */  lw         $s0, 0x10($sp)
/* 8A1F8 800999F8 0800E003 */  jr         $ra
/* 8A1FC 800999FC 3000BD27 */   addiu     $sp, $sp, 0x30
.size PLANPOOL_GetClosestUnexploredValidNeighbor, . - PLANPOOL_GetClosestUnexploredValidNeighbor
