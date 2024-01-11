.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSwitchVAnim
/* 97AC0 800A72C0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 97AC4 800A72C4 2118C000 */  addu       $v1, $a2, $zero
/* 97AC8 800A72C8 3800A88F */  lw         $t0, 0x38($sp)
/* 97ACC 800A72CC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 97AD0 800A72D0 0200E214 */  bne        $a3, $v0, .L800A72DC
/* 97AD4 800A72D4 2000BFAF */   sw        $ra, 0x20($sp)
/* 97AD8 800A72D8 06006794 */  lhu        $a3, 0x6($v1)
.L800A72DC:
/* 97ADC 800A72DC 02000215 */  bne        $t0, $v0, .L800A72E8
/* 97AE0 800A72E0 01000224 */   addiu     $v0, $zero, 0x1
/* 97AE4 800A72E4 03006890 */  lbu        $t0, 0x3($v1)
.L800A72E8:
/* 97AE8 800A72E8 1400A210 */  beq        $a1, $v0, .L800A733C
/* 97AEC 800A72EC 0200A228 */   slti      $v0, $a1, 0x2
/* 97AF0 800A72F0 05004010 */  beqz       $v0, .L800A7308
/* 97AF4 800A72F4 00000000 */   nop
/* 97AF8 800A72F8 0800A010 */  beqz       $a1, .L800A731C
/* 97AFC 800A72FC 00000000 */   nop
/* 97B00 800A7300 DF9C0208 */  j          .L800A737C
/* 97B04 800A7304 00000000 */   nop
.L800A7308:
/* 97B08 800A7308 02000224 */  addiu      $v0, $zero, 0x2
/* 97B0C 800A730C 1300A210 */  beq        $a1, $v0, .L800A735C
/* 97B10 800A7310 02000524 */   addiu     $a1, $zero, 0x2
/* 97B14 800A7314 DF9C0208 */  j          .L800A737C
/* 97B18 800A7318 00000000 */   nop
.L800A731C:
/* 97B1C 800A731C 00006690 */  lbu        $a2, 0x0($v1)
/* 97B20 800A7320 1000A8AF */  sw         $t0, 0x10($sp)
/* 97B24 800A7324 04006290 */  lbu        $v0, 0x4($v1)
/* 97B28 800A7328 00000000 */  nop
/* 97B2C 800A732C 1400A2AF */  sw         $v0, 0x14($sp)
/* 97B30 800A7330 05006290 */  lbu        $v0, 0x5($v1)
/* 97B34 800A7334 DD9C0208 */  j          .L800A7374
/* 97B38 800A7338 21280000 */   addu      $a1, $zero, $zero
.L800A733C:
/* 97B3C 800A733C 01006690 */  lbu        $a2, 0x1($v1)
/* 97B40 800A7340 1000A8AF */  sw         $t0, 0x10($sp)
/* 97B44 800A7344 04006290 */  lbu        $v0, 0x4($v1)
/* 97B48 800A7348 00000000 */  nop
/* 97B4C 800A734C 1400A2AF */  sw         $v0, 0x14($sp)
/* 97B50 800A7350 05006290 */  lbu        $v0, 0x5($v1)
/* 97B54 800A7354 DD9C0208 */  j          .L800A7374
/* 97B58 800A7358 01000524 */   addiu     $a1, $zero, 0x1
.L800A735C:
/* 97B5C 800A735C 02006690 */  lbu        $a2, 0x2($v1)
/* 97B60 800A7360 1000A8AF */  sw         $t0, 0x10($sp)
/* 97B64 800A7364 04006290 */  lbu        $v0, 0x4($v1)
/* 97B68 800A7368 00000000 */  nop
/* 97B6C 800A736C 1400A2AF */  sw         $v0, 0x14($sp)
/* 97B70 800A7370 05006290 */  lbu        $v0, 0x5($v1)
.L800A7374:
/* 97B74 800A7374 05C8010C */  jal        G2EmulationInstanceSwitchAnimationAlpha
/* 97B78 800A7378 1800A2AF */   sw        $v0, 0x18($sp)
.L800A737C:
/* 97B7C 800A737C 2000BF8F */  lw         $ra, 0x20($sp)
/* 97B80 800A7380 00000000 */  nop
/* 97B84 800A7384 0800E003 */  jr         $ra
/* 97B88 800A7388 2800BD27 */   addiu     $sp, $sp, 0x28
.size razSwitchVAnim, . - razSwitchVAnim
