.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOBS_CheckForStackedForwardHits
/* 5FA60 8006F260 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5FA64 8006F264 1800B2AF */  sw         $s2, 0x18($sp)
/* 5FA68 8006F268 2190A000 */  addu       $s2, $a1, $zero
/* 5FA6C 8006F26C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 5FA70 8006F270 2198C000 */  addu       $s3, $a2, $zero
/* 5FA74 8006F274 1400B1AF */  sw         $s1, 0x14($sp)
/* 5FA78 8006F278 21880000 */  addu       $s1, $zero, $zero
/* 5FA7C 8006F27C 2000BFAF */  sw         $ra, 0x20($sp)
/* 5FA80 8006F280 AABC0108 */  j          .L8006F2A8
/* 5FA84 8006F284 1000B0AF */   sw        $s0, 0x10($sp)
.L8006F288:
/* 5FA88 8006F288 21284002 */  addu       $a1, $s2, $zero
/* 5FA8C 8006F28C 21306002 */  addu       $a2, $s3, $zero
/* 5FA90 8006F290 7BBC010C */  jal        PHYSOB_CheckDirectedLineCollision
/* 5FA94 8006F294 21380000 */   addu      $a3, $zero, $zero
/* 5FA98 8006F298 03004010 */  beqz       $v0, .L8006F2A8
/* 5FA9C 8006F29C 21200002 */   addu      $a0, $s0, $zero
/* 5FAA0 8006F2A0 AFBC0108 */  j          .L8006F2BC
/* 5FAA4 8006F2A4 01001124 */   addiu     $s1, $zero, 0x1
.L8006F2A8:
/* 5FAA8 8006F2A8 71A3010C */  jal        PHYSOBS_IsAPushBlockAttached
/* 5FAAC 8006F2AC 00000000 */   nop
/* 5FAB0 8006F2B0 21804000 */  addu       $s0, $v0, $zero
/* 5FAB4 8006F2B4 F4FF0016 */  bnez       $s0, .L8006F288
/* 5FAB8 8006F2B8 21200002 */   addu      $a0, $s0, $zero
.L8006F2BC:
/* 5FABC 8006F2BC 21102002 */  addu       $v0, $s1, $zero
/* 5FAC0 8006F2C0 2000BF8F */  lw         $ra, 0x20($sp)
/* 5FAC4 8006F2C4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 5FAC8 8006F2C8 1800B28F */  lw         $s2, 0x18($sp)
/* 5FACC 8006F2CC 1400B18F */  lw         $s1, 0x14($sp)
/* 5FAD0 8006F2D0 1000B08F */  lw         $s0, 0x10($sp)
/* 5FAD4 8006F2D4 0800E003 */  jr         $ra
/* 5FAD8 8006F2D8 2800BD27 */   addiu     $sp, $sp, 0x28
.size PHYSOBS_CheckForStackedForwardHits, . - PHYSOBS_CheckForStackedForwardHits
