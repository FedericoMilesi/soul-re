.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_UpdateInstanceWaterSplit
/* 3B684 8004AE84 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3B688 8004AE88 1800B0AF */  sw         $s0, 0x18($sp)
/* 3B68C 8004AE8C 21808000 */  addu       $s0, $a0, $zero
/* 3B690 8004AE90 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3B694 8004AE94 2801048E */  lw         $a0, 0x128($s0)
/* 3B698 8004AE98 00000000 */  nop
/* 3B69C 8004AE9C 19008010 */  beqz       $a0, .L8004AF04
/* 3B6A0 8004AEA0 00000000 */   nop
/* 3B6A4 8004AEA4 3001038E */  lw         $v1, 0x130($s0)
/* 3B6A8 8004AEA8 00000000 */  nop
/* 3B6AC 8004AEAC 15006010 */  beqz       $v1, .L8004AF04
/* 3B6B0 8004AEB0 00000000 */   nop
/* 3B6B4 8004AEB4 3A010296 */  lhu        $v0, 0x13A($s0)
/* 3B6B8 8004AEB8 00000000 */  nop
/* 3B6BC 8004AEBC 08004230 */  andi       $v0, $v0, 0x8
/* 3B6C0 8004AEC0 0B004014 */  bnez       $v0, .L8004AEF0
/* 3B6C4 8004AEC4 00000000 */   nop
/* 3B6C8 8004AEC8 08008484 */  lh         $a0, 0x8($a0)
/* 3B6CC 8004AECC 2400658C */  lw         $a1, 0x24($v1)
/* 3B6D0 8004AED0 C27A000C */  jal        COLLIDE_GetNormal
/* 3B6D4 8004AED4 1000A627 */   addiu     $a2, $sp, 0x10
/* 3B6D8 8004AED8 1000A427 */  addiu      $a0, $sp, 0x10
/* 3B6DC 8004AEDC 40010526 */  addiu      $a1, $s0, 0x140
/* 3B6E0 8004AEE0 34010626 */  addiu      $a2, $s0, 0x134
/* 3B6E4 8004AEE4 02000224 */  addiu      $v0, $zero, 0x2
/* 3B6E8 8004AEE8 CD2B010C */  jal        FX_GetPlaneEquation
/* 3B6EC 8004AEEC 3A0102A6 */   sh        $v0, 0x13A($s0)
.L8004AEF0:
/* 3B6F0 8004AEF0 44010586 */  lh         $a1, 0x144($s0)
/* 3B6F4 8004AEF4 DB1C010C */  jal        FX_MakeWaterTrail
/* 3B6F8 8004AEF8 21200002 */   addu      $a0, $s0, $zero
/* 3B6FC 8004AEFC C52B0108 */  j          .L8004AF14
/* 3B700 8004AF00 00000000 */   nop
.L8004AF04:
/* 3B704 8004AF04 3A010296 */  lhu        $v0, 0x13A($s0)
/* 3B708 8004AF08 00000000 */  nop
/* 3B70C 8004AF0C FDFF4230 */  andi       $v0, $v0, 0xFFFD
/* 3B710 8004AF10 3A0102A6 */  sh         $v0, 0x13A($s0)
.L8004AF14:
/* 3B714 8004AF14 2801028E */  lw         $v0, 0x128($s0)
/* 3B718 8004AF18 280100AE */  sw         $zero, 0x128($s0)
/* 3B71C 8004AF1C 300100AE */  sw         $zero, 0x130($s0)
/* 3B720 8004AF20 2C0102AE */  sw         $v0, 0x12C($s0)
/* 3B724 8004AF24 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 3B728 8004AF28 1800B08F */  lw         $s0, 0x18($sp)
/* 3B72C 8004AF2C 0800E003 */  jr         $ra
/* 3B730 8004AF30 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_UpdateInstanceWaterSplit, . - FX_UpdateInstanceWaterSplit
