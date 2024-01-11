.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawRing2
/* 3F030 8004E830 78FFBD27 */  addiu      $sp, $sp, -0x88
/* 3F034 8004E834 7C00B7AF */  sw         $s7, 0x7C($sp)
/* 3F038 8004E838 AC00B78F */  lw         $s7, 0xAC($sp)
/* 3F03C 8004E83C 9CBF888F */  lw         $t0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 3F040 8004E840 6000B0AF */  sw         $s0, 0x60($sp)
/* 3F044 8004E844 21808000 */  addu       $s0, $a0, $zero
/* 3F048 8004E848 6400B1AF */  sw         $s1, 0x64($sp)
/* 3F04C 8004E84C 2188A000 */  addu       $s1, $a1, $zero
/* 3F050 8004E850 6C00B3AF */  sw         $s3, 0x6C($sp)
/* 3F054 8004E854 2198C000 */  addu       $s3, $a2, $zero
/* 3F058 8004E858 8000BEAF */  sw         $fp, 0x80($sp)
/* 3F05C 8004E85C 21F00000 */  addu       $fp, $zero, $zero
/* 3F060 8004E860 7000B4AF */  sw         $s4, 0x70($sp)
/* 3F064 8004E864 20001424 */  addiu      $s4, $zero, 0x20
/* 3F068 8004E868 9400A7AF */  sw         $a3, 0x94($sp)
/* 3F06C 8004E86C 7800E228 */  slti       $v0, $a3, 0x78
/* 3F070 8004E870 8400BFAF */  sw         $ra, 0x84($sp)
/* 3F074 8004E874 7800B6AF */  sw         $s6, 0x78($sp)
/* 3F078 8004E878 7400B5AF */  sw         $s5, 0x74($sp)
/* 3F07C 8004E87C 6800B2AF */  sw         $s2, 0x68($sp)
/* 3F080 8004E880 02004010 */  beqz       $v0, .L8004E88C
/* 3F084 8004E884 4C00A8AF */   sw        $t0, 0x4C($sp)
/* 3F088 8004E888 08001424 */  addiu      $s4, $zero, 0x8
.L8004E88C:
/* 3F08C 8004E88C 80181400 */  sll        $v1, $s4, 2
/* 3F090 8004E890 21187400 */  addu       $v1, $v1, $s4
/* 3F094 8004E894 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3F098 8004E898 C0180300 */  sll        $v1, $v1, 3
/* 3F09C 8004E89C 0400528C */  lw         $s2, 0x4($v0)
/* 3F0A0 8004E8A0 0800428C */  lw         $v0, 0x8($v0)
/* 3F0A4 8004E8A4 21184302 */  addu       $v1, $s2, $v1
/* 3F0A8 8004E8A8 2B186200 */  sltu       $v1, $v1, $v0
/* 3F0AC 8004E8AC CA006010 */  beqz       $v1, .L8004EBD8
/* 3F0B0 8004E8B0 00000000 */   nop
/* 3F0B4 8004E8B4 CDFD020C */  jal        func_800BF734
/* 3F0B8 8004E8B8 00000000 */   nop
/* 3F0BC 8004E8BC 52F2020C */  jal        func_800BC948
/* 3F0C0 8004E8C0 21200002 */   addu      $a0, $s0, $zero
/* 3F0C4 8004E8C4 4AF2020C */  jal        func_800BC928
/* 3F0C8 8004E8C8 21200002 */   addu      $a0, $s0, $zero
/* 3F0CC 8004E8CC 3A39010C */  jal        fx_get_startz
/* 3F0D0 8004E8D0 21202002 */   addu      $a0, $s1, $zero
/* 3F0D4 8004E8D4 21206002 */  addu       $a0, $s3, $zero
/* 3F0D8 8004E8D8 52F2020C */  jal        func_800BC948
/* 3F0DC 8004E8DC 5000A2AF */   sw        $v0, 0x50($sp)
/* 3F0E0 8004E8E0 1800A427 */  addiu      $a0, $sp, 0x18
/* 3F0E4 8004E8E4 9400A68F */  lw         $a2, 0x94($sp)
/* 3F0E8 8004E8E8 CCBD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x4)($gp)
/* 3F0EC 8004E8EC 9800A78F */  lw         $a3, 0x98($sp)
/* 3F0F0 8004E8F0 A000A28F */  lw         $v0, 0xA0($sp)
/* 3F0F4 8004E8F4 9C00A88F */  lw         $t0, 0x9C($sp)
/* 3F0F8 8004E8F8 21280000 */  addu       $a1, $zero, $zero
/* 3F0FC 8004E8FC 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 3F100 8004E900 A400A28F */  lw         $v0, 0xA4($sp)
/* 3F104 8004E904 01006338 */  xori       $v1, $v1, 0x1
/* 3F108 8004E908 2400A2A7 */  sh         $v0, 0x24($sp)
/* 3F10C 8004E90C A800A28F */  lw         $v0, 0xA8($sp)
/* 3F110 8004E910 00820300 */  sll        $s0, $v1, 8
/* 3F114 8004E914 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* 3F118 8004E918 F638010C */  jal        fx_calc_points
/* 3F11C 8004E91C 1000A8AF */   sw        $t0, 0x10($sp)
/* 3F120 8004E920 3000A427 */  addiu      $a0, $sp, 0x30
/* 3F124 8004E924 3400A327 */  addiu      $v1, $sp, 0x34
/* 3F128 8004E928 3800A227 */  addiu      $v0, $sp, 0x38
/* 3F12C 8004E92C 00008CE8 */  swc2       $12, 0x0($a0)
/* 3F130 8004E930 00006DE8 */  swc2       $13, 0x0($v1)
/* 3F134 8004E934 00004EE8 */  swc2       $14, 0x0($v0)
/* 3F138 8004E938 00100224 */  addiu      $v0, $zero, 0x1000
/* 3F13C 8004E93C 1A005400 */  div        $zero, $v0, $s4
/* 3F140 8004E940 12400000 */  mflo       $t0
/* 3F144 8004E944 21980000 */  addu       $s3, $zero, $zero
/* 3F148 8004E948 A0008012 */  beqz       $s4, .L8004EBCC
/* 3F14C 8004E94C 5400A8AF */   sw        $t0, 0x54($sp)
/* 3F150 8004E950 00010232 */  andi       $v0, $s0, 0x100
/* 3F154 8004E954 03B10200 */  sra        $s6, $v0, 4
/* 3F158 8004E958 0001C336 */  ori        $v1, $s6, 0x100
/* 3F15C 8004E95C 00020232 */  andi       $v0, $s0, 0x200
/* 3F160 8004E960 80A80200 */  sll        $s5, $v0, 2
/* 3F164 8004E964 25187500 */  or         $v1, $v1, $s5
/* 3F168 8004E968 5800A3AF */  sw         $v1, 0x58($sp)
/* 3F16C 8004E96C 24005126 */  addiu      $s1, $s2, 0x24
/* 3F170 8004E970 1800A427 */  addiu      $a0, $sp, 0x18
.L8004E974:
/* 3F174 8004E974 5400A88F */  lw         $t0, 0x54($sp)
/* 3F178 8004E978 9400A68F */  lw         $a2, 0x94($sp)
/* 3F17C 8004E97C 9800A78F */  lw         $a3, 0x98($sp)
/* 3F180 8004E980 21F0C803 */  addu       $fp, $fp, $t0
/* 3F184 8004E984 9C00A88F */  lw         $t0, 0x9C($sp)
/* 3F188 8004E988 2128C003 */  addu       $a1, $fp, $zero
/* 3F18C 8004E98C F638010C */  jal        fx_calc_points
/* 3F190 8004E990 1000A8AF */   sw        $t0, 0x10($sp)
/* 3F194 8004E994 C02D023C */  lui        $v0, (0x2DC0C0C0 >> 16)
/* 3F198 8004E998 C0C04234 */  ori        $v0, $v0, (0x2DC0C0C0 & 0xFFFF)
/* 3F19C 8004E99C E0FF22AE */  sw         $v0, -0x20($s1)
/* 3F1A0 8004E9A0 3800A28F */  lw         $v0, 0x38($sp)
/* 3F1A4 8004E9A4 00000000 */  nop
/* 3F1A8 8004E9A8 E4FF22AE */  sw         $v0, -0x1C($s1)
/* 3F1AC 8004E9AC 3000A28F */  lw         $v0, 0x30($sp)
/* 3F1B0 8004E9B0 00000000 */  nop
/* 3F1B4 8004E9B4 F4FF22AE */  sw         $v0, -0xC($s1)
/* 3F1B8 8004E9B8 3800A287 */  lh         $v0, 0x38($sp)
/* 3F1BC 8004E9BC 3000A387 */  lh         $v1, 0x30($sp)
/* 3F1C0 8004E9C0 3000B097 */  lhu        $s0, 0x30($sp)
/* 3F1C4 8004E9C4 2A104300 */  slt        $v0, $v0, $v1
/* 3F1C8 8004E9C8 3800A397 */  lhu        $v1, 0x38($sp)
/* 3F1CC 8004E9CC 02004010 */  beqz       $v0, .L8004E9D8
/* 3F1D0 8004E9D0 3000A427 */   addiu     $a0, $sp, 0x30
/* 3F1D4 8004E9D4 21806000 */  addu       $s0, $v1, $zero
.L8004E9D8:
/* 3F1D8 8004E9D8 3400A327 */  addiu      $v1, $sp, 0x34
/* 3F1DC 8004E9DC 3800A227 */  addiu      $v0, $sp, 0x38
/* 3F1E0 8004E9E0 00008CE8 */  swc2       $12, 0x0($a0)
/* 3F1E4 8004E9E4 00006DE8 */  swc2       $13, 0x0($v1)
/* 3F1E8 8004E9E8 00004EE8 */  swc2       $14, 0x0($v0)
/* 3F1EC 8004E9EC 4000A427 */  addiu      $a0, $sp, 0x40
/* 3F1F0 8004E9F0 4400A327 */  addiu      $v1, $sp, 0x44
/* 3F1F4 8004E9F4 4800A227 */  addiu      $v0, $sp, 0x48
/* 3F1F8 8004E9F8 000091E8 */  swc2       $17, 0x0($a0)
/* 3F1FC 8004E9FC 000072E8 */  swc2       $18, 0x0($v1)
/* 3F200 8004EA00 000053E8 */  swc2       $19, 0x0($v0)
/* 3F204 8004EA04 3800A28F */  lw         $v0, 0x38($sp)
/* 3F208 8004EA08 00000000 */  nop
/* 3F20C 8004EA0C ECFF22AE */  sw         $v0, -0x14($s1)
/* 3F210 8004EA10 3000A28F */  lw         $v0, 0x30($sp)
/* 3F214 8004EA14 00000000 */  nop
/* 3F218 8004EA18 FCFF22AE */  sw         $v0, -0x4($s1)
/* 3F21C 8004EA1C 00141000 */  sll        $v0, $s0, 16
/* 3F220 8004EA20 3800A387 */  lh         $v1, 0x38($sp)
/* 3F224 8004EA24 03140200 */  sra        $v0, $v0, 16
/* 3F228 8004EA28 2A186200 */  slt        $v1, $v1, $v0
/* 3F22C 8004EA2C 3800A297 */  lhu        $v0, 0x38($sp)
/* 3F230 8004EA30 02006010 */  beqz       $v1, .L8004EA3C
/* 3F234 8004EA34 00000000 */   nop
/* 3F238 8004EA38 21804000 */  addu       $s0, $v0, $zero
.L8004EA3C:
/* 3F23C 8004EA3C 00141000 */  sll        $v0, $s0, 16
/* 3F240 8004EA40 3000A387 */  lh         $v1, 0x30($sp)
/* 3F244 8004EA44 03140200 */  sra        $v0, $v0, 16
/* 3F248 8004EA48 2A186200 */  slt        $v1, $v1, $v0
/* 3F24C 8004EA4C 3000A297 */  lhu        $v0, 0x30($sp)
/* 3F250 8004EA50 02006010 */  beqz       $v1, .L8004EA5C
/* 3F254 8004EA54 00000000 */   nop
/* 3F258 8004EA58 21804000 */  addu       $s0, $v0, $zero
.L8004EA5C:
/* 3F25C 8004EA5C C0FF0224 */  addiu      $v0, $zero, -0x40
/* 3F260 8004EA60 24200202 */  and        $a0, $s0, $v0
/* 3F264 8004EA64 00140400 */  sll        $v0, $a0, 16
/* 3F268 8004EA68 031C0200 */  sra        $v1, $v0, 16
/* 3F26C 8004EA6C C1FF6228 */  slti       $v0, $v1, -0x3F
/* 3F270 8004EA70 04004010 */  beqz       $v0, .L8004EA84
/* 3F274 8004EA74 21808000 */   addu      $s0, $a0, $zero
/* 3F278 8004EA78 5800A897 */  lhu        $t0, 0x58($sp)
/* 3F27C 8004EA7C AC3A0108 */  j          .L8004EAB0
/* 3F280 8004EA80 F2FF28A6 */   sh        $t0, -0xE($s1)
.L8004EA84:
/* 3F284 8004EA84 04006104 */  bgez       $v1, .L8004EA98
/* 3F288 8004EA88 00046224 */   addiu     $v0, $v1, 0x400
/* 3F28C 8004EA8C FF034230 */  andi       $v0, $v0, 0x3FF
/* 3F290 8004EA90 A83A0108 */  j          .L8004EAA0
/* 3F294 8004EA94 83110200 */   sra       $v0, $v0, 6
.L8004EA98:
/* 3F298 8004EA98 FF038230 */  andi       $v0, $a0, 0x3FF
/* 3F29C 8004EA9C 82110200 */  srl        $v0, $v0, 6
.L8004EAA0:
/* 3F2A0 8004EAA0 00014234 */  ori        $v0, $v0, 0x100
/* 3F2A4 8004EAA4 2510C202 */  or         $v0, $s6, $v0
/* 3F2A8 8004EAA8 25105500 */  or         $v0, $v0, $s5
/* 3F2AC 8004EAAC F2FF22A6 */  sh         $v0, -0xE($s1)
.L8004EAB0:
/* 3F2B0 8004EAB0 08004426 */  addiu      $a0, $s2, 0x8
/* 3F2B4 8004EAB4 0C004526 */  addiu      $a1, $s2, 0xC
/* 3F2B8 8004EAB8 00841000 */  sll        $s0, $s0, 16
/* 3F2BC 8004EABC 03841000 */  sra        $s0, $s0, 16
/* 3F2C0 8004EAC0 21300002 */  addu       $a2, $s0, $zero
/* 3F2C4 8004EAC4 FB39010C */  jal        fx_setTex
/* 3F2C8 8004EAC8 2138E002 */   addu      $a3, $s7, $zero
/* 3F2CC 8004EACC 10004426 */  addiu      $a0, $s2, 0x10
/* 3F2D0 8004EAD0 14004526 */  addiu      $a1, $s2, 0x14
/* 3F2D4 8004EAD4 21300002 */  addu       $a2, $s0, $zero
/* 3F2D8 8004EAD8 FB39010C */  jal        fx_setTex
/* 3F2DC 8004EADC 2138E002 */   addu      $a3, $s7, $zero
/* 3F2E0 8004EAE0 18004426 */  addiu      $a0, $s2, 0x18
/* 3F2E4 8004EAE4 1C004526 */  addiu      $a1, $s2, 0x1C
/* 3F2E8 8004EAE8 21300002 */  addu       $a2, $s0, $zero
/* 3F2EC 8004EAEC FB39010C */  jal        fx_setTex
/* 3F2F0 8004EAF0 2138E002 */   addu      $a3, $s7, $zero
/* 3F2F4 8004EAF4 20004426 */  addiu      $a0, $s2, 0x20
/* 3F2F8 8004EAF8 21282002 */  addu       $a1, $s1, $zero
/* 3F2FC 8004EAFC 21300002 */  addu       $a2, $s0, $zero
/* 3F300 8004EB00 FB39010C */  jal        fx_setTex
/* 3F304 8004EB04 2138E002 */   addu      $a3, $s7, $zero
/* 3F308 8004EB08 4800A38F */  lw         $v1, 0x48($sp)
/* 3F30C 8004EB0C 4000A28F */  lw         $v0, 0x40($sp)
/* 3F310 8004EB10 00000000 */  nop
/* 3F314 8004EB14 2A106200 */  slt        $v0, $v1, $v0
/* 3F318 8004EB18 02004010 */  beqz       $v0, .L8004EB24
/* 3F31C 8004EB1C 00000000 */   nop
/* 3F320 8004EB20 4000A3AF */  sw         $v1, 0x40($sp)
.L8004EB24:
/* 3F324 8004EB24 4000A28F */  lw         $v0, 0x40($sp)
/* 3F328 8004EB28 00000000 */  nop
/* 3F32C 8004EB2C 02004104 */  bgez       $v0, .L8004EB38
/* 3F330 8004EB30 00000000 */   nop
/* 3F334 8004EB34 03004224 */  addiu      $v0, $v0, 0x3
.L8004EB38:
/* 3F338 8004EB38 83100200 */  sra        $v0, $v0, 2
/* 3F33C 8004EB3C 1F004018 */  blez       $v0, .L8004EBBC
/* 3F340 8004EB40 4000A2AF */   sw        $v0, 0x40($sp)
/* 3F344 8004EB44 B000A88F */  lw         $t0, 0xB0($sp)
/* 3F348 8004EB48 00000000 */  nop
/* 3F34C 8004EB4C 08000015 */  bnez       $t0, .L8004EB70
/* 3F350 8004EB50 00000000 */   nop
/* 3F354 8004EB54 5000A88F */  lw         $t0, 0x50($sp)
/* 3F358 8004EB58 00000000 */  nop
/* 3F35C 8004EB5C 2A100201 */  slt        $v0, $t0, $v0
/* 3F360 8004EB60 02004014 */  bnez       $v0, .L8004EB6C
/* 3F364 8004EB64 10000225 */   addiu     $v0, $t0, 0x10
/* 3F368 8004EB68 01000224 */  addiu      $v0, $zero, 0x1
.L8004EB6C:
/* 3F36C 8004EB6C 4000A2AF */  sw         $v0, 0x40($sp)
.L8004EB70:
/* 3F370 8004EB70 4000A48F */  lw         $a0, 0x40($sp)
/* 3F374 8004EB74 00000000 */  nop
/* 3F378 8004EB78 FFFF8224 */  addiu      $v0, $a0, -0x1
/* 3F37C 8004EB7C FF0B422C */  sltiu      $v0, $v0, 0xBFF
/* 3F380 8004EB80 0E004010 */  beqz       $v0, .L8004EBBC
/* 3F384 8004EB84 FF00053C */   lui       $a1, (0xFFFFFF >> 16)
/* 3F388 8004EB88 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 3F38C 8004EB8C 80200400 */  sll        $a0, $a0, 2
/* 3F390 8004EB90 4C00A88F */  lw         $t0, 0x4C($sp)
/* 3F394 8004EB94 28003126 */  addiu      $s1, $s1, 0x28
/* 3F398 8004EB98 21208800 */  addu       $a0, $a0, $t0
/* 3F39C 8004EB9C 0000838C */  lw         $v1, 0x0($a0)
/* 3F3A0 8004EBA0 0009023C */  lui        $v0, (0x9000000 >> 16)
/* 3F3A4 8004EBA4 24186500 */  and        $v1, $v1, $a1
/* 3F3A8 8004EBA8 25186200 */  or         $v1, $v1, $v0
/* 3F3AC 8004EBAC 24284502 */  and        $a1, $s2, $a1
/* 3F3B0 8004EBB0 000043AE */  sw         $v1, 0x0($s2)
/* 3F3B4 8004EBB4 28005226 */  addiu      $s2, $s2, 0x28
/* 3F3B8 8004EBB8 000085AC */  sw         $a1, 0x0($a0)
.L8004EBBC:
/* 3F3BC 8004EBBC 01007326 */  addiu      $s3, $s3, 0x1
/* 3F3C0 8004EBC0 2A107402 */  slt        $v0, $s3, $s4
/* 3F3C4 8004EBC4 6BFF4014 */  bnez       $v0, .L8004E974
/* 3F3C8 8004EBC8 1800A427 */   addiu     $a0, $sp, 0x18
.L8004EBCC:
/* 3F3CC 8004EBCC 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3F3D0 8004EBD0 F6FD020C */  jal        func_800BF7D8
/* 3F3D4 8004EBD4 040052AC */   sw        $s2, 0x4($v0)
.L8004EBD8:
/* 3F3D8 8004EBD8 8400BF8F */  lw         $ra, 0x84($sp)
/* 3F3DC 8004EBDC 8000BE8F */  lw         $fp, 0x80($sp)
/* 3F3E0 8004EBE0 7C00B78F */  lw         $s7, 0x7C($sp)
/* 3F3E4 8004EBE4 7800B68F */  lw         $s6, 0x78($sp)
/* 3F3E8 8004EBE8 7400B58F */  lw         $s5, 0x74($sp)
/* 3F3EC 8004EBEC 7000B48F */  lw         $s4, 0x70($sp)
/* 3F3F0 8004EBF0 6C00B38F */  lw         $s3, 0x6C($sp)
/* 3F3F4 8004EBF4 6800B28F */  lw         $s2, 0x68($sp)
/* 3F3F8 8004EBF8 6400B18F */  lw         $s1, 0x64($sp)
/* 3F3FC 8004EBFC 6000B08F */  lw         $s0, 0x60($sp)
/* 3F400 8004EC00 0800E003 */  jr         $ra
/* 3F404 8004EC04 8800BD27 */   addiu     $sp, $sp, 0x88
.size FX_DrawRing2, . - FX_DrawRing2
