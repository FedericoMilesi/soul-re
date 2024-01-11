.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSwitchStringAnimation
/* 97D04 800A7504 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 97D08 800A7508 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 97D0C 800A750C 2800BFAF */  sw         $ra, 0x28($sp)
/* 97D10 800A7510 2400B3AF */  sw         $s3, 0x24($sp)
/* 97D14 800A7514 2000B2AF */  sw         $s2, 0x20($sp)
/* 97D18 800A7518 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 97D1C 800A751C 1800B0AF */  sw         $s0, 0x18($sp)
/* 97D20 800A7520 2000428C */  lw         $v0, 0x20($v0)
/* 97D24 800A7524 80280500 */  sll        $a1, $a1, 2
/* 97D28 800A7528 2128A200 */  addu       $a1, $a1, $v0
/* 97D2C 800A752C 0000A28C */  lw         $v0, 0x0($a1)
/* 97D30 800A7530 00000000 */  nop
/* 97D34 800A7534 D8FB82AF */  sw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97D38 800A7538 0000518C */  lw         $s1, 0x0($v0)
/* 97D3C 800A753C 00000000 */  nop
/* 97D40 800A7540 1B002012 */  beqz       $s1, .L800A75B0
/* 97D44 800A7544 21908000 */   addu      $s2, $a0, $zero
/* 97D48 800A7548 21800000 */  addu       $s0, $zero, $zero
/* 97D4C 800A754C FFFF1324 */  addiu      $s3, $zero, -0x1
.L800A7550:
/* 97D50 800A7550 1000B3AF */  sw         $s3, 0x10($sp)
/* 97D54 800A7554 21204002 */  addu       $a0, $s2, $zero
/* 97D58 800A7558 21280002 */  addu       $a1, $s0, $zero
/* 97D5C 800A755C 21302002 */  addu       $a2, $s1, $zero
/* 97D60 800A7560 B09C020C */  jal        razSwitchVAnim
/* 97D64 800A7564 FFFF0724 */   addiu     $a3, $zero, -0x1
/* 97D68 800A7568 01001026 */  addiu      $s0, $s0, 0x1
/* 97D6C 800A756C 0300022A */  slti       $v0, $s0, 0x3
/* 97D70 800A7570 F7FF4014 */  bnez       $v0, .L800A7550
/* 97D74 800A7574 00000000 */   nop
/* 97D78 800A7578 D8FB828F */  lw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97D7C 800A757C 00000000 */  nop
/* 97D80 800A7580 0C004584 */  lh         $a1, 0xC($v0)
/* 97D84 800A7584 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 97D88 800A7588 C8014426 */   addiu     $a0, $s2, 0x1C8
/* 97D8C 800A758C D8FB848F */  lw         $a0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97D90 800A7590 00000000 */  nop
/* 97D94 800A7594 08008384 */  lh         $v1, 0x8($a0)
/* 97D98 800A7598 02000224 */  addiu      $v0, $zero, 0x2
/* 97D9C 800A759C 04006214 */  bne        $v1, $v0, .L800A75B0
/* 97DA0 800A75A0 00000000 */   nop
/* 97DA4 800A75A4 0A008484 */  lh         $a0, 0xA($a0)
/* 97DA8 800A75A8 31CC020C */  jal        SetTimer
/* 97DAC 800A75AC 00000000 */   nop
.L800A75B0:
/* 97DB0 800A75B0 2800BF8F */  lw         $ra, 0x28($sp)
/* 97DB4 800A75B4 2400B38F */  lw         $s3, 0x24($sp)
/* 97DB8 800A75B8 2000B28F */  lw         $s2, 0x20($sp)
/* 97DBC 800A75BC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 97DC0 800A75C0 1800B08F */  lw         $s0, 0x18($sp)
/* 97DC4 800A75C4 0800E003 */  jr         $ra
/* 97DC8 800A75C8 3000BD27 */   addiu     $sp, $sp, 0x30
.size razSwitchStringAnimation, . - razSwitchStringAnimation
