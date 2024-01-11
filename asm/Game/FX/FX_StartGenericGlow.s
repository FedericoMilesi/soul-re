.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartGenericGlow
/* 3D0E4 8004C8E4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3D0E8 8004C8E8 2140C000 */  addu       $t0, $a2, $zero
/* 3D0EC 8004C8EC 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3D0F0 8004C8F0 90A2438C */  lw         $v1, %lo(objectAccess + 0x54)($v0)
/* 3D0F4 8004C8F4 3800A68F */  lw         $a2, 0x38($sp)
/* 3D0F8 8004C8F8 2400BFAF */  sw         $ra, 0x24($sp)
/* 3D0FC 8004C8FC 5F006010 */  beqz       $v1, .L8004CA7C
/* 3D100 8004C900 2000B0AF */   sw        $s0, 0x20($sp)
/* 3D104 8004C904 40100500 */  sll        $v0, $a1, 1
/* 3D108 8004C908 1C00698C */  lw         $t1, 0x1C($v1)
/* 3D10C 8004C90C 21104500 */  addu       $v0, $v0, $a1
/* 3D110 8004C910 0800238D */  lw         $v1, 0x8($t1)
/* 3D114 8004C914 C0100200 */  sll        $v0, $v0, 3
/* 3D118 8004C918 0500C010 */  beqz       $a2, .L8004C930
/* 3D11C 8004C91C 21806200 */   addu      $s0, $v1, $v0
/* 3D120 8004C920 00000282 */  lb         $v0, 0x0($s0)
/* 3D124 8004C924 00000000 */  nop
/* 3D128 8004C928 54004010 */  beqz       $v0, .L8004CA7C
/* 3D12C 8004C92C 00000000 */   nop
.L8004C930:
/* 3D130 8004C930 05000282 */  lb         $v0, 0x5($s0)
/* 3D134 8004C934 00000000 */  nop
/* 3D138 8004C938 05004010 */  beqz       $v0, .L8004C950
/* 3D13C 8004C93C 00000000 */   nop
/* 3D140 8004C940 4C01848C */  lw         $a0, 0x14C($a0)
/* 3D144 8004C944 00000000 */  nop
/* 3D148 8004C948 4C008010 */  beqz       $a0, .L8004CA7C
/* 3D14C 8004C94C 00000000 */   nop
.L8004C950:
/* 3D150 8004C950 04000292 */  lbu        $v0, 0x4($s0)
/* 3D154 8004C954 1800238D */  lw         $v1, 0x18($t1)
/* 3D158 8004C958 03000682 */  lb         $a2, 0x3($s0)
/* 3D15C 8004C95C 80100200 */  sll        $v0, $v0, 2
/* 3D160 8004C960 21186200 */  addu       $v1, $v1, $v0
/* 3D164 8004C964 0200C228 */  slti       $v0, $a2, 0x2
/* 3D168 8004C968 10004010 */  beqz       $v0, .L8004C9AC
/* 3D16C 8004C96C 02000224 */   addiu     $v0, $zero, 0x2
/* 3D170 8004C970 02000015 */  bnez       $t0, .L8004C97C
/* 3D174 8004C974 21280001 */   addu      $a1, $t0, $zero
/* 3D178 8004C978 01000592 */  lbu        $a1, 0x1($s0)
.L8004C97C:
/* 3D17C 8004C97C 0800028E */  lw         $v0, 0x8($s0)
/* 3D180 8004C980 06000792 */  lbu        $a3, 0x6($s0)
/* 3D184 8004C984 1000A2AF */  sw         $v0, 0x10($sp)
/* 3D188 8004C988 0C000286 */  lh         $v0, 0xC($s0)
/* 3D18C 8004C98C 00000000 */  nop
/* 3D190 8004C990 1400A2AF */  sw         $v0, 0x14($sp)
/* 3D194 8004C994 0E000286 */  lh         $v0, 0xE($s0)
/* 3D198 8004C998 21306000 */  addu       $a2, $v1, $zero
/* 3D19C 8004C99C 462D010C */  jal        FX_DoInstanceOneSegmentGlow
/* 3D1A0 8004C9A0 1800A2AF */   sw        $v0, 0x18($sp)
/* 3D1A4 8004C9A4 93320108 */  j          .L8004CA4C
/* 3D1A8 8004C9A8 21204000 */   addu      $a0, $v0, $zero
.L8004C9AC:
/* 3D1AC 8004C9AC 1500C214 */  bne        $a2, $v0, .L8004CA04
/* 3D1B0 8004C9B0 00000000 */   nop
/* 3D1B4 8004C9B4 03000015 */  bnez       $t0, .L8004C9C4
/* 3D1B8 8004C9B8 21280001 */   addu      $a1, $t0, $zero
/* 3D1BC 8004C9BC 0300E010 */  beqz       $a3, .L8004C9CC
/* 3D1C0 8004C9C0 00000000 */   nop
.L8004C9C4:
/* 3D1C4 8004C9C4 75320108 */  j          .L8004C9D4
/* 3D1C8 8004C9C8 2130E000 */   addu      $a2, $a3, $zero
.L8004C9CC:
/* 3D1CC 8004C9CC 01000592 */  lbu        $a1, 0x1($s0)
/* 3D1D0 8004C9D0 02000692 */  lbu        $a2, 0x2($s0)
.L8004C9D4:
/* 3D1D4 8004C9D4 06000292 */  lbu        $v0, 0x6($s0)
/* 3D1D8 8004C9D8 00000000 */  nop
/* 3D1DC 8004C9DC 1000A2AF */  sw         $v0, 0x10($sp)
/* 3D1E0 8004C9E0 0800028E */  lw         $v0, 0x8($s0)
/* 3D1E4 8004C9E4 00000000 */  nop
/* 3D1E8 8004C9E8 1400A2AF */  sw         $v0, 0x14($sp)
/* 3D1EC 8004C9EC 0C000286 */  lh         $v0, 0xC($s0)
/* 3D1F0 8004C9F0 21386000 */  addu       $a3, $v1, $zero
/* 3D1F4 8004C9F4 A52D010C */  jal        FX_DoInstanceTwoSegmentGlow
/* 3D1F8 8004C9F8 1800A2AF */   sw        $v0, 0x18($sp)
/* 3D1FC 8004C9FC 93320108 */  j          .L8004CA4C
/* 3D200 8004CA00 21204000 */   addu      $a0, $v0, $zero
.L8004CA04:
/* 3D204 8004CA04 03000015 */  bnez       $t0, .L8004CA14
/* 3D208 8004CA08 21280001 */   addu      $a1, $t0, $zero
/* 3D20C 8004CA0C 0300E010 */  beqz       $a3, .L8004CA1C
/* 3D210 8004CA10 00000000 */   nop
.L8004CA14:
/* 3D214 8004CA14 88320108 */  j          .L8004CA20
/* 3D218 8004CA18 2130E000 */   addu      $a2, $a3, $zero
.L8004CA1C:
/* 3D21C 8004CA1C 01000592 */  lbu        $a1, 0x1($s0)
.L8004CA20:
/* 3D220 8004CA20 06000292 */  lbu        $v0, 0x6($s0)
/* 3D224 8004CA24 00000000 */  nop
/* 3D228 8004CA28 1000A2AF */  sw         $v0, 0x10($sp)
/* 3D22C 8004CA2C 0800028E */  lw         $v0, 0x8($s0)
/* 3D230 8004CA30 00000000 */  nop
/* 3D234 8004CA34 1400A2AF */  sw         $v0, 0x14($sp)
/* 3D238 8004CA38 0C000286 */  lh         $v0, 0xC($s0)
/* 3D23C 8004CA3C 21386000 */  addu       $a3, $v1, $zero
/* 3D240 8004CA40 BB2D010C */  jal        FX_DoInstanceManySegmentGlow
/* 3D244 8004CA44 1800A2AF */   sw        $v0, 0x18($sp)
/* 3D248 8004CA48 21204000 */  addu       $a0, $v0, $zero
.L8004CA4C:
/* 3D24C 8004CA4C 0B008010 */  beqz       $a0, .L8004CA7C
/* 3D250 8004CA50 00000000 */   nop
/* 3D254 8004CA54 1000038E */  lw         $v1, 0x10($s0)
/* 3D258 8004CA58 00000000 */  nop
/* 3D25C 8004CA5C 07006018 */  blez       $v1, .L8004CA7C
/* 3D260 8004CA60 40110300 */   sll       $v0, $v1, 5
/* 3D264 8004CA64 21104300 */  addu       $v0, $v0, $v1
/* 3D268 8004CA68 0E0082A4 */  sh         $v0, 0xE($a0)
/* 3D26C 8004CA6C 14000586 */  lh         $a1, 0x14($s0)
/* 3D270 8004CA70 16000686 */  lh         $a2, 0x16($s0)
/* 3D274 8004CA74 9E2D010C */  jal        FX_SetGlowFades
/* 3D278 8004CA78 00000000 */   nop
.L8004CA7C:
/* 3D27C 8004CA7C 2400BF8F */  lw         $ra, 0x24($sp)
/* 3D280 8004CA80 2000B08F */  lw         $s0, 0x20($sp)
/* 3D284 8004CA84 0800E003 */  jr         $ra
/* 3D288 8004CA88 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_StartGenericGlow, . - FX_StartGenericGlow
