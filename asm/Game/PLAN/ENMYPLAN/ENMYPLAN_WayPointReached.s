.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_WayPointReached
/* 87174 80096974 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 87178 80096978 21188000 */  addu       $v1, $a0, $zero
/* 8717C 8009697C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 87180 80096980 2188A000 */  addu       $s1, $a1, $zero
/* 87184 80096984 1800B0AF */  sw         $s0, 0x18($sp)
/* 87188 80096988 2180C000 */  addu       $s0, $a2, $zero
/* 8718C 8009698C 2000BFAF */  sw         $ra, 0x20($sp)
/* 87190 80096990 00000286 */  lh         $v0, 0x0($s0)
/* 87194 80096994 00006484 */  lh         $a0, 0x0($v1)
/* 87198 80096998 02000786 */  lh         $a3, 0x2($s0)
/* 8719C 8009699C 02006584 */  lh         $a1, 0x2($v1)
/* 871A0 800969A0 04006684 */  lh         $a2, 0x4($v1)
/* 871A4 800969A4 23204400 */  subu       $a0, $v0, $a0
/* 871A8 800969A8 04000286 */  lh         $v0, 0x4($s0)
/* 871AC 800969AC 2328E500 */  subu       $a1, $a3, $a1
/* 871B0 800969B0 B7E6000C */  jal        MATH3D_LengthXYZ
/* 871B4 800969B4 23304600 */   subu      $a2, $v0, $a2
/* 871B8 800969B8 1000A2AF */  sw         $v0, 0x10($sp)
/* 871BC 800969BC 00000286 */  lh         $v0, 0x0($s0)
/* 871C0 800969C0 00002486 */  lh         $a0, 0x0($s1)
/* 871C4 800969C4 02000386 */  lh         $v1, 0x2($s0)
/* 871C8 800969C8 02002586 */  lh         $a1, 0x2($s1)
/* 871CC 800969CC 04002686 */  lh         $a2, 0x4($s1)
/* 871D0 800969D0 23204400 */  subu       $a0, $v0, $a0
/* 871D4 800969D4 04000286 */  lh         $v0, 0x4($s0)
/* 871D8 800969D8 23286500 */  subu       $a1, $v1, $a1
/* 871DC 800969DC B7E6000C */  jal        MATH3D_LengthXYZ
/* 871E0 800969E0 23304600 */   subu      $a2, $v0, $a2
/* 871E4 800969E4 1000A38F */  lw         $v1, 0x10($sp)
/* 871E8 800969E8 1400A2AF */  sw         $v0, 0x14($sp)
/* 871EC 800969EC 2A104300 */  slt        $v0, $v0, $v1
/* 871F0 800969F0 03004010 */  beqz       $v0, .L80096A00
/* 871F4 800969F4 90016228 */   slti      $v0, $v1, 0x190
/* 871F8 800969F8 05004014 */  bnez       $v0, .L80096A10
/* 871FC 800969FC 01000224 */   addiu     $v0, $zero, 0x1
.L80096A00:
/* 87200 80096A00 32006228 */  slti       $v0, $v1, 0x32
/* 87204 80096A04 02004014 */  bnez       $v0, .L80096A10
/* 87208 80096A08 01000224 */   addiu     $v0, $zero, 0x1
/* 8720C 80096A0C 21100000 */  addu       $v0, $zero, $zero
.L80096A10:
/* 87210 80096A10 2000BF8F */  lw         $ra, 0x20($sp)
/* 87214 80096A14 1C00B18F */  lw         $s1, 0x1C($sp)
/* 87218 80096A18 1800B08F */  lw         $s0, 0x18($sp)
/* 8721C 80096A1C 0800E003 */  jr         $ra
/* 87220 80096A20 2800BD27 */   addiu     $sp, $sp, 0x28
.size ENMYPLAN_WayPointReached, . - ENMYPLAN_WayPointReached
