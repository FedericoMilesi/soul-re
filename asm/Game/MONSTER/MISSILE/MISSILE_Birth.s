.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MISSILE_Birth
/* 6E2FC 8007DAFC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6E300 8007DB00 1400B1AF */  sw         $s1, 0x14($sp)
/* 6E304 8007DB04 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E308 8007DB08 2180A000 */  addu       $s0, $a1, $zero
/* 6E30C 8007DB0C 1800BFAF */  sw         $ra, 0x18($sp)
/* 6E310 8007DB10 08000392 */  lbu        $v1, 0x8($s0)
/* 6E314 8007DB14 03000224 */  addiu      $v0, $zero, 0x3
/* 6E318 8007DB18 0C006214 */  bne        $v1, $v0, .L8007DB4C
/* 6E31C 8007DB1C 21888000 */   addu      $s1, $a0, $zero
/* 6E320 8007DB20 A0F6010C */  jal        MISSILE_Find
/* 6E324 8007DB24 00000000 */   nop
/* 6E328 8007DB28 21284000 */  addu       $a1, $v0, $zero
/* 6E32C 8007DB2C 0700A010 */  beqz       $a1, .L8007DB4C
/* 6E330 8007DB30 0880023C */   lui       $v0, %hi(MISSILE_Process)
/* 6E334 8007DB34 ECD94224 */  addiu      $v0, $v0, %lo(MISSILE_Process)
/* 6E338 8007DB38 0801A2AC */  sw         $v0, 0x108($a1)
/* 6E33C 8007DB3C 0880023C */  lui        $v0, %hi(MISSILE_Collide)
/* 6E340 8007DB40 44DA4224 */  addiu      $v0, $v0, %lo(MISSILE_Collide)
/* 6E344 8007DB44 EEF60108 */  j          .L8007DBB8
/* 6E348 8007DB48 0C01A2AC */   sw        $v0, 0x10C($a1)
.L8007DB4C:
/* 6E34C 8007DB4C 06000592 */  lbu        $a1, 0x6($s0)
/* 6E350 8007DB50 09000692 */  lbu        $a2, 0x9($s0)
/* 6E354 8007DB54 77AA010C */  jal        PHYSOB_BirthProjectile
/* 6E358 8007DB58 21202002 */   addu      $a0, $s1, $zero
/* 6E35C 8007DB5C 0C00458C */  lw         $a1, 0xC($v0)
/* 6E360 8007DB60 00000000 */  nop
/* 6E364 8007DB64 1400A010 */  beqz       $a1, .L8007DBB8
/* 6E368 8007DB68 0880023C */   lui       $v0, %hi(MISSILE_Process)
/* 6E36C 8007DB6C ECD94224 */  addiu      $v0, $v0, %lo(MISSILE_Process)
/* 6E370 8007DB70 0801A2AC */  sw         $v0, 0x108($a1)
/* 6E374 8007DB74 4000248E */  lw         $a0, 0x40($s1)
/* 6E378 8007DB78 00000000 */  nop
/* 6E37C 8007DB7C 0F008010 */  beqz       $a0, .L8007DBBC
/* 6E380 8007DB80 2110A000 */   addu      $v0, $a1, $zero
/* 6E384 8007DB84 06000292 */  lbu        $v0, 0x6($s0)
/* 6E388 8007DB88 00000000 */  nop
/* 6E38C 8007DB8C 40110200 */  sll        $v0, $v0, 5
/* 6E390 8007DB90 21108200 */  addu       $v0, $a0, $v0
/* 6E394 8007DB94 14004394 */  lhu        $v1, 0x14($v0)
/* 6E398 8007DB98 00000000 */  nop
/* 6E39C 8007DB9C 5C00A3A4 */  sh         $v1, 0x5C($a1)
/* 6E3A0 8007DBA0 18004394 */  lhu        $v1, 0x18($v0)
/* 6E3A4 8007DBA4 00000000 */  nop
/* 6E3A8 8007DBA8 5E00A3A4 */  sh         $v1, 0x5E($a1)
/* 6E3AC 8007DBAC 1C004294 */  lhu        $v0, 0x1C($v0)
/* 6E3B0 8007DBB0 00000000 */  nop
/* 6E3B4 8007DBB4 6000A2A4 */  sh         $v0, 0x60($a1)
.L8007DBB8:
/* 6E3B8 8007DBB8 2110A000 */  addu       $v0, $a1, $zero
.L8007DBBC:
/* 6E3BC 8007DBBC 1800BF8F */  lw         $ra, 0x18($sp)
/* 6E3C0 8007DBC0 1400B18F */  lw         $s1, 0x14($sp)
/* 6E3C4 8007DBC4 1000B08F */  lw         $s0, 0x10($sp)
/* 6E3C8 8007DBC8 0800E003 */  jr         $ra
/* 6E3CC 8007DBCC 2000BD27 */   addiu     $sp, $sp, 0x20
.size MISSILE_Birth, . - MISSILE_Birth
