.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_CalculateWCTransform
/* 2B058 8003A858 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 2B05C 8003A85C 7000B2AF */  sw         $s2, 0x70($sp)
/* 2B060 8003A860 21908000 */  addu       $s2, $a0, $zero
/* 2B064 8003A864 7800BFAF */  sw         $ra, 0x78($sp)
/* 2B068 8003A868 7400B3AF */  sw         $s3, 0x74($sp)
/* 2B06C 8003A86C 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 2B070 8003A870 6800B0AF */  sw         $s0, 0x68($sp)
/* 2B074 8003A874 00004296 */  lhu        $v0, 0x0($s2)
/* 2B078 8003A878 6000538E */  lw         $s3, 0x60($s2)
/* 2B07C 8003A87C 23100200 */  negu       $v0, $v0
/* 2B080 8003A880 5000A2A7 */  sh         $v0, 0x50($sp)
/* 2B084 8003A884 02004296 */  lhu        $v0, 0x2($s2)
/* 2B088 8003A888 88BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 2B08C 8003A88C 23100200 */  negu       $v0, $v0
/* 2B090 8003A890 5200A2A7 */  sh         $v0, 0x52($sp)
/* 2B094 8003A894 04004296 */  lhu        $v0, 0x4($s2)
/* 2B098 8003A898 08006330 */  andi       $v1, $v1, 0x8
/* 2B09C 8003A89C 23100200 */  negu       $v0, $v0
/* 2B0A0 8003A8A0 1C006014 */  bnez       $v1, .L8003A914
/* 2B0A4 8003A8A4 5400A2A7 */   sh        $v0, 0x54($sp)
/* 2B0A8 8003A8A8 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 2B0AC 8003A8AC 1000A427 */   addiu     $a0, $sp, 0x10
/* 2B0B0 8003A8B0 B4004486 */  lh         $a0, 0xB4($s2)
/* 2B0B4 8003A8B4 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B0B8 8003A8B8 32E4010C */  jal        RotMatrixZ
/* 2B0BC 8003A8BC 23200400 */   negu      $a0, $a0
/* 2B0C0 8003A8C0 B0004486 */  lh         $a0, 0xB0($s2)
/* 2B0C4 8003A8C4 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B0C8 8003A8C8 98E3010C */  jal        RotMatrixX
/* 2B0CC 8003A8CC 23200400 */   negu      $a0, $a0
/* 2B0D0 8003A8D0 B2004486 */  lh         $a0, 0xB2($s2)
/* 2B0D4 8003A8D4 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B0D8 8003A8D8 E5E3010C */  jal        RotMatrixY
/* 2B0DC 8003A8DC 23200400 */   negu      $a0, $a0
/* 2B0E0 8003A8E0 00004296 */  lhu        $v0, 0x0($s2)
/* 2B0E4 8003A8E4 00000000 */  nop
/* 2B0E8 8003A8E8 23100200 */  negu       $v0, $v0
/* 2B0EC 8003A8EC 5000A2A7 */  sh         $v0, 0x50($sp)
/* 2B0F0 8003A8F0 02004296 */  lhu        $v0, 0x2($s2)
/* 2B0F4 8003A8F4 00000000 */  nop
/* 2B0F8 8003A8F8 23100200 */  negu       $v0, $v0
/* 2B0FC 8003A8FC 5200A2A7 */  sh         $v0, 0x52($sp)
/* 2B100 8003A900 04004296 */  lhu        $v0, 0x4($s2)
/* 2B104 8003A904 00000000 */  nop
/* 2B108 8003A908 23100200 */  negu       $v0, $v0
/* 2B10C 8003A90C 6BEA0008 */  j          .L8003A9AC
/* 2B110 8003A910 5400A2A7 */   sh        $v0, 0x54($sp)
.L8003A914:
/* 2B114 8003A914 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 2B118 8003A918 1000A427 */   addiu     $a0, $sp, 0x10
/* 2B11C 8003A91C D0004486 */  lh         $a0, 0xD0($s2)
/* 2B120 8003A920 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B124 8003A924 32E4010C */  jal        RotMatrixZ
/* 2B128 8003A928 23200400 */   negu      $a0, $a0
/* 2B12C 8003A92C CE004486 */  lh         $a0, 0xCE($s2)
/* 2B130 8003A930 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B134 8003A934 E5E3010C */  jal        RotMatrixY
/* 2B138 8003A938 23200400 */   negu      $a0, $a0
/* 2B13C 8003A93C CC004486 */  lh         $a0, 0xCC($s2)
/* 2B140 8003A940 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B144 8003A944 98E3010C */  jal        RotMatrixX
/* 2B148 8003A948 23200400 */   negu      $a0, $a0
/* 2B14C 8003A94C C4004296 */  lhu        $v0, 0xC4($s2)
/* 2B150 8003A950 00000000 */  nop
/* 2B154 8003A954 23100200 */  negu       $v0, $v0
/* 2B158 8003A958 5000A2A7 */  sh         $v0, 0x50($sp)
/* 2B15C 8003A95C C6004296 */  lhu        $v0, 0xC6($s2)
/* 2B160 8003A960 00000000 */  nop
/* 2B164 8003A964 23100200 */  negu       $v0, $v0
/* 2B168 8003A968 5200A2A7 */  sh         $v0, 0x52($sp)
/* 2B16C 8003A96C C8004296 */  lhu        $v0, 0xC8($s2)
/* 2B170 8003A970 00000000 */  nop
/* 2B174 8003A974 23100200 */  negu       $v0, $v0
/* 2B178 8003A978 5400A2A7 */  sh         $v0, 0x54($sp)
/* 2B17C 8003A97C 00004296 */  lhu        $v0, 0x0($s2)
/* 2B180 8003A980 02004396 */  lhu        $v1, 0x2($s2)
/* 2B184 8003A984 04004496 */  lhu        $a0, 0x4($s2)
/* 2B188 8003A988 C4004596 */  lhu        $a1, 0xC4($s2)
/* 2B18C 8003A98C C6004696 */  lhu        $a2, 0xC6($s2)
/* 2B190 8003A990 C8004796 */  lhu        $a3, 0xC8($s2)
/* 2B194 8003A994 D60042A6 */  sh         $v0, 0xD6($s2)
/* 2B198 8003A998 D80043A6 */  sh         $v1, 0xD8($s2)
/* 2B19C 8003A99C DA0044A6 */  sh         $a0, 0xDA($s2)
/* 2B1A0 8003A9A0 000045A6 */  sh         $a1, 0x0($s2)
/* 2B1A4 8003A9A4 020046A6 */  sh         $a2, 0x2($s2)
/* 2B1A8 8003A9A8 040047A6 */  sh         $a3, 0x4($s2)
.L8003A9AC:
/* 2B1AC 8003A9AC 3000B027 */  addiu      $s0, $sp, 0x30
/* 2B1B0 8003A9B0 21200002 */  addu       $a0, $s0, $zero
/* 2B1B4 8003A9B4 1000A527 */  addiu      $a1, $sp, 0x10
/* 2B1B8 8003A9B8 21306002 */  addu       $a2, $s3, $zero
/* 2B1BC 8003A9BC 00100324 */  addiu      $v1, $zero, 0x1000
/* 2B1C0 8003A9C0 00F00224 */  addiu      $v0, $zero, -0x1000
/* 2B1C4 8003A9C4 3000A3A7 */  sh         $v1, 0x30($sp)
/* 2B1C8 8003A9C8 3200A0A7 */  sh         $zero, 0x32($sp)
/* 2B1CC 8003A9CC 3400A0A7 */  sh         $zero, 0x34($sp)
/* 2B1D0 8003A9D0 3600A0A7 */  sh         $zero, 0x36($sp)
/* 2B1D4 8003A9D4 3800A0A7 */  sh         $zero, 0x38($sp)
/* 2B1D8 8003A9D8 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 2B1DC 8003A9DC 3C00A0A7 */  sh         $zero, 0x3C($sp)
/* 2B1E0 8003A9E0 3E00A3A7 */  sh         $v1, 0x3E($sp)
/* 2B1E4 8003A9E4 BFF7020C */  jal        MulMatrix0
/* 2B1E8 8003A9E8 4000A0A7 */   sh        $zero, 0x40($sp)
/* 2B1EC 8003A9EC 21200002 */  addu       $a0, $s0, $zero
/* 2B1F0 8003A9F0 7000468E */  lw         $a2, 0x70($s2)
/* 2B1F4 8003A9F4 BFF7020C */  jal        MulMatrix0
/* 2B1F8 8003A9F8 1000A527 */   addiu     $a1, $sp, 0x10
/* 2B1FC 8003A9FC F4E9000C */  jal        PIPE3D_AspectAdjustMatrix
/* 2B200 8003AA00 21206002 */   addu      $a0, $s3, $zero
/* 2B204 8003AA04 00006386 */  lh         $v1, 0x0($s3)
/* 2B208 8003AA08 BA004286 */  lh         $v0, 0xBA($s2)
/* 2B20C 8003AA0C 00000000 */  nop
/* 2B210 8003AA10 18006200 */  mult       $v1, $v0
/* 2B214 8003AA14 02006386 */  lh         $v1, 0x2($s3)
/* 2B218 8003AA18 12400000 */  mflo       $t0
/* 2B21C 8003AA1C 03130800 */  sra        $v0, $t0, 12
/* 2B220 8003AA20 000062A6 */  sh         $v0, 0x0($s3)
/* 2B224 8003AA24 BA004286 */  lh         $v0, 0xBA($s2)
/* 2B228 8003AA28 00000000 */  nop
/* 2B22C 8003AA2C 18006200 */  mult       $v1, $v0
/* 2B230 8003AA30 04006386 */  lh         $v1, 0x4($s3)
/* 2B234 8003AA34 12400000 */  mflo       $t0
/* 2B238 8003AA38 03130800 */  sra        $v0, $t0, 12
/* 2B23C 8003AA3C 020062A6 */  sh         $v0, 0x2($s3)
/* 2B240 8003AA40 BA004286 */  lh         $v0, 0xBA($s2)
/* 2B244 8003AA44 00000000 */  nop
/* 2B248 8003AA48 18006200 */  mult       $v1, $v0
/* 2B24C 8003AA4C 06006386 */  lh         $v1, 0x6($s3)
/* 2B250 8003AA50 12400000 */  mflo       $t0
/* 2B254 8003AA54 03130800 */  sra        $v0, $t0, 12
/* 2B258 8003AA58 040062A6 */  sh         $v0, 0x4($s3)
/* 2B25C 8003AA5C BC004286 */  lh         $v0, 0xBC($s2)
/* 2B260 8003AA60 00000000 */  nop
/* 2B264 8003AA64 18006200 */  mult       $v1, $v0
/* 2B268 8003AA68 08006386 */  lh         $v1, 0x8($s3)
/* 2B26C 8003AA6C 12400000 */  mflo       $t0
/* 2B270 8003AA70 03130800 */  sra        $v0, $t0, 12
/* 2B274 8003AA74 060062A6 */  sh         $v0, 0x6($s3)
/* 2B278 8003AA78 BC004286 */  lh         $v0, 0xBC($s2)
/* 2B27C 8003AA7C 00000000 */  nop
/* 2B280 8003AA80 18006200 */  mult       $v1, $v0
/* 2B284 8003AA84 0A006386 */  lh         $v1, 0xA($s3)
/* 2B288 8003AA88 12400000 */  mflo       $t0
/* 2B28C 8003AA8C 03130800 */  sra        $v0, $t0, 12
/* 2B290 8003AA90 080062A6 */  sh         $v0, 0x8($s3)
/* 2B294 8003AA94 BC004286 */  lh         $v0, 0xBC($s2)
/* 2B298 8003AA98 00000000 */  nop
/* 2B29C 8003AA9C 18006200 */  mult       $v1, $v0
/* 2B2A0 8003AAA0 0C006386 */  lh         $v1, 0xC($s3)
/* 2B2A4 8003AAA4 12400000 */  mflo       $t0
/* 2B2A8 8003AAA8 03130800 */  sra        $v0, $t0, 12
/* 2B2AC 8003AAAC 0A0062A6 */  sh         $v0, 0xA($s3)
/* 2B2B0 8003AAB0 BE004286 */  lh         $v0, 0xBE($s2)
/* 2B2B4 8003AAB4 00000000 */  nop
/* 2B2B8 8003AAB8 18006200 */  mult       $v1, $v0
/* 2B2BC 8003AABC 0E006386 */  lh         $v1, 0xE($s3)
/* 2B2C0 8003AAC0 12400000 */  mflo       $t0
/* 2B2C4 8003AAC4 03130800 */  sra        $v0, $t0, 12
/* 2B2C8 8003AAC8 0C0062A6 */  sh         $v0, 0xC($s3)
/* 2B2CC 8003AACC BE004286 */  lh         $v0, 0xBE($s2)
/* 2B2D0 8003AAD0 00000000 */  nop
/* 2B2D4 8003AAD4 18006200 */  mult       $v1, $v0
/* 2B2D8 8003AAD8 10006386 */  lh         $v1, 0x10($s3)
/* 2B2DC 8003AADC 12400000 */  mflo       $t0
/* 2B2E0 8003AAE0 03130800 */  sra        $v0, $t0, 12
/* 2B2E4 8003AAE4 0E0062A6 */  sh         $v0, 0xE($s3)
/* 2B2E8 8003AAE8 BE004286 */  lh         $v0, 0xBE($s2)
/* 2B2EC 8003AAEC 00000000 */  nop
/* 2B2F0 8003AAF0 18006200 */  mult       $v1, $v0
/* 2B2F4 8003AAF4 12400000 */  mflo       $t0
/* 2B2F8 8003AAF8 03130800 */  sra        $v0, $t0, 12
/* 2B2FC 8003AAFC 100062A6 */  sh         $v0, 0x10($s3)
/* 2B300 8003AB00 00006C8E */  lw         $t4, 0x0($s3)
/* 2B304 8003AB04 04006D8E */  lw         $t5, 0x4($s3)
/* 2B308 8003AB08 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 2B30C 8003AB0C 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 2B310 8003AB10 08006C8E */  lw         $t4, 0x8($s3)
/* 2B314 8003AB14 0C006D8E */  lw         $t5, 0xC($s3)
/* 2B318 8003AB18 10006E8E */  lw         $t6, 0x10($s3)
/* 2B31C 8003AB1C 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 2B320 8003AB20 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 2B324 8003AB24 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 2B328 8003AB28 5000B127 */  addiu      $s1, $sp, 0x50
/* 2B32C 8003AB2C 000020CA */  lwc2       $0, 0x0($s1)
/* 2B330 8003AB30 040021CA */  lwc2       $1, 0x4($s1)
/* 2B334 8003AB34 00000000 */  nop
/* 2B338 8003AB38 00000000 */  nop
/* 2B33C 8003AB3C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 2B340 8003AB40 5800B027 */  addiu      $s0, $sp, 0x58
/* 2B344 8003AB44 000019EA */  swc2       $25, 0x0($s0)
/* 2B348 8003AB48 04001AEA */  swc2       $26, 0x4($s0) # handwritten instruction
/* 2B34C 8003AB4C 08001BEA */  swc2       $27, 0x8($s0) # handwritten instruction
/* 2B350 8003AB50 21206002 */  addu       $a0, $s3, $zero
/* 2B354 8003AB54 B1FD020C */  jal        TransMatrix
/* 2B358 8003AB58 21280002 */   addu      $a1, $s0, $zero
/* 2B35C 8003AB5C 7000488E */  lw         $t0, 0x70($s2)
/* 2B360 8003AB60 00000000 */  nop
/* 2B364 8003AB64 00000C8D */  lw         $t4, 0x0($t0)
/* 2B368 8003AB68 04000D8D */  lw         $t5, 0x4($t0)
/* 2B36C 8003AB6C 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 2B370 8003AB70 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 2B374 8003AB74 08000C8D */  lw         $t4, 0x8($t0)
/* 2B378 8003AB78 0C000D8D */  lw         $t5, 0xC($t0)
/* 2B37C 8003AB7C 10000E8D */  lw         $t6, 0x10($t0)
/* 2B380 8003AB80 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 2B384 8003AB84 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 2B388 8003AB88 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 2B38C 8003AB8C 000020CA */  lwc2       $0, 0x0($s1)
/* 2B390 8003AB90 040021CA */  lwc2       $1, 0x4($s1)
/* 2B394 8003AB94 00000000 */  nop
/* 2B398 8003AB98 00000000 */  nop
/* 2B39C 8003AB9C 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 2B3A0 8003ABA0 000019EA */  swc2       $25, 0x0($s0)
/* 2B3A4 8003ABA4 04001AEA */  swc2       $26, 0x4($s0) # handwritten instruction
/* 2B3A8 8003ABA8 08001BEA */  swc2       $27, 0x8($s0) # handwritten instruction
/* 2B3AC 8003ABAC 7000448E */  lw         $a0, 0x70($s2)
/* 2B3B0 8003ABB0 B1FD020C */  jal        TransMatrix
/* 2B3B4 8003ABB4 21280002 */   addu      $a1, $s0, $zero
/* 2B3B8 8003ABB8 7800BF8F */  lw         $ra, 0x78($sp)
/* 2B3BC 8003ABBC 7400B38F */  lw         $s3, 0x74($sp)
/* 2B3C0 8003ABC0 7000B28F */  lw         $s2, 0x70($sp)
/* 2B3C4 8003ABC4 6C00B18F */  lw         $s1, 0x6C($sp)
/* 2B3C8 8003ABC8 6800B08F */  lw         $s0, 0x68($sp)
/* 2B3CC 8003ABCC 0800E003 */  jr         $ra
/* 2B3D0 8003ABD0 8000BD27 */   addiu     $sp, $sp, 0x80
.size PIPE3D_CalculateWCTransform, . - PIPE3D_CalculateWCTransform
