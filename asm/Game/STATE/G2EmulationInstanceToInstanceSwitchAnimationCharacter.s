.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceToInstanceSwitchAnimationCharacter
/* 62B04 80072304 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 62B08 80072308 1800B0AF */  sw         $s0, 0x18($sp)
/* 62B0C 8007230C 21808000 */  addu       $s0, $a0, $zero
/* 62B10 80072310 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 62B14 80072314 4800B18F */  lw         $s1, 0x48($sp)
/* 62B18 80072318 2120A000 */  addu       $a0, $a1, $zero
/* 62B1C 8007231C 2000B2AF */  sw         $s2, 0x20($sp)
/* 62B20 80072320 2190C000 */  addu       $s2, $a2, $zero
/* 62B24 80072324 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 62B28 80072328 4C00B58F */  lw         $s5, 0x4C($sp)
/* 62B2C 8007232C 21284002 */  addu       $a1, $s2, $zero
/* 62B30 80072330 2400B3AF */  sw         $s3, 0x24($sp)
/* 62B34 80072334 2198E000 */  addu       $s3, $a3, $zero
/* 62B38 80072338 3000BFAF */  sw         $ra, 0x30($sp)
/* 62B3C 8007233C 4154020C */  jal        G2Instance_GetKeylist
/* 62B40 80072340 2800B4AF */   sw        $s4, 0x28($sp)
/* 62B44 80072344 C8011426 */  addiu      $s4, $s0, 0x1C8
/* 62B48 80072348 21208002 */  addu       $a0, $s4, $zero
/* 62B4C 8007234C 21280000 */  addu       $a1, $zero, $zero
/* 62B50 80072350 1B3F020C */  jal        G2Anim_SetAlphaTable
/* 62B54 80072354 21804000 */   addu      $s0, $v0, $zero
/* 62B58 80072358 21208002 */  addu       $a0, $s4, $zero
/* 62B5C 8007235C 21280002 */  addu       $a1, $s0, $zero
/* 62B60 80072360 21304002 */  addu       $a2, $s2, $zero
/* 62B64 80072364 21386002 */  addu       $a3, $s3, $zero
/* 62B68 80072368 40101100 */  sll        $v0, $s1, 1
/* 62B6C 8007236C 21105100 */  addu       $v0, $v0, $s1
/* 62B70 80072370 C0100200 */  sll        $v0, $v0, 3
/* 62B74 80072374 21105100 */  addu       $v0, $v0, $s1
/* 62B78 80072378 80140200 */  sll        $v0, $v0, 18
/* 62B7C 8007237C 03140200 */  sra        $v0, $v0, 16
/* 62B80 80072380 F23E020C */  jal        G2Anim_InterpToKeylistFrame
/* 62B84 80072384 1000A2AF */   sw        $v0, 0x10($sp)
/* 62B88 80072388 0500A016 */  bnez       $s5, .L800723A0
/* 62B8C 8007238C 00000000 */   nop
/* 62B90 80072390 763F020C */  jal        G2Anim_SetPaused
/* 62B94 80072394 21208002 */   addu      $a0, $s4, $zero
/* 62B98 80072398 F3C80108 */  j          .L800723CC
/* 62B9C 8007239C 00000000 */   nop
.L800723A0:
/* 62BA0 800723A0 9B3F020C */  jal        G2Anim_SetUnpaused
/* 62BA4 800723A4 21208002 */   addu      $a0, $s4, $zero
/* 62BA8 800723A8 02000224 */  addiu      $v0, $zero, 0x2
/* 62BAC 800723AC 0500A216 */  bne        $s5, $v0, .L800723C4
/* 62BB0 800723B0 00000000 */   nop
/* 62BB4 800723B4 463F020C */  jal        G2Anim_SetLooping
/* 62BB8 800723B8 21208002 */   addu      $a0, $s4, $zero
/* 62BBC 800723BC F3C80108 */  j          .L800723CC
/* 62BC0 800723C0 00000000 */   nop
.L800723C4:
/* 62BC4 800723C4 5E3F020C */  jal        G2Anim_SetNoLooping
/* 62BC8 800723C8 21208002 */   addu      $a0, $s4, $zero
.L800723CC:
/* 62BCC 800723CC 3000BF8F */  lw         $ra, 0x30($sp)
/* 62BD0 800723D0 2C00B58F */  lw         $s5, 0x2C($sp)
/* 62BD4 800723D4 2800B48F */  lw         $s4, 0x28($sp)
/* 62BD8 800723D8 2400B38F */  lw         $s3, 0x24($sp)
/* 62BDC 800723DC 2000B28F */  lw         $s2, 0x20($sp)
/* 62BE0 800723E0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 62BE4 800723E4 1800B08F */  lw         $s0, 0x18($sp)
/* 62BE8 800723E8 0800E003 */  jr         $ra
/* 62BEC 800723EC 3800BD27 */   addiu     $sp, $sp, 0x38
.size G2EmulationInstanceToInstanceSwitchAnimationCharacter, . - G2EmulationInstanceToInstanceSwitchAnimationCharacter
