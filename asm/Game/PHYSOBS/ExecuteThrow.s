.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ExecuteThrow
/* 5EB70 8006E370 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5EB74 8006E374 2400B1AF */  sw         $s1, 0x24($sp)
/* 5EB78 8006E378 21888000 */  addu       $s1, $a0, $zero
/* 5EB7C 8006E37C 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 5EB80 8006E380 2800B2AF */  sw         $s2, 0x28($sp)
/* 5EB84 8006E384 2000B0AF */  sw         $s0, 0x20($sp)
/* 5EB88 8006E388 6C01328E */  lw         $s2, 0x16C($s1)
/* 5EB8C 8006E38C 00000000 */  nop
/* 5EB90 8006E390 36004296 */  lhu        $v0, 0x36($s2)
/* 5EB94 8006E394 00000000 */  nop
/* 5EB98 8006E398 01004230 */  andi       $v0, $v0, 0x1
/* 5EB9C 8006E39C 1B004010 */  beqz       $v0, .L8006E40C
/* 5EBA0 8006E3A0 1000A427 */   addiu     $a0, $sp, 0x10
/* 5EBA4 8006E3A4 21280000 */  addu       $a1, $zero, $zero
/* 5EBA8 8006E3A8 2EF2020C */  jal        func_800BC8B8
/* 5EBAC 8006E3AC 06000624 */   addiu     $a2, $zero, 0x6
/* 5EBB0 8006E3B0 74012296 */  lhu        $v0, 0x174($s1)
/* 5EBB4 8006E3B4 1000A427 */  addiu      $a0, $sp, 0x10
/* 5EBB8 8006E3B8 1800A2A7 */  sh         $v0, 0x18($sp)
/* 5EBBC 8006E3BC 78012296 */  lhu        $v0, 0x178($s1)
/* 5EBC0 8006E3C0 1800B027 */  addiu      $s0, $sp, 0x18
/* 5EBC4 8006E3C4 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 5EBC8 8006E3C8 7C012296 */  lhu        $v0, 0x17C($s1)
/* 5EBCC 8006E3CC 21280002 */  addu       $a1, $s0, $zero
/* 5EBD0 8006E3D0 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 5EBD4 8006E3D4 1C00A2A7 */   sh        $v0, 0x1C($sp)
/* 5EBD8 8006E3D8 1000A427 */  addiu      $a0, $sp, 0x10
/* 5EBDC 8006E3DC 21280002 */  addu       $a1, $s0, $zero
/* 5EBE0 8006E3E0 ACE8000C */  jal        MATH3D_ElevationFromPosToPos
/* 5EBE4 8006E3E4 21804000 */   addu      $s0, $v0, $zero
/* 5EBE8 8006E3E8 38004396 */  lhu        $v1, 0x38($s2)
/* 5EBEC 8006E3EC 74002426 */  addiu      $a0, $s1, 0x74
/* 5EBF0 8006E3F0 780030A6 */  sh         $s0, 0x78($s1)
/* 5EBF4 8006E3F4 760020A6 */  sh         $zero, 0x76($s1)
/* 5EBF8 8006E3F8 21186200 */  addu       $v1, $v1, $v0
/* 5EBFC 8006E3FC 95E8000C */  jal        MATH3D_ZYXtoXYZ
/* 5EC00 8006E400 740023A6 */   sh        $v1, 0x74($s1)
/* 5EC04 8006E404 12B90108 */  j          .L8006E448
/* 5EC08 8006E408 00000000 */   nop
.L8006E40C:
/* 5EC0C 8006E40C 74002296 */  lhu        $v0, 0x74($s1)
/* 5EC10 8006E410 3A004396 */  lhu        $v1, 0x3A($s2)
/* 5EC14 8006E414 00000000 */  nop
/* 5EC18 8006E418 21104300 */  addu       $v0, $v0, $v1
/* 5EC1C 8006E41C 740022A6 */  sh         $v0, 0x74($s1)
/* 5EC20 8006E420 76002296 */  lhu        $v0, 0x76($s1)
/* 5EC24 8006E424 3C004396 */  lhu        $v1, 0x3C($s2)
/* 5EC28 8006E428 00000000 */  nop
/* 5EC2C 8006E42C 21104300 */  addu       $v0, $v0, $v1
/* 5EC30 8006E430 760022A6 */  sh         $v0, 0x76($s1)
/* 5EC34 8006E434 78002296 */  lhu        $v0, 0x78($s1)
/* 5EC38 8006E438 3E004396 */  lhu        $v1, 0x3E($s2)
/* 5EC3C 8006E43C 00000000 */  nop
/* 5EC40 8006E440 21104300 */  addu       $v0, $v0, $v1
/* 5EC44 8006E444 780022A6 */  sh         $v0, 0x78($s1)
.L8006E448:
/* 5EC48 8006E448 4400428E */  lw         $v0, 0x44($s2)
/* 5EC4C 8006E44C 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 5EC50 8006E450 00000000 */  nop
/* 5EC54 8006E454 23104300 */  subu       $v0, $v0, $v1
/* 5EC58 8006E458 03004104 */  bgez       $v0, .L8006E468
/* 5EC5C 8006E45C 440042AE */   sw        $v0, 0x44($s2)
/* 5EC60 8006E460 85D1000C */  jal        INSTANCE_KillInstance
/* 5EC64 8006E464 21202002 */   addu      $a0, $s1, $zero
.L8006E468:
/* 5EC68 8006E468 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 5EC6C 8006E46C 2800B28F */  lw         $s2, 0x28($sp)
/* 5EC70 8006E470 2400B18F */  lw         $s1, 0x24($sp)
/* 5EC74 8006E474 2000B08F */  lw         $s0, 0x20($sp)
/* 5EC78 8006E478 0800E003 */  jr         $ra
/* 5EC7C 8006E47C 3000BD27 */   addiu     $sp, $sp, 0x30
.size ExecuteThrow, . - ExecuteThrow
