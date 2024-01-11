.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetPhysics
/* 8A9AC 8009A1AC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8A9B0 8009A1B0 2000B2AF */  sw         $s2, 0x20($sp)
/* 8A9B4 8009A1B4 21908000 */  addu       $s2, $a0, $zero
/* 8A9B8 8009A1B8 2118A000 */  addu       $v1, $a1, $zero
/* 8A9BC 8009A1BC 21280000 */  addu       $a1, $zero, $zero
/* 8A9C0 8009A1C0 2130A000 */  addu       $a2, $a1, $zero
/* 8A9C4 8009A1C4 003C0300 */  sll        $a3, $v1, 16
/* 8A9C8 8009A1C8 033C0700 */  sra        $a3, $a3, 16
/* 8A9CC 8009A1CC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8A9D0 8009A1D0 01001124 */  addiu      $s1, $zero, 0x1
/* 8A9D4 8009A1D4 1800B0AF */  sw         $s0, 0x18($sp)
/* 8A9D8 8009A1D8 14001024 */  addiu      $s0, $zero, 0x14
/* 8A9DC 8009A1DC F0F5848F */  lw         $a0, %gp_rel(ExternalForces)($gp)
/* 8A9E0 8009A1E0 00100224 */  addiu      $v0, $zero, 0x1000
/* 8A9E4 8009A1E4 2400B3AF */  sw         $s3, 0x24($sp)
/* 8A9E8 8009A1E8 21986000 */  addu       $s3, $v1, $zero
/* 8A9EC 8009A1EC 2800BFAF */  sw         $ra, 0x28($sp)
/* 8A9F0 8009A1F0 1000A0AF */  sw         $zero, 0x10($sp)
/* 8A9F4 8009A1F4 2E69020C */  jal        SetExternalForce
/* 8A9F8 8009A1F8 1400A2AF */   sw        $v0, 0x14($sp)
.L8009A1FC:
/* 8A9FC 8009A1FC 21280000 */  addu       $a1, $zero, $zero
/* 8AA00 8009A200 2130A000 */  addu       $a2, $a1, $zero
/* 8AA04 8009A204 2138A000 */  addu       $a3, $a1, $zero
/* 8AA08 8009A208 F0F5848F */  lw         $a0, %gp_rel(ExternalForces)($gp)
/* 8AA0C 8009A20C 01003126 */  addiu      $s1, $s1, 0x1
/* 8AA10 8009A210 1000A0AF */  sw         $zero, 0x10($sp)
/* 8AA14 8009A214 1400A0AF */  sw         $zero, 0x14($sp)
/* 8AA18 8009A218 2E69020C */  jal        SetExternalForce
/* 8AA1C 8009A21C 21209000 */   addu      $a0, $a0, $s0
/* 8AA20 8009A220 0400222A */  slti       $v0, $s1, 0x4
/* 8AA24 8009A224 F5FF4014 */  bnez       $v0, .L8009A1FC
/* 8AA28 8009A228 14001026 */   addiu     $s0, $s0, 0x14
/* 8AA2C 8009A22C 00141300 */  sll        $v0, $s3, 16
/* 8AA30 8009A230 03140200 */  sra        $v0, $v0, 16
/* 8AA34 8009A234 740140AE */  sw         $zero, 0x174($s2)
/* 8AA38 8009A238 780140AE */  sw         $zero, 0x178($s2)
/* 8AA3C 8009A23C 7C0140AE */  sw         $zero, 0x17C($s2)
/* 8AA40 8009A240 800140AE */  sw         $zero, 0x180($s2)
/* 8AA44 8009A244 840140AE */  sw         $zero, 0x184($s2)
/* 8AA48 8009A248 880142AE */  sw         $v0, 0x188($s2)
/* 8AA4C 8009A24C 2800BF8F */  lw         $ra, 0x28($sp)
/* 8AA50 8009A250 2400B38F */  lw         $s3, 0x24($sp)
/* 8AA54 8009A254 2000B28F */  lw         $s2, 0x20($sp)
/* 8AA58 8009A258 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8AA5C 8009A25C 1800B08F */  lw         $s0, 0x18($sp)
/* 8AA60 8009A260 0800E003 */  jr         $ra
/* 8AA64 8009A264 3000BD27 */   addiu     $sp, $sp, 0x30
.size ResetPhysics, . - ResetPhysics
