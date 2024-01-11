.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razGetRotFromNormal
/* 96964 800A6164 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 96968 800A6168 2000BFAF */  sw         $ra, 0x20($sp)
/* 9696C 800A616C 00008294 */  lhu        $v0, 0x0($a0)
/* 96970 800A6170 2130A000 */  addu       $a2, $a1, $zero
/* 96974 800A6174 1000A2A7 */  sh         $v0, 0x10($sp)
/* 96978 800A6178 02008294 */  lhu        $v0, 0x2($a0)
/* 9697C 800A617C 1800A527 */  addiu      $a1, $sp, 0x18
/* 96980 800A6180 1200A2A7 */  sh         $v0, 0x12($sp)
/* 96984 800A6184 04008294 */  lhu        $v0, 0x4($a0)
/* 96988 800A6188 1000A427 */  addiu      $a0, $sp, 0x10
/* 9698C 800A618C 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 96990 800A6190 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 96994 800A6194 1800A0A7 */  sh         $zero, 0x18($sp)
/* 96998 800A6198 CDE8000C */  jal        MATH3D_RotationFromPosToPos
/* 9699C 800A619C 1400A2A7 */   sh        $v0, 0x14($sp)
/* 969A0 800A61A0 2000BF8F */  lw         $ra, 0x20($sp)
/* 969A4 800A61A4 00000000 */  nop
/* 969A8 800A61A8 0800E003 */  jr         $ra
/* 969AC 800A61AC 2800BD27 */   addiu     $sp, $sp, 0x28
.size razGetRotFromNormal, . - razGetRotFromNormal
