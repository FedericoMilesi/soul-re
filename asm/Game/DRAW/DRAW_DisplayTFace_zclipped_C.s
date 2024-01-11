.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel DRAW_DisplayTFace_zclipped_C
/* 1C874 8002C074 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 1C878 8002C078 3800BEAF */  sw         $fp, 0x38($sp)
/* 1C87C 8002C07C 5800BE8F */  lw         $fp, 0x58($sp)
/* 1C880 8002C080 801F0A3C */  lui        $t2, (0x1F800200 >> 16)
/* 1C884 8002C084 2800B4AF */  sw         $s4, 0x28($sp)
/* 1C888 8002C088 6400B48F */  lw         $s4, 0x64($sp)
/* 1C88C 8002C08C 00024A35 */  ori        $t2, $t2, (0x1F800200 & 0xFFFF)
/* 1C890 8002C090 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 1C894 8002C094 3400B7AF */  sw         $s7, 0x34($sp)
/* 1C898 8002C098 3000B6AF */  sw         $s6, 0x30($sp)
/* 1C89C 8002C09C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 1C8A0 8002C0A0 2400B3AF */  sw         $s3, 0x24($sp)
/* 1C8A4 8002C0A4 2000B2AF */  sw         $s2, 0x20($sp)
/* 1C8A8 8002C0A8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 1C8AC 8002C0AC 1800B0AF */  sw         $s0, 0x18($sp)
/* 1C8B0 8002C0B0 4000A4AF */  sw         $a0, 0x40($sp)
/* 1C8B4 8002C0B4 4400A5AF */  sw         $a1, 0x44($sp)
/* 1C8B8 8002C0B8 4800A6AF */  sw         $a2, 0x48($sp)
/* 1C8BC 8002C0BC 4C00A7AF */  sw         $a3, 0x4C($sp)
/* 1C8C0 8002C0C0 000080C8 */  lwc2       $0, 0x0($a0)
/* 1C8C4 8002C0C4 040081C8 */  lwc2       $1, 0x4($a0)
/* 1C8C8 8002C0C8 00000000 */  nop
/* 1C8CC 8002C0CC 00000000 */  nop
/* 1C8D0 8002C0D0 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 1C8D4 8002C0D4 801F153C */  lui        $s5, (0x1F800278 >> 16)
/* 1C8D8 8002C0D8 7802B536 */  ori        $s5, $s5, (0x1F800278 & 0xFFFF)
/* 1C8DC 8002C0DC 0000B9EA */  swc2       $25, 0x0($s5)
/* 1C8E0 8002C0E0 0400BAEA */  swc2       $26, 0x4($s5) # handwritten instruction
/* 1C8E4 8002C0E4 0800BBEA */  swc2       $27, 0x8($s5) # handwritten instruction
/* 1C8E8 8002C0E8 4400B68F */  lw         $s6, 0x44($sp)
/* 1C8EC 8002C0EC 00000000 */  nop
/* 1C8F0 8002C0F0 0000C0CA */  lwc2       $0, 0x0($s6)
/* 1C8F4 8002C0F4 0400C1CA */  lwc2       $1, 0x4($s6)
/* 1C8F8 8002C0F8 00000000 */  nop
/* 1C8FC 8002C0FC 00000000 */  nop
/* 1C900 8002C100 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 1C904 8002C104 801F173C */  lui        $s7, (0x1F800284 >> 16)
/* 1C908 8002C108 8402F736 */  ori        $s7, $s7, (0x1F800284 & 0xFFFF)
/* 1C90C 8002C10C 0000F9EA */  swc2       $25, 0x0($s7)
/* 1C910 8002C110 0400FAEA */  swc2       $26, 0x4($s7) # handwritten instruction
/* 1C914 8002C114 0800FBEA */  swc2       $27, 0x8($s7) # handwritten instruction
/* 1C918 8002C118 4800B58F */  lw         $s5, 0x48($sp)
/* 1C91C 8002C11C 00000000 */  nop
/* 1C920 8002C120 0000A0CA */  lwc2       $0, 0x0($s5)
/* 1C924 8002C124 0400A1CA */  lwc2       $1, 0x4($s5)
/* 1C928 8002C128 00000000 */  nop
/* 1C92C 8002C12C 00000000 */  nop
/* 1C930 8002C130 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 1C934 8002C134 801F163C */  lui        $s6, (0x1F800290 >> 16)
/* 1C938 8002C138 9002D636 */  ori        $s6, $s6, (0x1F800290 & 0xFFFF)
/* 1C93C 8002C13C 0000D9EA */  swc2       $25, 0x0($s6)
/* 1C940 8002C140 0400DAEA */  swc2       $26, 0x4($s6) # handwritten instruction
/* 1C944 8002C144 0800DBEA */  swc2       $27, 0x8($s6) # handwritten instruction
/* 1C948 8002C148 8000428D */  lw         $v0, 0x80($t2)
/* 1C94C 8002C14C 00000000 */  nop
/* 1C950 8002C150 A0004228 */  slti       $v0, $v0, 0xA0
/* 1C954 8002C154 0C004010 */  beqz       $v0, .L8002C188
/* 1C958 8002C158 21280000 */   addu      $a1, $zero, $zero
/* 1C95C 8002C15C 8C00428D */  lw         $v0, 0x8C($t2)
/* 1C960 8002C160 00000000 */  nop
/* 1C964 8002C164 A0004228 */  slti       $v0, $v0, 0xA0
/* 1C968 8002C168 07004010 */  beqz       $v0, .L8002C188
/* 1C96C 8002C16C 00000000 */   nop
/* 1C970 8002C170 9800428D */  lw         $v0, 0x98($t2)
/* 1C974 8002C174 00000000 */  nop
/* 1C978 8002C178 A0004228 */  slti       $v0, $v0, 0xA0
/* 1C97C 8002C17C C1014014 */  bnez       $v0, .L8002C884
/* 1C980 8002C180 02000224 */   addiu     $v0, $zero, 0x2
/* 1C984 8002C184 21280000 */  addu       $a1, $zero, $zero
.L8002C188:
/* 1C988 8002C188 A0001324 */  addiu      $s3, $zero, 0xA0
/* 1C98C 8002C18C 4C00B78F */  lw         $s7, 0x4C($sp)
/* 1C990 8002C190 0400998E */  lw         $t9, 0x4($s4)
/* 1C994 8002C194 0000E28E */  lw         $v0, 0x0($s7)
/* 1C998 8002C198 FFFF1034 */  ori        $s0, $zero, 0xFFFF
/* 1C99C 8002C19C B80042AD */  sw         $v0, 0xB8($t2)
/* 1C9A0 8002C1A0 5000B58F */  lw         $s5, 0x50($sp)
/* 1C9A4 8002C1A4 2178A000 */  addu       $t7, $a1, $zero
/* 1C9A8 8002C1A8 0000A28E */  lw         $v0, 0x0($s5)
/* 1C9AC 8002C1AC 2190A000 */  addu       $s2, $a1, $zero
/* 1C9B0 8002C1B0 BC0042AD */  sw         $v0, 0xBC($t2)
/* 1C9B4 8002C1B4 5400B68F */  lw         $s6, 0x54($sp)
/* 1C9B8 8002C1B8 21384001 */  addu       $a3, $t2, $zero
/* 1C9BC 8002C1BC 0000C38E */  lw         $v1, 0x0($s6)
/* 1C9C0 8002C1C0 21884001 */  addu       $s1, $t2, $zero
/* 1C9C4 8002C1C4 A8005EAD */  sw         $fp, 0xA8($t2)
/* 1C9C8 8002C1C8 5C00A28F */  lw         $v0, 0x5C($sp)
/* 1C9CC 8002C1CC 04003827 */  addiu      $t8, $t9, 0x4
/* 1C9D0 8002C1D0 AC0042AD */  sw         $v0, 0xAC($t2)
/* 1C9D4 8002C1D4 6000A28F */  lw         $v0, 0x60($sp)
/* 1C9D8 8002C1D8 0A002B27 */  addiu      $t3, $t9, 0xA
/* 1C9DC 8002C1DC C00043AD */  sw         $v1, 0xC0($t2)
/* 1C9E0 8002C1E0 B00042AD */  sw         $v0, 0xB0($t2)
.L8002C1E4:
/* 1C9E4 8002C1E4 0100EE25 */  addiu      $t6, $t7, 0x1
/* 1C9E8 8002C1E8 0300C229 */  slti       $v0, $t6, 0x3
/* 1C9EC 8002C1EC 02004014 */  bnez       $v0, .L8002C1F8
/* 1C9F0 8002C1F0 00000000 */   nop
/* 1C9F4 8002C1F4 21700000 */  addu       $t6, $zero, $zero
.L8002C1F8:
/* 1C9F8 8002C1F8 40180E00 */  sll        $v1, $t6, 1
/* 1C9FC 8002C1FC 21186E00 */  addu       $v1, $v1, $t6
/* 1CA00 8002C200 80180300 */  sll        $v1, $v1, 2
/* 1CA04 8002C204 21184301 */  addu       $v1, $t2, $v1
/* 1CA08 8002C208 8000E28C */  lw         $v0, 0x80($a3)
/* 1CA0C 8002C20C 8000638C */  lw         $v1, 0x80($v1)
/* 1CA10 8002C210 A0004228 */  slti       $v0, $v0, 0xA0
/* 1CA14 8002C214 01004938 */  xori       $t1, $v0, 0x1
/* 1CA18 8002C218 A0006328 */  slti       $v1, $v1, 0xA0
/* 1CA1C 8002C21C 3A002011 */  beqz       $t1, .L8002C308
/* 1CA20 8002C220 01006338 */   xori      $v1, $v1, 0x1
/* 1CA24 8002C224 01000224 */  addiu      $v0, $zero, 0x1
/* 1CA28 8002C228 0800E211 */  beq        $t7, $v0, .L8002C24C
/* 1CA2C 8002C22C 0200E229 */   slti      $v0, $t7, 0x2
/* 1CA30 8002C230 03004014 */  bnez       $v0, .L8002C240
/* 1CA34 8002C234 02000224 */   addiu     $v0, $zero, 0x2
/* 1CA38 8002C238 0700E211 */  beq        $t7, $v0, .L8002C258
/* 1CA3C 8002C23C 00000000 */   nop
.L8002C240:
/* 1CA40 8002C240 4000A28F */  lw         $v0, 0x40($sp)
/* 1CA44 8002C244 97B00008 */  j          .L8002C25C
/* 1CA48 8002C248 00000000 */   nop
.L8002C24C:
/* 1CA4C 8002C24C 4400A28F */  lw         $v0, 0x44($sp)
/* 1CA50 8002C250 97B00008 */  j          .L8002C25C
/* 1CA54 8002C254 00000000 */   nop
.L8002C258:
/* 1CA58 8002C258 4800A28F */  lw         $v0, 0x48($sp)
.L8002C25C:
/* 1CA5C 8002C25C 00000000 */  nop
/* 1CA60 8002C260 000040C8 */  lwc2       $0, 0x0($v0)
/* 1CA64 8002C264 040041C8 */  lwc2       $1, 0x4($v0)
/* 1CA68 8002C268 00000000 */  nop
/* 1CA6C 8002C26C 00000000 */  nop
/* 1CA70 8002C270 0100184A */  RTPS
/* 1CA74 8002C274 B800228E */  lw         $v0, 0xB8($s1)
/* 1CA78 8002C278 00000000 */  nop
/* 1CA7C 8002C27C 020062AD */  sw         $v0, 0x2($t3)
/* 1CA80 8002C280 A800228E */  lw         $v0, 0xA8($s1)
/* 1CA84 8002C284 00000000 */  nop
/* 1CA88 8002C288 000002AF */  sw         $v0, 0x0($t8)
/* 1CA8C 8002C28C 04000227 */  addiu      $v0, $t8, 0x4
/* 1CA90 8002C290 00004EE8 */  swc2       $14, 0x0($v0)
/* 1CA94 8002C294 80100500 */  sll        $v0, $a1, 2
/* 1CA98 8002C298 C4004224 */  addiu      $v0, $v0, 0xC4
/* 1CA9C 8002C29C 21104201 */  addu       $v0, $t2, $v0
/* 1CAA0 8002C2A0 00004EE8 */  swc2       $14, 0x0($v0)
/* 1CAA4 8002C2A4 1000A227 */  addiu      $v0, $sp, 0x10
/* 1CAA8 8002C2A8 000053E8 */  swc2       $19, 0x0($v0)
/* 1CAAC 8002C2AC 1000A48F */  lw         $a0, 0x10($sp)
/* 1CAB0 8002C2B0 00000000 */  nop
/* 1CAB4 8002C2B4 2A106402 */  slt        $v0, $s3, $a0
/* 1CAB8 8002C2B8 02004010 */  beqz       $v0, .L8002C2C4
/* 1CABC 8002C2BC 00000000 */   nop
/* 1CAC0 8002C2C0 21988000 */  addu       $s3, $a0, $zero
.L8002C2C4:
/* 1CAC4 8002C2C4 FEFF6285 */  lh         $v0, -0x2($t3)
/* 1CAC8 8002C2C8 00006885 */  lh         $t0, 0x0($t3)
/* 1CACC 8002C2CC 00000000 */  nop
/* 1CAD0 8002C2D0 02000105 */  bgez       $t0, .L8002C2DC
/* 1CAD4 8002C2D4 C2270200 */   srl       $a0, $v0, 31
/* 1CAD8 8002C2D8 02008434 */  ori        $a0, $a0, 0x2
.L8002C2DC:
/* 1CADC 8002C2DC 01024228 */  slti       $v0, $v0, 0x201
/* 1CAE0 8002C2E0 02004014 */  bnez       $v0, .L8002C2EC
/* 1CAE4 8002C2E4 F1000229 */   slti      $v0, $t0, 0xF1
/* 1CAE8 8002C2E8 04008434 */  ori        $a0, $a0, 0x4
.L8002C2EC:
/* 1CAEC 8002C2EC 02004014 */  bnez       $v0, .L8002C2F8
/* 1CAF0 8002C2F0 00000000 */   nop
/* 1CAF4 8002C2F4 08008434 */  ori        $a0, $a0, 0x8
.L8002C2F8:
/* 1CAF8 8002C2F8 24800402 */  and        $s0, $s0, $a0
/* 1CAFC 8002C2FC 0100A524 */  addiu      $a1, $a1, 0x1
/* 1CB00 8002C300 0C006B25 */  addiu      $t3, $t3, 0xC
/* 1CB04 8002C304 0C001827 */  addiu      $t8, $t8, 0xC
.L8002C308:
/* 1CB08 8002C308 88002311 */  beq        $t1, $v1, .L8002C52C
/* 1CB0C 8002C30C 40100E00 */   sll       $v0, $t6, 1
/* 1CB10 8002C310 21104E00 */  addu       $v0, $v0, $t6
/* 1CB14 8002C314 80100200 */  sll        $v0, $v0, 2
/* 1CB18 8002C318 21404201 */  addu       $t0, $t2, $v0
/* 1CB1C 8002C31C 8000E38C */  lw         $v1, 0x80($a3)
/* 1CB20 8002C320 8000048D */  lw         $a0, 0x80($t0)
/* 1CB24 8002C324 60FF6224 */  addiu      $v0, $v1, -0xA0
/* 1CB28 8002C328 00130200 */  sll        $v0, $v0, 12
/* 1CB2C 8002C32C 23186400 */  subu       $v1, $v1, $a0
/* 1CB30 8002C330 1A004300 */  div        $zero, $v0, $v1
/* 1CB34 8002C334 12100000 */  mflo       $v0
/* 1CB38 8002C338 7800038D */  lw         $v1, 0x78($t0)
/* 1CB3C 8002C33C 7800E48C */  lw         $a0, 0x78($a3)
/* 1CB40 8002C340 00000000 */  nop
/* 1CB44 8002C344 23186400 */  subu       $v1, $v1, $a0
/* 1CB48 8002C348 02004104 */  bgez       $v0, .L8002C354
/* 1CB4C 8002C34C 21484000 */   addu      $t1, $v0, $zero
/* 1CB50 8002C350 23480900 */  negu       $t1, $t1
.L8002C354:
/* 1CB54 8002C354 18006900 */  mult       $v1, $t1
/* 1CB58 8002C358 00100224 */  addiu      $v0, $zero, 0x1000
/* 1CB5C 8002C35C 12180000 */  mflo       $v1
/* 1CB60 8002C360 02006104 */  bgez       $v1, .L8002C36C
/* 1CB64 8002C364 23304900 */   subu      $a2, $v0, $t1
/* 1CB68 8002C368 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8002C36C:
/* 1CB6C 8002C36C 03130300 */  sra        $v0, $v1, 12
/* 1CB70 8002C370 21108200 */  addu       $v0, $a0, $v0
/* 1CB74 8002C374 40100200 */  sll        $v0, $v0, 1
/* 1CB78 8002C378 00014324 */  addiu      $v1, $v0, 0x100
/* 1CB7C 8002C37C 00046228 */  slti       $v0, $v1, 0x400
/* 1CB80 8002C380 03004014 */  bnez       $v0, .L8002C390
/* 1CB84 8002C384 01FC6228 */   slti      $v0, $v1, -0x3FF
/* 1CB88 8002C388 FF030324 */  addiu      $v1, $zero, 0x3FF
/* 1CB8C 8002C38C 01FC6228 */  slti       $v0, $v1, -0x3FF
.L8002C390:
/* 1CB90 8002C390 02004010 */  beqz       $v0, .L8002C39C
/* 1CB94 8002C394 00000000 */   nop
/* 1CB98 8002C398 01FC0324 */  addiu      $v1, $zero, -0x3FF
.L8002C39C:
/* 1CB9C 8002C39C FEFF63A5 */  sh         $v1, -0x2($t3)
/* 1CBA0 8002C3A0 7C00028D */  lw         $v0, 0x7C($t0)
/* 1CBA4 8002C3A4 7C00E38C */  lw         $v1, 0x7C($a3)
/* 1CBA8 8002C3A8 00000000 */  nop
/* 1CBAC 8002C3AC 23104300 */  subu       $v0, $v0, $v1
/* 1CBB0 8002C3B0 18004900 */  mult       $v0, $t1
/* 1CBB4 8002C3B4 12100000 */  mflo       $v0
/* 1CBB8 8002C3B8 02004104 */  bgez       $v0, .L8002C3C4
/* 1CBBC 8002C3BC 00000000 */   nop
/* 1CBC0 8002C3C0 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8002C3C4:
/* 1CBC4 8002C3C4 03130200 */  sra        $v0, $v0, 12
/* 1CBC8 8002C3C8 21106200 */  addu       $v0, $v1, $v0
/* 1CBCC 8002C3CC 40100200 */  sll        $v0, $v0, 1
/* 1CBD0 8002C3D0 78004324 */  addiu      $v1, $v0, 0x78
/* 1CBD4 8002C3D4 00046228 */  slti       $v0, $v1, 0x400
/* 1CBD8 8002C3D8 03004014 */  bnez       $v0, .L8002C3E8
/* 1CBDC 8002C3DC 01FC6228 */   slti      $v0, $v1, -0x3FF
/* 1CBE0 8002C3E0 FF030324 */  addiu      $v1, $zero, 0x3FF
/* 1CBE4 8002C3E4 01FC6228 */  slti       $v0, $v1, -0x3FF
.L8002C3E8:
/* 1CBE8 8002C3E8 02004010 */  beqz       $v0, .L8002C3F4
/* 1CBEC 8002C3EC 00000000 */   nop
/* 1CBF0 8002C3F0 01FC0324 */  addiu      $v1, $zero, -0x3FF
.L8002C3F4:
/* 1CBF4 8002C3F4 000063A5 */  sh         $v1, 0x0($t3)
/* 1CBF8 8002C3F8 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 1CBFC 8002C3FC B8004226 */  addiu      $v0, $s2, 0xB8
/* 1CC00 8002C400 21104201 */  addu       $v0, $t2, $v0
/* 1CC04 8002C404 00004C90 */  lbu        $t4, 0x0($v0)
/* 1CC08 8002C408 01004D90 */  lbu        $t5, 0x1($v0)
/* 1CC0C 8002C40C 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1CC10 8002C410 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1CC14 8002C414 00000000 */  nop
/* 1CC18 8002C418 00000000 */  nop
/* 1CC1C 8002C41C 3D00984B */  GPF        1
/* 1CC20 8002C420 00408948 */  mtc2       $t1, $8 # handwritten instruction
/* 1CC24 8002C424 80180E00 */  sll        $v1, $t6, 2
/* 1CC28 8002C428 B8006224 */  addiu      $v0, $v1, 0xB8
/* 1CC2C 8002C42C 21104201 */  addu       $v0, $t2, $v0
/* 1CC30 8002C430 00004C90 */  lbu        $t4, 0x0($v0)
/* 1CC34 8002C434 01004D90 */  lbu        $t5, 0x1($v0)
/* 1CC38 8002C438 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1CC3C 8002C43C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1CC40 8002C440 00000000 */  nop
/* 1CC44 8002C444 00000000 */  nop
/* 1CC48 8002C448 3E00A84B */  GPL        1
/* 1CC4C 8002C44C 08000227 */  addiu      $v0, $t8, 0x8
/* 1CC50 8002C450 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 1CC54 8002C454 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1CC58 8002C458 00004CA0 */  sb         $t4, 0x0($v0)
/* 1CC5C 8002C45C 01004DA0 */  sb         $t5, 0x1($v0)
/* 1CC60 8002C460 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* 1CC64 8002C464 A8004226 */  addiu      $v0, $s2, 0xA8
/* 1CC68 8002C468 21104201 */  addu       $v0, $t2, $v0
/* 1CC6C 8002C46C 00004C90 */  lbu        $t4, 0x0($v0)
/* 1CC70 8002C470 01004D90 */  lbu        $t5, 0x1($v0)
/* 1CC74 8002C474 02004E90 */  lbu        $t6, 0x2($v0)
/* 1CC78 8002C478 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1CC7C 8002C47C 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1CC80 8002C480 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 1CC84 8002C484 00000000 */  nop
/* 1CC88 8002C488 00000000 */  nop
/* 1CC8C 8002C48C 3D00984B */  GPF        1
/* 1CC90 8002C490 00408948 */  mtc2       $t1, $8 # handwritten instruction
/* 1CC94 8002C494 A8006324 */  addiu      $v1, $v1, 0xA8
/* 1CC98 8002C498 21184301 */  addu       $v1, $t2, $v1
/* 1CC9C 8002C49C 00006C90 */  lbu        $t4, 0x0($v1)
/* 1CCA0 8002C4A0 01006D90 */  lbu        $t5, 0x1($v1)
/* 1CCA4 8002C4A4 02006E90 */  lbu        $t6, 0x2($v1)
/* 1CCA8 8002C4A8 00488C48 */  mtc2       $t4, $9 # handwritten instruction
/* 1CCAC 8002C4AC 00508D48 */  mtc2       $t5, $10 # handwritten instruction
/* 1CCB0 8002C4B0 00588E48 */  mtc2       $t6, $11 # handwritten instruction
/* 1CCB4 8002C4B4 00000000 */  nop
/* 1CCB8 8002C4B8 00000000 */  nop
/* 1CCBC 8002C4BC 3E00A84B */  GPL        1
/* 1CCC0 8002C4C0 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 1CCC4 8002C4C4 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 1CCC8 8002C4C8 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 1CCCC 8002C4CC 00000CA3 */  sb         $t4, 0x0($t8)
/* 1CCD0 8002C4D0 01000DA3 */  sb         $t5, 0x1($t8)
/* 1CCD4 8002C4D4 02000EA3 */  sb         $t6, 0x2($t8)
/* 1CCD8 8002C4D8 80100500 */  sll        $v0, $a1, 2
/* 1CCDC 8002C4DC FEFF638D */  lw         $v1, -0x2($t3)
/* 1CCE0 8002C4E0 21104A00 */  addu       $v0, $v0, $t2
/* 1CCE4 8002C4E4 C40043AC */  sw         $v1, 0xC4($v0)
/* 1CCE8 8002C4E8 FEFF6285 */  lh         $v0, -0x2($t3)
/* 1CCEC 8002C4EC 00006485 */  lh         $a0, 0x0($t3)
/* 1CCF0 8002C4F0 00000000 */  nop
/* 1CCF4 8002C4F4 02008104 */  bgez       $a0, .L8002C500
/* 1CCF8 8002C4F8 C21F0200 */   srl       $v1, $v0, 31
/* 1CCFC 8002C4FC 02006334 */  ori        $v1, $v1, 0x2
.L8002C500:
/* 1CD00 8002C500 01024228 */  slti       $v0, $v0, 0x201
/* 1CD04 8002C504 02004014 */  bnez       $v0, .L8002C510
/* 1CD08 8002C508 F1008228 */   slti      $v0, $a0, 0xF1
/* 1CD0C 8002C50C 04006334 */  ori        $v1, $v1, 0x4
.L8002C510:
/* 1CD10 8002C510 02004014 */  bnez       $v0, .L8002C51C
/* 1CD14 8002C514 00000000 */   nop
/* 1CD18 8002C518 08006334 */  ori        $v1, $v1, 0x8
.L8002C51C:
/* 1CD1C 8002C51C 24800302 */  and        $s0, $s0, $v1
/* 1CD20 8002C520 0100A524 */  addiu      $a1, $a1, 0x1
/* 1CD24 8002C524 0C006B25 */  addiu      $t3, $t3, 0xC
/* 1CD28 8002C528 0C001827 */  addiu      $t8, $t8, 0xC
.L8002C52C:
/* 1CD2C 8002C52C 04005226 */  addiu      $s2, $s2, 0x4
/* 1CD30 8002C530 0C00E724 */  addiu      $a3, $a3, 0xC
/* 1CD34 8002C534 0100EF25 */  addiu      $t7, $t7, 0x1
/* 1CD38 8002C538 0300E229 */  slti       $v0, $t7, 0x3
/* 1CD3C 8002C53C 29FF4014 */  bnez       $v0, .L8002C1E4
/* 1CD40 8002C540 04003126 */   addiu     $s1, $s1, 0x4
/* 1CD44 8002C544 CF000016 */  bnez       $s0, .L8002C884
/* 1CD48 8002C548 02000224 */   addiu     $v0, $zero, 0x2
/* 1CD4C 8002C54C 83981300 */  sra        $s3, $s3, 2
/* 1CD50 8002C550 000C622A */  slti       $v0, $s3, 0xC00
/* 1CD54 8002C554 A8004010 */  beqz       $v0, .L8002C7F8
/* 1CD58 8002C558 00000000 */   nop
/* 1CD5C 8002C55C 6C00B58F */  lw         $s5, 0x6C($sp)
/* 1CD60 8002C560 00000000 */  nop
/* 1CD64 8002C564 7700A016 */  bnez       $s5, .L8002C744
/* 1CD68 8002C568 21780000 */   addu      $t7, $zero, $zero
/* 1CD6C 8002C56C 2900A018 */  blez       $a1, .L8002C614
/* 1CD70 8002C570 2158E001 */   addu      $t3, $t7, $zero
/* 1CD74 8002C574 21484001 */  addu       $t1, $t2, $zero
/* 1CD78 8002C578 0100E825 */  addiu      $t0, $t7, 0x1
.L8002C57C:
/* 1CD7C 8002C57C 2A100501 */  slt        $v0, $t0, $a1
/* 1CD80 8002C580 03004014 */  bnez       $v0, .L8002C590
/* 1CD84 8002C584 80100800 */   sll       $v0, $t0, 2
/* 1CD88 8002C588 21400000 */  addu       $t0, $zero, $zero
/* 1CD8C 8002C58C 80100800 */  sll        $v0, $t0, 2
.L8002C590:
/* 1CD90 8002C590 21104201 */  addu       $v0, $t2, $v0
/* 1CD94 8002C594 C4002485 */  lh         $a0, 0xC4($t1)
/* 1CD98 8002C598 C4004384 */  lh         $v1, 0xC4($v0)
/* 1CD9C 8002C59C 00000000 */  nop
/* 1CDA0 8002C5A0 23108300 */  subu       $v0, $a0, $v1
/* 1CDA4 8002C5A4 03004104 */  bgez       $v0, .L8002C5B4
/* 1CDA8 8002C5A8 00044228 */   slti      $v0, $v0, 0x400
/* 1CDAC 8002C5AC 23106400 */  subu       $v0, $v1, $a0
/* 1CDB0 8002C5B0 00044228 */  slti       $v0, $v0, 0x400
.L8002C5B4:
/* 1CDB4 8002C5B4 10004010 */  beqz       $v0, .L8002C5F8
/* 1CDB8 8002C5B8 80100800 */   sll       $v0, $t0, 2
/* 1CDBC 8002C5BC 21104201 */  addu       $v0, $t2, $v0
/* 1CDC0 8002C5C0 C6002485 */  lh         $a0, 0xC6($t1)
/* 1CDC4 8002C5C4 C6004384 */  lh         $v1, 0xC6($v0)
/* 1CDC8 8002C5C8 00000000 */  nop
/* 1CDCC 8002C5CC 23108300 */  subu       $v0, $a0, $v1
/* 1CDD0 8002C5D0 05004004 */  bltz       $v0, .L8002C5E8
/* 1CDD4 8002C5D4 00024228 */   slti      $v0, $v0, 0x200
/* 1CDD8 8002C5D8 07004010 */  beqz       $v0, .L8002C5F8
/* 1CDDC 8002C5DC 00000000 */   nop
/* 1CDE0 8002C5E0 81B10008 */  j          .L8002C604
/* 1CDE4 8002C5E4 04002925 */   addiu     $t1, $t1, 0x4
.L8002C5E8:
/* 1CDE8 8002C5E8 23106400 */  subu       $v0, $v1, $a0
/* 1CDEC 8002C5EC 00024228 */  slti       $v0, $v0, 0x200
/* 1CDF0 8002C5F0 03004014 */  bnez       $v0, .L8002C600
/* 1CDF4 8002C5F4 00000000 */   nop
.L8002C5F8:
/* 1CDF8 8002C5F8 85B10008 */  j          .L8002C614
/* 1CDFC 8002C5FC 01000B24 */   addiu     $t3, $zero, 0x1
.L8002C600:
/* 1CE00 8002C600 04002925 */  addiu      $t1, $t1, 0x4
.L8002C604:
/* 1CE04 8002C604 0100EF25 */  addiu      $t7, $t7, 0x1
/* 1CE08 8002C608 2A10E501 */  slt        $v0, $t7, $a1
/* 1CE0C 8002C60C DBFF4014 */  bnez       $v0, .L8002C57C
/* 1CE10 8002C610 0100E825 */   addiu     $t0, $t7, 0x1
.L8002C614:
/* 1CE14 8002C614 25006015 */  bnez       $t3, .L8002C6AC
/* 1CE18 8002C618 00000000 */   nop
/* 1CE1C 8002C61C 04000224 */  addiu      $v0, $zero, 0x4
/* 1CE20 8002C620 2000A214 */  bne        $a1, $v0, .L8002C6A4
/* 1CE24 8002C624 00000000 */   nop
/* 1CE28 8002C628 D0004295 */  lhu        $v0, 0xD0($t2)
/* 1CE2C 8002C62C C8004395 */  lhu        $v1, 0xC8($t2)
/* 1CE30 8002C630 00140200 */  sll        $v0, $v0, 16
/* 1CE34 8002C634 03240200 */  sra        $a0, $v0, 16
/* 1CE38 8002C638 001C0300 */  sll        $v1, $v1, 16
/* 1CE3C 8002C63C 031C0300 */  sra        $v1, $v1, 16
/* 1CE40 8002C640 23108300 */  subu       $v0, $a0, $v1
/* 1CE44 8002C644 03004104 */  bgez       $v0, .L8002C654
/* 1CE48 8002C648 00044228 */   slti      $v0, $v0, 0x400
/* 1CE4C 8002C64C 23106400 */  subu       $v0, $v1, $a0
/* 1CE50 8002C650 00044228 */  slti       $v0, $v0, 0x400
.L8002C654:
/* 1CE54 8002C654 12004010 */  beqz       $v0, .L8002C6A0
/* 1CE58 8002C658 00000000 */   nop
/* 1CE5C 8002C65C D2004295 */  lhu        $v0, 0xD2($t2)
/* 1CE60 8002C660 CA004395 */  lhu        $v1, 0xCA($t2)
/* 1CE64 8002C664 00140200 */  sll        $v0, $v0, 16
/* 1CE68 8002C668 03240200 */  sra        $a0, $v0, 16
/* 1CE6C 8002C66C 001C0300 */  sll        $v1, $v1, 16
/* 1CE70 8002C670 031C0300 */  sra        $v1, $v1, 16
/* 1CE74 8002C674 23108300 */  subu       $v0, $a0, $v1
/* 1CE78 8002C678 05004004 */  bltz       $v0, .L8002C690
/* 1CE7C 8002C67C 00024228 */   slti      $v0, $v0, 0x200
/* 1CE80 8002C680 07004010 */  beqz       $v0, .L8002C6A0
/* 1CE84 8002C684 00000000 */   nop
/* 1CE88 8002C688 A9B10008 */  j          .L8002C6A4
/* 1CE8C 8002C68C 00000000 */   nop
.L8002C690:
/* 1CE90 8002C690 23106400 */  subu       $v0, $v1, $a0
/* 1CE94 8002C694 00024228 */  slti       $v0, $v0, 0x200
/* 1CE98 8002C698 02004014 */  bnez       $v0, .L8002C6A4
/* 1CE9C 8002C69C 00000000 */   nop
.L8002C6A0:
/* 1CEA0 8002C6A0 01000B24 */  addiu      $t3, $zero, 0x1
.L8002C6A4:
/* 1CEA4 8002C6A4 27006011 */  beqz       $t3, .L8002C744
/* 1CEA8 8002C6A8 00000000 */   nop
.L8002C6AC:
/* 1CEAC 8002C6AC 4000B68F */  lw         $s6, 0x40($sp)
/* 1CEB0 8002C6B0 4400B78F */  lw         $s7, 0x44($sp)
/* 1CEB4 8002C6B4 4800B58F */  lw         $s5, 0x48($sp)
/* 1CEB8 8002C6B8 0000C0CA */  lwc2       $0, 0x0($s6)
/* 1CEBC 8002C6BC 0400C1CA */  lwc2       $1, 0x4($s6)
/* 1CEC0 8002C6C0 0000E2CA */  lwc2       $2, 0x0($s7)
/* 1CEC4 8002C6C4 0400E3CA */  lwc2       $3, 0x4($s7)
/* 1CEC8 8002C6C8 0000A4CA */  lwc2       $4, 0x0($s5)
/* 1CECC 8002C6CC 0400A5CA */  lwc2       $5, 0x4($s5)
/* 1CED0 8002C6D0 A8004425 */  addiu      $a0, $t2, 0xA8
/* 1CED4 8002C6D4 AB004291 */  lbu        $v0, 0xAB($t2)
/* 1CED8 8002C6D8 AC004325 */  addiu      $v1, $t2, 0xAC
/* 1CEDC 8002C6DC B30042A1 */  sb         $v0, 0xB3($t2)
/* 1CEE0 8002C6E0 B0004225 */  addiu      $v0, $t2, 0xB0
/* 1CEE4 8002C6E4 000094C8 */  lwc2       $20, 0x0($a0)
/* 1CEE8 8002C6E8 000075C8 */  lwc2       $21, 0x0($v1)
/* 1CEEC 8002C6EC 000056C8 */  lwc2       $22, 0x0($v0)
/* 1CEF0 8002C6F0 000046C8 */  lwc2       $6, 0x0($v0)
/* 1CEF4 8002C6F4 4C00B68F */  lw         $s6, 0x4C($sp)
/* 1CEF8 8002C6F8 00000000 */  nop
/* 1CEFC 8002C6FC 0000C28E */  lw         $v0, 0x0($s6)
/* 1CF00 8002C700 00000000 */  nop
/* 1CF04 8002C704 0C0022AF */  sw         $v0, 0xC($t9)
/* 1CF08 8002C708 5000B78F */  lw         $s7, 0x50($sp)
/* 1CF0C 8002C70C 00000000 */  nop
/* 1CF10 8002C710 0000E28E */  lw         $v0, 0x0($s7)
/* 1CF14 8002C714 00000000 */  nop
/* 1CF18 8002C718 180022AF */  sw         $v0, 0x18($t9)
/* 1CF1C 8002C71C 5400B58F */  lw         $s5, 0x54($sp)
/* 1CF20 8002C720 00000000 */  nop
/* 1CF24 8002C724 0000A28E */  lw         $v0, 0x0($s5)
/* 1CF28 8002C728 21202003 */  addu       $a0, $t9, $zero
/* 1CF2C 8002C72C 240022AF */  sw         $v0, 0x24($t9)
/* 1CF30 8002C730 6800A58F */  lw         $a1, 0x68($sp)
/* 1CF34 8002C734 2DB2000C */  jal        DRAW_Zclip_subdiv
/* 1CF38 8002C738 01000624 */   addiu     $a2, $zero, 0x1
/* 1CF3C 8002C73C 21B20008 */  j          .L8002C884
/* 1CF40 8002C740 01000224 */   addiu     $v0, $zero, 0x1
.L8002C744:
/* 1CF44 8002C744 0800368F */  lw         $s6, 0x8($t9)
/* 1CF48 8002C748 1400378F */  lw         $s7, 0x14($t9)
/* 1CF4C 8002C74C 2000358F */  lw         $s5, 0x20($t9)
/* 1CF50 8002C750 00609648 */  mtc2       $s6, $12 # handwritten instruction
/* 1CF54 8002C754 00709548 */  mtc2       $s5, $14 # handwritten instruction
/* 1CF58 8002C758 00689748 */  mtc2       $s7, $13 # handwritten instruction
/* 1CF5C 8002C75C 00000000 */  nop
/* 1CF60 8002C760 00000000 */  nop
/* 1CF64 8002C764 0600404B */  NCLIP
/* 1CF68 8002C768 BA004295 */  lhu        $v0, 0xBA($t2)
/* 1CF6C 8002C76C 00000000 */  nop
/* 1CF70 8002C770 0E0022A7 */  sh         $v0, 0xE($t9)
/* 1CF74 8002C774 BE004295 */  lhu        $v0, 0xBE($t2)
/* 1CF78 8002C778 00000000 */  nop
/* 1CF7C 8002C77C 1A0022A7 */  sh         $v0, 0x1A($t9)
/* 1CF80 8002C780 1400A227 */  addiu      $v0, $sp, 0x14
/* 1CF84 8002C784 000058E8 */  swc2       $24, 0x0($v0)
/* 1CF88 8002C788 1400A28F */  lw         $v0, 0x14($sp)
/* 1CF8C 8002C78C 00000000 */  nop
/* 1CF90 8002C790 3C00401C */  bgtz       $v0, .L8002C884
/* 1CF94 8002C794 04000224 */   addiu     $v0, $zero, 0x4
/* 1CF98 8002C798 03000224 */  addiu      $v0, $zero, 0x3
/* 1CF9C 8002C79C 1400A214 */  bne        $a1, $v0, .L8002C7F0
/* 1CFA0 8002C7A0 04000224 */   addiu     $v0, $zero, 0x4
/* 1CFA4 8002C7A4 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
/* 1CFA8 8002C7A8 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* 1CFAC 8002C7AC 03161E00 */  sra        $v0, $fp, 24
/* 1CFB0 8002C7B0 80281300 */  sll        $a1, $s3, 2
/* 1CFB4 8002C7B4 070022A3 */  sb         $v0, 0x7($t9)
/* 1CFB8 8002C7B8 6800B68F */  lw         $s6, 0x68($sp)
/* 1CFBC 8002C7BC 01000224 */  addiu      $v0, $zero, 0x1
/* 1CFC0 8002C7C0 2128B600 */  addu       $a1, $a1, $s6
/* 1CFC4 8002C7C4 0000A38C */  lw         $v1, 0x0($a1)
/* 1CFC8 8002C7C8 0009043C */  lui        $a0, (0x9000000 >> 16)
/* 1CFCC 8002C7CC 24186600 */  and        $v1, $v1, $a2
/* 1CFD0 8002C7D0 25186400 */  or         $v1, $v1, $a0
/* 1CFD4 8002C7D4 24302603 */  and        $a2, $t9, $a2
/* 1CFD8 8002C7D8 000023AF */  sw         $v1, 0x0($t9)
/* 1CFDC 8002C7DC 0000A6AC */  sw         $a2, 0x0($a1)
/* 1CFE0 8002C7E0 0400838E */  lw         $v1, 0x4($s4)
/* 1CFE4 8002C7E4 0000848E */  lw         $a0, 0x0($s4)
/* 1CFE8 8002C7E8 1EB20008 */  j          .L8002C878
/* 1CFEC 8002C7EC 28006324 */   addiu     $v1, $v1, 0x28
.L8002C7F0:
/* 1CFF0 8002C7F0 0300A210 */  beq        $a1, $v0, .L8002C800
/* 1CFF4 8002C7F4 FF00063C */   lui       $a2, (0xFFFFFF >> 16)
.L8002C7F8:
/* 1CFF8 8002C7F8 21B20008 */  j          .L8002C884
/* 1CFFC 8002C7FC 02000224 */   addiu     $v0, $zero, 0x2
.L8002C800:
/* 1D000 8002C800 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* 1D004 8002C804 03161E00 */  sra        $v0, $fp, 24
/* 1D008 8002C808 1C00278F */  lw         $a3, 0x1C($t9)
/* 1D00C 8002C80C 2000288F */  lw         $t0, 0x20($t9)
/* 1D010 8002C810 2400298F */  lw         $t1, 0x24($t9)
/* 1D014 8002C814 2800238F */  lw         $v1, 0x28($t9)
/* 1D018 8002C818 2C00248F */  lw         $a0, 0x2C($t9)
/* 1D01C 8002C81C 3000258F */  lw         $a1, 0x30($t9)
/* 1D020 8002C820 08004234 */  ori        $v0, $v0, 0x8
/* 1D024 8002C824 070022A3 */  sb         $v0, 0x7($t9)
/* 1D028 8002C828 01000224 */  addiu      $v0, $zero, 0x1
/* 1D02C 8002C82C 1C0023AF */  sw         $v1, 0x1C($t9)
/* 1D030 8002C830 200024AF */  sw         $a0, 0x20($t9)
/* 1D034 8002C834 240025AF */  sw         $a1, 0x24($t9)
/* 1D038 8002C838 280027AF */  sw         $a3, 0x28($t9)
/* 1D03C 8002C83C 2C0028AF */  sw         $t0, 0x2C($t9)
/* 1D040 8002C840 300029AF */  sw         $t1, 0x30($t9)
/* 1D044 8002C844 6800B78F */  lw         $s7, 0x68($sp)
/* 1D048 8002C848 80281300 */  sll        $a1, $s3, 2
/* 1D04C 8002C84C 2128B700 */  addu       $a1, $a1, $s7
/* 1D050 8002C850 0000A38C */  lw         $v1, 0x0($a1)
/* 1D054 8002C854 000C043C */  lui        $a0, (0xC000000 >> 16)
/* 1D058 8002C858 24186600 */  and        $v1, $v1, $a2
/* 1D05C 8002C85C 25186400 */  or         $v1, $v1, $a0
/* 1D060 8002C860 24302603 */  and        $a2, $t9, $a2
/* 1D064 8002C864 000023AF */  sw         $v1, 0x0($t9)
/* 1D068 8002C868 0000A6AC */  sw         $a2, 0x0($a1)
/* 1D06C 8002C86C 0400838E */  lw         $v1, 0x4($s4)
/* 1D070 8002C870 0000848E */  lw         $a0, 0x0($s4)
/* 1D074 8002C874 34006324 */  addiu      $v1, $v1, 0x34
.L8002C878:
/* 1D078 8002C878 21208200 */  addu       $a0, $a0, $v0
/* 1D07C 8002C87C 040083AE */  sw         $v1, 0x4($s4)
/* 1D080 8002C880 000084AE */  sw         $a0, 0x0($s4)
.L8002C884:
/* 1D084 8002C884 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 1D088 8002C888 3800BE8F */  lw         $fp, 0x38($sp)
/* 1D08C 8002C88C 3400B78F */  lw         $s7, 0x34($sp)
/* 1D090 8002C890 3000B68F */  lw         $s6, 0x30($sp)
/* 1D094 8002C894 2C00B58F */  lw         $s5, 0x2C($sp)
/* 1D098 8002C898 2800B48F */  lw         $s4, 0x28($sp)
/* 1D09C 8002C89C 2400B38F */  lw         $s3, 0x24($sp)
/* 1D0A0 8002C8A0 2000B28F */  lw         $s2, 0x20($sp)
/* 1D0A4 8002C8A4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 1D0A8 8002C8A8 1800B08F */  lw         $s0, 0x18($sp)
/* 1D0AC 8002C8AC 0800E003 */  jr         $ra
/* 1D0B0 8002C8B0 4000BD27 */   addiu     $sp, $sp, 0x40
.size DRAW_DisplayTFace_zclipped_C, . - DRAW_DisplayTFace_zclipped_C
