.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SplineGetNearestPoint
/* B728 8001AF28 90FFBD27 */  addiu      $sp, $sp, -0x70
/* B72C 8001AF2C 5800B4AF */  sw         $s4, 0x58($sp)
/* B730 8001AF30 21A08000 */  addu       $s4, $a0, $zero
/* B734 8001AF34 6000B6AF */  sw         $s6, 0x60($sp)
/* B738 8001AF38 6400B7AF */  sw         $s7, 0x64($sp)
/* B73C 8001AF3C 21B8C000 */  addu       $s7, $a2, $zero
/* B740 8001AF40 6C00BFAF */  sw         $ra, 0x6C($sp)
/* B744 8001AF44 6800BEAF */  sw         $fp, 0x68($sp)
/* B748 8001AF48 5C00B5AF */  sw         $s5, 0x5C($sp)
/* B74C 8001AF4C 5400B3AF */  sw         $s3, 0x54($sp)
/* B750 8001AF50 5000B2AF */  sw         $s2, 0x50($sp)
/* B754 8001AF54 4C00B1AF */  sw         $s1, 0x4C($sp)
/* B758 8001AF58 4800B0AF */  sw         $s0, 0x48($sp)
/* B75C 8001AF5C 7C00A7AF */  sw         $a3, 0x7C($sp)
/* B760 8001AF60 04008286 */  lh         $v0, 0x4($s4)
/* B764 8001AF64 0000F08E */  lw         $s0, 0x0($s7)
/* B768 8001AF68 0000918E */  lw         $s1, 0x0($s4)
/* B76C 8001AF6C FEFF4324 */  addiu      $v1, $v0, -0x2
/* B770 8001AF70 2A107000 */  slt        $v0, $v1, $s0
/* B774 8001AF74 03004010 */  beqz       $v0, .L8001AF84
/* B778 8001AF78 21B0A000 */   addu      $s6, $a1, $zero
/* B77C 8001AF7C 21806000 */  addu       $s0, $v1, $zero
/* B780 8001AF80 0000F0AE */  sw         $s0, 0x0($s7)
.L8001AF84:
/* B784 8001AF84 04008286 */  lh         $v0, 0x4($s4)
/* B788 8001AF88 02002486 */  lh         $a0, 0x2($s1)
/* B78C 8001AF8C 40110200 */  sll        $v0, $v0, 5
/* B790 8001AF90 21105100 */  addu       $v0, $v0, $s1
/* B794 8001AF94 E2FF4384 */  lh         $v1, -0x1E($v0)
/* B798 8001AF98 00000000 */  nop
/* B79C 8001AF9C 23108300 */  subu       $v0, $a0, $v1
/* B7A0 8001AFA0 05004004 */  bltz       $v0, .L8001AFB8
/* B7A4 8001AFA4 05004228 */   slti      $v0, $v0, 0x5
/* B7A8 8001AFA8 07004014 */  bnez       $v0, .L8001AFC8
/* B7AC 8001AFAC 21900000 */   addu      $s2, $zero, $zero
/* B7B0 8001AFB0 166C0008 */  j          .L8001B058
/* B7B4 8001AFB4 1000A427 */   addiu     $a0, $sp, 0x10
.L8001AFB8:
/* B7B8 8001AFB8 23106400 */  subu       $v0, $v1, $a0
/* B7BC 8001AFBC 05004228 */  slti       $v0, $v0, 0x5
/* B7C0 8001AFC0 24004010 */  beqz       $v0, .L8001B054
/* B7C4 8001AFC4 21900000 */   addu      $s2, $zero, $zero
.L8001AFC8:
/* B7C8 8001AFC8 04008286 */  lh         $v0, 0x4($s4)
/* B7CC 8001AFCC 04002486 */  lh         $a0, 0x4($s1)
/* B7D0 8001AFD0 40110200 */  sll        $v0, $v0, 5
/* B7D4 8001AFD4 21105100 */  addu       $v0, $v0, $s1
/* B7D8 8001AFD8 E4FF4384 */  lh         $v1, -0x1C($v0)
/* B7DC 8001AFDC 00000000 */  nop
/* B7E0 8001AFE0 23108300 */  subu       $v0, $a0, $v1
/* B7E4 8001AFE4 05004004 */  bltz       $v0, .L8001AFFC
/* B7E8 8001AFE8 05004228 */   slti      $v0, $v0, 0x5
/* B7EC 8001AFEC 07004014 */  bnez       $v0, .L8001B00C
/* B7F0 8001AFF0 21900000 */   addu      $s2, $zero, $zero
/* B7F4 8001AFF4 166C0008 */  j          .L8001B058
/* B7F8 8001AFF8 1000A427 */   addiu     $a0, $sp, 0x10
.L8001AFFC:
/* B7FC 8001AFFC 23106400 */  subu       $v0, $v1, $a0
/* B800 8001B000 05004228 */  slti       $v0, $v0, 0x5
/* B804 8001B004 13004010 */  beqz       $v0, .L8001B054
/* B808 8001B008 21900000 */   addu      $s2, $zero, $zero
.L8001B00C:
/* B80C 8001B00C 04008286 */  lh         $v0, 0x4($s4)
/* B810 8001B010 06002486 */  lh         $a0, 0x6($s1)
/* B814 8001B014 40110200 */  sll        $v0, $v0, 5
/* B818 8001B018 21105100 */  addu       $v0, $v0, $s1
/* B81C 8001B01C E6FF4384 */  lh         $v1, -0x1A($v0)
/* B820 8001B020 00000000 */  nop
/* B824 8001B024 23108300 */  subu       $v0, $a0, $v1
/* B828 8001B028 05004004 */  bltz       $v0, .L8001B040
/* B82C 8001B02C 05004228 */   slti      $v0, $v0, 0x5
/* B830 8001B030 08004014 */  bnez       $v0, .L8001B054
/* B834 8001B034 01001224 */   addiu     $s2, $zero, 0x1
/* B838 8001B038 156C0008 */  j          .L8001B054
/* B83C 8001B03C 21900000 */   addu      $s2, $zero, $zero
.L8001B040:
/* B840 8001B040 23106400 */  subu       $v0, $v1, $a0
/* B844 8001B044 05004228 */  slti       $v0, $v0, 0x5
/* B848 8001B048 02004014 */  bnez       $v0, .L8001B054
/* B84C 8001B04C 01001224 */   addiu     $s2, $zero, 0x1
/* B850 8001B050 21900000 */  addu       $s2, $zero, $zero
.L8001B054:
/* B854 8001B054 1000A427 */  addiu      $a0, $sp, 0x10
.L8001B058:
/* B858 8001B058 3000A527 */  addiu      $a1, $sp, 0x30
/* B85C 8001B05C 40111000 */  sll        $v0, $s0, 5
/* B860 8001B060 21182202 */  addu       $v1, $s1, $v0
/* B864 8001B064 02006724 */  addiu      $a3, $v1, 0x2
/* B868 8001B068 3800A627 */  addiu      $a2, $sp, 0x38
/* B86C 8001B06C 20004224 */  addiu      $v0, $v0, 0x20
/* B870 8001B070 02006394 */  lhu        $v1, 0x2($v1)
/* B874 8001B074 0200E894 */  lhu        $t0, 0x2($a3)
/* B878 8001B078 0400E794 */  lhu        $a3, 0x4($a3)
/* B87C 8001B07C 21102202 */  addu       $v0, $s1, $v0
/* B880 8001B080 3000A3A7 */  sh         $v1, 0x30($sp)
/* B884 8001B084 02004324 */  addiu      $v1, $v0, 0x2
/* B888 8001B088 0200A8A4 */  sh         $t0, 0x2($a1)
/* B88C 8001B08C 0400A7A4 */  sh         $a3, 0x4($a1)
/* B890 8001B090 02004294 */  lhu        $v0, 0x2($v0)
/* B894 8001B094 02006894 */  lhu        $t0, 0x2($v1)
/* B898 8001B098 04006394 */  lhu        $v1, 0x4($v1)
/* B89C 8001B09C 2138C002 */  addu       $a3, $s6, $zero
/* B8A0 8001B0A0 3800A2A7 */  sh         $v0, 0x38($sp)
/* B8A4 8001B0A4 0200C8A4 */  sh         $t0, 0x2($a2)
/* B8A8 8001B0A8 79E0010C */  jal        func_800781E4
/* B8AC 8001B0AC 0400C3A4 */   sh        $v1, 0x4($a2)
/* B8B0 8001B0B0 1000A427 */  addiu      $a0, $sp, 0x10
/* B8B4 8001B0B4 2128C002 */  addu       $a1, $s6, $zero
/* B8B8 8001B0B8 406A000C */  jal        CAMERA_GetDistSq
/* B8BC 8001B0BC 21A84000 */   addu      $s5, $v0, $zero
/* B8C0 8001B0C0 04008386 */  lh         $v1, 0x4($s4)
/* B8C4 8001B0C4 00000000 */  nop
/* B8C8 8001B0C8 FEFF6324 */  addiu      $v1, $v1, -0x2
/* B8CC 8001B0CC 2A180302 */  slt        $v1, $s0, $v1
/* B8D0 8001B0D0 03006010 */  beqz       $v1, .L8001B0E0
/* B8D4 8001B0D4 21F04000 */   addu      $fp, $v0, $zero
/* B8D8 8001B0D8 3B6C0008 */  j          .L8001B0EC
/* B8DC 8001B0DC 01001326 */   addiu     $s3, $s0, 0x1
.L8001B0E0:
/* B8E0 8001B0E0 02004012 */  beqz       $s2, .L8001B0EC
/* B8E4 8001B0E4 FFFF1324 */   addiu     $s3, $zero, -0x1
/* B8E8 8001B0E8 21980000 */  addu       $s3, $zero, $zero
.L8001B0EC:
/* B8EC 8001B0EC 0300001A */  blez       $s0, .L8001B0FC
/* B8F0 8001B0F0 00000000 */   nop
/* B8F4 8001B0F4 446C0008 */  j          .L8001B110
/* B8F8 8001B0F8 FFFF1226 */   addiu     $s2, $s0, -0x1
.L8001B0FC:
/* B8FC 8001B0FC 04004012 */  beqz       $s2, .L8001B110
/* B900 8001B100 FFFF1224 */   addiu     $s2, $zero, -0x1
/* B904 8001B104 04008286 */  lh         $v0, 0x4($s4)
/* B908 8001B108 00000000 */  nop
/* B90C 8001B10C FEFF5224 */  addiu      $s2, $v0, -0x2
.L8001B110:
/* B910 8001B110 FFFF0224 */  addiu      $v0, $zero, -0x1
/* B914 8001B114 15006212 */  beq        $s3, $v0, .L8001B16C
/* B918 8001B118 1800A427 */   addiu     $a0, $sp, 0x18
/* B91C 8001B11C 3800A527 */  addiu      $a1, $sp, 0x38
/* B920 8001B120 4000A627 */  addiu      $a2, $sp, 0x40
/* B924 8001B124 40111300 */  sll        $v0, $s3, 5
/* B928 8001B128 20004224 */  addiu      $v0, $v0, 0x20
/* B92C 8001B12C 21102202 */  addu       $v0, $s1, $v0
/* B930 8001B130 02004324 */  addiu      $v1, $v0, 0x2
/* B934 8001B134 02004294 */  lhu        $v0, 0x2($v0)
/* B938 8001B138 02006894 */  lhu        $t0, 0x2($v1)
/* B93C 8001B13C 04006394 */  lhu        $v1, 0x4($v1)
/* B940 8001B140 2138C002 */  addu       $a3, $s6, $zero
/* B944 8001B144 4000A2A7 */  sh         $v0, 0x40($sp)
/* B948 8001B148 0200C8A4 */  sh         $t0, 0x2($a2)
/* B94C 8001B14C 79E0010C */  jal        func_800781E4
/* B950 8001B150 0400C3A4 */   sh        $v1, 0x4($a2)
/* B954 8001B154 21A04000 */  addu       $s4, $v0, $zero
/* B958 8001B158 0010A22A */  slti       $v0, $s5, 0x1000
/* B95C 8001B15C 05004014 */  bnez       $v0, .L8001B174
/* B960 8001B160 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B964 8001B164 7B6C0008 */  j          .L8001B1EC
/* B968 8001B168 0000F3AE */   sw        $s3, 0x0($s7)
.L8001B16C:
/* B96C 8001B16C FFFF1424 */  addiu      $s4, $zero, -0x1
/* B970 8001B170 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8001B174:
/* B974 8001B174 12004212 */  beq        $s2, $v0, .L8001B1C0
/* B978 8001B178 2000A427 */   addiu     $a0, $sp, 0x20
/* B97C 8001B17C 2800A527 */  addiu      $a1, $sp, 0x28
/* B980 8001B180 3000A627 */  addiu      $a2, $sp, 0x30
/* B984 8001B184 40111200 */  sll        $v0, $s2, 5
/* B988 8001B188 21102202 */  addu       $v0, $s1, $v0
/* B98C 8001B18C 02004324 */  addiu      $v1, $v0, 0x2
/* B990 8001B190 02004294 */  lhu        $v0, 0x2($v0)
/* B994 8001B194 02006894 */  lhu        $t0, 0x2($v1)
/* B998 8001B198 04006394 */  lhu        $v1, 0x4($v1)
/* B99C 8001B19C 2138C002 */  addu       $a3, $s6, $zero
/* B9A0 8001B1A0 2800A2A7 */  sh         $v0, 0x28($sp)
/* B9A4 8001B1A4 0200A8A4 */  sh         $t0, 0x2($a1)
/* B9A8 8001B1A8 79E0010C */  jal        func_800781E4
/* B9AC 8001B1AC 0400A3A4 */   sh        $v1, 0x4($a1)
/* B9B0 8001B1B0 0400A01E */  bgtz       $s5, .L8001B1C4
/* B9B4 8001B1B4 21804000 */   addu      $s0, $v0, $zero
/* B9B8 8001B1B8 906C0008 */  j          .L8001B240
/* B9BC 8001B1BC 0000F2AE */   sw        $s2, 0x0($s7)
.L8001B1C0:
/* B9C0 8001B1C0 FFFF1024 */  addiu      $s0, $zero, -0x1
.L8001B1C4:
/* B9C4 8001B1C4 FFFF8226 */  addiu      $v0, $s4, -0x1
/* B9C8 8001B1C8 FF0F422C */  sltiu      $v0, $v0, 0xFFF
/* B9CC 8001B1CC 12004010 */  beqz       $v0, .L8001B218
/* B9D0 8001B1D0 1800A427 */   addiu     $a0, $sp, 0x18
/* B9D4 8001B1D4 406A000C */  jal        CAMERA_GetDistSq
/* B9D8 8001B1D8 2128C002 */   addu      $a1, $s6, $zero
/* B9DC 8001B1DC 2A105E00 */  slt        $v0, $v0, $fp
/* B9E0 8001B1E0 0E004010 */  beqz       $v0, .L8001B21C
/* B9E4 8001B1E4 FFFF0226 */   addiu     $v0, $s0, -0x1
/* B9E8 8001B1E8 0000F3AE */  sw         $s3, 0x0($s7)
.L8001B1EC:
/* B9EC 8001B1EC 7C00A98F */  lw         $t1, 0x7C($sp)
/* B9F0 8001B1F0 1B00AA8B */  lwl        $t2, 0x1B($sp)
/* B9F4 8001B1F4 1800AA9B */  lwr        $t2, 0x18($sp)
/* B9F8 8001B1F8 1F00AB8B */  lwl        $t3, 0x1F($sp)
/* B9FC 8001B1FC 1C00AB9B */  lwr        $t3, 0x1C($sp)
/* BA00 8001B200 03002AA9 */  swl        $t2, 0x3($t1)
/* BA04 8001B204 00002AB9 */  swr        $t2, 0x0($t1)
/* BA08 8001B208 07002BA9 */  swl        $t3, 0x7($t1)
/* BA0C 8001B20C 04002BB9 */  swr        $t3, 0x4($t1)
/* BA10 8001B210 A46C0008 */  j          .L8001B290
/* BA14 8001B214 00000000 */   nop
.L8001B218:
/* BA18 8001B218 FFFF0226 */  addiu      $v0, $s0, -0x1
.L8001B21C:
/* BA1C 8001B21C FF0F422C */  sltiu      $v0, $v0, 0xFFF
/* BA20 8001B220 12004010 */  beqz       $v0, .L8001B26C
/* BA24 8001B224 2000A427 */   addiu     $a0, $sp, 0x20
/* BA28 8001B228 406A000C */  jal        CAMERA_GetDistSq
/* BA2C 8001B22C 2128C002 */   addu      $a1, $s6, $zero
/* BA30 8001B230 2A105E00 */  slt        $v0, $v0, $fp
/* BA34 8001B234 0D004010 */  beqz       $v0, .L8001B26C
/* BA38 8001B238 00000000 */   nop
/* BA3C 8001B23C 0000F2AE */  sw         $s2, 0x0($s7)
.L8001B240:
/* BA40 8001B240 7C00A98F */  lw         $t1, 0x7C($sp)
/* BA44 8001B244 2300AA8B */  lwl        $t2, 0x23($sp)
/* BA48 8001B248 2000AA9B */  lwr        $t2, 0x20($sp)
/* BA4C 8001B24C 2700AB8B */  lwl        $t3, 0x27($sp)
/* BA50 8001B250 2400AB9B */  lwr        $t3, 0x24($sp)
/* BA54 8001B254 03002AA9 */  swl        $t2, 0x3($t1)
/* BA58 8001B258 00002AB9 */  swr        $t2, 0x0($t1)
/* BA5C 8001B25C 07002BA9 */  swl        $t3, 0x7($t1)
/* BA60 8001B260 04002BB9 */  swr        $t3, 0x4($t1)
/* BA64 8001B264 A46C0008 */  j          .L8001B290
/* BA68 8001B268 00000000 */   nop
.L8001B26C:
/* BA6C 8001B26C 7C00A98F */  lw         $t1, 0x7C($sp)
/* BA70 8001B270 1300AA8B */  lwl        $t2, 0x13($sp)
/* BA74 8001B274 1000AA9B */  lwr        $t2, 0x10($sp)
/* BA78 8001B278 1700AB8B */  lwl        $t3, 0x17($sp)
/* BA7C 8001B27C 1400AB9B */  lwr        $t3, 0x14($sp)
/* BA80 8001B280 03002AA9 */  swl        $t2, 0x3($t1)
/* BA84 8001B284 00002AB9 */  swr        $t2, 0x0($t1)
/* BA88 8001B288 07002BA9 */  swl        $t3, 0x7($t1)
/* BA8C 8001B28C 04002BB9 */  swr        $t3, 0x4($t1)
.L8001B290:
/* BA90 8001B290 6C00BF8F */  lw         $ra, 0x6C($sp)
/* BA94 8001B294 6800BE8F */  lw         $fp, 0x68($sp)
/* BA98 8001B298 6400B78F */  lw         $s7, 0x64($sp)
/* BA9C 8001B29C 6000B68F */  lw         $s6, 0x60($sp)
/* BAA0 8001B2A0 5C00B58F */  lw         $s5, 0x5C($sp)
/* BAA4 8001B2A4 5800B48F */  lw         $s4, 0x58($sp)
/* BAA8 8001B2A8 5400B38F */  lw         $s3, 0x54($sp)
/* BAAC 8001B2AC 5000B28F */  lw         $s2, 0x50($sp)
/* BAB0 8001B2B0 4C00B18F */  lw         $s1, 0x4C($sp)
/* BAB4 8001B2B4 4800B08F */  lw         $s0, 0x48($sp)
/* BAB8 8001B2B8 0800E003 */  jr         $ra
/* BABC 8001B2BC 7000BD27 */   addiu     $sp, $sp, 0x70
.size CAMERA_SplineGetNearestPoint, . - CAMERA_SplineGetNearestPoint
