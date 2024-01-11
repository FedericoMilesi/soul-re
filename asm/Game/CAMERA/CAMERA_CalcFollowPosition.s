.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel CAMERA_CalcFollowPosition
/* D748 8001CF48 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* D74C 8001CF4C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* D750 8001CF50 21888000 */  addu       $s1, $a0, $zero
/* D754 8001CF54 2800B0AF */  sw         $s0, 0x28($sp)
/* D758 8001CF58 2180A000 */  addu       $s0, $a1, $zero
/* D75C 8001CF5C 98012426 */  addiu      $a0, $s1, 0x198
/* D760 8001CF60 00012526 */  addiu      $a1, $s1, 0x100
/* D764 8001CF64 3800BFAF */  sw         $ra, 0x38($sp)
/* D768 8001CF68 3400B3AF */  sw         $s3, 0x34($sp)
/* D76C 8001CF6C 3000B2AF */  sw         $s2, 0x30($sp)
/* D770 8001CF70 06012786 */  lh         $a3, 0x106($s1)
/* D774 8001CF74 0801328E */  lw         $s2, 0x108($s1)
/* D778 8001CF78 6F5A000C */  jal        CAMERA_CalcPosition
/* D77C 8001CF7C 21300002 */   addu      $a2, $s0, $zero
/* D780 8001CF80 9B01288A */  lwl        $t0, 0x19B($s1)
/* D784 8001CF84 9801289A */  lwr        $t0, 0x198($s1)
/* D788 8001CF88 9C012986 */  lh         $t1, 0x19C($s1)
/* D78C 8001CF8C 030028AA */  swl        $t0, 0x3($s1)
/* D790 8001CF90 000028BA */  swr        $t0, 0x0($s1)
/* D794 8001CF94 040029A6 */  sh         $t1, 0x4($s1)
/* D798 8001CF98 00000296 */  lhu        $v0, 0x0($s0)
/* D79C 8001CF9C 02000396 */  lhu        $v1, 0x2($s0)
/* D7A0 8001CFA0 04000496 */  lhu        $a0, 0x4($s0)
/* D7A4 8001CFA4 B00022A6 */  sh         $v0, 0xB0($s1)
/* D7A8 8001CFA8 B0002226 */  addiu      $v0, $s1, 0xB0
/* D7AC 8001CFAC 020043A4 */  sh         $v1, 0x2($v0)
/* D7B0 8001CFB0 040044A4 */  sh         $a0, 0x4($v0)
/* D7B4 8001CFB4 E800228E */  lw         $v0, 0xE8($s1)
/* D7B8 8001CFB8 0100033C */  lui        $v1, (0x10000 >> 16)
/* D7BC 8001CFBC 24104300 */  and        $v0, $v0, $v1
/* D7C0 8001CFC0 93004014 */  bnez       $v0, .L8001D210
/* D7C4 8001CFC4 00000000 */   nop
/* D7C8 8001CFC8 B2042296 */  lhu        $v0, 0x4B2($s1)
/* D7CC 8001CFCC B8042496 */  lhu        $a0, 0x4B8($s1)
/* D7D0 8001CFD0 A8042386 */  lh         $v1, 0x4A8($s1)
/* D7D4 8001CFD4 98012586 */  lh         $a1, 0x198($s1)
/* D7D8 8001CFD8 23104400 */  subu       $v0, $v0, $a0
/* D7DC 8001CFDC 23186500 */  subu       $v1, $v1, $a1
/* D7E0 8001CFE0 B20422A6 */  sh         $v0, 0x4B2($s1)
/* D7E4 8001CFE4 1800A3AF */  sw         $v1, 0x18($sp)
/* D7E8 8001CFE8 AA042286 */  lh         $v0, 0x4AA($s1)
/* D7EC 8001CFEC 9A012386 */  lh         $v1, 0x19A($s1)
/* D7F0 8001CFF0 2000A0AF */  sw         $zero, 0x20($sp)
/* D7F4 8001CFF4 23104300 */  subu       $v0, $v0, $v1
/* D7F8 8001CFF8 1C00A2AF */  sw         $v0, 0x1C($sp)
/* D7FC 8001CFFC 1800A227 */  addiu      $v0, $sp, 0x18
/* D800 8001D000 000049C8 */  lwc2       $9, 0x0($v0)
/* D804 8001D004 04004AC8 */  lwc2       $10, 0x4($v0)
/* D808 8001D008 08004BC8 */  lwc2       $11, 0x8($v0)
/* D80C 8001D00C 00000000 */  nop
/* D810 8001D010 00000000 */  nop
/* D814 8001D014 2804A04A */  SQR        0
/* D818 8001D018 000059E8 */  swc2       $25, 0x0($v0)
/* D81C 8001D01C 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* D820 8001D020 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* D824 8001D024 1800A28F */  lw         $v0, 0x18($sp)
/* D828 8001D028 1C00A48F */  lw         $a0, 0x1C($sp)
/* D82C 8001D02C A6E7000C */  jal        MATH3D_FastSqrt0
/* D830 8001D030 21204400 */   addu      $a0, $v0, $a0
/* D834 8001D034 21984000 */  addu       $s3, $v0, $zero
/* D838 8001D038 AC042286 */  lh         $v0, 0x4AC($s1)
/* D83C 8001D03C 9C012486 */  lh         $a0, 0x19C($s1)
/* D840 8001D040 21286002 */  addu       $a1, $s3, $zero
/* D844 8001D044 26F3020C */  jal        ratan2
/* D848 8001D048 23204400 */   subu      $a0, $v0, $a0
/* D84C 8001D04C 21204000 */  addu       $a0, $v0, $zero
/* D850 8001D050 9C04228E */  lw         $v0, 0x49C($s1)
/* D854 8001D054 00000000 */  nop
/* D858 8001D058 38104230 */  andi       $v0, $v0, 0x1038
/* D85C 8001D05C 29004010 */  beqz       $v0, .L8001D104
/* D860 8001D060 21808000 */   addu      $s0, $a0, $zero
/* D864 8001D064 24014386 */  lh         $v1, 0x124($s2)
/* D868 8001D068 60004286 */  lh         $v0, 0x60($s2)
/* D86C 8001D06C 2C012586 */  lh         $a1, 0x12C($s1)
/* D870 8001D070 2E006210 */  beq        $v1, $v0, .L8001D12C
/* D874 8001D074 00000000 */   nop
/* D878 8001D078 2B00A104 */  bgez       $a1, .L8001D128
/* D87C 8001D07C FCFEA228 */   slti      $v0, $a1, -0x104
/* D880 8001D080 05004010 */  beqz       $v0, .L8001D098
/* D884 8001D084 F8FD0224 */   addiu     $v0, $zero, -0x208
/* D888 8001D088 23284500 */  subu       $a1, $v0, $a1
/* D88C 8001D08C 0200A018 */  blez       $a1, .L8001D098
/* D890 8001D090 00000000 */   nop
/* D894 8001D094 21280000 */  addu       $a1, $zero, $zero
.L8001D098:
/* D898 8001D098 24014286 */  lh         $v0, 0x124($s2)
/* D89C 8001D09C AC042386 */  lh         $v1, 0x4AC($s1)
/* D8A0 8001D0A0 60014424 */  addiu      $a0, $v0, 0x160
/* D8A4 8001D0A4 40100500 */  sll        $v0, $a1, 1
/* D8A8 8001D0A8 21186200 */  addu       $v1, $v1, $v0
/* D8AC 8001D0AC 2A106400 */  slt        $v0, $v1, $a0
/* D8B0 8001D0B0 04004010 */  beqz       $v0, .L8001D0C4
/* D8B4 8001D0B4 00000000 */   nop
/* D8B8 8001D0B8 9C012286 */  lh         $v0, 0x19C($s1)
/* D8BC 8001D0BC 34740008 */  j          .L8001D0D0
/* D8C0 8001D0C0 23208200 */   subu      $a0, $a0, $v0
.L8001D0C4:
/* D8C4 8001D0C4 9C012286 */  lh         $v0, 0x19C($s1)
/* D8C8 8001D0C8 00000000 */  nop
/* D8CC 8001D0CC 23206200 */  subu       $a0, $v1, $v0
.L8001D0D0:
/* D8D0 8001D0D0 26F3020C */  jal        ratan2
/* D8D4 8001D0D4 21286002 */   addu      $a1, $s3, $zero
/* D8D8 8001D0D8 21804000 */  addu       $s0, $v0, $zero
/* D8DC 8001D0DC B2042586 */  lh         $a1, 0x4B2($s1)
/* D8E0 8001D0E0 00140200 */  sll        $v0, $v0, 16
/* D8E4 8001D0E4 DA59000C */  jal        CAMERA_SignedAngleDifference
/* D8E8 8001D0E8 03240200 */   sra       $a0, $v0, 16
/* D8EC 8001D0EC 00140200 */  sll        $v0, $v0, 16
/* D8F0 8001D0F0 0E004018 */  blez       $v0, .L8001D12C
/* D8F4 8001D0F4 00000000 */   nop
/* D8F8 8001D0F8 B2043096 */  lhu        $s0, 0x4B2($s1)
/* D8FC 8001D0FC 4B740008 */  j          .L8001D12C
/* D900 8001D100 00000000 */   nop
.L8001D104:
/* D904 8001D104 B0002586 */  lh         $a1, 0xB0($s1)
/* D908 8001D108 00240400 */  sll        $a0, $a0, 16
/* D90C 8001D10C BC59000C */  jal        CAMERA_AngleDifference
/* D910 8001D110 03240400 */   sra       $a0, $a0, 16
/* D914 8001D114 00140200 */  sll        $v0, $v0, 16
/* D918 8001D118 03140200 */  sra        $v0, $v0, 16
/* D91C 8001D11C 04004228 */  slti       $v0, $v0, 0x4
/* D920 8001D120 02004010 */  beqz       $v0, .L8001D12C
/* D924 8001D124 00000000 */   nop
.L8001D128:
/* D928 8001D128 B0003096 */  lhu        $s0, 0xB0($s1)
.L8001D12C:
/* D92C 8001D12C E800228E */  lw         $v0, 0xE8($s1)
/* D930 8001D130 00000000 */  nop
/* D934 8001D134 00184230 */  andi       $v0, $v0, 0x1800
/* D938 8001D138 03004010 */  beqz       $v0, .L8001D148
/* D93C 8001D13C 00000000 */   nop
/* D940 8001D140 B20430A6 */  sh         $s0, 0x4B2($s1)
/* D944 8001D144 B80420A6 */  sh         $zero, 0x4B8($s1)
.L8001D148:
/* D948 8001D148 00241000 */  sll        $a0, $s0, 16
/* D94C 8001D14C B2042586 */  lh         $a1, 0x4B2($s1)
/* D950 8001D150 DA59000C */  jal        CAMERA_SignedAngleDifference
/* D954 8001D154 03240400 */   sra       $a0, $a0, 16
/* D958 8001D158 00140200 */  sll        $v0, $v0, 16
/* D95C 8001D15C 9C04238E */  lw         $v1, 0x49C($s1)
/* D960 8001D160 00000000 */  nop
/* D964 8001D164 00206330 */  andi       $v1, $v1, 0x2000
/* D968 8001D168 15006010 */  beqz       $v1, .L8001D1C0
/* D96C 8001D16C 03240200 */   sra       $a0, $v0, 16
/* D970 8001D170 51008228 */  slti       $v0, $a0, 0x51
/* D974 8001D174 0E004014 */  bnez       $v0, .L8001D1B0
/* D978 8001D178 5555033C */   lui       $v1, (0x55555556 >> 16)
/* D97C 8001D17C 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
/* D980 8001D180 B0FF8224 */  addiu      $v0, $a0, -0x50
/* D984 8001D184 18004300 */  mult       $v0, $v1
/* D988 8001D188 C3170200 */  sra        $v0, $v0, 31
/* D98C 8001D18C 10400000 */  mfhi       $t0
/* D990 8001D190 23180201 */  subu       $v1, $t0, $v0
/* D994 8001D194 04006228 */  slti       $v0, $v1, 0x4
/* D998 8001D198 07004014 */  bnez       $v0, .L8001D1B8
/* D99C 8001D19C 19006228 */   slti      $v0, $v1, 0x19
/* D9A0 8001D1A0 08004014 */  bnez       $v0, .L8001D1C4
/* D9A4 8001D1A4 00000000 */   nop
/* D9A8 8001D1A8 71740008 */  j          .L8001D1C4
/* D9AC 8001D1AC 18000324 */   addiu     $v1, $zero, 0x18
.L8001D1B0:
/* D9B0 8001D1B0 04008018 */  blez       $a0, .L8001D1C4
/* D9B4 8001D1B4 18000324 */   addiu     $v1, $zero, 0x18
.L8001D1B8:
/* D9B8 8001D1B8 71740008 */  j          .L8001D1C4
/* D9BC 8001D1BC 04000324 */   addiu     $v1, $zero, 0x4
.L8001D1C0:
/* D9C0 8001D1C0 18000324 */  addiu      $v1, $zero, 0x18
.L8001D1C4:
/* D9C4 8001D1C4 0D006010 */  beqz       $v1, .L8001D1FC
/* D9C8 8001D1C8 01000424 */   addiu     $a0, $zero, 0x1
/* D9CC 8001D1CC B2042526 */  addiu      $a1, $s1, 0x4B2
/* D9D0 8001D1D0 00341000 */  sll        $a2, $s0, 16
/* D9D4 8001D1D4 03340600 */  sra        $a2, $a2, 16
/* D9D8 8001D1D8 B4042726 */  addiu      $a3, $s1, 0x4B4
/* D9DC 8001D1DC B6042226 */  addiu      $v0, $s1, 0x4B6
/* D9E0 8001D1E0 1000A2AF */  sw         $v0, 0x10($sp)
/* D9E4 8001D1E4 00140300 */  sll        $v0, $v1, 16
/* D9E8 8001D1E8 03140200 */  sra        $v0, $v0, 16
/* D9EC 8001D1EC 7E5E000C */  jal        CriticalDampAngle
/* D9F0 8001D1F0 1400A2AF */   sw        $v0, 0x14($sp)
/* D9F4 8001D1F4 81740008 */  j          .L8001D204
/* D9F8 8001D1F8 00000000 */   nop
.L8001D1FC:
/* D9FC 8001D1FC B60420A6 */  sh         $zero, 0x4B6($s1)
/* DA00 8001D200 B40420A6 */  sh         $zero, 0x4B4($s1)
.L8001D204:
/* DA04 8001D204 B2042296 */  lhu        $v0, 0x4B2($s1)
/* DA08 8001D208 87740008 */  j          .L8001D21C
/* DA0C 8001D20C B00022A6 */   sh        $v0, 0xB0($s1)
.L8001D210:
/* DA10 8001D210 B0002296 */  lhu        $v0, 0xB0($s1)
/* DA14 8001D214 00000000 */  nop
/* DA18 8001D218 B20422A6 */  sh         $v0, 0x4B2($s1)
.L8001D21C:
/* DA1C 8001D21C B4002296 */  lhu        $v0, 0xB4($s1)
/* DA20 8001D220 00000000 */  nop
/* DA24 8001D224 FC0022A6 */  sh         $v0, 0xFC($s1)
/* DA28 8001D228 3800BF8F */  lw         $ra, 0x38($sp)
/* DA2C 8001D22C 3400B38F */  lw         $s3, 0x34($sp)
/* DA30 8001D230 3000B28F */  lw         $s2, 0x30($sp)
/* DA34 8001D234 2C00B18F */  lw         $s1, 0x2C($sp)
/* DA38 8001D238 2800B08F */  lw         $s0, 0x28($sp)
/* DA3C 8001D23C 0800E003 */  jr         $ra
/* DA40 8001D240 4000BD27 */   addiu     $sp, $sp, 0x40
.size CAMERA_CalcFollowPosition, . - CAMERA_CalcFollowPosition
