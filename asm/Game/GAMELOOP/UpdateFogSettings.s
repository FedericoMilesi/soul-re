.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UpdateFogSettings
/* 1F1B8 8002E9B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1F1BC 8002E9BC 1800B2AF */  sw         $s2, 0x18($sp)
/* 1F1C0 8002E9C0 21908000 */  addu       $s2, $a0, $zero
/* 1F1C4 8002E9C4 1000B0AF */  sw         $s0, 0x10($sp)
/* 1F1C8 8002E9C8 2180A000 */  addu       $s0, $a1, $zero
/* 1F1CC 8002E9CC 21300000 */  addu       $a2, $zero, $zero
/* 1F1D0 8002E9D0 1400B1AF */  sw         $s1, 0x14($sp)
/* 1F1D4 8002E9D4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1F1D8 8002E9D8 3A004486 */  lh         $a0, 0x3A($s2)
/* 1F1DC 8002E9DC 46000396 */  lhu        $v1, 0x46($s0)
/* 1F1E0 8002E9E0 38004586 */  lh         $a1, 0x38($s2)
/* 1F1E4 8002E9E4 2A108300 */  slt        $v0, $a0, $v1
/* 1F1E8 8002E9E8 07004010 */  beqz       $v0, .L8002EA08
/* 1F1EC 8002E9EC 2188C000 */   addu      $s1, $a2, $zero
/* 1F1F0 8002E9F0 0CFE6224 */  addiu      $v0, $v1, -0x1F4
/* 1F1F4 8002E9F4 460002A6 */  sh         $v0, 0x46($s0)
/* 1F1F8 8002E9F8 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 1F1FC 8002E9FC 01000624 */  addiu      $a2, $zero, 0x1
/* 1F200 8002EA00 89BA0008 */  j          .L8002EA24
/* 1F204 8002EA04 2A108200 */   slt       $v0, $a0, $v0
.L8002EA08:
/* 1F208 8002EA08 2A106400 */  slt        $v0, $v1, $a0
/* 1F20C 8002EA0C 0A004010 */  beqz       $v0, .L8002EA38
/* 1F210 8002EA10 F4016224 */   addiu     $v0, $v1, 0x1F4
/* 1F214 8002EA14 460002A6 */  sh         $v0, 0x46($s0)
/* 1F218 8002EA18 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 1F21C 8002EA1C 01000624 */  addiu      $a2, $zero, 0x1
/* 1F220 8002EA20 2A104400 */  slt        $v0, $v0, $a0
.L8002EA24:
/* 1F224 8002EA24 05004014 */  bnez       $v0, .L8002EA3C
/* 1F228 8002EA28 00000000 */   nop
/* 1F22C 8002EA2C 2188C000 */  addu       $s1, $a2, $zero
/* 1F230 8002EA30 8FBA0008 */  j          .L8002EA3C
/* 1F234 8002EA34 460004A6 */   sh        $a0, 0x46($s0)
.L8002EA38:
/* 1F238 8002EA38 01001124 */  addiu      $s1, $zero, 0x1
.L8002EA3C:
/* 1F23C 8002EA3C 44000396 */  lhu        $v1, 0x44($s0)
/* 1F240 8002EA40 00000000 */  nop
/* 1F244 8002EA44 2A10A300 */  slt        $v0, $a1, $v1
/* 1F248 8002EA48 08004010 */  beqz       $v0, .L8002EA6C
/* 1F24C 8002EA4C 0CFE6224 */   addiu     $v0, $v1, -0x1F4
/* 1F250 8002EA50 440002A6 */  sh         $v0, 0x44($s0)
/* 1F254 8002EA54 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 1F258 8002EA58 2A10A200 */  slt        $v0, $a1, $v0
/* 1F25C 8002EA5C 0B004010 */  beqz       $v0, .L8002EA8C
/* 1F260 8002EA60 01000624 */   addiu     $a2, $zero, 0x1
/* 1F264 8002EA64 A6BA0008 */  j          .L8002EA98
/* 1F268 8002EA68 21880000 */   addu      $s1, $zero, $zero
.L8002EA6C:
/* 1F26C 8002EA6C 2A106500 */  slt        $v0, $v1, $a1
/* 1F270 8002EA70 09004010 */  beqz       $v0, .L8002EA98
/* 1F274 8002EA74 F4016224 */   addiu     $v0, $v1, 0x1F4
/* 1F278 8002EA78 440002A6 */  sh         $v0, 0x44($s0)
/* 1F27C 8002EA7C FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 1F280 8002EA80 2A104500 */  slt        $v0, $v0, $a1
/* 1F284 8002EA84 03004014 */  bnez       $v0, .L8002EA94
/* 1F288 8002EA88 01000624 */   addiu     $a2, $zero, 0x1
.L8002EA8C:
/* 1F28C 8002EA8C A6BA0008 */  j          .L8002EA98
/* 1F290 8002EA90 440005A6 */   sh        $a1, 0x44($s0)
.L8002EA94:
/* 1F294 8002EA94 21880000 */  addu       $s1, $zero, $zero
.L8002EA98:
/* 1F298 8002EA98 0B00C010 */  beqz       $a2, .L8002EAC8
/* 1F29C 8002EA9C 00000000 */   nop
/* 1F2A0 8002EAA0 6DDC000C */  jal        LIGHT_CalcDQPTable
/* 1F2A4 8002EAA4 21200002 */   addu      $a0, $s0, $zero
/* 1F2A8 8002EAA8 07002012 */  beqz       $s1, .L8002EAC8
/* 1F2AC 8002EAAC 00000000 */   nop
/* 1F2B0 8002EAB0 46000296 */  lhu        $v0, 0x46($s0)
/* 1F2B4 8002EAB4 00000000 */  nop
/* 1F2B8 8002EAB8 3A0042A6 */  sh         $v0, 0x3A($s2)
/* 1F2BC 8002EABC 44000296 */  lhu        $v0, 0x44($s0)
/* 1F2C0 8002EAC0 00000000 */  nop
/* 1F2C4 8002EAC4 380042A6 */  sh         $v0, 0x38($s2)
.L8002EAC8:
/* 1F2C8 8002EAC8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1F2CC 8002EACC 1800B28F */  lw         $s2, 0x18($sp)
/* 1F2D0 8002EAD0 1400B18F */  lw         $s1, 0x14($sp)
/* 1F2D4 8002EAD4 1000B08F */  lw         $s0, 0x10($sp)
/* 1F2D8 8002EAD8 0800E003 */  jr         $ra
/* 1F2DC 8002EADC 2000BD27 */   addiu     $sp, $sp, 0x20
.size UpdateFogSettings, . - UpdateFogSettings
