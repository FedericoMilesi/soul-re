.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFogColor
/* 4F7B8 8005EFB8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 4F7BC 8005EFBC 3000B0AF */  sw         $s0, 0x30($sp)
/* 4F7C0 8005EFC0 21808000 */  addu       $s0, $a0, $zero
/* 4F7C4 8005EFC4 3400B1AF */  sw         $s1, 0x34($sp)
/* 4F7C8 8005EFC8 3800BFAF */  sw         $ra, 0x38($sp)
/* 4F7CC 8005EFCC 3000A28C */  lw         $v0, 0x30($a1)
/* 4F7D0 8005EFD0 E8030324 */  addiu      $v1, $zero, 0x3E8
/* 4F7D4 8005EFD4 2800A2AF */  sw         $v0, 0x28($sp)
/* 4F7D8 8005EFD8 2800028E */  lw         $v0, 0x28($s0)
/* 4F7DC 8005EFDC D0BD8487 */  lh         $a0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4F7E0 8005EFE0 0800458C */  lw         $a1, 0x8($v0)
/* 4F7E4 8005EFE4 1A008310 */  beq        $a0, $v1, .L8005F050
/* 4F7E8 8005EFE8 2188C000 */   addu      $s1, $a2, $zero
/* 4F7EC 8005EFEC 6210033C */  lui        $v1, (0x10624DD3 >> 16)
/* 4F7F0 8005EFF0 D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* 4F7F4 8005EFF4 00130400 */  sll        $v0, $a0, 12
/* 4F7F8 8005EFF8 18004300 */  mult       $v0, $v1
/* 4F7FC 8005EFFC C3170200 */  sra        $v0, $v0, 31
/* 4F800 8005F000 10400000 */  mfhi       $t0
/* 4F804 8005F004 83190800 */  sra        $v1, $t0, 6
/* 4F808 8005F008 23306200 */  subu       $a2, $v1, $v0
/* 4F80C 8005F00C D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4F810 8005F010 01000224 */  addiu      $v0, $zero, 0x1
/* 4F814 8005F014 03006214 */  bne        $v1, $v0, .L8005F024
/* 4F818 8005F018 4000A424 */   addiu     $a0, $a1, 0x40
/* 4F81C 8005F01C 00100224 */  addiu      $v0, $zero, 0x1000
/* 4F820 8005F020 23304600 */  subu       $a2, $v0, $a2
.L8005F024:
/* 4F824 8005F024 3C00A524 */  addiu      $a1, $a1, 0x3C
/* 4F828 8005F028 00100724 */  addiu      $a3, $zero, 0x1000
/* 4F82C 8005F02C 2338E600 */  subu       $a3, $a3, $a2
/* 4F830 8005F030 1800A227 */  addiu      $v0, $sp, 0x18
/* 4F834 8005F034 A8F3020C */  jal        LoadAverageCol
/* 4F838 8005F038 1000A2AF */   sw        $v0, 0x10($sp)
/* 4F83C 8005F03C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 4F840 8005F040 1800A28F */  lw         $v0, 0x18($sp)
/* 4F844 8005F044 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 4F848 8005F048 1C7C0108 */  j          .L8005F070
/* 4F84C 8005F04C 24104300 */   and       $v0, $v0, $v1
.L8005F050:
/* 4F850 8005F050 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4F854 8005F054 01000224 */  addiu      $v0, $zero, 0x1
/* 4F858 8005F058 04006214 */  bne        $v1, $v0, .L8005F06C
/* 4F85C 8005F05C 00000000 */   nop
/* 4F860 8005F060 4000A28C */  lw         $v0, 0x40($a1)
/* 4F864 8005F064 1E7C0108 */  j          .L8005F078
/* 4F868 8005F068 1800A2AF */   sw        $v0, 0x18($sp)
.L8005F06C:
/* 4F86C 8005F06C 3C00A28C */  lw         $v0, 0x3C($a1)
.L8005F070:
/* 4F870 8005F070 00000000 */  nop
/* 4F874 8005F074 1800A2AF */  sw         $v0, 0x18($sp)
.L8005F078:
/* 4F878 8005F078 2C000426 */  addiu      $a0, $s0, 0x2C
/* 4F87C 8005F07C 34000326 */  addiu      $v1, $s0, 0x34
/* 4F880 8005F080 3C000226 */  addiu      $v0, $s0, 0x3C
/* 4F884 8005F084 000080C8 */  lwc2       $0, 0x0($a0)
/* 4F888 8005F088 040081C8 */  lwc2       $1, 0x4($a0)
/* 4F88C 8005F08C 000062C8 */  lwc2       $2, 0x0($v1)
/* 4F890 8005F090 040063C8 */  lwc2       $3, 0x4($v1)
/* 4F894 8005F094 000044C8 */  lwc2       $4, 0x0($v0)
/* 4F898 8005F098 040045C8 */  lwc2       $5, 0x4($v0)
/* 4F89C 8005F09C 00000000 */  nop
/* 4F8A0 8005F0A0 00000000 */  nop
/* 4F8A4 8005F0A4 3000284A */  RTPT
/* 4F8A8 8005F0A8 1C00A427 */  addiu      $a0, $sp, 0x1C
/* 4F8AC 8005F0AC 2000A327 */  addiu      $v1, $sp, 0x20
/* 4F8B0 8005F0B0 2400A227 */  addiu      $v0, $sp, 0x24
/* 4F8B4 8005F0B4 000091E8 */  swc2       $17, 0x0($a0)
/* 4F8B8 8005F0B8 000072E8 */  swc2       $18, 0x0($v1)
/* 4F8BC 8005F0BC 000053E8 */  swc2       $19, 0x0($v0)
/* 4F8C0 8005F0C0 1C00A48F */  lw         $a0, 0x1C($sp)
/* 4F8C4 8005F0C4 2000A38F */  lw         $v1, 0x20($sp)
/* 4F8C8 8005F0C8 00000000 */  nop
/* 4F8CC 8005F0CC 2A106400 */  slt        $v0, $v1, $a0
/* 4F8D0 8005F0D0 08004010 */  beqz       $v0, .L8005F0F4
/* 4F8D4 8005F0D4 00000000 */   nop
/* 4F8D8 8005F0D8 2400A58F */  lw         $a1, 0x24($sp)
/* 4F8DC 8005F0DC 00000000 */  nop
/* 4F8E0 8005F0E0 2A10A400 */  slt        $v0, $a1, $a0
/* 4F8E4 8005F0E4 09004010 */  beqz       $v0, .L8005F10C
/* 4F8E8 8005F0E8 00000000 */   nop
/* 4F8EC 8005F0EC 437C0108 */  j          .L8005F10C
/* 4F8F0 8005F0F0 21288000 */   addu      $a1, $a0, $zero
.L8005F0F4:
/* 4F8F4 8005F0F4 2400A58F */  lw         $a1, 0x24($sp)
/* 4F8F8 8005F0F8 00000000 */  nop
/* 4F8FC 8005F0FC 2A10A300 */  slt        $v0, $a1, $v1
/* 4F900 8005F100 03004010 */  beqz       $v0, .L8005F110
/* 4F904 8005F104 44000426 */   addiu     $a0, $s0, 0x44
/* 4F908 8005F108 21286000 */  addu       $a1, $v1, $zero
.L8005F10C:
/* 4F90C 8005F10C 44000426 */  addiu      $a0, $s0, 0x44
.L8005F110:
/* 4F910 8005F110 4C000326 */  addiu      $v1, $s0, 0x4C
/* 4F914 8005F114 54000226 */  addiu      $v0, $s0, 0x54
/* 4F918 8005F118 000080C8 */  lwc2       $0, 0x0($a0)
/* 4F91C 8005F11C 040081C8 */  lwc2       $1, 0x4($a0)
/* 4F920 8005F120 000062C8 */  lwc2       $2, 0x0($v1)
/* 4F924 8005F124 040063C8 */  lwc2       $3, 0x4($v1)
/* 4F928 8005F128 000044C8 */  lwc2       $4, 0x0($v0)
/* 4F92C 8005F12C 040045C8 */  lwc2       $5, 0x4($v0)
/* 4F930 8005F130 00000000 */  nop
/* 4F934 8005F134 00000000 */  nop
/* 4F938 8005F138 3000284A */  RTPT
/* 4F93C 8005F13C 1C00A427 */  addiu      $a0, $sp, 0x1C
/* 4F940 8005F140 2000A327 */  addiu      $v1, $sp, 0x20
/* 4F944 8005F144 2400A227 */  addiu      $v0, $sp, 0x24
/* 4F948 8005F148 000091E8 */  swc2       $17, 0x0($a0)
/* 4F94C 8005F14C 000072E8 */  swc2       $18, 0x0($v1)
/* 4F950 8005F150 000053E8 */  swc2       $19, 0x0($v0)
/* 4F954 8005F154 1C00A68F */  lw         $a2, 0x1C($sp)
/* 4F958 8005F158 2000A48F */  lw         $a0, 0x20($sp)
/* 4F95C 8005F15C 00000000 */  nop
/* 4F960 8005F160 2A108600 */  slt        $v0, $a0, $a2
/* 4F964 8005F164 08004010 */  beqz       $v0, .L8005F188
/* 4F968 8005F168 00000000 */   nop
/* 4F96C 8005F16C 2400A38F */  lw         $v1, 0x24($sp)
/* 4F970 8005F170 00000000 */  nop
/* 4F974 8005F174 2A106600 */  slt        $v0, $v1, $a2
/* 4F978 8005F178 0A004010 */  beqz       $v0, .L8005F1A4
/* 4F97C 8005F17C 2A10A300 */   slt       $v0, $a1, $v1
/* 4F980 8005F180 687C0108 */  j          .L8005F1A0
/* 4F984 8005F184 2118C000 */   addu      $v1, $a2, $zero
.L8005F188:
/* 4F988 8005F188 2400A38F */  lw         $v1, 0x24($sp)
/* 4F98C 8005F18C 00000000 */  nop
/* 4F990 8005F190 2A106400 */  slt        $v0, $v1, $a0
/* 4F994 8005F194 03004010 */  beqz       $v0, .L8005F1A4
/* 4F998 8005F198 2A10A300 */   slt       $v0, $a1, $v1
/* 4F99C 8005F19C 21188000 */  addu       $v1, $a0, $zero
.L8005F1A0:
/* 4F9A0 8005F1A0 2A10A300 */  slt        $v0, $a1, $v1
.L8005F1A4:
/* 4F9A4 8005F1A4 02004010 */  beqz       $v0, .L8005F1B0
/* 4F9A8 8005F1A8 00000000 */   nop
/* 4F9AC 8005F1AC 21286000 */  addu       $a1, $v1, $zero
.L8005F1B0:
/* 4F9B0 8005F1B0 44002396 */  lhu        $v1, 0x44($s1)
/* 4F9B4 8005F1B4 8000A524 */  addiu      $a1, $a1, 0x80
/* 4F9B8 8005F1B8 2A10A300 */  slt        $v0, $a1, $v1
/* 4F9BC 8005F1BC 02004010 */  beqz       $v0, .L8005F1C8
/* 4F9C0 8005F1C0 00000000 */   nop
/* 4F9C4 8005F1C4 2118A000 */  addu       $v1, $a1, $zero
.L8005F1C8:
/* 4F9C8 8005F1C8 21286000 */  addu       $a1, $v1, $zero
/* 4F9CC 8005F1CC 1800A48F */  lw         $a0, 0x18($sp)
/* 4F9D0 8005F1D0 2800A38F */  lw         $v1, 0x28($sp)
/* 4F9D4 8005F1D4 83100500 */  sra        $v0, $a1, 2
/* 4F9D8 8005F1D8 14C782AF */  sw         $v0, %gp_rel(s_zval)($gp)
/* 4F9DC 8005F1DC 0C006414 */  bne        $v1, $a0, .L8005F210
/* 4F9E0 8005F1E0 F8FF023C */   lui       $v0, (0xFFF8F8F8 >> 16)
/* 4F9E4 8005F1E4 F8F84234 */  ori        $v0, $v0, (0xFFF8F8F8 & 0xFFFF)
/* 4F9E8 8005F1E8 24188200 */  and        $v1, $a0, $v0
/* 4F9EC 8005F1EC 05006010 */  beqz       $v1, .L8005F204
/* 4F9F0 8005F1F0 2C00A3AF */   sw        $v1, 0x2C($sp)
/* 4F9F4 8005F1F4 0400023C */  lui        $v0, (0x40404 >> 16)
/* 4F9F8 8005F1F8 04044234 */  ori        $v0, $v0, (0x40404 & 0xFFFF)
/* 4F9FC 8005F1FC 25106200 */  or         $v0, $v1, $v0
/* 4FA00 8005F200 2C00A2AF */  sw         $v0, 0x2C($sp)
.L8005F204:
/* 4FA04 8005F204 2C00A28F */  lw         $v0, 0x2C($sp)
/* 4FA08 8005F208 B27C0108 */  j          .L8005F2C8
/* 4FA0C 8005F20C 00000000 */   nop
.L8005F210:
/* 4FA10 8005F210 46002696 */  lhu        $a2, 0x46($s1)
/* 4FA14 8005F214 00000000 */  nop
/* 4FA18 8005F218 2328A600 */  subu       $a1, $a1, $a2
/* 4FA1C 8005F21C 0300A104 */  bgez       $a1, .L8005F22C
/* 4FA20 8005F220 001C0500 */   sll       $v1, $a1, 16
/* 4FA24 8005F224 B27C0108 */  j          .L8005F2C8
/* 4FA28 8005F228 21108000 */   addu      $v0, $a0, $zero
.L8005F22C:
/* 4FA2C 8005F22C 44002296 */  lhu        $v0, 0x44($s1)
/* 4FA30 8005F230 00000000 */  nop
/* 4FA34 8005F234 23104600 */  subu       $v0, $v0, $a2
/* 4FA38 8005F238 1A006200 */  div        $zero, $v1, $v0
/* 4FA3C 8005F23C 12800000 */  mflo       $s0
/* 4FA40 8005F240 00000000 */  nop
/* 4FA44 8005F244 03811000 */  sra        $s0, $s0, 4
/* 4FA48 8005F248 03000106 */  bgez       $s0, .L8005F258
/* 4FA4C 8005F24C 0110022A */   slti      $v0, $s0, 0x1001
/* 4FA50 8005F250 21800000 */  addu       $s0, $zero, $zero
/* 4FA54 8005F254 0110022A */  slti       $v0, $s0, 0x1001
.L8005F258:
/* 4FA58 8005F258 02004014 */  bnez       $v0, .L8005F264
/* 4FA5C 8005F25C 2C00A227 */   addiu     $v0, $sp, 0x2C
/* 4FA60 8005F260 00101024 */  addiu      $s0, $zero, 0x1000
.L8005F264:
/* 4FA64 8005F264 1000A2AF */  sw         $v0, 0x10($sp)
/* 4FA68 8005F268 2800A427 */  addiu      $a0, $sp, 0x28
/* 4FA6C 8005F26C 1800A527 */  addiu      $a1, $sp, 0x18
/* 4FA70 8005F270 21300002 */  addu       $a2, $s0, $zero
/* 4FA74 8005F274 00100724 */  addiu      $a3, $zero, 0x1000
/* 4FA78 8005F278 A8F3020C */  jal        LoadAverageCol
/* 4FA7C 8005F27C 2338F000 */   subu      $a3, $a3, $s0
/* 4FA80 8005F280 FB0F022A */  slti       $v0, $s0, 0xFFB
/* 4FA84 8005F284 0C004014 */  bnez       $v0, .L8005F2B8
/* 4FA88 8005F288 FF00033C */   lui       $v1, (0xFFFFFF >> 16)
/* 4FA8C 8005F28C F8FF033C */  lui        $v1, (0xFFF8F8F8 >> 16)
/* 4FA90 8005F290 2C00A28F */  lw         $v0, 0x2C($sp)
/* 4FA94 8005F294 F8F86334 */  ori        $v1, $v1, (0xFFF8F8F8 & 0xFFFF)
/* 4FA98 8005F298 24184300 */  and        $v1, $v0, $v1
/* 4FA9C 8005F29C 05006010 */  beqz       $v1, .L8005F2B4
/* 4FAA0 8005F2A0 2C00A3AF */   sw        $v1, 0x2C($sp)
/* 4FAA4 8005F2A4 0400023C */  lui        $v0, (0x40404 >> 16)
/* 4FAA8 8005F2A8 04044234 */  ori        $v0, $v0, (0x40404 & 0xFFFF)
/* 4FAAC 8005F2AC 25106200 */  or         $v0, $v1, $v0
/* 4FAB0 8005F2B0 2C00A2AF */  sw         $v0, 0x2C($sp)
.L8005F2B4:
/* 4FAB4 8005F2B4 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
.L8005F2B8:
/* 4FAB8 8005F2B8 2C00A28F */  lw         $v0, 0x2C($sp)
/* 4FABC 8005F2BC FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 4FAC0 8005F2C0 24104300 */  and        $v0, $v0, $v1
/* 4FAC4 8005F2C4 2C00A2AF */  sw         $v0, 0x2C($sp)
.L8005F2C8:
/* 4FAC8 8005F2C8 3800BF8F */  lw         $ra, 0x38($sp)
/* 4FACC 8005F2CC 3400B18F */  lw         $s1, 0x34($sp)
/* 4FAD0 8005F2D0 3000B08F */  lw         $s0, 0x30($sp)
/* 4FAD4 8005F2D4 0800E003 */  jr         $ra
/* 4FAD8 8005F2D8 4000BD27 */   addiu     $sp, $sp, 0x40
.size GetFogColor, . - GetFogColor
