.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_RotationFromPosToPos
/* 2AB34 8003A334 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2AB38 8003A338 1000B0AF */  sw         $s0, 0x10($sp)
/* 2AB3C 8003A33C 21808000 */  addu       $s0, $a0, $zero
/* 2AB40 8003A340 1800B2AF */  sw         $s2, 0x18($sp)
/* 2AB44 8003A344 2190A000 */  addu       $s2, $a1, $zero
/* 2AB48 8003A348 1400B1AF */  sw         $s1, 0x14($sp)
/* 2AB4C 8003A34C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 2AB50 8003A350 ACE8000C */  jal        MATH3D_ElevationFromPosToPos
/* 2AB54 8003A354 2188C000 */   addu      $s1, $a2, $zero
/* 2AB58 8003A358 21200002 */  addu       $a0, $s0, $zero
/* 2AB5C 8003A35C 21284002 */  addu       $a1, $s2, $zero
/* 2AB60 8003A360 000022A6 */  sh         $v0, 0x0($s1)
/* 2AB64 8003A364 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 2AB68 8003A368 020020A6 */   sh        $zero, 0x2($s1)
/* 2AB6C 8003A36C 040022A6 */  sh         $v0, 0x4($s1)
/* 2AB70 8003A370 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 2AB74 8003A374 1800B28F */  lw         $s2, 0x18($sp)
/* 2AB78 8003A378 1400B18F */  lw         $s1, 0x14($sp)
/* 2AB7C 8003A37C 1000B08F */  lw         $s0, 0x10($sp)
/* 2AB80 8003A380 0800E003 */  jr         $ra
/* 2AB84 8003A384 2000BD27 */   addiu     $sp, $sp, 0x20
.size MATH3D_RotationFromPosToPos, . - MATH3D_RotationFromPosToPos
