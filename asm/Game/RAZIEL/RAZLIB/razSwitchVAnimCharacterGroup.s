.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSwitchVAnimCharacterGroup
/* 978BC 800A70BC C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 978C0 800A70C0 3400B3AF */  sw         $s3, 0x34($sp)
/* 978C4 800A70C4 21988000 */  addu       $s3, $a0, $zero
/* 978C8 800A70C8 3800B4AF */  sw         $s4, 0x38($sp)
/* 978CC 800A70CC 21A0A000 */  addu       $s4, $a1, $zero
/* 978D0 800A70D0 0D80023C */  lui        $v0, %hi(D_800D1D98)
/* 978D4 800A70D4 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 978D8 800A70D8 3000B2AF */  sw         $s2, 0x30($sp)
/* 978DC 800A70DC 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 978E0 800A70E0 2800B0AF */  sw         $s0, 0x28($sp)
/* 978E4 800A70E4 981D4B24 */  addiu      $t3, $v0, %lo(D_800D1D98)
/* 978E8 800A70E8 0000688D */  lw         $t0, 0x0($t3)
/* 978EC 800A70EC 0400698D */  lw         $t1, 0x4($t3)
/* 978F0 800A70F0 08006A8D */  lw         $t2, 0x8($t3)
/* 978F4 800A70F4 1800A8AF */  sw         $t0, 0x18($sp)
/* 978F8 800A70F8 1C00A9AF */  sw         $t1, 0x1C($sp)
/* 978FC 800A70FC 2000AAAF */  sw         $t2, 0x20($sp)
/* 97900 800A7100 0200C014 */  bnez       $a2, .L800A710C
/* 97904 800A7104 1800A227 */   addiu     $v0, $sp, 0x18
/* 97908 800A7108 21304000 */  addu       $a2, $v0, $zero
.L800A710C:
/* 9790C 800A710C 0200E014 */  bnez       $a3, .L800A7118
/* 97910 800A7110 21800000 */   addu      $s0, $zero, $zero
/* 97914 800A7114 21384000 */  addu       $a3, $v0, $zero
.L800A7118:
/* 97918 800A7118 2190C000 */  addu       $s2, $a2, $zero
/* 9791C 800A711C 2188E000 */  addu       $s1, $a3, $zero
.L800A7120:
/* 97920 800A7120 0000228E */  lw         $v0, 0x0($s1)
/* 97924 800A7124 04003126 */  addiu      $s1, $s1, 0x4
/* 97928 800A7128 21280002 */  addu       $a1, $s0, $zero
/* 9792C 800A712C 01001026 */  addiu      $s0, $s0, 0x1
/* 97930 800A7130 21206002 */  addu       $a0, $s3, $zero
/* 97934 800A7134 21308002 */  addu       $a2, $s4, $zero
/* 97938 800A7138 1000A2AF */  sw         $v0, 0x10($sp)
/* 9793C 800A713C 0000478E */  lw         $a3, 0x0($s2)
/* 97940 800A7140 5E9C020C */  jal        razSwitchVAnimGroup
/* 97944 800A7144 04005226 */   addiu     $s2, $s2, 0x4
/* 97948 800A7148 21184000 */  addu       $v1, $v0, $zero
/* 9794C 800A714C 0300022A */  slti       $v0, $s0, 0x3
/* 97950 800A7150 F3FF4014 */  bnez       $v0, .L800A7120
/* 97954 800A7154 21106000 */   addu      $v0, $v1, $zero
/* 97958 800A7158 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 9795C 800A715C 3800B48F */  lw         $s4, 0x38($sp)
/* 97960 800A7160 3400B38F */  lw         $s3, 0x34($sp)
/* 97964 800A7164 3000B28F */  lw         $s2, 0x30($sp)
/* 97968 800A7168 2C00B18F */  lw         $s1, 0x2C($sp)
/* 9796C 800A716C 2800B08F */  lw         $s0, 0x28($sp)
/* 97970 800A7170 0800E003 */  jr         $ra
/* 97974 800A7174 4000BD27 */   addiu     $sp, $sp, 0x40
.size razSwitchVAnimCharacterGroup, . - razSwitchVAnimCharacterGroup
