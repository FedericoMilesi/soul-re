.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_UpdatePlayerNode
/* 87DB0 800975B0 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 87DB4 800975B4 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 87DB8 800975B8 21988000 */  addu       $s3, $a0, $zero
/* 87DBC 800975BC 3800B2AF */  sw         $s2, 0x38($sp)
/* 87DC0 800975C0 2190A000 */  addu       $s2, $a1, $zero
/* 87DC4 800975C4 01000524 */  addiu      $a1, $zero, 0x1
/* 87DC8 800975C8 4000BFAF */  sw         $ra, 0x40($sp)
/* 87DCC 800975CC 3400B1AF */  sw         $s1, 0x34($sp)
/* 87DD0 800975D0 A264020C */  jal        PLANPOOL_GetFirstNodeOfSource
/* 87DD4 800975D4 3000B0AF */   sw        $s0, 0x30($sp)
/* 87DD8 800975D8 21884000 */  addu       $s1, $v0, $zero
/* 87DDC 800975DC 42002012 */  beqz       $s1, .L800976E8
/* 87DE0 800975E0 00000000 */   nop
/* 87DE4 800975E4 F962020C */  jal        PLANCOLL_CheckUnderwaterPoint
/* 87DE8 800975E8 21204002 */   addu      $a0, $s2, $zero
/* 87DEC 800975EC 21804000 */  addu       $s0, $v0, $zero
/* 87DF0 800975F0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 87DF4 800975F4 08000212 */  beq        $s0, $v0, .L80097618
/* 87DF8 800975F8 21204002 */   addu      $a0, $s2, $zero
/* 87DFC 800975FC 21282002 */  addu       $a1, $s1, $zero
/* 87E00 80097600 8066020C */  jal        PLANPOOL_ChangeNodePosition
/* 87E04 80097604 21306002 */   addu      $a2, $s3, $zero
/* 87E08 80097608 19000224 */  addiu      $v0, $zero, 0x19
/* 87E0C 8009760C 140022A6 */  sh         $v0, 0x14($s1)
/* 87E10 80097610 BA5D0208 */  j          .L800976E8
/* 87E14 80097614 180030AE */   sw        $s0, 0x18($s1)
.L80097618:
/* 87E18 80097618 1800A427 */  addiu      $a0, $sp, 0x18
/* 87E1C 8009761C 2800A527 */  addiu      $a1, $sp, 0x28
/* 87E20 80097620 00010624 */  addiu      $a2, $zero, 0x100
/* 87E24 80097624 00004296 */  lhu        $v0, 0x0($s2)
/* 87E28 80097628 02004396 */  lhu        $v1, 0x2($s2)
/* 87E2C 8009762C 04004796 */  lhu        $a3, 0x4($s2)
/* 87E30 80097630 2000B027 */  addiu      $s0, $sp, 0x20
/* 87E34 80097634 2000A2A7 */  sh         $v0, 0x20($sp)
/* 87E38 80097638 05000224 */  addiu      $v0, $zero, 0x5
/* 87E3C 8009763C 040007A6 */  sh         $a3, 0x4($s0)
/* 87E40 80097640 80FD0724 */  addiu      $a3, $zero, -0x280
/* 87E44 80097644 020003A6 */  sh         $v1, 0x2($s0)
/* 87E48 80097648 1000A0AF */  sw         $zero, 0x10($sp)
/* 87E4C 8009764C 5463020C */  jal        PLANCOLL_FindTerrainHitFinal
/* 87E50 80097650 1400A2AF */   sw        $v0, 0x14($sp)
/* 87E54 80097654 0D004010 */  beqz       $v0, .L8009768C
/* 87E58 80097658 21200002 */   addu      $a0, $s0, $zero
/* 87E5C 8009765C 21282002 */  addu       $a1, $s1, $zero
/* 87E60 80097660 8066020C */  jal        PLANPOOL_ChangeNodePosition
/* 87E64 80097664 21306002 */   addu      $a2, $s3, $zero
/* 87E68 80097668 2800A297 */  lhu        $v0, 0x28($sp)
/* 87E6C 8009766C 00000000 */  nop
/* 87E70 80097670 03004230 */  andi       $v0, $v0, 0x3
/* 87E74 80097674 C0100200 */  sll        $v0, $v0, 3
/* 87E78 80097678 01004234 */  ori        $v0, $v0, 0x1
/* 87E7C 8009767C 140022A6 */  sh         $v0, 0x14($s1)
/* 87E80 80097680 1800A28F */  lw         $v0, 0x18($sp)
/* 87E84 80097684 BA5D0208 */  j          .L800976E8
/* 87E88 80097688 180022AE */   sw        $v0, 0x18($s1)
.L8009768C:
/* 87E8C 8009768C 00004286 */  lh         $v0, 0x0($s2)
/* 87E90 80097690 00002486 */  lh         $a0, 0x0($s1)
/* 87E94 80097694 02004386 */  lh         $v1, 0x2($s2)
/* 87E98 80097698 02002586 */  lh         $a1, 0x2($s1)
/* 87E9C 8009769C 04002686 */  lh         $a2, 0x4($s1)
/* 87EA0 800976A0 23204400 */  subu       $a0, $v0, $a0
/* 87EA4 800976A4 04004286 */  lh         $v0, 0x4($s2)
/* 87EA8 800976A8 23286500 */  subu       $a1, $v1, $a1
/* 87EAC 800976AC B7E6000C */  jal        MATH3D_LengthXYZ
/* 87EB0 800976B0 23304600 */   subu      $a2, $v0, $a2
/* 87EB4 800976B4 E12E4228 */  slti       $v0, $v0, 0x2EE1
/* 87EB8 800976B8 0B004014 */  bnez       $v0, .L800976E8
/* 87EBC 800976BC 21204002 */   addu      $a0, $s2, $zero
/* 87EC0 800976C0 21282002 */  addu       $a1, $s1, $zero
/* 87EC4 800976C4 8066020C */  jal        PLANPOOL_ChangeNodePosition
/* 87EC8 800976C8 21306002 */   addu      $a2, $s3, $zero
/* 87ECC 800976CC 01000224 */  addiu      $v0, $zero, 0x1
/* 87ED0 800976D0 140022A6 */  sh         $v0, 0x14($s1)
/* 87ED4 800976D4 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 87ED8 800976D8 00000000 */  nop
/* 87EDC 800976DC 3800428C */  lw         $v0, 0x38($v0)
/* 87EE0 800976E0 00000000 */  nop
/* 87EE4 800976E4 180022AE */  sw         $v0, 0x18($s1)
.L800976E8:
/* 87EE8 800976E8 4000BF8F */  lw         $ra, 0x40($sp)
/* 87EEC 800976EC 3C00B38F */  lw         $s3, 0x3C($sp)
/* 87EF0 800976F0 3800B28F */  lw         $s2, 0x38($sp)
/* 87EF4 800976F4 3400B18F */  lw         $s1, 0x34($sp)
/* 87EF8 800976F8 3000B08F */  lw         $s0, 0x30($sp)
/* 87EFC 800976FC 0800E003 */  jr         $ra
/* 87F00 80097700 4800BD27 */   addiu     $sp, $sp, 0x48
.size PLAN_UpdatePlayerNode, . - PLAN_UpdatePlayerNode
