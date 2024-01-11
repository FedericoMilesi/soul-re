.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_TorchFlame
/* 398A8 800490A8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 398AC 800490AC 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 398B0 800490B0 2400B3AF */  sw         $s3, 0x24($sp)
/* 398B4 800490B4 90A2538C */  lw         $s3, %lo(objectAccess + 0x54)($v0)
/* 398B8 800490B8 2000B2AF */  sw         $s2, 0x20($sp)
/* 398BC 800490BC 21908000 */  addu       $s2, $a0, $zero
/* 398C0 800490C0 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 398C4 800490C4 2800B4AF */  sw         $s4, 0x28($sp)
/* 398C8 800490C8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 398CC 800490CC 1800B0AF */  sw         $s0, 0x18($sp)
/* 398D0 800490D0 44006012 */  beqz       $s3, .L800491E4
/* 398D4 800490D4 21100000 */   addu      $v0, $zero, $zero
/* 398D8 800490D8 FBFF0224 */  addiu      $v0, $zero, -0x5
/* 398DC 800490DC 1000A2AF */  sw         $v0, 0x10($sp)
/* 398E0 800490E0 21204002 */  addu       $a0, $s2, $zero
/* 398E4 800490E4 00140500 */  sll        $v0, $a1, 16
/* 398E8 800490E8 038C0200 */  sra        $s1, $v0, 16
/* 398EC 800490EC 21282002 */  addu       $a1, $s1, $zero
/* 398F0 800490F0 21300000 */  addu       $a2, $zero, $zero
/* 398F4 800490F4 F123010C */  jal        FX_GetTorchParticle
/* 398F8 800490F8 10000724 */   addiu     $a3, $zero, 0x10
/* 398FC 800490FC 21804000 */  addu       $s0, $v0, $zero
/* 39900 80049100 06000012 */  beqz       $s0, .L8004911C
/* 39904 80049104 30000224 */   addiu     $v0, $zero, 0x30
/* 39908 80049108 240002A6 */  sh         $v0, 0x24($s0)
/* 3990C 8004910C 20000224 */  addiu      $v0, $zero, 0x20
/* 39910 80049110 260002A6 */  sh         $v0, 0x26($s0)
/* 39914 80049114 38000224 */  addiu      $v0, $zero, 0x38
/* 39918 80049118 280002A6 */  sh         $v0, 0x28($s0)
.L8004911C:
/* 3991C 8004911C FFFF1424 */  addiu      $s4, $zero, -0x1
/* 39920 80049120 1000B4AF */  sw         $s4, 0x10($sp)
/* 39924 80049124 21204002 */  addu       $a0, $s2, $zero
/* 39928 80049128 21282002 */  addu       $a1, $s1, $zero
/* 3992C 8004912C 01000624 */  addiu      $a2, $zero, 0x1
/* 39930 80049130 F123010C */  jal        FX_GetTorchParticle
/* 39934 80049134 08000724 */   addiu     $a3, $zero, 0x8
/* 39938 80049138 21804000 */  addu       $s0, $v0, $zero
/* 3993C 8004913C 05000012 */  beqz       $s0, .L80049154
/* 39940 80049140 18000224 */   addiu     $v0, $zero, 0x18
/* 39944 80049144 240002A6 */  sh         $v0, 0x24($s0)
/* 39948 80049148 10000224 */  addiu      $v0, $zero, 0x10
/* 3994C 8004914C 260002A6 */  sh         $v0, 0x26($s0)
/* 39950 80049150 280002A6 */  sh         $v0, 0x28($s0)
.L80049154:
/* 39954 80049154 21204002 */  addu       $a0, $s2, $zero
/* 39958 80049158 DC09010C */  jal        FX_GetParticle
/* 3995C 8004915C 21282002 */   addu      $a1, $s1, $zero
/* 39960 80049160 21804000 */  addu       $s0, $v0, $zero
/* 39964 80049164 1E000012 */  beqz       $s0, .L800491E0
/* 39968 80049168 21206002 */   addu      $a0, $s3, $zero
/* 3996C 8004916C 21280000 */  addu       $a1, $zero, $zero
/* 39970 80049170 01000624 */  addiu      $a2, $zero, 0x1
/* 39974 80049174 0A000224 */  addiu      $v0, $zero, 0xA
/* 39978 80049178 9D19010C */  jal        FX_GetTextureObject
/* 3997C 8004917C 1C0002A6 */   sh        $v0, 0x1C($s0)
/* 39980 80049180 0002033C */  lui        $v1, (0x20093E4 >> 16)
/* 39984 80049184 E4936334 */  ori        $v1, $v1, (0x20093E4 & 0xFFFF)
/* 39988 80049188 100002AE */  sw         $v0, 0x10($s0)
/* 3998C 8004918C 14000224 */  addiu      $v0, $zero, 0x14
/* 39990 80049190 200002A6 */  sh         $v0, 0x20($s0)
/* 39994 80049194 80000224 */  addiu      $v0, $zero, 0x80
/* 39998 80049198 240002A6 */  sh         $v0, 0x24($s0)
/* 3999C 8004919C 260002A6 */  sh         $v0, 0x26($s0)
/* 399A0 800491A0 280002A6 */  sh         $v0, 0x28($s0)
/* 399A4 800491A4 01000224 */  addiu      $v0, $zero, 0x1
/* 399A8 800491A8 300002A6 */  sh         $v0, 0x30($s0)
/* 399AC 800491AC 460002A2 */  sb         $v0, 0x46($s0)
/* 399B0 800491B0 2A000296 */  lhu        $v0, 0x2A($s0)
/* 399B4 800491B4 21200002 */  addu       $a0, $s0, $zero
/* 399B8 800491B8 3C0003AE */  sw         $v1, 0x3C($s0)
/* 399BC 800491BC 0F000324 */  addiu      $v1, $zero, 0xF
/* 399C0 800491C0 2C0000A6 */  sh         $zero, 0x2C($s0)
/* 399C4 800491C4 2E0000A6 */  sh         $zero, 0x2E($s0)
/* 399C8 800491C8 400000AE */  sw         $zero, 0x40($s0)
/* 399CC 800491CC 0E0014A6 */  sh         $s4, 0xE($s0)
/* 399D0 800491D0 1E0003A6 */  sh         $v1, 0x1E($s0)
/* 399D4 800491D4 01004234 */  ori        $v0, $v0, 0x1
/* 399D8 800491D8 1B2D010C */  jal        FX_InsertGeneralEffect
/* 399DC 800491DC 2A0002A6 */   sh        $v0, 0x2A($s0)
.L800491E0:
/* 399E0 800491E0 21100002 */  addu       $v0, $s0, $zero
.L800491E4:
/* 399E4 800491E4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 399E8 800491E8 2800B48F */  lw         $s4, 0x28($sp)
/* 399EC 800491EC 2400B38F */  lw         $s3, 0x24($sp)
/* 399F0 800491F0 2000B28F */  lw         $s2, 0x20($sp)
/* 399F4 800491F4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 399F8 800491F8 1800B08F */  lw         $s0, 0x18($sp)
/* 399FC 800491FC 0800E003 */  jr         $ra
/* 39A00 80049200 3000BD27 */   addiu     $sp, $sp, 0x30
.size FX_TorchFlame, . - FX_TorchFlame
