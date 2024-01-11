.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PlayAnimID
/* 70404 8007FC04 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 70408 8007FC08 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 7040C 8007FC0C 21988000 */  addu       $s3, $a0, $zero
/* 70410 8007FC10 4400BFAF */  sw         $ra, 0x44($sp)
/* 70414 8007FC14 4000BEAF */  sw         $fp, 0x40($sp)
/* 70418 8007FC18 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 7041C 8007FC1C 3800B6AF */  sw         $s6, 0x38($sp)
/* 70420 8007FC20 3400B5AF */  sw         $s5, 0x34($sp)
/* 70424 8007FC24 3000B4AF */  sw         $s4, 0x30($sp)
/* 70428 8007FC28 2800B2AF */  sw         $s2, 0x28($sp)
/* 7042C 8007FC2C 2400B1AF */  sw         $s1, 0x24($sp)
/* 70430 8007FC30 2000B0AF */  sw         $s0, 0x20($sp)
/* 70434 8007FC34 2400628E */  lw         $v0, 0x24($s3)
/* 70438 8007FC38 00290500 */  sll        $a1, $a1, 4
/* 7043C 8007FC3C 4000428C */  lw         $v0, 0x40($v0)
/* 70440 8007FC40 00000000 */  nop
/* 70444 8007FC44 21884500 */  addu       $s1, $v0, $a1
/* 70448 8007FC48 0C003682 */  lb         $s6, 0xC($s1)
/* 7044C 8007FC4C 6C01728E */  lw         $s2, 0x16C($s3)
/* 70450 8007FC50 0800C006 */  bltz       $s6, .L8007FC74
/* 70454 8007FC54 21F0C000 */   addu      $fp, $a2, $zero
/* 70458 8007FC58 1C00628E */  lw         $v0, 0x1C($s3)
/* 7045C 8007FC5C 00000000 */  nop
/* 70460 8007FC60 0A004284 */  lh         $v0, 0xA($v0)
/* 70464 8007FC64 00000000 */  nop
/* 70468 8007FC68 2A10C202 */  slt        $v0, $s6, $v0
/* 7046C 8007FC6C 03004014 */  bnez       $v0, .L8007FC7C
/* 70470 8007FC70 C8016426 */   addiu     $a0, $s3, 0x1C8
.L8007FC74:
/* 70474 8007FC74 21B00000 */  addu       $s6, $zero, $zero
/* 70478 8007FC78 C8016426 */  addiu      $a0, $s3, 0x1C8
.L8007FC7C:
/* 7047C 8007FC7C 0380053C */  lui        $a1, %hi(INSTANCE_DefaultAnimCallback)
/* 70480 8007FC80 C859A524 */  addiu      $a1, $a1, %lo(INSTANCE_DefaultAnimCallback)
/* 70484 8007FC84 373F020C */  jal        G2Anim_SetCallback
/* 70488 8007FC88 21306002 */   addu      $a2, $s3, $zero
/* 7048C 8007FC8C BC00438E */  lw         $v1, 0xBC($s2)
/* 70490 8007FC90 00000000 */  nop
/* 70494 8007FC94 08006010 */  beqz       $v1, .L8007FCB8
/* 70498 8007FC98 00000000 */   nop
/* 7049C 8007FC9C 08006290 */  lbu        $v0, 0x8($v1)
/* 704A0 8007FCA0 00000000 */  nop
/* 704A4 8007FCA4 04004010 */  beqz       $v0, .L8007FCB8
/* 704A8 8007FCA8 21A84000 */   addu      $s5, $v0, $zero
/* 704AC 8007FCAC 0A007490 */  lbu        $s4, 0xA($v1)
/* 704B0 8007FCB0 30FF0108 */  j          .L8007FCC0
/* 704B4 8007FCB4 00000000 */   nop
.L8007FCB8:
/* 704B8 8007FCB8 06003592 */  lbu        $s5, 0x6($s1)
/* 704BC 8007FCBC 09003492 */  lbu        $s4, 0x9($s1)
.L8007FCC0:
/* 704C0 8007FCC0 6801428E */  lw         $v0, 0x168($s2)
/* 704C4 8007FCC4 00000000 */  nop
/* 704C8 8007FCC8 2A004290 */  lbu        $v0, 0x2A($v0)
/* 704CC 8007FCCC 00000000 */  nop
/* 704D0 8007FCD0 19004010 */  beqz       $v0, .L8007FD38
/* 704D4 8007FCD4 21800000 */   addu      $s0, $zero, $zero
/* 704D8 8007FCD8 FFFF1724 */  addiu      $s7, $zero, -0x1
/* 704DC 8007FCDC 21103002 */  addu       $v0, $s1, $s0
.L8007FCE0:
/* 704E0 8007FCE0 0C004680 */  lb         $a2, 0xC($v0)
/* 704E4 8007FCE4 00000000 */  nop
/* 704E8 8007FCE8 0200D714 */  bne        $a2, $s7, .L8007FCF4
/* 704EC 8007FCEC 21206002 */   addu      $a0, $s3, $zero
/* 704F0 8007FCF0 2130C002 */  addu       $a2, $s6, $zero
.L8007FCF4:
/* 704F4 8007FCF4 07002792 */  lbu        $a3, 0x7($s1)
/* 704F8 8007FCF8 21280002 */  addu       $a1, $s0, $zero
/* 704FC 8007FCFC 1000B5AF */  sw         $s5, 0x10($sp)
/* 70500 8007FD00 1400BEAF */  sw         $fp, 0x14($sp)
/* 70504 8007FD04 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 70508 8007FD08 1800B4AF */   sw        $s4, 0x18($sp)
/* 7050C 8007FD0C 21206002 */  addu       $a0, $s3, $zero
/* 70510 8007FD10 04002696 */  lhu        $a2, 0x4($s1)
/* 70514 8007FD14 9AC9010C */  jal        G2EmulationInstanceSetAnimSpeed
/* 70518 8007FD18 21280002 */   addu      $a1, $s0, $zero
/* 7051C 8007FD1C 6801428E */  lw         $v0, 0x168($s2)
/* 70520 8007FD20 00000000 */  nop
/* 70524 8007FD24 2A004290 */  lbu        $v0, 0x2A($v0)
/* 70528 8007FD28 01001026 */  addiu      $s0, $s0, 0x1
/* 7052C 8007FD2C 2A100202 */  slt        $v0, $s0, $v0
/* 70530 8007FD30 EBFF4014 */  bnez       $v0, .L8007FCE0
/* 70534 8007FD34 21103002 */   addu      $v0, $s1, $s0
.L8007FD38:
/* 70538 8007FD38 0000428E */  lw         $v0, 0x0($s2)
/* 7053C 8007FD3C 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 70540 8007FD40 BC0051AE */  sw         $s1, 0xBC($s2)
/* 70544 8007FD44 25104300 */  or         $v0, $v0, $v1
/* 70548 8007FD48 000042AE */  sw         $v0, 0x0($s2)
/* 7054C 8007FD4C 0B002392 */  lbu        $v1, 0xB($s1)
/* 70550 8007FD50 00000000 */  nop
/* 70554 8007FD54 40100300 */  sll        $v0, $v1, 1
/* 70558 8007FD58 21104300 */  addu       $v0, $v0, $v1
/* 7055C 8007FD5C 00110200 */  sll        $v0, $v0, 4
/* 70560 8007FD60 21105300 */  addu       $v0, $v0, $s3
/* 70564 8007FD64 0880033C */  lui        $v1, %hi(MON_AnimCallback)
/* 70568 8007FD68 74FF6324 */  addiu      $v1, $v1, %lo(MON_AnimCallback)
/* 7056C 8007FD6C 080243AC */  sw         $v1, 0x208($v0)
/* 70570 8007FD70 0B002392 */  lbu        $v1, 0xB($s1)
/* 70574 8007FD74 00000000 */  nop
/* 70578 8007FD78 40100300 */  sll        $v0, $v1, 1
/* 7057C 8007FD7C 21104300 */  addu       $v0, $v0, $v1
/* 70580 8007FD80 00110200 */  sll        $v0, $v0, 4
/* 70584 8007FD84 21105300 */  addu       $v0, $v0, $s3
/* 70588 8007FD88 0C0253AC */  sw         $s3, 0x20C($v0)
/* 7058C 8007FD8C 4400BF8F */  lw         $ra, 0x44($sp)
/* 70590 8007FD90 4000BE8F */  lw         $fp, 0x40($sp)
/* 70594 8007FD94 3C00B78F */  lw         $s7, 0x3C($sp)
/* 70598 8007FD98 3800B68F */  lw         $s6, 0x38($sp)
/* 7059C 8007FD9C 3400B58F */  lw         $s5, 0x34($sp)
/* 705A0 8007FDA0 3000B48F */  lw         $s4, 0x30($sp)
/* 705A4 8007FDA4 2C00B38F */  lw         $s3, 0x2C($sp)
/* 705A8 8007FDA8 2800B28F */  lw         $s2, 0x28($sp)
/* 705AC 8007FDAC 2400B18F */  lw         $s1, 0x24($sp)
/* 705B0 8007FDB0 2000B08F */  lw         $s0, 0x20($sp)
/* 705B4 8007FDB4 0800E003 */  jr         $ra
/* 705B8 8007FDB8 4800BD27 */   addiu     $sp, $sp, 0x48
.size MON_PlayAnimID, . - MON_PlayAnimID
