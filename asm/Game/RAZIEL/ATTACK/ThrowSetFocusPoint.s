.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ThrowSetFocusPoint
/* 8EC10 8009E410 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8EC14 8009E414 3000B2AF */  sw         $s2, 0x30($sp)
/* 8EC18 8009E418 2190A000 */  addu       $s2, $a1, $zero
/* 8EC1C 8009E41C 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 8EC20 8009E420 3800B4AF */  sw         $s4, 0x38($sp)
/* 8EC24 8009E424 3400B3AF */  sw         $s3, 0x34($sp)
/* 8EC28 8009E428 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 8EC2C 8009E42C 2800B0AF */  sw         $s0, 0x28($sp)
/* 8EC30 8009E430 00004296 */  lhu        $v0, 0x0($s2)
/* 8EC34 8009E434 00000000 */  nop
/* 8EC38 8009E438 23100200 */  negu       $v0, $v0
/* 8EC3C 8009E43C 000042A6 */  sh         $v0, 0x0($s2)
/* 8EC40 8009E440 04AD908F */  lw         $s0, %gp_rel(theCamera + 0x74)($gp)
/* 8EC44 8009E444 2F97020C */  jal        razGetHeldWeapon
/* 8EC48 8009E448 21A08000 */   addu      $s4, $a0, $zero
/* 8EC4C 8009E44C 21884000 */  addu       $s1, $v0, $zero
/* 8EC50 8009E450 37002012 */  beqz       $s1, .L8009E530
/* 8EC54 8009E454 00000000 */   nop
/* 8EC58 8009E458 4000228E */  lw         $v0, 0x40($s1)
/* 8EC5C 8009E45C 00000000 */  nop
/* 8EC60 8009E460 33004010 */  beqz       $v0, .L8009E530
/* 8EC64 8009E464 21200002 */   addu      $a0, $s0, $zero
/* 8EC68 8009E468 1000A527 */  addiu      $a1, $sp, 0x10
/* 8EC6C 8009E46C 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8EC70 8009E470 1800B327 */  addiu      $s3, $sp, 0x18
/* 8EC74 8009E474 1000A0A7 */  sh         $zero, 0x10($sp)
/* 8EC78 8009E478 1200A0A7 */  sh         $zero, 0x12($sp)
/* 8EC7C 8009E47C 18004294 */  lhu        $v0, 0x18($v0)
/* 8EC80 8009E480 21306002 */  addu       $a2, $s3, $zero
/* 8EC84 8009E484 1AF2020C */  jal        ApplyMatrix
/* 8EC88 8009E488 1400A2A7 */   sh        $v0, 0x14($sp)
/* 8EC8C 8009E48C C8019026 */  addiu      $s0, $s4, 0x1C8
/* 8EC90 8009E490 21200002 */  addu       $a0, $s0, $zero
/* 8EC94 8009E494 0E000524 */  addiu      $a1, $zero, 0xE
/* 8EC98 8009E498 1800A297 */  lhu        $v0, 0x18($sp)
/* 8EC9C 8009E49C 1C00A397 */  lhu        $v1, 0x1C($sp)
/* 8ECA0 8009E4A0 2000A797 */  lhu        $a3, 0x20($sp)
/* 8ECA4 8009E4A4 9CFA82A7 */  sh         $v0, %gp_rel(Raziel + 0x46C)($gp)
/* 8ECA8 8009E4A8 9EFA83A7 */  sh         $v1, %gp_rel(Raziel + 0x46E)($gp)
/* 8ECAC 8009E4AC A0FA87A7 */  sh         $a3, %gp_rel(Raziel + 0x470)($gp)
/* 8ECB0 8009E4B0 E541020C */  jal        G2Anim_IsControllerActive
/* 8ECB4 8009E4B4 2130A000 */   addu      $a2, $a1, $zero
/* 8ECB8 8009E4B8 04004014 */  bnez       $v0, .L8009E4CC
/* 8ECBC 8009E4BC 21200002 */   addu      $a0, $s0, $zero
/* 8ECC0 8009E4C0 0E000524 */  addiu      $a1, $zero, 0xE
/* 8ECC4 8009E4C4 5641020C */  jal        G2Anim_EnableController
/* 8ECC8 8009E4C8 2130A000 */   addu      $a2, $a1, $zero
.L8009E4CC:
/* 8ECCC 8009E4CC 95E8000C */  jal        MATH3D_ZYXtoXYZ
/* 8ECD0 8009E4D0 21204002 */   addu      $a0, $s2, $zero
/* 8ECD4 8009E4D4 21200002 */  addu       $a0, $s0, $zero
/* 8ECD8 8009E4D8 0E000524 */  addiu      $a1, $zero, 0xE
/* 8ECDC 8009E4DC 2130A000 */  addu       $a2, $a1, $zero
/* 8ECE0 8009E4E0 7D42020C */  jal        G2Anim_SetController_Vector
/* 8ECE4 8009E4E4 21384002 */   addu      $a3, $s2, $zero
/* 8ECE8 8009E4E8 4000228E */  lw         $v0, 0x40($s1)
/* 8ECEC 8009E4EC 00000000 */  nop
/* 8ECF0 8009E4F0 3400428C */  lw         $v0, 0x34($v0)
/* 8ECF4 8009E4F4 00000000 */  nop
/* 8ECF8 8009E4F8 1800A2AF */  sw         $v0, 0x18($sp)
/* 8ECFC 8009E4FC 4000228E */  lw         $v0, 0x40($s1)
/* 8ED00 8009E500 00000000 */  nop
/* 8ED04 8009E504 3800428C */  lw         $v0, 0x38($v0)
/* 8ED08 8009E508 04AD8427 */  addiu      $a0, $gp, %gp_rel(theCamera + 0x74)
/* 8ED0C 8009E50C 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 8ED10 8009E510 4000228E */  lw         $v0, 0x40($s1)
/* 8ED14 8009E514 E8FB838F */  lw         $v1, %gp_rel(PlayerData)($gp)
/* 8ED18 8009E518 3C00428C */  lw         $v0, 0x3C($v0)
/* 8ED1C 8009E51C 8CFF8424 */  addiu      $a0, $a0, -0x74
/* 8ED20 8009E520 2000A2AF */  sw         $v0, 0x20($sp)
/* 8ED24 8009E524 2C00668C */  lw         $a2, 0x2C($v1)
/* 8ED28 8009E528 6762000C */  jal        CAMERA_SetLookFocusAndDistance
/* 8ED2C 8009E52C 21286002 */   addu      $a1, $s3, $zero
.L8009E530:
/* 8ED30 8009E530 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 8ED34 8009E534 3800B48F */  lw         $s4, 0x38($sp)
/* 8ED38 8009E538 3400B38F */  lw         $s3, 0x34($sp)
/* 8ED3C 8009E53C 3000B28F */  lw         $s2, 0x30($sp)
/* 8ED40 8009E540 2C00B18F */  lw         $s1, 0x2C($sp)
/* 8ED44 8009E544 2800B08F */  lw         $s0, 0x28($sp)
/* 8ED48 8009E548 0800E003 */  jr         $ra
/* 8ED4C 8009E54C 4000BD27 */   addiu     $sp, $sp, 0x40
.size ThrowSetFocusPoint, . - ThrowSetFocusPoint
