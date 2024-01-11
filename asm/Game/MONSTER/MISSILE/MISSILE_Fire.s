.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MISSILE_Fire
/* 6E3D0 8007DBD0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6E3D4 8007DBD4 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 6E3D8 8007DBD8 2188A000 */  addu       $s1, $a1, $zero
/* 6E3DC 8007DBDC 3000B2AF */  sw         $s2, 0x30($sp)
/* 6E3E0 8007DBE0 2190C000 */  addu       $s2, $a2, $zero
/* 6E3E4 8007DBE4 3400B3AF */  sw         $s3, 0x34($sp)
/* 6E3E8 8007DBE8 2198E000 */  addu       $s3, $a3, $zero
/* 6E3EC 8007DBEC 3800BFAF */  sw         $ra, 0x38($sp)
/* 6E3F0 8007DBF0 BFF6010C */  jal        MISSILE_Birth
/* 6E3F4 8007DBF4 2800B0AF */   sw        $s0, 0x28($sp)
/* 6E3F8 8007DBF8 21804000 */  addu       $s0, $v0, $zero
/* 6E3FC 8007DBFC 1C000012 */  beqz       $s0, .L8007DC70
/* 6E400 8007DC00 03000224 */   addiu     $v0, $zero, 0x3
/* 6E404 8007DC04 08002392 */  lbu        $v1, 0x8($s1)
/* 6E408 8007DC08 00000000 */  nop
/* 6E40C 8007DC0C 06006214 */  bne        $v1, $v0, .L8007DC28
/* 6E410 8007DC10 01000724 */   addiu     $a3, $zero, 0x1
/* 6E414 8007DC14 02000724 */  addiu      $a3, $zero, 0x2
/* 6E418 8007DC18 11010224 */  addiu      $v0, $zero, 0x111
/* 6E41C 8007DC1C 2000A2A7 */  sh         $v0, 0x20($sp)
/* 6E420 8007DC20 2200A0A7 */  sh         $zero, 0x22($sp)
/* 6E424 8007DC24 2400A0A7 */  sh         $zero, 0x24($sp)
.L8007DC28:
/* 6E428 8007DC28 21204002 */  addu       $a0, $s2, $zero
/* 6E42C 8007DC2C 2000A527 */  addiu      $a1, $sp, 0x20
/* 6E430 8007DC30 00002296 */  lhu        $v0, 0x0($s1)
/* 6E434 8007DC34 FFFF6632 */  andi       $a2, $s3, 0xFFFF
/* 6E438 8007DC38 1400A0AF */  sw         $zero, 0x14($sp)
/* 6E43C 8007DC3C 1800A0AF */  sw         $zero, 0x18($sp)
/* 6E440 8007DC40 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 6E444 8007DC44 BEC5010C */  jal        SetObjectThrowData
/* 6E448 8007DC48 1000A2AF */   sw        $v0, 0x10($sp)
/* 6E44C 8007DC4C 21200002 */  addu       $a0, $s0, $zero
/* 6E450 8007DC50 8000053C */  lui        $a1, (0x800010 >> 16)
/* 6E454 8007DC54 1000A534 */  ori        $a1, $a1, (0x800010 & 0xFFFF)
/* 6E458 8007DC58 A1D1000C */  jal        INSTANCE_Post
/* 6E45C 8007DC5C 21304000 */   addu      $a2, $v0, $zero
/* 6E460 8007DC60 9006020C */  jal        MON_GetTime
/* 6E464 8007DC64 21200002 */   addu      $a0, $s0, $zero
/* 6E468 8007DC68 88134224 */  addiu      $v0, $v0, 0x1388
/* 6E46C 8007DC6C A80102AE */  sw         $v0, 0x1A8($s0)
.L8007DC70:
/* 6E470 8007DC70 21100002 */  addu       $v0, $s0, $zero
/* 6E474 8007DC74 3800BF8F */  lw         $ra, 0x38($sp)
/* 6E478 8007DC78 3400B38F */  lw         $s3, 0x34($sp)
/* 6E47C 8007DC7C 3000B28F */  lw         $s2, 0x30($sp)
/* 6E480 8007DC80 2C00B18F */  lw         $s1, 0x2C($sp)
/* 6E484 8007DC84 2800B08F */  lw         $s0, 0x28($sp)
/* 6E488 8007DC88 0800E003 */  jr         $ra
/* 6E48C 8007DC8C 4000BD27 */   addiu     $sp, $sp, 0x40
.size MISSILE_Fire, . - MISSILE_Fire
