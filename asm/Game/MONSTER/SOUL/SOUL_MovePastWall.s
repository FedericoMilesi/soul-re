.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_MovePastWall
/* 7E330 8008DB30 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 7E334 8008DB34 6000B2AF */  sw         $s2, 0x60($sp)
/* 7E338 8008DB38 21908000 */  addu       $s2, $a0, $zero
/* 7E33C 8008DB3C 6400BFAF */  sw         $ra, 0x64($sp)
/* 7E340 8008DB40 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 7E344 8008DB44 5800B0AF */  sw         $s0, 0x58($sp)
/* 7E348 8008DB48 4000A38C */  lw         $v1, 0x40($a1)
/* 7E34C 8008DB4C 4000468E */  lw         $a2, 0x40($s2)
/* 7E350 8008DB50 14006294 */  lhu        $v0, 0x14($v1)
/* 7E354 8008DB54 00000000 */  nop
/* 7E358 8008DB58 4800A2A7 */  sh         $v0, 0x48($sp)
/* 7E35C 8008DB5C 18006294 */  lhu        $v0, 0x18($v1)
/* 7E360 8008DB60 00000000 */  nop
/* 7E364 8008DB64 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 7E368 8008DB68 1C006294 */  lhu        $v0, 0x1C($v1)
/* 7E36C 8008DB6C 00000000 */  nop
/* 7E370 8008DB70 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 7E374 8008DB74 1400C294 */  lhu        $v0, 0x14($a2)
/* 7E378 8008DB78 1000A527 */  addiu      $a1, $sp, 0x10
/* 7E37C 8008DB7C 4000A2A7 */  sh         $v0, 0x40($sp)
/* 7E380 8008DB80 1800C294 */  lhu        $v0, 0x18($a2)
/* 7E384 8008DB84 4000B027 */  addiu      $s0, $sp, 0x40
/* 7E388 8008DB88 4200A2A7 */  sh         $v0, 0x42($sp)
/* 7E38C 8008DB8C 1C00C394 */  lhu        $v1, 0x1C($a2)
/* 7E390 8008DB90 4800A227 */  addiu      $v0, $sp, 0x48
/* 7E394 8008DB94 2400B0AF */  sw         $s0, 0x24($sp)
/* 7E398 8008DB98 2800A2AF */  sw         $v0, 0x28($sp)
/* 7E39C 8008DB9C 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 7E3A0 8008DBA0 4400A3A7 */   sh        $v1, 0x44($sp)
/* 7E3A4 8008DBA4 21204002 */  addu       $a0, $s2, $zero
/* 7E3A8 8008DBA8 5000B127 */  addiu      $s1, $sp, 0x50
/* 7E3AC 8008DBAC 21282002 */  addu       $a1, $s1, $zero
/* 7E3B0 8008DBB0 5C004826 */  addiu      $t0, $s2, 0x5C
/* 7E3B4 8008DBB4 4000A297 */  lhu        $v0, 0x40($sp)
/* 7E3B8 8008DBB8 02000396 */  lhu        $v1, 0x2($s0)
/* 7E3BC 8008DBBC 04000696 */  lhu        $a2, 0x4($s0)
/* 7E3C0 8008DBC0 5C004796 */  lhu        $a3, 0x5C($s2)
/* 7E3C4 8008DBC4 02000995 */  lhu        $t1, 0x2($t0)
/* 7E3C8 8008DBC8 04000895 */  lhu        $t0, 0x4($t0)
/* 7E3CC 8008DBCC 23104700 */  subu       $v0, $v0, $a3
/* 7E3D0 8008DBD0 23186900 */  subu       $v1, $v1, $t1
/* 7E3D4 8008DBD4 2330C800 */  subu       $a2, $a2, $t0
/* 7E3D8 8008DBD8 5000A2A7 */  sh         $v0, 0x50($sp)
/* 7E3DC 8008DBDC 020023A6 */  sh         $v1, 0x2($s1)
/* 7E3E0 8008DBE0 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 7E3E4 8008DBE4 040026A6 */   sh        $a2, 0x4($s1)
/* 7E3E8 8008DBE8 21204002 */  addu       $a0, $s2, $zero
/* 7E3EC 8008DBEC 927B000C */  jal        COLLIDE_MoveAllTransforms
/* 7E3F0 8008DBF0 21282002 */   addu      $a1, $s1, $zero
/* 7E3F4 8008DBF4 4300AA8B */  lwl        $t2, 0x43($sp)
/* 7E3F8 8008DBF8 4000AA9B */  lwr        $t2, 0x40($sp)
/* 7E3FC 8008DBFC 4400AB87 */  lh         $t3, 0x44($sp)
/* 7E400 8008DC00 5F004AAA */  swl        $t2, 0x5F($s2)
/* 7E404 8008DC04 5C004ABA */  swr        $t2, 0x5C($s2)
/* 7E408 8008DC08 60004BA6 */  sh         $t3, 0x60($s2)
/* 7E40C 8008DC0C 6400BF8F */  lw         $ra, 0x64($sp)
/* 7E410 8008DC10 6000B28F */  lw         $s2, 0x60($sp)
/* 7E414 8008DC14 5C00B18F */  lw         $s1, 0x5C($sp)
/* 7E418 8008DC18 5800B08F */  lw         $s0, 0x58($sp)
/* 7E41C 8008DC1C 0800E003 */  jr         $ra
/* 7E420 8008DC20 6800BD27 */   addiu     $sp, $sp, 0x68
.size SOUL_MovePastWall, . - SOUL_MovePastWall
