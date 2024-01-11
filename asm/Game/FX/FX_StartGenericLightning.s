.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartGenericLightning
/* 3D444 8004CC44 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3D448 8004CC48 90A2438C */  lw         $v1, %lo(objectAccess + 0x54)($v0)
/* 3D44C 8004CC4C B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 3D450 8004CC50 3800B2AF */  sw         $s2, 0x38($sp)
/* 3D454 8004CC54 21908000 */  addu       $s2, $a0, $zero
/* 3D458 8004CC58 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 3D45C 8004CC5C 2198C000 */  addu       $s3, $a2, $zero
/* 3D460 8004CC60 4000B4AF */  sw         $s4, 0x40($sp)
/* 3D464 8004CC64 21A0E000 */  addu       $s4, $a3, $zero
/* 3D468 8004CC68 4400BFAF */  sw         $ra, 0x44($sp)
/* 3D46C 8004CC6C 3400B1AF */  sw         $s1, 0x34($sp)
/* 3D470 8004CC70 3000B0AF */  sw         $s0, 0x30($sp)
/* 3D474 8004CC74 54006010 */  beqz       $v1, .L8004CDC8
/* 3D478 8004CC78 21100000 */   addu      $v0, $zero, $zero
/* 3D47C 8004CC7C 80100500 */  sll        $v0, $a1, 2
/* 3D480 8004CC80 1C00638C */  lw         $v1, 0x1C($v1)
/* 3D484 8004CC84 21104500 */  addu       $v0, $v0, $a1
/* 3D488 8004CC88 0C00638C */  lw         $v1, 0xC($v1)
/* 3D48C 8004CC8C C0100200 */  sll        $v0, $v0, 3
/* 3D490 8004CC90 21806200 */  addu       $s0, $v1, $v0
/* 3D494 8004CC94 02000286 */  lh         $v0, 0x2($s0)
/* 3D498 8004CC98 00000000 */  nop
/* 3D49C 8004CC9C 03004014 */  bnez       $v0, .L8004CCAC
/* 3D4A0 8004CCA0 00000000 */   nop
.L8004CCA4:
/* 3D4A4 8004CCA4 72330108 */  j          .L8004CDC8
/* 3D4A8 8004CCA8 21100000 */   addu      $v0, $zero, $zero
.L8004CCAC:
/* 3D4AC 8004CCAC 01000282 */  lb         $v0, 0x1($s0)
/* 3D4B0 8004CCB0 00000000 */  nop
/* 3D4B4 8004CCB4 05004010 */  beqz       $v0, .L8004CCCC
/* 3D4B8 8004CCB8 00000000 */   nop
/* 3D4BC 8004CCBC 4C01448E */  lw         $a0, 0x14C($s2)
/* 3D4C0 8004CCC0 00000000 */  nop
/* 3D4C4 8004CCC4 F7FF8010 */  beqz       $a0, .L8004CCA4
/* 3D4C8 8004CCC8 21908000 */   addu      $s2, $a0, $zero
.L8004CCCC:
/* 3D4CC 8004CCCC 18000286 */  lh         $v0, 0x18($s0)
/* 3D4D0 8004CCD0 02000586 */  lh         $a1, 0x2($s0)
/* 3D4D4 8004CCD4 04000686 */  lh         $a2, 0x4($s0)
/* 3D4D8 8004CCD8 06000786 */  lh         $a3, 0x6($s0)
/* 3D4DC 8004CCDC 1000A2AF */  sw         $v0, 0x10($sp)
/* 3D4E0 8004CCE0 1A000286 */  lh         $v0, 0x1A($s0)
/* 3D4E4 8004CCE4 00000000 */  nop
/* 3D4E8 8004CCE8 1400A2AF */  sw         $v0, 0x14($sp)
/* 3D4EC 8004CCEC 17000292 */  lbu        $v0, 0x17($s0)
/* 3D4F0 8004CCF0 00000000 */  nop
/* 3D4F4 8004CCF4 1800A2AF */  sw         $v0, 0x18($sp)
/* 3D4F8 8004CCF8 1C000286 */  lh         $v0, 0x1C($s0)
/* 3D4FC 8004CCFC 00000000 */  nop
/* 3D500 8004CD00 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3D504 8004CD04 1E000286 */  lh         $v0, 0x1E($s0)
/* 3D508 8004CD08 00000000 */  nop
/* 3D50C 8004CD0C 2000A2AF */  sw         $v0, 0x20($sp)
/* 3D510 8004CD10 2000028E */  lw         $v0, 0x20($s0)
/* 3D514 8004CD14 00000000 */  nop
/* 3D518 8004CD18 2400A2AF */  sw         $v0, 0x24($sp)
/* 3D51C 8004CD1C 2400028E */  lw         $v0, 0x24($s0)
/* 3D520 8004CD20 21204002 */  addu       $a0, $s2, $zero
/* 3D524 8004CD24 A332010C */  jal        FX_CreateLightning
/* 3D528 8004CD28 2800A2AF */   sw        $v0, 0x28($sp)
/* 3D52C 8004CD2C 21884000 */  addu       $s1, $v0, $zero
/* 3D530 8004CD30 24002012 */  beqz       $s1, .L8004CDC4
/* 3D534 8004CD34 00000000 */   nop
/* 3D538 8004CD38 02006016 */  bnez       $s3, .L8004CD44
/* 3D53C 8004CD3C 21306002 */   addu      $a2, $s3, $zero
/* 3D540 8004CD40 0E000682 */  lb         $a2, 0xE($s0)
.L8004CD44:
/* 3D544 8004CD44 04008016 */  bnez       $s4, .L8004CD58
/* 3D548 8004CD48 21388002 */   addu      $a3, $s4, $zero
/* 3D54C 8004CD4C 0F000782 */  lb         $a3, 0xF($s0)
/* 3D550 8004CD50 57330108 */  j          .L8004CD5C
/* 3D554 8004CD54 21202002 */   addu      $a0, $s1, $zero
.L8004CD58:
/* 3D558 8004CD58 21202002 */  addu       $a0, $s1, $zero
.L8004CD5C:
/* 3D55C 8004CD5C 21284002 */  addu       $a1, $s2, $zero
/* 3D560 8004CD60 10000226 */  addiu      $v0, $s0, 0x10
/* 3D564 8004CD64 1000A5AF */  sw         $a1, 0x10($sp)
/* 3D568 8004CD68 1400A7AF */  sw         $a3, 0x14($sp)
/* 3D56C 8004CD6C 1800A2AF */  sw         $v0, 0x18($sp)
/* 3D570 8004CD70 16000282 */  lb         $v0, 0x16($s0)
/* 3D574 8004CD74 08000726 */  addiu      $a3, $s0, 0x8
/* 3D578 8004CD78 E532010C */  jal        FX_SetLightingPos
/* 3D57C 8004CD7C 1C00A2AF */   sw        $v0, 0x1C($sp)
/* 3D580 8004CD80 00000382 */  lb         $v1, 0x0($s0)
/* 3D584 8004CD84 01000224 */  addiu      $v0, $zero, 0x1
/* 3D588 8004CD88 0F006214 */  bne        $v1, $v0, .L8004CDC8
/* 3D58C 8004CD8C 21102002 */   addu      $v0, $s1, $zero
/* 3D590 8004CD90 D6EA010C */  jal        SoulReaverFire
/* 3D594 8004CD94 00000000 */   nop
/* 3D598 8004CD98 0A004010 */  beqz       $v0, .L8004CDC4
/* 3D59C 8004CD9C 34002326 */   addiu     $v1, $s1, 0x34
/* 3D5A0 8004CDA0 34002292 */  lbu        $v0, 0x34($s1)
/* 3D5A4 8004CDA4 02006490 */  lbu        $a0, 0x2($v1)
/* 3D5A8 8004CDA8 020062A0 */  sb         $v0, 0x2($v1)
/* 3D5AC 8004CDAC 38002292 */  lbu        $v0, 0x38($s1)
/* 3D5B0 8004CDB0 38002326 */  addiu      $v1, $s1, 0x38
/* 3D5B4 8004CDB4 340024A2 */  sb         $a0, 0x34($s1)
/* 3D5B8 8004CDB8 02006490 */  lbu        $a0, 0x2($v1)
/* 3D5BC 8004CDBC 020062A0 */  sb         $v0, 0x2($v1)
/* 3D5C0 8004CDC0 380024A2 */  sb         $a0, 0x38($s1)
.L8004CDC4:
/* 3D5C4 8004CDC4 21102002 */  addu       $v0, $s1, $zero
.L8004CDC8:
/* 3D5C8 8004CDC8 4400BF8F */  lw         $ra, 0x44($sp)
/* 3D5CC 8004CDCC 4000B48F */  lw         $s4, 0x40($sp)
/* 3D5D0 8004CDD0 3C00B38F */  lw         $s3, 0x3C($sp)
/* 3D5D4 8004CDD4 3800B28F */  lw         $s2, 0x38($sp)
/* 3D5D8 8004CDD8 3400B18F */  lw         $s1, 0x34($sp)
/* 3D5DC 8004CDDC 3000B08F */  lw         $s0, 0x30($sp)
/* 3D5E0 8004CDE0 0800E003 */  jr         $ra
/* 3D5E4 8004CDE4 4800BD27 */   addiu     $sp, $sp, 0x48
.size FX_StartGenericLightning, . - FX_StartGenericLightning
