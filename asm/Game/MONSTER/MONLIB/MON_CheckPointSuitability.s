.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_CheckPointSuitability
/* 72168 80081968 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7216C 8008196C 1800B2AF */  sw         $s2, 0x18($sp)
/* 72170 80081970 21908000 */  addu       $s2, $a0, $zero
/* 72174 80081974 2000B4AF */  sw         $s4, 0x20($sp)
/* 72178 80081978 21A0C000 */  addu       $s4, $a2, $zero
/* 7217C 8008197C 2400BFAF */  sw         $ra, 0x24($sp)
/* 72180 80081980 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 72184 80081984 1400B1AF */  sw         $s1, 0x14($sp)
/* 72188 80081988 1000B0AF */  sw         $s0, 0x10($sp)
/* 7218C 8008198C 6C01518E */  lw         $s1, 0x16C($s2)
/* 72190 80081990 21980000 */  addu       $s3, $zero, $zero
/* 72194 80081994 6801228E */  lw         $v0, 0x168($s1)
/* 72198 80081998 21208002 */  addu       $a0, $s4, $zero
/* 7219C 8008199C 16004584 */  lh         $a1, 0x16($v0)
/* 721A0 800819A0 31C5010C */  jal        SetPhysicsDropHeightData
/* 721A4 800819A4 40000624 */   addiu     $a2, $zero, 0x40
/* 721A8 800819A8 21204002 */  addu       $a0, $s2, $zero
/* 721AC 800819AC 21804000 */  addu       $s0, $v0, $zero
/* 721B0 800819B0 21280002 */  addu       $a1, $s0, $zero
/* 721B4 800819B4 A9DB010C */  jal        PhysicsCheckDropHeight
/* 721B8 800819B8 01000624 */   addiu     $a2, $zero, 0x1
/* 721BC 800819BC 21204000 */  addu       $a0, $v0, $zero
/* 721C0 800819C0 01000224 */  addiu      $v0, $zero, 0x1
/* 721C4 800819C4 08008214 */  bne        $a0, $v0, .L800819E8
/* 721C8 800819C8 00000000 */   nop
/* 721CC 800819CC 0C00058E */  lw         $a1, 0xC($s0)
/* 721D0 800819D0 1000068E */  lw         $a2, 0x10($s0)
/* 721D4 800819D4 2A06020C */  jal        MON_CheckTerrain
/* 721D8 800819D8 21204002 */   addu      $a0, $s2, $zero
/* 721DC 800819DC 04000396 */  lhu        $v1, 0x4($s0)
/* 721E0 800819E0 01004434 */  ori        $a0, $v0, 0x1
/* 721E4 800819E4 040083A6 */  sh         $v1, 0x4($s4)
.L800819E8:
/* 721E8 800819E8 52012296 */  lhu        $v0, 0x152($s1)
/* 721EC 800819EC 00000000 */  nop
/* 721F0 800819F0 24108200 */  and        $v0, $a0, $v0
/* 721F4 800819F4 0A004014 */  bnez       $v0, .L80081A20
/* 721F8 800819F8 21106002 */   addu      $v0, $s3, $zero
/* 721FC 800819FC 0000228E */  lw         $v0, 0x0($s1)
/* 72200 80081A00 00000000 */  nop
/* 72204 80081A04 00084230 */  andi       $v0, $v0, 0x800
/* 72208 80081A08 03004014 */  bnez       $v0, .L80081A18
/* 7220C 80081A0C 00000000 */   nop
/* 72210 80081A10 03008010 */  beqz       $a0, .L80081A20
/* 72214 80081A14 21106002 */   addu      $v0, $s3, $zero
.L80081A18:
/* 72218 80081A18 01001324 */  addiu      $s3, $zero, 0x1
/* 7221C 80081A1C 21106002 */  addu       $v0, $s3, $zero
.L80081A20:
/* 72220 80081A20 2400BF8F */  lw         $ra, 0x24($sp)
/* 72224 80081A24 2000B48F */  lw         $s4, 0x20($sp)
/* 72228 80081A28 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7222C 80081A2C 1800B28F */  lw         $s2, 0x18($sp)
/* 72230 80081A30 1400B18F */  lw         $s1, 0x14($sp)
/* 72234 80081A34 1000B08F */  lw         $s0, 0x10($sp)
/* 72238 80081A38 0800E003 */  jr         $ra
/* 7223C 80081A3C 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_CheckPointSuitability, . - MON_CheckPointSuitability
