.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_InstanceSplineProcess
/* 2E28C 8003DA8C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 2E290 8003DA90 3800B4AF */  sw         $s4, 0x38($sp)
/* 2E294 8003DA94 21A08000 */  addu       $s4, $a0, $zero
/* 2E298 8003DA98 3400B3AF */  sw         $s3, 0x34($sp)
/* 2E29C 8003DA9C 2198A000 */  addu       $s3, $a1, $zero
/* 2E2A0 8003DAA0 3000B2AF */  sw         $s2, 0x30($sp)
/* 2E2A4 8003DAA4 2190C000 */  addu       $s2, $a2, $zero
/* 2E2A8 8003DAA8 2800B0AF */  sw         $s0, 0x28($sp)
/* 2E2AC 8003DAAC 2180E000 */  addu       $s0, $a3, $zero
/* 2E2B0 8003DAB0 2000A527 */  addiu      $a1, $sp, 0x20
/* 2E2B4 8003DAB4 2400A627 */  addiu      $a2, $sp, 0x24
/* 2E2B8 8003DAB8 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 2E2BC 8003DABC 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* 2E2C0 8003DAC0 2C00B1AF */   sw        $s1, 0x2C($sp)
/* 2E2C4 8003DAC4 21884000 */  addu       $s1, $v0, $zero
/* 2E2C8 8003DAC8 2A002012 */  beqz       $s1, .L8003DB74
/* 2E2CC 8003DACC FFFF0224 */   addiu     $v0, $zero, -0x1
/* 2E2D0 8003DAD0 2000A28F */  lw         $v0, 0x20($sp)
/* 2E2D4 8003DAD4 00000000 */  nop
/* 2E2D8 8003DAD8 0B004014 */  bnez       $v0, .L8003DB08
/* 2E2DC 8003DADC 21208002 */   addu      $a0, $s4, $zero
/* 2E2E0 8003DAE0 2400A28F */  lw         $v0, 0x24($sp)
/* 2E2E4 8003DAE4 00000000 */  nop
/* 2E2E8 8003DAE8 07004014 */  bnez       $v0, .L8003DB08
/* 2E2EC 8003DAEC 00000000 */   nop
/* 2E2F0 8003DAF0 18006016 */  bnez       $s3, .L8003DB54
/* 2E2F4 8003DAF4 21282002 */   addu      $a1, $s1, $zero
/* 2E2F8 8003DAF8 16004016 */  bnez       $s2, .L8003DB54
/* 2E2FC 8003DAFC 00000000 */   nop
/* 2E300 8003DB00 14000016 */  bnez       $s0, .L8003DB54
/* 2E304 8003DB04 00000000 */   nop
.L8003DB08:
/* 2E308 8003DB08 2000A68F */  lw         $a2, 0x20($sp)
/* 2E30C 8003DB0C 2400A78F */  lw         $a3, 0x24($sp)
/* 2E310 8003DB10 96F4000C */  jal        SCRIPT_GetPosSplineDef
/* 2E314 8003DB14 21282002 */   addu      $a1, $s1, $zero
/* 2E318 8003DB18 21984000 */  addu       $s3, $v0, $zero
/* 2E31C 8003DB1C 21208002 */  addu       $a0, $s4, $zero
/* 2E320 8003DB20 2000A68F */  lw         $a2, 0x20($sp)
/* 2E324 8003DB24 2400A78F */  lw         $a3, 0x24($sp)
/* 2E328 8003DB28 A1F4000C */  jal        SCRIPT_GetRotSplineDef
/* 2E32C 8003DB2C 21282002 */   addu      $a1, $s1, $zero
/* 2E330 8003DB30 21904000 */  addu       $s2, $v0, $zero
/* 2E334 8003DB34 21208002 */  addu       $a0, $s4, $zero
/* 2E338 8003DB38 2000A68F */  lw         $a2, 0x20($sp)
/* 2E33C 8003DB3C 2400A78F */  lw         $a3, 0x24($sp)
/* 2E340 8003DB40 ACF4000C */  jal        SCRIPT_GetScaleSplineDef
/* 2E344 8003DB44 21282002 */   addu      $a1, $s1, $zero
/* 2E348 8003DB48 21804000 */  addu       $s0, $v0, $zero
/* 2E34C 8003DB4C 21208002 */  addu       $a0, $s4, $zero
/* 2E350 8003DB50 21282002 */  addu       $a1, $s1, $zero
.L8003DB54:
/* 2E354 8003DB54 5000A28F */  lw         $v0, 0x50($sp)
/* 2E358 8003DB58 21306002 */  addu       $a2, $s3, $zero
/* 2E35C 8003DB5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 2E360 8003DB60 1400A2AF */  sw         $v0, 0x14($sp)
/* 2E364 8003DB64 2400A28F */  lw         $v0, 0x24($sp)
/* 2E368 8003DB68 21384002 */  addu       $a3, $s2, $zero
/* 2E36C 8003DB6C E9F5000C */  jal        SCRIPT_SplineProcess
/* 2E370 8003DB70 1800A2AF */   sw        $v0, 0x18($sp)
.L8003DB74:
/* 2E374 8003DB74 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 2E378 8003DB78 3800B48F */  lw         $s4, 0x38($sp)
/* 2E37C 8003DB7C 3400B38F */  lw         $s3, 0x34($sp)
/* 2E380 8003DB80 3000B28F */  lw         $s2, 0x30($sp)
/* 2E384 8003DB84 2C00B18F */  lw         $s1, 0x2C($sp)
/* 2E388 8003DB88 2800B08F */  lw         $s0, 0x28($sp)
/* 2E38C 8003DB8C 0800E003 */  jr         $ra
/* 2E390 8003DB90 4000BD27 */   addiu     $sp, $sp, 0x40
.size SCRIPT_InstanceSplineProcess, . - SCRIPT_InstanceSplineProcess
