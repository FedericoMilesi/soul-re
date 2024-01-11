.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_AddOrRemoveNodes
/* 88328 80097B28 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8832C 80097B2C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 88330 80097B30 1400B1AF */  sw         $s1, 0x14($sp)
/* 88334 80097B34 21888000 */  addu       $s1, $a0, $zero
/* 88338 80097B38 1800B2AF */  sw         $s2, 0x18($sp)
/* 8833C 80097B3C 2190A000 */  addu       $s2, $a1, $zero
/* 88340 80097B40 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 88344 80097B44 1000B0AF */  sw         $s0, 0x10($sp)
/* 88348 80097B48 5C004386 */  lh         $v1, 0x5C($s2)
/* 8834C 80097B4C 5E004786 */  lh         $a3, 0x5E($s2)
/* 88350 80097B50 02004484 */  lh         $a0, 0x2($v0)
/* 88354 80097B54 04004584 */  lh         $a1, 0x4($v0)
/* 88358 80097B58 06004684 */  lh         $a2, 0x6($v0)
/* 8835C 80097B5C 23206400 */  subu       $a0, $v1, $a0
/* 88360 80097B60 60004386 */  lh         $v1, 0x60($s2)
/* 88364 80097B64 2328E500 */  subu       $a1, $a3, $a1
/* 88368 80097B68 B7E6000C */  jal        MATH3D_LengthXYZ
/* 8836C 80097B6C 23306600 */   subu      $a2, $v1, $a2
/* 88370 80097B70 F5014228 */  slti       $v0, $v0, 0x1F5
/* 88374 80097B74 1E004014 */  bnez       $v0, .L80097BF0
/* 88378 80097B78 21202002 */   addu      $a0, $s1, $zero
/* 8837C 80097B7C 5C005026 */  addiu      $s0, $s2, 0x5C
/* 88380 80097B80 6C5D020C */  jal        PLAN_UpdatePlayerNode
/* 88384 80097B84 21280002 */   addu      $a1, $s0, $zero
/* 88388 80097B88 21202002 */  addu       $a0, $s1, $zero
/* 8838C 80097B8C D95C020C */  jal        PLAN_UpdatePlanMkrNodes
/* 88390 80097B90 21280002 */   addu      $a1, $s0, $zero
/* 88394 80097B94 21202002 */  addu       $a0, $s1, $zero
/* 88398 80097B98 21280002 */  addu       $a1, $s0, $zero
/* 8839C 80097B9C 21300000 */  addu       $a2, $zero, $zero
/* 883A0 80097BA0 515E020C */  jal        PLAN_DeleteOutOfRangeNodesOfSource
/* 883A4 80097BA4 E02E0724 */   addiu     $a3, $zero, 0x2EE0
/* 883A8 80097BA8 21202002 */  addu       $a0, $s1, $zero
/* 883AC 80097BAC 21280002 */  addu       $a1, $s0, $zero
/* 883B0 80097BB0 02000624 */  addiu      $a2, $zero, 0x2
/* 883B4 80097BB4 515E020C */  jal        PLAN_DeleteOutOfRangeNodesOfSource
/* 883B8 80097BB8 E02E0724 */   addiu     $a3, $zero, 0x2EE0
/* 883BC 80097BBC 21202002 */  addu       $a0, $s1, $zero
/* 883C0 80097BC0 21280002 */  addu       $a1, $s0, $zero
/* 883C4 80097BC4 03000624 */  addiu      $a2, $zero, 0x3
/* 883C8 80097BC8 515E020C */  jal        PLAN_DeleteOutOfRangeNodesOfSource
/* 883CC 80097BCC E02E0724 */   addiu     $a3, $zero, 0x2EE0
/* 883D0 80097BD0 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 883D4 80097BD4 5F00488A */  lwl        $t0, 0x5F($s2)
/* 883D8 80097BD8 5C00489A */  lwr        $t0, 0x5C($s2)
/* 883DC 80097BDC 60004986 */  lh         $t1, 0x60($s2)
/* 883E0 80097BE0 050048A8 */  swl        $t0, 0x5($v0)
/* 883E4 80097BE4 020048B8 */  swr        $t0, 0x2($v0)
/* 883E8 80097BE8 060049A4 */  sh         $t1, 0x6($v0)
/* 883EC 80097BEC 21202002 */  addu       $a0, $s1, $zero
.L80097BF0:
/* 883F0 80097BF0 875E020C */  jal        PLAN_AddOrRemoveRandomNodes
/* 883F4 80097BF4 5C004526 */   addiu     $a1, $s2, 0x5C
/* 883F8 80097BF8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 883FC 80097BFC 1800B28F */  lw         $s2, 0x18($sp)
/* 88400 80097C00 1400B18F */  lw         $s1, 0x14($sp)
/* 88404 80097C04 1000B08F */  lw         $s0, 0x10($sp)
/* 88408 80097C08 0800E003 */  jr         $ra
/* 8840C 80097C0C 2000BD27 */   addiu     $sp, $sp, 0x20
.size PLAN_AddOrRemoveNodes, . - PLAN_AddOrRemoveNodes
