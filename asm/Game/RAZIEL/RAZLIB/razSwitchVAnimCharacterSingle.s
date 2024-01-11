.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSwitchVAnimCharacterSingle
/* 979D4 800A71D4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 979D8 800A71D8 3400B3AF */  sw         $s3, 0x34($sp)
/* 979DC 800A71DC 21988000 */  addu       $s3, $a0, $zero
/* 979E0 800A71E0 3800B4AF */  sw         $s4, 0x38($sp)
/* 979E4 800A71E4 21A0A000 */  addu       $s4, $a1, $zero
/* 979E8 800A71E8 0D80023C */  lui        $v0, %hi(ZoneDelta + 0x80)
/* 979EC 800A71EC 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 979F0 800A71F0 3000B2AF */  sw         $s2, 0x30($sp)
/* 979F4 800A71F4 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 979F8 800A71F8 2800B0AF */  sw         $s0, 0x28($sp)
/* 979FC 800A71FC 981D4A24 */  addiu      $t2, $v0, %lo(ZoneDelta + 0x80)
/* 97A00 800A7200 0000438D */  lw         $v1, 0x0($t2)
/* 97A04 800A7204 0400488D */  lw         $t0, 0x4($t2)
/* 97A08 800A7208 0800498D */  lw         $t1, 0x8($t2)
/* 97A0C 800A720C 1800A3AF */  sw         $v1, 0x18($sp)
/* 97A10 800A7210 1C00A8AF */  sw         $t0, 0x1C($sp)
/* 97A14 800A7214 2000A9AF */  sw         $t1, 0x20($sp)
/* 97A18 800A7218 0200C014 */  bnez       $a2, .L800A7224
/* 97A1C 800A721C 1800A227 */   addiu     $v0, $sp, 0x18
/* 97A20 800A7220 21304000 */  addu       $a2, $v0, $zero
.L800A7224:
/* 97A24 800A7224 0200E014 */  bnez       $a3, .L800A7230
/* 97A28 800A7228 21800000 */   addu      $s0, $zero, $zero
/* 97A2C 800A722C 21384000 */  addu       $a3, $v0, $zero
.L800A7230:
/* 97A30 800A7230 2190C000 */  addu       $s2, $a2, $zero
/* 97A34 800A7234 2188E000 */  addu       $s1, $a3, $zero
.L800A7238:
/* 97A38 800A7238 0000228E */  lw         $v0, 0x0($s1)
/* 97A3C 800A723C 04003126 */  addiu      $s1, $s1, 0x4
/* 97A40 800A7240 21280002 */  addu       $a1, $s0, $zero
/* 97A44 800A7244 01001026 */  addiu      $s0, $s0, 0x1
/* 97A48 800A7248 21206002 */  addu       $a0, $s3, $zero
/* 97A4C 800A724C 21308002 */  addu       $a2, $s4, $zero
/* 97A50 800A7250 1000A2AF */  sw         $v0, 0x10($sp)
/* 97A54 800A7254 0000478E */  lw         $a3, 0x0($s2)
/* 97A58 800A7258 A39C020C */  jal        razSwitchVAnimSingle
/* 97A5C 800A725C 04005226 */   addiu     $s2, $s2, 0x4
/* 97A60 800A7260 0300022A */  slti       $v0, $s0, 0x3
/* 97A64 800A7264 F4FF4014 */  bnez       $v0, .L800A7238
/* 97A68 800A7268 00000000 */   nop
/* 97A6C 800A726C 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 97A70 800A7270 3800B48F */  lw         $s4, 0x38($sp)
/* 97A74 800A7274 3400B38F */  lw         $s3, 0x34($sp)
/* 97A78 800A7278 3000B28F */  lw         $s2, 0x30($sp)
/* 97A7C 800A727C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 97A80 800A7280 2800B08F */  lw         $s0, 0x28($sp)
/* 97A84 800A7284 0800E003 */  jr         $ra
/* 97A88 800A7288 4000BD27 */   addiu     $sp, $sp, 0x40
.size razSwitchVAnimCharacterSingle, . - razSwitchVAnimCharacterSingle
