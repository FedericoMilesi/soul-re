.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_CheckLineInWorldMask
/* 65188 80074988 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6518C 8007498C 1800B2AF */  sw         $s2, 0x18($sp)
/* 65190 80074990 21908000 */  addu       $s2, $a0, $zero
/* 65194 80074994 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 65198 80074998 1400B1AF */  sw         $s1, 0x14($sp)
/* 6519C 8007499C 1000B0AF */  sw         $s0, 0x10($sp)
/* 651A0 800749A0 3800448E */  lw         $a0, 0x38($s2)
/* 651A4 800749A4 1C66010C */  jal        STREAM_GetLevelWithID
/* 651A8 800749A8 2188A000 */   addu      $s1, $a1, $zero
/* 651AC 800749AC 21204002 */  addu       $a0, $s2, $zero
/* 651B0 800749B0 21804000 */  addu       $s0, $v0, $zero
/* 651B4 800749B4 080020AE */  sw         $zero, 0x8($s1)
/* 651B8 800749B8 34D2010C */  jal        SetNoPtCollideInFamily
/* 651BC 800749BC 280032AE */   sw        $s2, 0x28($s1)
/* 651C0 800749C0 05000012 */  beqz       $s0, .L800749D8
/* 651C4 800749C4 21202002 */   addu      $a0, $s1, $zero
/* 651C8 800749C8 0783000C */  jal        COLLIDE_PointAndWorld
/* 651CC 800749CC 21280002 */   addu      $a1, $s0, $zero
/* 651D0 800749D0 77D20108 */  j          .L800749DC
/* 651D4 800749D4 00000000 */   nop
.L800749D8:
/* 651D8 800749D8 000020A6 */  sh         $zero, 0x0($s1)
.L800749DC:
/* 651DC 800749DC 46D2010C */  jal        ResetNoPtCollideInFamily
/* 651E0 800749E0 21204002 */   addu      $a0, $s2, $zero
/* 651E4 800749E4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 651E8 800749E8 1800B28F */  lw         $s2, 0x18($sp)
/* 651EC 800749EC 1400B18F */  lw         $s1, 0x14($sp)
/* 651F0 800749F0 1000B08F */  lw         $s0, 0x10($sp)
/* 651F4 800749F4 0800E003 */  jr         $ra
/* 651F8 800749F8 2000BD27 */   addiu     $sp, $sp, 0x20
.size PHYSICS_CheckLineInWorldMask, . - PHYSICS_CheckLineInWorldMask
