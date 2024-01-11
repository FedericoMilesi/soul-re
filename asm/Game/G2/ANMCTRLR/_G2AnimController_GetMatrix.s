.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimController_GetMatrix
/* 822C8 80091AC8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 822CC 80091ACC 2000B0AF */  sw         $s0, 0x20($sp)
/* 822D0 80091AD0 21808000 */  addu       $s0, $a0, $zero
/* 822D4 80091AD4 2800BFAF */  sw         $ra, 0x28($sp)
/* 822D8 80091AD8 2400B1AF */  sw         $s1, 0x24($sp)
/* 822DC 80091ADC 08000396 */  lhu        $v1, 0x8($s0)
/* 822E0 80091AE0 00000000 */  nop
/* 822E4 80091AE4 00406230 */  andi       $v0, $v1, 0x4000
/* 822E8 80091AE8 1B004010 */  beqz       $v0, .L80091B58
/* 822EC 80091AEC 2188A000 */   addu      $s1, $a1, $zero
/* 822F0 80091AF0 00206230 */  andi       $v0, $v1, 0x2000
/* 822F4 80091AF4 05004010 */  beqz       $v0, .L80091B0C
/* 822F8 80091AF8 00000000 */   nop
/* 822FC 80091AFC 27E7010C */  jal        G2Quat_ToMatrix_S
/* 82300 80091B00 1C000426 */   addiu     $a0, $s0, 0x1C
/* 82304 80091B04 E3460208 */  j          .L80091B8C
/* 82308 80091B08 00000000 */   nop
.L80091B0C:
/* 8230C 80091B0C 0C000586 */  lh         $a1, 0xC($s0)
/* 82310 80091B10 0A000286 */  lh         $v0, 0xA($s0)
/* 82314 80091B14 002B0500 */  sll        $a1, $a1, 12
/* 82318 80091B18 1A00A200 */  div        $zero, $a1, $v0
/* 8231C 80091B1C 12280000 */  mflo       $a1
/* 82320 80091B20 1000048E */  lw         $a0, 0x10($s0)
/* 82324 80091B24 9B53020C */  jal        _G2AnimAlphaTable_GetValue
/* 82328 80091B28 00000000 */   nop
/* 8232C 80091B2C 21204000 */  addu       $a0, $v0, $zero
/* 82330 80091B30 14000526 */  addiu      $a1, $s0, 0x14
/* 82334 80091B34 1C000626 */  addiu      $a2, $s0, 0x1C
/* 82338 80091B38 1800A727 */  addiu      $a3, $sp, 0x18
/* 8233C 80091B3C 0D59020C */  jal        G2Quat_Slerp_VM
/* 82340 80091B40 1000A0AF */   sw        $zero, 0x10($sp)
/* 82344 80091B44 1800A427 */  addiu      $a0, $sp, 0x18
/* 82348 80091B48 27E7010C */  jal        G2Quat_ToMatrix_S
/* 8234C 80091B4C 21282002 */   addu      $a1, $s1, $zero
/* 82350 80091B50 E3460208 */  j          .L80091B8C
/* 82354 80091B54 00000000 */   nop
.L80091B58:
/* 82358 80091B58 FF006330 */  andi       $v1, $v1, 0xFF
/* 8235C 80091B5C 01000224 */  addiu      $v0, $zero, 0x1
/* 82360 80091B60 07006210 */  beq        $v1, $v0, .L80091B80
/* 82364 80091B64 15000224 */   addiu     $v0, $zero, 0x15
/* 82368 80091B68 08006214 */  bne        $v1, $v0, .L80091B8C
/* 8236C 80091B6C 14000426 */   addiu     $a0, $s0, 0x14
/* 82370 80091B70 3DE3010C */  jal        RotMatrix
/* 82374 80091B74 21282002 */   addu      $a1, $s1, $zero
/* 82378 80091B78 E3460208 */  j          .L80091B8C
/* 8237C 80091B7C 00000000 */   nop
.L80091B80:
/* 82380 80091B80 14000426 */  addiu      $a0, $s0, 0x14
/* 82384 80091B84 D8E2010C */  jal        RotMatrixZYX
/* 82388 80091B88 21282002 */   addu      $a1, $s1, $zero
.L80091B8C:
/* 8238C 80091B8C 2800BF8F */  lw         $ra, 0x28($sp)
/* 82390 80091B90 2400B18F */  lw         $s1, 0x24($sp)
/* 82394 80091B94 2000B08F */  lw         $s0, 0x20($sp)
/* 82398 80091B98 0800E003 */  jr         $ra
/* 8239C 80091B9C 3000BD27 */   addiu     $sp, $sp, 0x30
.size _G2AnimController_GetMatrix, . - _G2AnimController_GetMatrix
