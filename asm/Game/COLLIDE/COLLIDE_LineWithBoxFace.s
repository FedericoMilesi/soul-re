.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_LineWithBoxFace
/* F82C 8001F02C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* F830 8001F030 3800A88F */  lw         $t0, 0x38($sp)
/* F834 8001F034 4000A98F */  lw         $t1, 0x40($sp)
/* F838 8001F038 2000B0AF */  sw         $s0, 0x20($sp)
/* F83C 8001F03C 4400B08F */  lw         $s0, 0x44($sp)
/* F840 8001F040 6100A010 */  beqz       $a1, .L8001F1C8
/* F844 8001F044 2400BFAF */   sw        $ra, 0x24($sp)
/* F848 8001F048 00140400 */  sll        $v0, $a0, 16
/* F84C 8001F04C 03140200 */  sra        $v0, $v0, 16
/* F850 8001F050 001C0600 */  sll        $v1, $a2, 16
/* F854 8001F054 031C0300 */  sra        $v1, $v1, 16
/* F858 8001F058 23104300 */  subu       $v0, $v0, $v1
/* F85C 8001F05C 00130200 */  sll        $v0, $v0, 12
/* F860 8001F060 23100200 */  negu       $v0, $v0
/* F864 8001F064 1A004500 */  div        $zero, $v0, $a1
/* F868 8001F068 12280000 */  mflo       $a1
/* F86C 8001F06C 00000000 */  nop
/* F870 8001F070 0110A22C */  sltiu      $v0, $a1, 0x1001
/* F874 8001F074 54004010 */  beqz       $v0, .L8001F1C8
/* F878 8001F078 1800A5AF */   sw        $a1, 0x18($sp)
/* F87C 8001F07C 0000028D */  lw         $v0, 0x0($t0)
/* F880 8001F080 00000000 */  nop
/* F884 8001F084 18004500 */  mult       $v0, $a1
/* F888 8001F088 0000E294 */  lhu        $v0, 0x0($a3)
/* F88C 8001F08C 12600000 */  mflo       $t4
/* F890 8001F090 031B0C00 */  sra        $v1, $t4, 12
/* F894 8001F094 21104300 */  addu       $v0, $v0, $v1
/* F898 8001F098 1000A2A7 */  sh         $v0, 0x10($sp)
/* F89C 8001F09C 0400028D */  lw         $v0, 0x4($t0)
/* F8A0 8001F0A0 00000000 */  nop
/* F8A4 8001F0A4 18004500 */  mult       $v0, $a1
/* F8A8 8001F0A8 0200E294 */  lhu        $v0, 0x2($a3)
/* F8AC 8001F0AC 12600000 */  mflo       $t4
/* F8B0 8001F0B0 031B0C00 */  sra        $v1, $t4, 12
/* F8B4 8001F0B4 21104300 */  addu       $v0, $v0, $v1
/* F8B8 8001F0B8 1200A2A7 */  sh         $v0, 0x12($sp)
/* F8BC 8001F0BC 0800028D */  lw         $v0, 0x8($t0)
/* F8C0 8001F0C0 00000000 */  nop
/* F8C4 8001F0C4 18004500 */  mult       $v0, $a1
/* F8C8 8001F0C8 1000A427 */  addiu      $a0, $sp, 0x10
/* F8CC 8001F0CC 0400E294 */  lhu        $v0, 0x4($a3)
/* F8D0 8001F0D0 3C00A58F */  lw         $a1, 0x3C($sp)
/* F8D4 8001F0D4 12600000 */  mflo       $t4
/* F8D8 8001F0D8 031B0C00 */  sra        $v1, $t4, 12
/* F8DC 8001F0DC 21104300 */  addu       $v0, $v0, $v1
/* F8E0 8001F0E0 09F82001 */  jalr       $t1
/* F8E4 8001F0E4 1400A2A7 */   sh        $v0, 0x14($sp)
/* F8E8 8001F0E8 37004010 */  beqz       $v0, .L8001F1C8
/* F8EC 8001F0EC 00000000 */   nop
/* F8F0 8001F0F0 1800AA8F */  lw         $t2, 0x18($sp)
/* F8F4 8001F0F4 68B18B8F */  lw         $t3, %gp_rel(collide_t0)($gp)
/* F8F8 8001F0F8 60B1868F */  lw         $a2, %gp_rel(collide_point0)($gp)
/* F8FC 8001F0FC 7CB1878F */  lw         $a3, %gp_rel(collide_normal0)($gp)
/* F900 8001F100 64B1858F */  lw         $a1, %gp_rel(collide_point1)($gp)
/* F904 8001F104 80B1888F */  lw         $t0, %gp_rel(collide_normal1)($gp)
/* F908 8001F108 2A104B01 */  slt        $v0, $t2, $t3
/* F90C 8001F10C 1C004010 */  beqz       $v0, .L8001F180
/* F910 8001F110 1000A927 */   addiu     $t1, $sp, 0x10
/* F914 8001F114 0000C294 */  lhu        $v0, 0x0($a2)
/* F918 8001F118 0200C394 */  lhu        $v1, 0x2($a2)
/* F91C 8001F11C 0400C494 */  lhu        $a0, 0x4($a2)
/* F920 8001F120 0000A2A4 */  sh         $v0, 0x0($a1)
/* F924 8001F124 0200A3A4 */  sh         $v1, 0x2($a1)
/* F928 8001F128 0400A4A4 */  sh         $a0, 0x4($a1)
/* F92C 8001F12C 0000E294 */  lhu        $v0, 0x0($a3)
/* F930 8001F130 0200E394 */  lhu        $v1, 0x2($a3)
/* F934 8001F134 0400E494 */  lhu        $a0, 0x4($a3)
/* F938 8001F138 000002A5 */  sh         $v0, 0x0($t0)
/* F93C 8001F13C 020003A5 */  sh         $v1, 0x2($t0)
/* F940 8001F140 040004A5 */  sh         $a0, 0x4($t0)
/* F944 8001F144 1000A297 */  lhu        $v0, 0x10($sp)
/* F948 8001F148 02002395 */  lhu        $v1, 0x2($t1)
/* F94C 8001F14C 04002495 */  lhu        $a0, 0x4($t1)
/* F950 8001F150 0000C2A4 */  sh         $v0, 0x0($a2)
/* F954 8001F154 0200C3A4 */  sh         $v1, 0x2($a2)
/* F958 8001F158 0400C4A4 */  sh         $a0, 0x4($a2)
/* F95C 8001F15C 00000296 */  lhu        $v0, 0x0($s0)
/* F960 8001F160 02000396 */  lhu        $v1, 0x2($s0)
/* F964 8001F164 04000496 */  lhu        $a0, 0x4($s0)
/* F968 8001F168 6CB18BAF */  sw         $t3, %gp_rel(collide_t1)($gp)
/* F96C 8001F16C 68B18AAF */  sw         $t2, %gp_rel(collide_t0)($gp)
/* F970 8001F170 0000E2A4 */  sh         $v0, 0x0($a3)
/* F974 8001F174 0200E3A4 */  sh         $v1, 0x2($a3)
/* F978 8001F178 727C0008 */  j          .L8001F1C8
/* F97C 8001F17C 0400E4A4 */   sh        $a0, 0x4($a3)
.L8001F180:
/* F980 8001F180 6CB1828F */  lw         $v0, %gp_rel(collide_t1)($gp)
/* F984 8001F184 00000000 */  nop
/* F988 8001F188 2A104201 */  slt        $v0, $t2, $v0
/* F98C 8001F18C 0E004010 */  beqz       $v0, .L8001F1C8
/* F990 8001F190 00000000 */   nop
/* F994 8001F194 1000A297 */  lhu        $v0, 0x10($sp)
/* F998 8001F198 02002395 */  lhu        $v1, 0x2($t1)
/* F99C 8001F19C 04002495 */  lhu        $a0, 0x4($t1)
/* F9A0 8001F1A0 0000A2A4 */  sh         $v0, 0x0($a1)
/* F9A4 8001F1A4 0200A3A4 */  sh         $v1, 0x2($a1)
/* F9A8 8001F1A8 0400A4A4 */  sh         $a0, 0x4($a1)
/* F9AC 8001F1AC 00000296 */  lhu        $v0, 0x0($s0)
/* F9B0 8001F1B0 02000396 */  lhu        $v1, 0x2($s0)
/* F9B4 8001F1B4 04000496 */  lhu        $a0, 0x4($s0)
/* F9B8 8001F1B8 6CB18AAF */  sw         $t2, %gp_rel(collide_t1)($gp)
/* F9BC 8001F1BC 000002A5 */  sh         $v0, 0x0($t0)
/* F9C0 8001F1C0 020003A5 */  sh         $v1, 0x2($t0)
/* F9C4 8001F1C4 040004A5 */  sh         $a0, 0x4($t0)
.L8001F1C8:
/* F9C8 8001F1C8 2400BF8F */  lw         $ra, 0x24($sp)
/* F9CC 8001F1CC 2000B08F */  lw         $s0, 0x20($sp)
/* F9D0 8001F1D0 0800E003 */  jr         $ra
/* F9D4 8001F1D4 2800BD27 */   addiu     $sp, $sp, 0x28
.size COLLIDE_LineWithBoxFace, . - COLLIDE_LineWithBoxFace
