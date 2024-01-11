.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_InitTerrainMovement
/* 519F8 800611F8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 519FC 800611FC 1400B1AF */  sw         $s1, 0x14($sp)
/* 51A00 80061200 21880000 */  addu       $s1, $zero, $zero
/* 51A04 80061204 1000B0AF */  sw         $s0, 0x10($sp)
/* 51A08 80061208 60CB9027 */  addiu      $s0, $gp, %gp_rel(WaterLevelArray)
/* 51A0C 8006120C 1800BFAF */  sw         $ra, 0x18($sp)
.L80061210:
/* 51A10 80061210 21200002 */  addu       $a0, $s0, $zero
/* 51A14 80061214 1C000524 */  addiu      $a1, $zero, 0x1C
/* 51A18 80061218 2EF2020C */  jal        memset
/* 51A1C 8006121C 21300000 */   addu      $a2, $zero, $zero
/* 51A20 80061220 01003126 */  addiu      $s1, $s1, 0x1
/* 51A24 80061224 0500222A */  slti       $v0, $s1, 0x5
/* 51A28 80061228 F9FF4014 */  bnez       $v0, .L80061210
/* 51A2C 8006122C 1C001026 */   addiu     $s0, $s0, 0x1C
/* 51A30 80061230 1800BF8F */  lw         $ra, 0x18($sp)
/* 51A34 80061234 1400B18F */  lw         $s1, 0x14($sp)
/* 51A38 80061238 1000B08F */  lw         $s0, 0x10($sp)
/* 51A3C 8006123C 68A480AF */  sw         $zero, %gp_rel(WaterInUse)($gp)
/* 51A40 80061240 0800E003 */  jr         $ra
/* 51A44 80061244 2000BD27 */   addiu     $sp, $sp, 0x20
.size EVENT_InitTerrainMovement, . - EVENT_InitTerrainMovement
