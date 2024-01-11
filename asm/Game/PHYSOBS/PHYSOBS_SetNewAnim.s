.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOBS_SetNewAnim
/* 5FADC 8006F2DC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5FAE0 8006F2E0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5FAE4 8006F2E4 21888000 */  addu       $s1, $a0, $zero
/* 5FAE8 8006F2E8 1800B0AF */  sw         $s0, 0x18($sp)
/* 5FAEC 8006F2EC 2180A000 */  addu       $s0, $a1, $zero
/* 5FAF0 8006F2F0 2000B2AF */  sw         $s2, 0x20($sp)
/* 5FAF4 8006F2F4 2190E000 */  addu       $s2, $a3, $zero
/* 5FAF8 8006F2F8 2400BFAF */  sw         $ra, 0x24($sp)
/* 5FAFC 8006F2FC 0000028E */  lw         $v0, 0x0($s0)
/* 5FB00 8006F300 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 5FB04 8006F304 280012A6 */  sh         $s2, 0x28($s0)
/* 5FB08 8006F308 24104300 */  and        $v0, $v0, $v1
/* 5FB0C 8006F30C 3800A38F */  lw         $v1, 0x38($sp)
/* 5FB10 8006F310 25104600 */  or         $v0, $v0, $a2
/* 5FB14 8006F314 03006010 */  beqz       $v1, .L8006F324
/* 5FB18 8006F318 000002AE */   sw        $v0, 0x0($s0)
/* 5FB1C 8006F31C A9A7010C */  jal        ResetOrientation
/* 5FB20 8006F320 00000000 */   nop
.L8006F324:
/* 5FB24 8006F324 21202002 */  addu       $a0, $s1, $zero
/* 5FB28 8006F328 04000586 */  lh         $a1, 0x4($s0)
/* 5FB2C 8006F32C 06000686 */  lh         $a2, 0x6($s0)
/* 5FB30 8006F330 21384002 */  addu       $a3, $s2, $zero
/* 5FB34 8006F334 F8A8010C */  jal        PhysOb_AlignPush
/* 5FB38 8006F338 1000B0AF */   sw        $s0, 0x10($sp)
/* 5FB3C 8006F33C 2400BF8F */  lw         $ra, 0x24($sp)
/* 5FB40 8006F340 2000B28F */  lw         $s2, 0x20($sp)
/* 5FB44 8006F344 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5FB48 8006F348 1800B08F */  lw         $s0, 0x18($sp)
/* 5FB4C 8006F34C 0800E003 */  jr         $ra
/* 5FB50 8006F350 2800BD27 */   addiu     $sp, $sp, 0x28
.size PHYSOBS_SetNewAnim, . - PHYSOBS_SetNewAnim
