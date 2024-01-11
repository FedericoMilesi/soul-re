.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SoulReaverAnimate
/* 6B19C 8007A99C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6B1A0 8007A9A0 1800B2AF */  sw         $s2, 0x18($sp)
/* 6B1A4 8007A9A4 21908000 */  addu       $s2, $a0, $zero
/* 6B1A8 8007A9A8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6B1AC 8007A9AC 1400B1AF */  sw         $s1, 0x14($sp)
/* 6B1B0 8007A9B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 6B1B4 8007A9B4 6C01508E */  lw         $s0, 0x16C($s2)
/* 6B1B8 8007A9B8 2400518E */  lw         $s1, 0x24($s2)
/* 6B1BC 8007A9BC 0C2A010C */  jal        FX_SetReaverInstance
/* 6B1C0 8007A9C0 00000000 */   nop
/* 6B1C4 8007A9C4 3AF2020C */  jal        rand
/* 6B1C8 8007A9C8 00000000 */   nop
/* 6B1CC 8007A9CC 06000396 */  lhu        $v1, 0x6($s0)
/* 6B1D0 8007A9D0 1F004230 */  andi       $v0, $v0, 0x1F
/* 6B1D4 8007A9D4 00016324 */  addiu      $v1, $v1, 0x100
/* 6B1D8 8007A9D8 21186200 */  addu       $v1, $v1, $v0
/* 6B1DC 8007A9DC FF0F6330 */  andi       $v1, $v1, 0xFFF
/* 6B1E0 8007A9E0 060003A6 */  sh         $v1, 0x6($s0)
/* 6B1E4 8007A9E4 01000392 */  lbu        $v1, 0x1($s0)
/* 6B1E8 8007A9E8 01000224 */  addiu      $v0, $zero, 0x1
/* 6B1EC 8007A9EC 08006214 */  bne        $v1, $v0, .L8007AA10
/* 6B1F0 8007A9F0 00000000 */   nop
/* 6B1F4 8007A9F4 02000286 */  lh         $v0, 0x2($s0)
/* 6B1F8 8007A9F8 02000396 */  lhu        $v1, 0x2($s0)
/* 6B1FC 8007A9FC 00104228 */  slti       $v0, $v0, 0x1000
/* 6B200 8007AA00 08004010 */  beqz       $v0, .L8007AA24
/* 6B204 8007AA04 00016224 */   addiu     $v0, $v1, 0x100
/* 6B208 8007AA08 89EA0108 */  j          .L8007AA24
/* 6B20C 8007AA0C 020002A6 */   sh        $v0, 0x2($s0)
.L8007AA10:
/* 6B210 8007AA10 02000286 */  lh         $v0, 0x2($s0)
/* 6B214 8007AA14 02000396 */  lhu        $v1, 0x2($s0)
/* 6B218 8007AA18 02004018 */  blez       $v0, .L8007AA24
/* 6B21C 8007AA1C 00FF6224 */   addiu     $v0, $v1, -0x100
/* 6B220 8007AA20 020002A6 */  sh         $v0, 0x2($s0)
.L8007AA24:
/* 6B224 8007AA24 04000286 */  lh         $v0, 0x4($s0)
/* 6B228 8007AA28 00000000 */  nop
/* 6B22C 8007AA2C 11004018 */  blez       $v0, .L8007AA74
/* 6B230 8007AA30 80100200 */   sll       $v0, $v0, 2
/* 6B234 8007AA34 21102202 */  addu       $v0, $s1, $v0
/* 6B238 8007AA38 1C00438C */  lw         $v1, 0x1C($v0)
/* 6B23C 8007AA3C 04000286 */  lh         $v0, 0x4($s0)
/* 6B240 8007AA40 00000000 */  nop
/* 6B244 8007AA44 80100200 */  sll        $v0, $v0, 2
/* 6B248 8007AA48 21102202 */  addu       $v0, $s1, $v0
/* 6B24C 8007AA4C 140003AE */  sw         $v1, 0x14($s0)
/* 6B250 8007AA50 3C00438C */  lw         $v1, 0x3C($v0)
/* 6B254 8007AA54 04000286 */  lh         $v0, 0x4($s0)
/* 6B258 8007AA58 00000000 */  nop
/* 6B25C 8007AA5C 80100200 */  sll        $v0, $v0, 2
/* 6B260 8007AA60 21105100 */  addu       $v0, $v0, $s1
/* 6B264 8007AA64 180003AE */  sw         $v1, 0x18($s0)
/* 6B268 8007AA68 FCFF428C */  lw         $v0, -0x4($v0)
/* 6B26C 8007AA6C 00000000 */  nop
/* 6B270 8007AA70 100002AE */  sw         $v0, 0x10($s0)
.L8007AA74:
/* 6B274 8007AA74 1E000486 */  lh         $a0, 0x1E($s0)
/* 6B278 8007AA78 1C000386 */  lh         $v1, 0x1C($s0)
/* 6B27C 8007AA7C 00000000 */  nop
/* 6B280 8007AA80 23108300 */  subu       $v0, $a0, $v1
/* 6B284 8007AA84 05004004 */  bltz       $v0, .L8007AA9C
/* 6B288 8007AA88 81004228 */   slti      $v0, $v0, 0x81
/* 6B28C 8007AA8C 0B004010 */  beqz       $v0, .L8007AABC
/* 6B290 8007AA90 00000000 */   nop
/* 6B294 8007AA94 ABEA0108 */  j          .L8007AAAC
/* 6B298 8007AA98 00000000 */   nop
.L8007AA9C:
/* 6B29C 8007AA9C 23106400 */  subu       $v0, $v1, $a0
/* 6B2A0 8007AAA0 81004228 */  slti       $v0, $v0, 0x81
/* 6B2A4 8007AAA4 04004010 */  beqz       $v0, .L8007AAB8
/* 6B2A8 8007AAA8 00000000 */   nop
.L8007AAAC:
/* 6B2AC 8007AAAC 1E000296 */  lhu        $v0, 0x1E($s0)
/* 6B2B0 8007AAB0 BEEA0108 */  j          .L8007AAF8
/* 6B2B4 8007AAB4 1C0002A6 */   sh        $v0, 0x1C($s0)
.L8007AAB8:
/* 6B2B8 8007AAB8 1C000386 */  lh         $v1, 0x1C($s0)
.L8007AABC:
/* 6B2BC 8007AABC 1E000286 */  lh         $v0, 0x1E($s0)
/* 6B2C0 8007AAC0 00000000 */  nop
/* 6B2C4 8007AAC4 2A104300 */  slt        $v0, $v0, $v1
/* 6B2C8 8007AAC8 1C000396 */  lhu        $v1, 0x1C($s0)
/* 6B2CC 8007AACC 02004010 */  beqz       $v0, .L8007AAD8
/* 6B2D0 8007AAD0 80FF6224 */   addiu     $v0, $v1, -0x80
/* 6B2D4 8007AAD4 1C0002A6 */  sh         $v0, 0x1C($s0)
.L8007AAD8:
/* 6B2D8 8007AAD8 1C000286 */  lh         $v0, 0x1C($s0)
/* 6B2DC 8007AADC 1E000386 */  lh         $v1, 0x1E($s0)
/* 6B2E0 8007AAE0 00000000 */  nop
/* 6B2E4 8007AAE4 2A104300 */  slt        $v0, $v0, $v1
/* 6B2E8 8007AAE8 1C000396 */  lhu        $v1, 0x1C($s0)
/* 6B2EC 8007AAEC 02004010 */  beqz       $v0, .L8007AAF8
/* 6B2F0 8007AAF0 80006224 */   addiu     $v0, $v1, 0x80
/* 6B2F4 8007AAF4 1C0002A6 */  sh         $v0, 0x1C($s0)
.L8007AAF8:
/* 6B2F8 8007AAF8 01000392 */  lbu        $v1, 0x1($s0)
/* 6B2FC 8007AAFC 01000224 */  addiu      $v0, $zero, 0x1
/* 6B300 8007AB00 08006214 */  bne        $v1, $v0, .L8007AB24
/* 6B304 8007AB04 00000000 */   nop
/* 6B308 8007AB08 1C000286 */  lh         $v0, 0x1C($s0)
/* 6B30C 8007AB0C 00000000 */  nop
/* 6B310 8007AB10 04004018 */  blez       $v0, .L8007AB24
/* 6B314 8007AB14 FFF70324 */   addiu     $v1, $zero, -0x801
/* 6B318 8007AB18 1400428E */  lw         $v0, 0x14($s2)
/* 6B31C 8007AB1C CCEA0108 */  j          .L8007AB30
/* 6B320 8007AB20 24104300 */   and       $v0, $v0, $v1
.L8007AB24:
/* 6B324 8007AB24 1400428E */  lw         $v0, 0x14($s2)
/* 6B328 8007AB28 00000000 */  nop
/* 6B32C 8007AB2C 00084234 */  ori        $v0, $v0, 0x800
.L8007AB30:
/* 6B330 8007AB30 140042AE */  sw         $v0, 0x14($s2)
/* 6B334 8007AB34 21204002 */  addu       $a0, $s2, $zero
/* 6B338 8007AB38 2EE9010C */  jal        SoulReaverCharge
/* 6B33C 8007AB3C 21280002 */   addu      $a1, $s0, $zero
/* 6B340 8007AB40 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6B344 8007AB44 1800B28F */  lw         $s2, 0x18($sp)
/* 6B348 8007AB48 1400B18F */  lw         $s1, 0x14($sp)
/* 6B34C 8007AB4C 1000B08F */  lw         $s0, 0x10($sp)
/* 6B350 8007AB50 0800E003 */  jr         $ra
/* 6B354 8007AB54 2000BD27 */   addiu     $sp, $sp, 0x20
.size _SoulReaverAnimate, . - _SoulReaverAnimate
