.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_SplineProcess
/* 2DFA4 8003D7A4 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 2DFA8 8003D7A8 6800BEAF */  sw         $fp, 0x68($sp)
/* 2DFAC 8003D7AC 21F0A000 */  addu       $fp, $a1, $zero
/* 2DFB0 8003D7B0 8000A58F */  lw         $a1, 0x80($sp)
/* 2DFB4 8003D7B4 6000B6AF */  sw         $s6, 0x60($sp)
/* 2DFB8 8003D7B8 08C0968F */  lw         $s6, %gp_rel(gameTrackerX + 0x240)($gp)
/* 2DFBC 8003D7BC 5800B4AF */  sw         $s4, 0x58($sp)
/* 2DFC0 8003D7C0 21A08000 */  addu       $s4, $a0, $zero
/* 2DFC4 8003D7C4 6400B7AF */  sw         $s7, 0x64($sp)
/* 2DFC8 8003D7C8 21B8E000 */  addu       $s7, $a3, $zero
/* 2DFCC 8003D7CC 5400B3AF */  sw         $s3, 0x54($sp)
/* 2DFD0 8003D7D0 FFFF1324 */  addiu      $s3, $zero, -0x1
/* 2DFD4 8003D7D4 5000B2AF */  sw         $s2, 0x50($sp)
/* 2DFD8 8003D7D8 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 2DFDC 8003D7DC 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 2DFE0 8003D7E0 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 2DFE4 8003D7E4 4800B0AF */  sw         $s0, 0x48($sp)
/* 2DFE8 8003D7E8 7800A6AF */  sw         $a2, 0x78($sp)
/* 2DFEC 8003D7EC 0000D58F */  lw         $s5, 0x0($fp)
/* 2DFF0 8003D7F0 0800C48F */  lw         $a0, 0x8($fp)
/* 2DFF4 8003D7F4 0400D18F */  lw         $s1, 0x4($fp)
/* 2DFF8 8003D7F8 20008010 */  beqz       $a0, .L8003D87C
/* 2DFFC 8003D7FC 21900000 */   addu      $s2, $zero, $zero
/* 2E000 8003D800 8400A88F */  lw         $t0, 0x84($sp)
/* 2E004 8003D804 00000000 */  nop
/* 2E008 8003D808 05000019 */  blez       $t0, .L8003D820
/* 2E00C 8003D80C 00000000 */   nop
/* 2E010 8003D810 D805010C */  jal        SplineGetNextPoint
/* 2E014 8003D814 00000000 */   nop
/* 2E018 8003D818 13F60008 */  j          .L8003D84C
/* 2E01C 8003D81C 21904000 */   addu      $s2, $v0, $zero
.L8003D820:
/* 2E020 8003D820 05000105 */  bgez       $t0, .L8003D838
/* 2E024 8003D824 1800B027 */   addiu     $s0, $sp, 0x18
/* 2E028 8003D828 EE05010C */  jal        SplineGetPreviousPoint
/* 2E02C 8003D82C 00000000 */   nop
/* 2E030 8003D830 13F60008 */  j          .L8003D84C
/* 2E034 8003D834 21904000 */   addu      $s2, $v0, $zero
.L8003D838:
/* 2E038 8003D838 F306010C */  jal        SplineGetData
/* 2E03C 8003D83C 21300002 */   addu      $a2, $s0, $zero
/* 2E040 8003D840 02004010 */  beqz       $v0, .L8003D84C
/* 2E044 8003D844 00000000 */   nop
/* 2E048 8003D848 21900002 */  addu       $s2, $s0, $zero
.L8003D84C:
/* 2E04C 8003D84C 0A004012 */  beqz       $s2, .L8003D878
/* 2E050 8003D850 21980000 */   addu      $s3, $zero, $zero
/* 2E054 8003D854 00004296 */  lhu        $v0, 0x0($s2)
/* 2E058 8003D858 00000000 */  nop
/* 2E05C 8003D85C 840082A6 */  sh         $v0, 0x84($s4)
/* 2E060 8003D860 04004296 */  lhu        $v0, 0x4($s2)
/* 2E064 8003D864 00000000 */  nop
/* 2E068 8003D868 860082A6 */  sh         $v0, 0x86($s4)
/* 2E06C 8003D86C 02004296 */  lhu        $v0, 0x2($s2)
/* 2E070 8003D870 1FF60008 */  j          .L8003D87C
/* 2E074 8003D874 880082A6 */   sh        $v0, 0x88($s4)
.L8003D878:
/* 2E078 8003D878 01001324 */  addiu      $s3, $zero, 0x1
.L8003D87C:
/* 2E07C 8003D87C 49002012 */  beqz       $s1, .L8003D9A4
/* 2E080 8003D880 00000000 */   nop
/* 2E084 8003D884 8400A88F */  lw         $t0, 0x84($sp)
/* 2E088 8003D888 00000000 */  nop
/* 2E08C 8003D88C 07000019 */  blez       $t0, .L8003D8AC
/* 2E090 8003D890 21980000 */   addu      $s3, $zero, $zero
/* 2E094 8003D894 21202002 */  addu       $a0, $s1, $zero
/* 2E098 8003D898 2128E002 */  addu       $a1, $s7, $zero
/* 2E09C 8003D89C 5608010C */  jal        SplineGetOffsetNext
/* 2E0A0 8003D8A0 2130C002 */   addu      $a2, $s6, $zero
/* 2E0A4 8003D8A4 33F60008 */  j          .L8003D8CC
/* 2E0A8 8003D8A8 0100532C */   sltiu     $s3, $v0, 0x1
.L8003D8AC:
/* 2E0AC 8003D8AC 07000105 */  bgez       $t0, .L8003D8CC
/* 2E0B0 8003D8B0 21202002 */   addu      $a0, $s1, $zero
/* 2E0B4 8003D8B4 2128E002 */  addu       $a1, $s7, $zero
/* 2E0B8 8003D8B8 CF08010C */  jal        SplineGetOffsetPrev
/* 2E0BC 8003D8BC 2130C002 */   addu      $a2, $s6, $zero
/* 2E0C0 8003D8C0 02004014 */  bnez       $v0, .L8003D8CC
/* 2E0C4 8003D8C4 00000000 */   nop
/* 2E0C8 8003D8C8 01001324 */  addiu      $s3, $zero, 0x1
.L8003D8CC:
/* 2E0CC 8003D8CC 35006016 */  bnez       $s3, .L8003D9A4
/* 2E0D0 8003D8D0 00000000 */   nop
/* 2E0D4 8003D8D4 1400828E */  lw         $v0, 0x14($s4)
/* 2E0D8 8003D8D8 00000000 */  nop
/* 2E0DC 8003D8DC 01004230 */  andi       $v0, $v0, 0x1
/* 2E0E0 8003D8E0 17004010 */  beqz       $v0, .L8003D940
/* 2E0E4 8003D8E4 21202002 */   addu      $a0, $s1, $zero
/* 2E0E8 8003D8E8 2128E002 */  addu       $a1, $s7, $zero
/* 2E0EC 8003D8EC 2000B027 */  addiu      $s0, $sp, 0x20
/* 2E0F0 8003D8F0 7707010C */  jal        SplineGetQuatData
/* 2E0F4 8003D8F4 21300002 */   addu      $a2, $s0, $zero
/* 2E0F8 8003D8F8 29004010 */  beqz       $v0, .L8003D9A0
/* 2E0FC 8003D8FC 21200002 */   addu      $a0, $s0, $zero
/* 2E100 8003D900 3000D127 */  addiu      $s1, $fp, 0x30
/* 2E104 8003D904 27E7010C */  jal        func_80079C9C
/* 2E108 8003D908 21282002 */   addu      $a1, $s1, $zero
/* 2E10C 8003D90C 2000848E */  lw         $a0, 0x20($s4)
/* 2E110 8003D910 00000000 */  nop
/* 2E114 8003D914 23008010 */  beqz       $a0, .L8003D9A4
/* 2E118 8003D918 18008424 */   addiu     $a0, $a0, 0x18
/* 2E11C 8003D91C 2800B027 */  addiu      $s0, $sp, 0x28
/* 2E120 8003D920 3DE3010C */  jal        func_80078CF4
/* 2E124 8003D924 21280002 */   addu      $a1, $s0, $zero
/* 2E128 8003D928 21202002 */  addu       $a0, $s1, $zero
/* 2E12C 8003D92C 21280002 */  addu       $a1, $s0, $zero
/* 2E130 8003D930 BFF7020C */  jal        func_800BDEFC
/* 2E134 8003D934 21308000 */   addu      $a2, $a0, $zero
/* 2E138 8003D938 69F60008 */  j          .L8003D9A4
/* 2E13C 8003D93C 00000000 */   nop
.L8003D940:
/* 2E140 8003D940 2128E002 */  addu       $a1, $s7, $zero
/* 2E144 8003D944 F306010C */  jal        SplineGetData
/* 2E148 8003D948 1000A627 */   addiu     $a2, $sp, 0x10
/* 2E14C 8003D94C 14004010 */  beqz       $v0, .L8003D9A0
/* 2E150 8003D950 2800B127 */   addiu     $s1, $sp, 0x28
/* 2E154 8003D954 21202002 */  addu       $a0, $s1, $zero
/* 2E158 8003D958 1000A297 */  lhu        $v0, 0x10($sp)
/* 2E15C 8003D95C 2000868E */  lw         $a2, 0x20($s4)
/* 2E160 8003D960 74009026 */  addiu      $s0, $s4, 0x74
/* 2E164 8003D964 740082A6 */  sh         $v0, 0x74($s4)
/* 2E168 8003D968 1200A297 */  lhu        $v0, 0x12($sp)
/* 2E16C 8003D96C 21280002 */  addu       $a1, $s0, $zero
/* 2E170 8003D970 760082A6 */  sh         $v0, 0x76($s4)
/* 2E174 8003D974 1400A297 */  lhu        $v0, 0x14($sp)
/* 2E178 8003D978 1800C624 */  addiu      $a2, $a2, 0x18
/* 2E17C 8003D97C 2FF3000C */  jal        SCRIPT_CombineEulerAngles
/* 2E180 8003D980 780082A6 */   sh        $v0, 0x78($s4)
/* 2E184 8003D984 2800A297 */  lhu        $v0, 0x28($sp)
/* 2E188 8003D988 02002396 */  lhu        $v1, 0x2($s1)
/* 2E18C 8003D98C 04002496 */  lhu        $a0, 0x4($s1)
/* 2E190 8003D990 740082A6 */  sh         $v0, 0x74($s4)
/* 2E194 8003D994 020003A6 */  sh         $v1, 0x2($s0)
/* 2E198 8003D998 69F60008 */  j          .L8003D9A4
/* 2E19C 8003D99C 040004A6 */   sh        $a0, 0x4($s0)
.L8003D9A0:
/* 2E1A0 8003D9A0 01001324 */  addiu      $s3, $zero, 0x1
.L8003D9A4:
/* 2E1A4 8003D9A4 2D00A012 */  beqz       $s5, .L8003DA5C
/* 2E1A8 8003D9A8 21106002 */   addu      $v0, $s3, $zero
/* 2E1AC 8003D9AC 8400A88F */  lw         $t0, 0x84($sp)
/* 2E1B0 8003D9B0 00000000 */  nop
/* 2E1B4 8003D9B4 06000019 */  blez       $t0, .L8003D9D0
/* 2E1B8 8003D9B8 2120A002 */   addu      $a0, $s5, $zero
/* 2E1BC 8003D9BC 7800A58F */  lw         $a1, 0x78($sp)
/* 2E1C0 8003D9C0 2C09010C */  jal        SplineGetOffsetNextPoint
/* 2E1C4 8003D9C4 2130C002 */   addu      $a2, $s6, $zero
/* 2E1C8 8003D9C8 82F60008 */  j          .L8003DA08
/* 2E1CC 8003D9CC 21904000 */   addu      $s2, $v0, $zero
.L8003D9D0:
/* 2E1D0 8003D9D0 07000105 */  bgez       $t0, .L8003D9F0
/* 2E1D4 8003D9D4 2000B027 */   addiu     $s0, $sp, 0x20
/* 2E1D8 8003D9D8 2120A002 */  addu       $a0, $s5, $zero
/* 2E1DC 8003D9DC 7800A58F */  lw         $a1, 0x78($sp)
/* 2E1E0 8003D9E0 4209010C */  jal        SplineGetOffsetPreviousPoint
/* 2E1E4 8003D9E4 2130C002 */   addu      $a2, $s6, $zero
/* 2E1E8 8003D9E8 82F60008 */  j          .L8003DA08
/* 2E1EC 8003D9EC 21904000 */   addu      $s2, $v0, $zero
.L8003D9F0:
/* 2E1F0 8003D9F0 7800A58F */  lw         $a1, 0x78($sp)
/* 2E1F4 8003D9F4 F306010C */  jal        SplineGetData
/* 2E1F8 8003D9F8 21300002 */   addu      $a2, $s0, $zero
/* 2E1FC 8003D9FC 02004010 */  beqz       $v0, .L8003DA08
/* 2E200 8003DA00 00000000 */   nop
/* 2E204 8003DA04 21900002 */  addu       $s2, $s0, $zero
.L8003DA08:
/* 2E208 8003DA08 13004012 */  beqz       $s2, .L8003DA58
/* 2E20C 8003DA0C 01001324 */   addiu     $s3, $zero, 0x1
/* 2E210 8003DA10 8800A88F */  lw         $t0, 0x88($sp)
/* 2E214 8003DA14 00000000 */  nop
/* 2E218 8003DA18 06000011 */  beqz       $t0, .L8003DA34
/* 2E21C 8003DA1C 21980000 */   addu      $s3, $zero, $zero
/* 2E220 8003DA20 21208002 */  addu       $a0, $s4, $zero
/* 2E224 8003DA24 B7F4000C */  jal        SCRIPT_RelativisticSpline
/* 2E228 8003DA28 21284002 */   addu      $a1, $s2, $zero
/* 2E22C 8003DA2C 97F60008 */  j          .L8003DA5C
/* 2E230 8003DA30 21106002 */   addu      $v0, $s3, $zero
.L8003DA34:
/* 2E234 8003DA34 00004296 */  lhu        $v0, 0x0($s2)
/* 2E238 8003DA38 00000000 */  nop
/* 2E23C 8003DA3C 5C0082A6 */  sh         $v0, 0x5C($s4)
/* 2E240 8003DA40 02004296 */  lhu        $v0, 0x2($s2)
/* 2E244 8003DA44 00000000 */  nop
/* 2E248 8003DA48 5E0082A6 */  sh         $v0, 0x5E($s4)
/* 2E24C 8003DA4C 04004296 */  lhu        $v0, 0x4($s2)
/* 2E250 8003DA50 00000000 */  nop
/* 2E254 8003DA54 600082A6 */  sh         $v0, 0x60($s4)
.L8003DA58:
/* 2E258 8003DA58 21106002 */  addu       $v0, $s3, $zero
.L8003DA5C:
/* 2E25C 8003DA5C 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 2E260 8003DA60 6800BE8F */  lw         $fp, 0x68($sp)
/* 2E264 8003DA64 6400B78F */  lw         $s7, 0x64($sp)
/* 2E268 8003DA68 6000B68F */  lw         $s6, 0x60($sp)
/* 2E26C 8003DA6C 5C00B58F */  lw         $s5, 0x5C($sp)
/* 2E270 8003DA70 5800B48F */  lw         $s4, 0x58($sp)
/* 2E274 8003DA74 5400B38F */  lw         $s3, 0x54($sp)
/* 2E278 8003DA78 5000B28F */  lw         $s2, 0x50($sp)
/* 2E27C 8003DA7C 4C00B18F */  lw         $s1, 0x4C($sp)
/* 2E280 8003DA80 4800B08F */  lw         $s0, 0x48($sp)
/* 2E284 8003DA84 0800E003 */  jr         $ra
/* 2E288 8003DA88 7000BD27 */   addiu     $sp, $sp, 0x70
.size SCRIPT_SplineProcess, . - SCRIPT_SplineProcess
