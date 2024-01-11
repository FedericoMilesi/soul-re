.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razAlignYRotMoveInterp
/* 959F8 800A51F8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 959FC 800A51FC 3400B1AF */  sw         $s1, 0x34($sp)
/* 95A00 800A5200 21888000 */  addu       $s1, $a0, $zero
/* 95A04 800A5204 2120A000 */  addu       $a0, $a1, $zero
/* 95A08 800A5208 002C0600 */  sll        $a1, $a2, 16
/* 95A0C 800A520C 032C0500 */  sra        $a1, $a1, 16
/* 95A10 800A5210 1800A627 */  addiu      $a2, $sp, 0x18
/* 95A14 800A5214 3000B0AF */  sw         $s0, 0x30($sp)
/* 95A18 800A5218 2180E000 */  addu       $s0, $a3, $zero
/* 95A1C 800A521C 5400A28F */  lw         $v0, 0x54($sp)
/* 95A20 800A5220 2000A727 */  addiu      $a3, $sp, 0x20
/* 95A24 800A5224 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 95A28 800A5228 3800B2AF */  sw         $s2, 0x38($sp)
/* 95A2C 800A522C 5F00288A */  lwl        $t0, 0x5F($s1)
/* 95A30 800A5230 5C00289A */  lwr        $t0, 0x5C($s1)
/* 95A34 800A5234 60002986 */  lh         $t1, 0x60($s1)
/* 95A38 800A5238 1B00A8AB */  swl        $t0, 0x1B($sp)
/* 95A3C 800A523C 1800A8BB */  swr        $t0, 0x18($sp)
/* 95A40 800A5240 1C00A9A7 */  sh         $t1, 0x1C($sp)
/* 95A44 800A5244 5000B28F */  lw         $s2, 0x50($sp)
/* 95A48 800A5248 00140200 */  sll        $v0, $v0, 16
/* 95A4C 800A524C 03140200 */  sra        $v0, $v0, 16
/* 95A50 800A5250 4894020C */  jal        razAlignYRotMove
/* 95A54 800A5254 1000A2AF */   sw        $v0, 0x10($sp)
/* 95A58 800A5258 C8012426 */  addiu      $a0, $s1, 0x1C8
/* 95A5C 800A525C FF001032 */  andi       $s0, $s0, 0xFF
/* 95A60 800A5260 1800A297 */  lhu        $v0, 0x18($sp)
/* 95A64 800A5264 1A00A397 */  lhu        $v1, 0x1A($sp)
/* 95A68 800A5268 1C00A697 */  lhu        $a2, 0x1C($sp)
/* 95A6C 800A526C 21280002 */  addu       $a1, $s0, $zero
/* 95A70 800A5270 2800A2A7 */  sh         $v0, 0x28($sp)
/* 95A74 800A5274 2A00A3A7 */  sh         $v1, 0x2A($sp)
/* 95A78 800A5278 2C00A6A7 */  sh         $a2, 0x2C($sp)
/* 95A7C 800A527C 1B00A88B */  lwl        $t0, 0x1B($sp)
/* 95A80 800A5280 1800A89B */  lwr        $t0, 0x18($sp)
/* 95A84 800A5284 1C00A987 */  lh         $t1, 0x1C($sp)
/* 95A88 800A5288 5F0028AA */  swl        $t0, 0x5F($s1)
/* 95A8C 800A528C 5C0028BA */  swr        $t0, 0x5C($s1)
/* 95A90 800A5290 600029A6 */  sh         $t1, 0x60($s1)
/* 95A94 800A5294 2400A297 */  lhu        $v0, 0x24($sp)
/* 95A98 800A5298 08000624 */  addiu      $a2, $zero, 0x8
/* 95A9C 800A529C 2800A0A7 */  sh         $zero, 0x28($sp)
/* 95AA0 800A52A0 2A00A0A7 */  sh         $zero, 0x2A($sp)
/* 95AA4 800A52A4 5641020C */  jal        G2Anim_EnableController
/* 95AA8 800A52A8 2C00A2A7 */   sh        $v0, 0x2C($sp)
/* 95AAC 800A52AC 21202002 */  addu       $a0, $s1, $zero
/* 95AB0 800A52B0 21280002 */  addu       $a1, $s0, $zero
/* 95AB4 800A52B4 08000624 */  addiu      $a2, $zero, 0x8
/* 95AB8 800A52B8 2800A727 */  addiu      $a3, $sp, 0x28
/* 95ABC 800A52BC 1000B2AF */  sw         $s2, 0x10($sp)
/* 95AC0 800A52C0 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 95AC4 800A52C4 1400A0AF */   sw        $zero, 0x14($sp)
/* 95AC8 800A52C8 2400A297 */  lhu        $v0, 0x24($sp)
/* 95ACC 800A52CC 00000000 */  nop
/* 95AD0 800A52D0 780022A6 */  sh         $v0, 0x78($s1)
/* 95AD4 800A52D4 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 95AD8 800A52D8 3800B28F */  lw         $s2, 0x38($sp)
/* 95ADC 800A52DC 3400B18F */  lw         $s1, 0x34($sp)
/* 95AE0 800A52E0 3000B08F */  lw         $s0, 0x30($sp)
/* 95AE4 800A52E4 0800E003 */  jr         $ra
/* 95AE8 800A52E8 4000BD27 */   addiu     $sp, $sp, 0x40
.size razAlignYRotMoveInterp, . - razAlignYRotMoveInterp
