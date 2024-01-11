.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_MonsterGlow
/* 7B990 8008B190 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 7B994 8008B194 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 7B998 8008B198 5800B78F */  lw         $s7, 0x58($sp)
/* 7B99C 8008B19C 4000BEAF */  sw         $fp, 0x40($sp)
/* 7B9A0 8008B1A0 21F08000 */  addu       $fp, $a0, $zero
/* 7B9A4 8008B1A4 3400B5AF */  sw         $s5, 0x34($sp)
/* 7B9A8 8008B1A8 21A8C000 */  addu       $s5, $a2, $zero
/* 7B9AC 8008B1AC 3800B6AF */  sw         $s6, 0x38($sp)
/* 7B9B0 8008B1B0 4400BFAF */  sw         $ra, 0x44($sp)
/* 7B9B4 8008B1B4 3000B4AF */  sw         $s4, 0x30($sp)
/* 7B9B8 8008B1B8 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 7B9BC 8008B1BC 2800B2AF */  sw         $s2, 0x28($sp)
/* 7B9C0 8008B1C0 2400B1AF */  sw         $s1, 0x24($sp)
/* 7B9C4 8008B1C4 2000B0AF */  sw         $s0, 0x20($sp)
/* 7B9C8 8008B1C8 4C00A5AF */  sw         $a1, 0x4C($sp)
/* 7B9CC 8008B1CC 2400D48F */  lw         $s4, 0x24($fp)
/* 7B9D0 8008B1D0 0300A01A */  blez       $s5, .L8008B1E0
/* 7B9D4 8008B1D4 21B0E000 */   addu      $s6, $a3, $zero
/* 7B9D8 8008B1D8 40111500 */  sll        $v0, $s5, 5
/* 7B9DC 8008B1DC 21A8A202 */  addu       $s5, $s5, $v0
.L8008B1E0:
/* 7B9E0 8008B1E0 0200E01A */  blez       $s7, .L8008B1EC
/* 7B9E4 8008B1E4 40111700 */   sll       $v0, $s7, 5
/* 7B9E8 8008B1E8 21B8E202 */  addu       $s7, $s7, $v0
.L8008B1EC:
/* 7B9EC 8008B1EC 0200C01A */  blez       $s6, .L8008B1F8
/* 7B9F0 8008B1F0 40111600 */   sll       $v0, $s6, 5
/* 7B9F4 8008B1F4 21B0C202 */  addu       $s6, $s6, $v0
.L8008B1F8:
/* 7B9F8 8008B1F8 2120C003 */  addu       $a0, $fp, $zero
/* 7B9FC 8008B1FC 4C00B327 */  addiu      $s3, $sp, 0x4C
/* 7BA00 8008B200 21386002 */  addu       $a3, $s3, $zero
/* 7BA04 8008B204 01001124 */  addiu      $s1, $zero, 0x1
/* 7BA08 8008B208 00041024 */  addiu      $s0, $zero, 0x400
/* 7BA0C 8008B20C 1D008592 */  lbu        $a1, 0x1D($s4)
/* 7BA10 8008B210 20008692 */  lbu        $a2, 0x20($s4)
/* 7BA14 8008B214 A0001224 */  addiu      $s2, $zero, 0xA0
/* 7BA18 8008B218 1000B1AF */  sw         $s1, 0x10($sp)
/* 7BA1C 8008B21C 1400B0AF */  sw         $s0, 0x14($sp)
/* 7BA20 8008B220 A52D010C */  jal        FX_DoInstanceTwoSegmentGlow
/* 7BA24 8008B224 1800B2AF */   sw        $s2, 0x18($sp)
/* 7BA28 8008B228 2120C003 */  addu       $a0, $fp, $zero
/* 7BA2C 8008B22C 0E0055A4 */  sh         $s5, 0xE($v0)
/* 7BA30 8008B230 280056A4 */  sh         $s6, 0x28($v0)
/* 7BA34 8008B234 2A0057A4 */  sh         $s7, 0x2A($v0)
/* 7BA38 8008B238 1D008592 */  lbu        $a1, 0x1D($s4)
/* 7BA3C 8008B23C 21008692 */  lbu        $a2, 0x21($s4)
/* 7BA40 8008B240 21386002 */  addu       $a3, $s3, $zero
/* 7BA44 8008B244 1000B1AF */  sw         $s1, 0x10($sp)
/* 7BA48 8008B248 1400B0AF */  sw         $s0, 0x14($sp)
/* 7BA4C 8008B24C A52D010C */  jal        FX_DoInstanceTwoSegmentGlow
/* 7BA50 8008B250 1800B2AF */   sw        $s2, 0x18($sp)
/* 7BA54 8008B254 2120C003 */  addu       $a0, $fp, $zero
/* 7BA58 8008B258 21386002 */  addu       $a3, $s3, $zero
/* 7BA5C 8008B25C 0E0055A4 */  sh         $s5, 0xE($v0)
/* 7BA60 8008B260 280056A4 */  sh         $s6, 0x28($v0)
/* 7BA64 8008B264 2A0057A4 */  sh         $s7, 0x2A($v0)
/* 7BA68 8008B268 1B008592 */  lbu        $a1, 0x1B($s4)
/* 7BA6C 8008B26C 23008692 */  lbu        $a2, 0x23($s4)
/* 7BA70 8008B270 80001224 */  addiu      $s2, $zero, 0x80
/* 7BA74 8008B274 1000B1AF */  sw         $s1, 0x10($sp)
/* 7BA78 8008B278 1400B0AF */  sw         $s0, 0x14($sp)
/* 7BA7C 8008B27C A52D010C */  jal        FX_DoInstanceTwoSegmentGlow
/* 7BA80 8008B280 1800B2AF */   sw        $s2, 0x18($sp)
/* 7BA84 8008B284 2120C003 */  addu       $a0, $fp, $zero
/* 7BA88 8008B288 0E0055A4 */  sh         $s5, 0xE($v0)
/* 7BA8C 8008B28C 280056A4 */  sh         $s6, 0x28($v0)
/* 7BA90 8008B290 2A0057A4 */  sh         $s7, 0x2A($v0)
/* 7BA94 8008B294 1C008592 */  lbu        $a1, 0x1C($s4)
/* 7BA98 8008B298 24008692 */  lbu        $a2, 0x24($s4)
/* 7BA9C 8008B29C 21386002 */  addu       $a3, $s3, $zero
/* 7BAA0 8008B2A0 1000B1AF */  sw         $s1, 0x10($sp)
/* 7BAA4 8008B2A4 1400B0AF */  sw         $s0, 0x14($sp)
/* 7BAA8 8008B2A8 A52D010C */  jal        FX_DoInstanceTwoSegmentGlow
/* 7BAAC 8008B2AC 1800B2AF */   sw        $s2, 0x18($sp)
/* 7BAB0 8008B2B0 2120C003 */  addu       $a0, $fp, $zero
/* 7BAB4 8008B2B4 21386002 */  addu       $a3, $s3, $zero
/* 7BAB8 8008B2B8 0E0055A4 */  sh         $s5, 0xE($v0)
/* 7BABC 8008B2BC 280056A4 */  sh         $s6, 0x28($v0)
/* 7BAC0 8008B2C0 2A0057A4 */  sh         $s7, 0x2A($v0)
/* 7BAC4 8008B2C4 19008592 */  lbu        $a1, 0x19($s4)
/* 7BAC8 8008B2C8 1D008692 */  lbu        $a2, 0x1D($s4)
/* 7BACC 8008B2CC C0000224 */  addiu      $v0, $zero, 0xC0
/* 7BAD0 8008B2D0 1000B1AF */  sw         $s1, 0x10($sp)
/* 7BAD4 8008B2D4 1400B0AF */  sw         $s0, 0x14($sp)
/* 7BAD8 8008B2D8 A52D010C */  jal        FX_DoInstanceTwoSegmentGlow
/* 7BADC 8008B2DC 1800A2AF */   sw        $v0, 0x18($sp)
/* 7BAE0 8008B2E0 0E0055A4 */  sh         $s5, 0xE($v0)
/* 7BAE4 8008B2E4 280056A4 */  sh         $s6, 0x28($v0)
/* 7BAE8 8008B2E8 2A0057A4 */  sh         $s7, 0x2A($v0)
/* 7BAEC 8008B2EC 4400BF8F */  lw         $ra, 0x44($sp)
/* 7BAF0 8008B2F0 4000BE8F */  lw         $fp, 0x40($sp)
/* 7BAF4 8008B2F4 3C00B78F */  lw         $s7, 0x3C($sp)
/* 7BAF8 8008B2F8 3800B68F */  lw         $s6, 0x38($sp)
/* 7BAFC 8008B2FC 3400B58F */  lw         $s5, 0x34($sp)
/* 7BB00 8008B300 3000B48F */  lw         $s4, 0x30($sp)
/* 7BB04 8008B304 2C00B38F */  lw         $s3, 0x2C($sp)
/* 7BB08 8008B308 2800B28F */  lw         $s2, 0x28($sp)
/* 7BB0C 8008B30C 2400B18F */  lw         $s1, 0x24($sp)
/* 7BB10 8008B310 2000B08F */  lw         $s0, 0x20($sp)
/* 7BB14 8008B314 0800E003 */  jr         $ra
/* 7BB18 8008B318 4800BD27 */   addiu     $sp, $sp, 0x48
.size MON_MonsterGlow, . - MON_MonsterGlow
