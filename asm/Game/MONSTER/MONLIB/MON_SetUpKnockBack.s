.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_SetUpKnockBack
/* 74CD4 800844D4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 74CD8 800844D8 1800B2AF */  sw         $s2, 0x18($sp)
/* 74CDC 800844DC 21908000 */  addu       $s2, $a0, $zero
/* 74CE0 800844E0 1400B1AF */  sw         $s1, 0x14($sp)
/* 74CE4 800844E4 2188A000 */  addu       $s1, $a1, $zero
/* 74CE8 800844E8 2800BFAF */  sw         $ra, 0x28($sp)
/* 74CEC 800844EC 2400B5AF */  sw         $s5, 0x24($sp)
/* 74CF0 800844F0 2000B4AF */  sw         $s4, 0x20($sp)
/* 74CF4 800844F4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 74CF8 800844F8 1000B0AF */  sw         $s0, 0x10($sp)
/* 74CFC 800844FC 0800D084 */  lh         $s0, 0x8($a2)
/* 74D00 80084500 0A00D484 */  lh         $s4, 0xA($a2)
/* 74D04 80084504 6C01558E */  lw         $s5, 0x16C($s2)
/* 74D08 80084508 21200002 */  addu       $a0, $s0, $zero
/* 74D0C 8008450C 2ADF010C */  jal        PHYSICS_FindAFromDAndT
/* 74D10 80084510 21288002 */   addu      $a1, $s4, $zero
/* 74D14 80084514 21984000 */  addu       $s3, $v0, $zero
/* 74D18 80084518 21206002 */  addu       $a0, $s3, $zero
/* 74D1C 8008451C 39DF010C */  jal        PHYSICS_FindVFromAAndD
/* 74D20 80084520 21280002 */   addu      $a1, $s0, $zero
/* 74D24 80084524 5C004426 */  addiu      $a0, $s2, 0x5C
/* 74D28 80084528 5C003126 */  addiu      $s1, $s1, 0x5C
/* 74D2C 8008452C 21282002 */  addu       $a1, $s1, $zero
/* 74D30 80084530 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 74D34 80084534 21804000 */   addu      $s0, $v0, $zero
/* 74D38 80084538 78004396 */  lhu        $v1, 0x78($s2)
/* 74D3C 8008453C 00000000 */  nop
/* 74D40 80084540 23186200 */  subu       $v1, $v1, $v0
/* 74D44 80084544 00046324 */  addiu      $v1, $v1, 0x400
/* 74D48 80084548 FF0F6330 */  andi       $v1, $v1, 0xFFF
/* 74D4C 8008454C 00086328 */  slti       $v1, $v1, 0x800
/* 74D50 80084550 0B006010 */  beqz       $v1, .L80084580
/* 74D54 80084554 21282002 */   addu      $a1, $s1, $zero
/* 74D58 80084558 21204002 */  addu       $a0, $s2, $zero
/* 74D5C 8008455C 6604020C */  jal        MON_TurnToPosition
/* 74D60 80084560 00100624 */   addiu     $a2, $zero, 0x1000
/* 74D64 80084564 21204002 */  addu       $a0, $s2, $zero
/* 74D68 80084568 74004526 */  addiu      $a1, $s2, 0x74
/* 74D6C 8008456C 23301000 */  negu       $a2, $s0
/* 74D70 80084570 EEDE010C */  jal        PHYSICS_SetVAndAFromRot
/* 74D74 80084574 21386002 */   addu      $a3, $s3, $zero
/* 74D78 80084578 66110208 */  j          .L80084598
/* 74D7C 8008457C 01001024 */   addiu     $s0, $zero, 0x1
.L80084580:
/* 74D80 80084580 21204002 */  addu       $a0, $s2, $zero
/* 74D84 80084584 74004526 */  addiu      $a1, $s2, 0x74
/* 74D88 80084588 21300002 */  addu       $a2, $s0, $zero
/* 74D8C 8008458C EEDE010C */  jal        PHYSICS_SetVAndAFromRot
/* 74D90 80084590 23381300 */   negu      $a3, $s3
/* 74D94 80084594 21800000 */  addu       $s0, $zero, $zero
.L80084598:
/* 74D98 80084598 9006020C */  jal        MON_GetTime
/* 74D9C 8008459C 21204002 */   addu      $a0, $s2, $zero
/* 74DA0 800845A0 40191400 */  sll        $v1, $s4, 5
/* 74DA4 800845A4 21187400 */  addu       $v1, $v1, $s4
/* 74DA8 800845A8 21104300 */  addu       $v0, $v0, $v1
/* 74DAC 800845AC 1401A2AE */  sw         $v0, 0x114($s5)
/* 74DB0 800845B0 21100002 */  addu       $v0, $s0, $zero
/* 74DB4 800845B4 2800BF8F */  lw         $ra, 0x28($sp)
/* 74DB8 800845B8 2400B58F */  lw         $s5, 0x24($sp)
/* 74DBC 800845BC 2000B48F */  lw         $s4, 0x20($sp)
/* 74DC0 800845C0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 74DC4 800845C4 1800B28F */  lw         $s2, 0x18($sp)
/* 74DC8 800845C8 1400B18F */  lw         $s1, 0x14($sp)
/* 74DCC 800845CC 1000B08F */  lw         $s0, 0x10($sp)
/* 74DD0 800845D0 0800E003 */  jr         $ra
/* 74DD4 800845D4 3000BD27 */   addiu     $sp, $sp, 0x30
.size MON_SetUpKnockBack, . - MON_SetUpKnockBack
