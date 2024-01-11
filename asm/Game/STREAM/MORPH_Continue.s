.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_Continue
/* 4EB24 8005E324 D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4EB28 8005E328 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4EB2C 8005E32C 2000BFAF */  sw         $ra, 0x20($sp)
/* 4EB30 8005E330 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4EB34 8005E334 1800B2AF */  sw         $s2, 0x18($sp)
/* 4EB38 8005E338 1400B1AF */  sw         $s1, 0x14($sp)
/* 4EB3C 8005E33C 03004014 */  bnez       $v0, .L8005E34C
/* 4EB40 8005E340 1000B0AF */   sw        $s0, 0x10($sp)
/* 4EB44 8005E344 F771010C */  jal        MORPH_InMorphInstanceListFlags
/* 4EB48 8005E348 00000000 */   nop
.L8005E34C:
/* 4EB4C 8005E34C 21900000 */  addu       $s2, $zero, $zero
/* 4EB50 8005E350 48C79127 */  addiu      $s1, $gp, %gp_rel(StreamTracker + 0xC)
/* 4EB54 8005E354 D0BD8297 */  lhu        $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4EB58 8005E358 3CC79027 */  addiu      $s0, $gp, %gp_rel(StreamTracker)
/* 4EB5C 8005E35C 14004224 */  addiu      $v0, $v0, 0x14
/* 4EB60 8005E360 D0BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4EB64 8005E364 1172010C */  jal        MORPH_InMorphDoFadeValues
/* 4EB68 8005E368 02001324 */   addiu     $s3, $zero, 0x2
.L8005E36C:
/* 4EB6C 8005E36C 04000286 */  lh         $v0, 0x4($s0)
/* 4EB70 8005E370 00000000 */  nop
/* 4EB74 8005E374 06005314 */  bne        $v0, $s3, .L8005E390
/* 4EB78 8005E378 21200002 */   addu      $a0, $s0, $zero
/* 4EB7C 8005E37C 4778010C */  jal        MORPH_DoStep
/* 4EB80 8005E380 21282002 */   addu      $a1, $s1, $zero
/* 4EB84 8005E384 21200002 */  addu       $a0, $s0, $zero
/* 4EB88 8005E388 7E78010C */  jal        MORPH_SetFog
/* 4EB8C 8005E38C 21280000 */   addu      $a1, $zero, $zero
.L8005E390:
/* 4EB90 8005E390 40003126 */  addiu      $s1, $s1, 0x40
/* 4EB94 8005E394 01005226 */  addiu      $s2, $s2, 0x1
/* 4EB98 8005E398 1000422A */  slti       $v0, $s2, 0x10
/* 4EB9C 8005E39C F3FF4014 */  bnez       $v0, .L8005E36C
/* 4EBA0 8005E3A0 40001026 */   addiu     $s0, $s0, 0x40
/* 4EBA4 8005E3A4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4EBA8 8005E3A8 92D1000C */  jal        INSTANCE_Query
/* 4EBAC 8005E3AC 0A000524 */   addiu     $a1, $zero, 0xA
/* 4EBB0 8005E3B0 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4EBB4 8005E3B4 00000000 */  nop
/* 4EBB8 8005E3B8 B400648C */  lw         $a0, 0xB4($v1)
/* 4EBBC 8005E3BC 00000000 */  nop
/* 4EBC0 8005E3C0 13008010 */  beqz       $a0, .L8005E410
/* 4EBC4 8005E3C4 00000000 */   nop
/* 4EBC8 8005E3C8 11004004 */  bltz       $v0, .L8005E410
/* 4EBCC 8005E3CC 00000000 */   nop
/* 4EBD0 8005E3D0 3CCB828F */  lw         $v0, %gp_rel(MORPH_SavedFace)($gp)
/* 4EBD4 8005E3D4 00000000 */  nop
/* 4EBD8 8005E3D8 04004414 */  bne        $v0, $a0, .L8005E3EC
/* 4EBDC 8005E3DC 00000000 */   nop
/* 4EBE0 8005E3E0 2CC7858F */  lw         $a1, %gp_rel(MORPH_SavedLevel)($gp)
/* 4EBE4 8005E3E4 02790108 */  j          .L8005E408
/* 4EBE8 8005E3E8 00000000 */   nop
.L8005E3EC:
/* 4EBEC 8005E3EC BC00658C */  lw         $a1, 0xBC($v1)
/* 4EBF0 8005E3F0 B576010C */  jal        MORPH_GetComponentsForTrackingPoint
/* 4EBF4 8005E3F4 00000000 */   nop
/* 4EBF8 8005E3F8 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4EBFC 8005E3FC 00000000 */  nop
/* 4EC00 8005E400 B400448C */  lw         $a0, 0xB4($v0)
/* 4EC04 8005E404 BC00458C */  lw         $a1, 0xBC($v0)
.L8005E408:
/* 4EC08 8005E408 8B77010C */  jal        MORPH_UpdateTrackingPoint
/* 4EC0C 8005E40C 00000000 */   nop
.L8005E410:
/* 4EC10 8005E410 B378010C */  jal        MORPH_UpdateTextures
/* 4EC14 8005E414 00000000 */   nop
/* 4EC18 8005E418 D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4EC1C 8005E41C E8030224 */  addiu      $v0, $zero, 0x3E8
/* 4EC20 8005E420 16006214 */  bne        $v1, $v0, .L8005E47C
/* 4EC24 8005E424 00000000 */   nop
/* 4EC28 8005E428 D2BD8297 */  lhu        $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4EC2C 8005E42C 00000000 */  nop
/* 4EC30 8005E430 01004238 */  xori       $v0, $v0, 0x1
/* 4EC34 8005E434 D2BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4EC38 8005E438 08004014 */  bnez       $v0, .L8005E45C
/* 4EC3C 8005E43C 0008043C */   lui       $a0, (0x8000000 >> 16)
/* 4EC40 8005E440 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4EC44 8005E444 FFF7033C */  lui        $v1, (0xF7FFFFFF >> 16)
/* 4EC48 8005E448 1800828C */  lw         $v0, 0x18($a0)
/* 4EC4C 8005E44C FFFF6334 */  ori        $v1, $v1, (0xF7FFFFFF & 0xFFFF)
/* 4EC50 8005E450 24104300 */  and        $v0, $v0, $v1
/* 4EC54 8005E454 1D790108 */  j          .L8005E474
/* 4EC58 8005E458 180082AC */   sw        $v0, 0x18($a0)
.L8005E45C:
/* 4EC5C 8005E45C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4EC60 8005E460 00000000 */  nop
/* 4EC64 8005E464 1800438C */  lw         $v1, 0x18($v0)
/* 4EC68 8005E468 00000000 */  nop
/* 4EC6C 8005E46C 25186400 */  or         $v1, $v1, $a0
/* 4EC70 8005E470 180043AC */  sw         $v1, 0x18($v0)
.L8005E474:
/* 4EC74 8005E474 E571010C */  jal        MORPH_SetupInstanceListFlags
/* 4EC78 8005E478 00000000 */   nop
.L8005E47C:
/* 4EC7C 8005E47C 2000BF8F */  lw         $ra, 0x20($sp)
/* 4EC80 8005E480 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4EC84 8005E484 1800B28F */  lw         $s2, 0x18($sp)
/* 4EC88 8005E488 1400B18F */  lw         $s1, 0x14($sp)
/* 4EC8C 8005E48C 1000B08F */  lw         $s0, 0x10($sp)
/* 4EC90 8005E490 0800E003 */  jr         $ra
/* 4EC94 8005E494 2800BD27 */   addiu     $sp, $sp, 0x28
.size MORPH_Continue, . - MORPH_Continue
