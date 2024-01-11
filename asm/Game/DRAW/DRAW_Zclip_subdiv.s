.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DRAW_Zclip_subdiv
/* 1D0B4 8002C8B4 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 1D0B8 8002C8B8 21408000 */  addu       $t0, $a0, $zero
/* 1D0BC 8002C8BC 4C00B7AF */  sw         $s7, 0x4C($sp)
/* 1D0C0 8002C8C0 801F173C */  lui        $s7, (0x1F800200 >> 16)
/* 1D0C4 8002C8C4 0002F736 */  ori        $s7, $s7, (0x1F800200 & 0xFFFF)
/* 1D0C8 8002C8C8 5400BFAF */  sw         $ra, 0x54($sp)
/* 1D0CC 8002C8CC 5000BEAF */  sw         $fp, 0x50($sp)
/* 1D0D0 8002C8D0 4800B6AF */  sw         $s6, 0x48($sp)
/* 1D0D4 8002C8D4 4400B5AF */  sw         $s5, 0x44($sp)
/* 1D0D8 8002C8D8 4000B4AF */  sw         $s4, 0x40($sp)
/* 1D0DC 8002C8DC 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 1D0E0 8002C8E0 3800B2AF */  sw         $s2, 0x38($sp)
/* 1D0E4 8002C8E4 3400B1AF */  sw         $s1, 0x34($sp)
/* 1D0E8 8002C8E8 3000B0AF */  sw         $s0, 0x30($sp)
/* 1D0EC 8002C8EC 5C00A5AF */  sw         $a1, 0x5C($sp)
/* 1D0F0 8002C8F0 0300C010 */  beqz       $a2, .L8002C900
/* 1D0F4 8002C8F4 6000A6AF */   sw        $a2, 0x60($sp)
/* 1D0F8 8002C8F8 801F173C */  lui        $s7, (0x1F8002D4 >> 16)
/* 1D0FC 8002C8FC D402F736 */  ori        $s7, $s7, (0x1F8002D4 & 0xFFFF)
.L8002C900:
/* 1D100 8002C900 6000E426 */  addiu      $a0, $s7, 0x60
/* 1D104 8002C904 6400E326 */  addiu      $v1, $s7, 0x64
/* 1D108 8002C908 6800E226 */  addiu      $v0, $s7, 0x68
/* 1D10C 8002C90C 000094E8 */  swc2       $20, 0x0($a0)
/* 1D110 8002C910 000075E8 */  swc2       $21, 0x0($v1)
/* 1D114 8002C914 000056E8 */  swc2       $22, 0x0($v0)
/* 1D118 8002C918 0000E0EA */  swc2       $0, 0x0($s7)
/* 1D11C 8002C91C 0400E1EA */  swc2       $1, 0x4($s7)
/* 1D120 8002C920 0800E226 */  addiu      $v0, $s7, 0x8
/* 1D124 8002C924 000042E8 */  swc2       $2, 0x0($v0)
/* 1D128 8002C928 040043E8 */  swc2       $3, 0x4($v0)
/* 1D12C 8002C92C 1000E226 */  addiu      $v0, $s7, 0x10
/* 1D130 8002C930 000044E8 */  swc2       $4, 0x0($v0)
/* 1D134 8002C934 040045E8 */  swc2       $5, 0x4($v0)
/* 1D138 8002C938 08BE9E8F */  lw         $fp, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1D13C 8002C93C 00000000 */  nop
/* 1D140 8002C940 0400C8AF */  sw         $t0, 0x4($fp)
/* 1D144 8002C944 0800E28E */  lw         $v0, 0x8($s7)
/* 1D148 8002C948 0400E48E */  lw         $a0, 0x4($s7)
/* 1D14C 8002C94C 0C00E58E */  lw         $a1, 0xC($s7)
/* 1D150 8002C950 1000E68E */  lw         $a2, 0x10($s7)
/* 1D154 8002C954 1400E78E */  lw         $a3, 0x14($s7)
/* 1D158 8002C958 2000E2AE */  sw         $v0, 0x20($s7)
/* 1D15C 8002C95C 0000E28E */  lw         $v0, 0x0($s7)
/* 1D160 8002C960 2000E396 */  lhu        $v1, 0x20($s7)
/* 1D164 8002C964 1C00E4AE */  sw         $a0, 0x1C($s7)
/* 1D168 8002C968 2400E5AE */  sw         $a1, 0x24($s7)
/* 1D16C 8002C96C 2400E486 */  lh         $a0, 0x24($s7)
/* 1D170 8002C970 2800E6AE */  sw         $a2, 0x28($s7)
/* 1D174 8002C974 2C00E7AE */  sw         $a3, 0x2C($s7)
/* 1D178 8002C978 001C0300 */  sll        $v1, $v1, 16
/* 1D17C 8002C97C 1800E2AE */  sw         $v0, 0x18($s7)
/* 1D180 8002C980 1800E286 */  lh         $v0, 0x18($s7)
/* 1D184 8002C984 031C0300 */  sra        $v1, $v1, 16
/* 1D188 8002C988 21104300 */  addu       $v0, $v0, $v1
/* 1D18C 8002C98C C21F0200 */  srl        $v1, $v0, 31
/* 1D190 8002C990 21104300 */  addu       $v0, $v0, $v1
/* 1D194 8002C994 2200E396 */  lhu        $v1, 0x22($s7)
/* 1D198 8002C998 43100200 */  sra        $v0, $v0, 1
/* 1D19C 8002C99C 3000E2A6 */  sh         $v0, 0x30($s7)
/* 1D1A0 8002C9A0 1A00E286 */  lh         $v0, 0x1A($s7)
/* 1D1A4 8002C9A4 001C0300 */  sll        $v1, $v1, 16
/* 1D1A8 8002C9A8 031C0300 */  sra        $v1, $v1, 16
/* 1D1AC 8002C9AC 21104300 */  addu       $v0, $v0, $v1
/* 1D1B0 8002C9B0 C21F0200 */  srl        $v1, $v0, 31
/* 1D1B4 8002C9B4 21104300 */  addu       $v0, $v0, $v1
/* 1D1B8 8002C9B8 1C00E386 */  lh         $v1, 0x1C($s7)
/* 1D1BC 8002C9BC 43100200 */  sra        $v0, $v0, 1
/* 1D1C0 8002C9C0 3200E2A6 */  sh         $v0, 0x32($s7)
/* 1D1C4 8002C9C4 21186400 */  addu       $v1, $v1, $a0
/* 1D1C8 8002C9C8 C2170300 */  srl        $v0, $v1, 31
/* 1D1CC 8002C9CC 21186200 */  addu       $v1, $v1, $v0
/* 1D1D0 8002C9D0 2000E296 */  lhu        $v0, 0x20($s7)
/* 1D1D4 8002C9D4 43180300 */  sra        $v1, $v1, 1
/* 1D1D8 8002C9D8 3400E3A6 */  sh         $v1, 0x34($s7)
/* 1D1DC 8002C9DC 2800E396 */  lhu        $v1, 0x28($s7)
/* 1D1E0 8002C9E0 2200E496 */  lhu        $a0, 0x22($s7)
/* 1D1E4 8002C9E4 00140200 */  sll        $v0, $v0, 16
/* 1D1E8 8002C9E8 03140200 */  sra        $v0, $v0, 16
/* 1D1EC 8002C9EC 001C0300 */  sll        $v1, $v1, 16
/* 1D1F0 8002C9F0 031C0300 */  sra        $v1, $v1, 16
/* 1D1F4 8002C9F4 21104300 */  addu       $v0, $v0, $v1
/* 1D1F8 8002C9F8 C21F0200 */  srl        $v1, $v0, 31
/* 1D1FC 8002C9FC 21104300 */  addu       $v0, $v0, $v1
/* 1D200 8002CA00 43100200 */  sra        $v0, $v0, 1
/* 1D204 8002CA04 00240400 */  sll        $a0, $a0, 16
/* 1D208 8002CA08 03240400 */  sra        $a0, $a0, 16
/* 1D20C 8002CA0C 3800E2A6 */  sh         $v0, 0x38($s7)
/* 1D210 8002CA10 2A00E296 */  lhu        $v0, 0x2A($s7)
/* 1D214 8002CA14 2400E386 */  lh         $v1, 0x24($s7)
/* 1D218 8002CA18 00140200 */  sll        $v0, $v0, 16
/* 1D21C 8002CA1C 03140200 */  sra        $v0, $v0, 16
/* 1D220 8002CA20 21208200 */  addu       $a0, $a0, $v0
/* 1D224 8002CA24 C2170400 */  srl        $v0, $a0, 31
/* 1D228 8002CA28 21208200 */  addu       $a0, $a0, $v0
/* 1D22C 8002CA2C 2C00E286 */  lh         $v0, 0x2C($s7)
/* 1D230 8002CA30 43200400 */  sra        $a0, $a0, 1
/* 1D234 8002CA34 3A00E4A6 */  sh         $a0, 0x3A($s7)
/* 1D238 8002CA38 21186200 */  addu       $v1, $v1, $v0
/* 1D23C 8002CA3C C2170300 */  srl        $v0, $v1, 31
/* 1D240 8002CA40 21186200 */  addu       $v1, $v1, $v0
/* 1D244 8002CA44 2800E296 */  lhu        $v0, 0x28($s7)
/* 1D248 8002CA48 43180300 */  sra        $v1, $v1, 1
/* 1D24C 8002CA4C 3C00E3A6 */  sh         $v1, 0x3C($s7)
/* 1D250 8002CA50 1800E386 */  lh         $v1, 0x18($s7)
/* 1D254 8002CA54 00140200 */  sll        $v0, $v0, 16
/* 1D258 8002CA58 03140200 */  sra        $v0, $v0, 16
/* 1D25C 8002CA5C 21104300 */  addu       $v0, $v0, $v1
/* 1D260 8002CA60 C21F0200 */  srl        $v1, $v0, 31
/* 1D264 8002CA64 21104300 */  addu       $v0, $v0, $v1
/* 1D268 8002CA68 43100200 */  sra        $v0, $v0, 1
/* 1D26C 8002CA6C 4000E2A6 */  sh         $v0, 0x40($s7)
/* 1D270 8002CA70 2A00E296 */  lhu        $v0, 0x2A($s7)
/* 1D274 8002CA74 1A00E386 */  lh         $v1, 0x1A($s7)
/* 1D278 8002CA78 1C00E486 */  lh         $a0, 0x1C($s7)
/* 1D27C 8002CA7C 00140200 */  sll        $v0, $v0, 16
/* 1D280 8002CA80 03140200 */  sra        $v0, $v0, 16
/* 1D284 8002CA84 21104300 */  addu       $v0, $v0, $v1
/* 1D288 8002CA88 C21F0200 */  srl        $v1, $v0, 31
/* 1D28C 8002CA8C 21104300 */  addu       $v0, $v0, $v1
/* 1D290 8002CA90 2C00E386 */  lh         $v1, 0x2C($s7)
/* 1D294 8002CA94 43100200 */  sra        $v0, $v0, 1
/* 1D298 8002CA98 4200E2A6 */  sh         $v0, 0x42($s7)
/* 1D29C 8002CA9C 21186400 */  addu       $v1, $v1, $a0
/* 1D2A0 8002CAA0 C2170300 */  srl        $v0, $v1, 31
/* 1D2A4 8002CAA4 21186200 */  addu       $v1, $v1, $v0
/* 1D2A8 8002CAA8 43180300 */  sra        $v1, $v1, 1
/* 1D2AC 8002CAAC 4400E3A6 */  sh         $v1, 0x44($s7)
/* 1D2B0 8002CAB0 0C00028D */  lw         $v0, 0xC($t0)
/* 1D2B4 8002CAB4 5400F626 */  addiu      $s6, $s7, 0x54
/* 1D2B8 8002CAB8 4800E2AE */  sw         $v0, 0x48($s7)
/* 1D2BC 8002CABC 1800028D */  lw         $v0, 0x18($t0)
/* 1D2C0 8002CAC0 5C00F326 */  addiu      $s3, $s7, 0x5C
/* 1D2C4 8002CAC4 4C00E2AE */  sw         $v0, 0x4C($s7)
/* 1D2C8 8002CAC8 4800E292 */  lbu        $v0, 0x48($s7)
/* 1D2CC 8002CACC 4C00E392 */  lbu        $v1, 0x4C($s7)
/* 1D2D0 8002CAD0 2400048D */  lw         $a0, 0x24($t0)
/* 1D2D4 8002CAD4 21104300 */  addu       $v0, $v0, $v1
/* 1D2D8 8002CAD8 4900E392 */  lbu        $v1, 0x49($s7)
/* 1D2DC 8002CADC 3000F526 */  addiu      $s5, $s7, 0x30
/* 1D2E0 8002CAE0 5000E4AE */  sw         $a0, 0x50($s7)
/* 1D2E4 8002CAE4 4D00E492 */  lbu        $a0, 0x4D($s7)
/* 1D2E8 8002CAE8 5000E592 */  lbu        $a1, 0x50($s7)
/* 1D2EC 8002CAEC 43100200 */  sra        $v0, $v0, 1
/* 1D2F0 8002CAF0 5400E2A2 */  sb         $v0, 0x54($s7)
/* 1D2F4 8002CAF4 4E00E296 */  lhu        $v0, 0x4E($s7)
/* 1D2F8 8002CAF8 21186400 */  addu       $v1, $v1, $a0
/* 1D2FC 8002CAFC 4C00E492 */  lbu        $a0, 0x4C($s7)
/* 1D300 8002CB00 4000F126 */  addiu      $s1, $s7, 0x40
/* 1D304 8002CB04 5A00E2A6 */  sh         $v0, 0x5A($s7)
/* 1D308 8002CB08 5600E2A6 */  sh         $v0, 0x56($s7)
/* 1D30C 8002CB0C 4D00E292 */  lbu        $v0, 0x4D($s7)
/* 1D310 8002CB10 43180300 */  sra        $v1, $v1, 1
/* 1D314 8002CB14 5500E3A2 */  sb         $v1, 0x55($s7)
/* 1D318 8002CB18 5100E392 */  lbu        $v1, 0x51($s7)
/* 1D31C 8002CB1C 21208500 */  addu       $a0, $a0, $a1
/* 1D320 8002CB20 43200400 */  sra        $a0, $a0, 1
/* 1D324 8002CB24 21104300 */  addu       $v0, $v0, $v1
/* 1D328 8002CB28 2118A000 */  addu       $v1, $a1, $zero
/* 1D32C 8002CB2C 5800E4A2 */  sb         $a0, 0x58($s7)
/* 1D330 8002CB30 4800E492 */  lbu        $a0, 0x48($s7)
/* 1D334 8002CB34 43100200 */  sra        $v0, $v0, 1
/* 1D338 8002CB38 5900E2A2 */  sb         $v0, 0x59($s7)
/* 1D33C 8002CB3C 5100E292 */  lbu        $v0, 0x51($s7)
/* 1D340 8002CB40 21186400 */  addu       $v1, $v1, $a0
/* 1D344 8002CB44 4900E492 */  lbu        $a0, 0x49($s7)
/* 1D348 8002CB48 43180300 */  sra        $v1, $v1, 1
/* 1D34C 8002CB4C 5C00E3A2 */  sb         $v1, 0x5C($s7)
/* 1D350 8002CB50 4A00E396 */  lhu        $v1, 0x4A($s7)
/* 1D354 8002CB54 21104400 */  addu       $v0, $v0, $a0
/* 1D358 8002CB58 43100200 */  sra        $v0, $v0, 1
/* 1D35C 8002CB5C 5D00E2A2 */  sb         $v0, 0x5D($s7)
/* 1D360 8002CB60 5E00E3A6 */  sh         $v1, 0x5E($s7)
/* 1D364 8002CB64 6000E292 */  lbu        $v0, 0x60($s7)
/* 1D368 8002CB68 6400E392 */  lbu        $v1, 0x64($s7)
/* 1D36C 8002CB6C 6500E592 */  lbu        $a1, 0x65($s7)
/* 1D370 8002CB70 21104300 */  addu       $v0, $v0, $v1
/* 1D374 8002CB74 6100E392 */  lbu        $v1, 0x61($s7)
/* 1D378 8002CB78 43100200 */  sra        $v0, $v0, 1
/* 1D37C 8002CB7C 6C00E2A2 */  sb         $v0, 0x6C($s7)
/* 1D380 8002CB80 6200E292 */  lbu        $v0, 0x62($s7)
/* 1D384 8002CB84 21186500 */  addu       $v1, $v1, $a1
/* 1D388 8002CB88 6600E592 */  lbu        $a1, 0x66($s7)
/* 1D38C 8002CB8C 43180300 */  sra        $v1, $v1, 1
/* 1D390 8002CB90 6D00E3A2 */  sb         $v1, 0x6D($s7)
/* 1D394 8002CB94 6400E392 */  lbu        $v1, 0x64($s7)
/* 1D398 8002CB98 21104500 */  addu       $v0, $v0, $a1
/* 1D39C 8002CB9C 6800E592 */  lbu        $a1, 0x68($s7)
/* 1D3A0 8002CBA0 43100200 */  sra        $v0, $v0, 1
/* 1D3A4 8002CBA4 6E00E2A2 */  sb         $v0, 0x6E($s7)
/* 1D3A8 8002CBA8 6500E292 */  lbu        $v0, 0x65($s7)
/* 1D3AC 8002CBAC 21186500 */  addu       $v1, $v1, $a1
/* 1D3B0 8002CBB0 6900E592 */  lbu        $a1, 0x69($s7)
/* 1D3B4 8002CBB4 43180300 */  sra        $v1, $v1, 1
/* 1D3B8 8002CBB8 7000E3A2 */  sb         $v1, 0x70($s7)
/* 1D3BC 8002CBBC 6600E392 */  lbu        $v1, 0x66($s7)
/* 1D3C0 8002CBC0 21104500 */  addu       $v0, $v0, $a1
/* 1D3C4 8002CBC4 6A00E592 */  lbu        $a1, 0x6A($s7)
/* 1D3C8 8002CBC8 43100200 */  sra        $v0, $v0, 1
/* 1D3CC 8002CBCC 7100E2A2 */  sb         $v0, 0x71($s7)
/* 1D3D0 8002CBD0 6800E292 */  lbu        $v0, 0x68($s7)
/* 1D3D4 8002CBD4 21186500 */  addu       $v1, $v1, $a1
/* 1D3D8 8002CBD8 6000E592 */  lbu        $a1, 0x60($s7)
/* 1D3DC 8002CBDC 43180300 */  sra        $v1, $v1, 1
/* 1D3E0 8002CBE0 7200E3A2 */  sb         $v1, 0x72($s7)
/* 1D3E4 8002CBE4 6900E392 */  lbu        $v1, 0x69($s7)
/* 1D3E8 8002CBE8 21104500 */  addu       $v0, $v0, $a1
/* 1D3EC 8002CBEC 6100E592 */  lbu        $a1, 0x61($s7)
/* 1D3F0 8002CBF0 43100200 */  sra        $v0, $v0, 1
/* 1D3F4 8002CBF4 7400E2A2 */  sb         $v0, 0x74($s7)
/* 1D3F8 8002CBF8 6A00E292 */  lbu        $v0, 0x6A($s7)
/* 1D3FC 8002CBFC 21186500 */  addu       $v1, $v1, $a1
/* 1D400 8002CC00 6200E592 */  lbu        $a1, 0x62($s7)
/* 1D404 8002CC04 43180300 */  sra        $v1, $v1, 1
/* 1D408 8002CC08 7500E3A2 */  sb         $v1, 0x75($s7)
/* 1D40C 8002CC0C 6300E392 */  lbu        $v1, 0x63($s7)
/* 1D410 8002CC10 21104500 */  addu       $v0, $v0, $a1
/* 1D414 8002CC14 43100200 */  sra        $v0, $v0, 1
/* 1D418 8002CC18 7600E2A2 */  sb         $v0, 0x76($s7)
/* 1D41C 8002CC1C 7700E3A2 */  sb         $v1, 0x77($s7)
/* 1D420 8002CC20 6F00E3A2 */  sb         $v1, 0x6F($s7)
/* 1D424 8002CC24 1000B6AF */  sw         $s6, 0x10($sp)
/* 1D428 8002CC28 1400B3AF */  sw         $s3, 0x14($sp)
/* 1D42C 8002CC2C 6000E28E */  lw         $v0, 0x60($s7)
/* 1D430 8002CC30 21302002 */  addu       $a2, $s1, $zero
/* 1D434 8002CC34 1800A2AF */  sw         $v0, 0x18($sp)
/* 1D438 8002CC38 6C00E28E */  lw         $v0, 0x6C($s7)
/* 1D43C 8002CC3C 5C00A98F */  lw         $t1, 0x5C($sp)
/* 1D440 8002CC40 4800E726 */  addiu      $a3, $s7, 0x48
/* 1D444 8002CC44 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1D448 8002CC48 7400E28E */  lw         $v0, 0x74($s7)
/* 1D44C 8002CC4C 1800E426 */  addiu      $a0, $s7, 0x18
/* 1D450 8002CC50 2800A9AF */  sw         $t1, 0x28($sp)
/* 1D454 8002CC54 6000A98F */  lw         $t1, 0x60($sp)
/* 1D458 8002CC58 2128A002 */  addu       $a1, $s5, $zero
/* 1D45C 8002CC5C 2400BEAF */  sw         $fp, 0x24($sp)
/* 1D460 8002CC60 2C00A9AF */  sw         $t1, 0x2C($sp)
/* 1D464 8002CC64 1DB0000C */  jal        DRAW_DisplayTFace_zclipped_C
/* 1D468 8002CC68 2000A2AF */   sw        $v0, 0x20($sp)
/* 1D46C 8002CC6C 21804000 */  addu       $s0, $v0, $zero
/* 1D470 8002CC70 21202002 */  addu       $a0, $s1, $zero
/* 1D474 8002CC74 5800F226 */  addiu      $s2, $s7, 0x58
/* 1D478 8002CC78 5000E226 */  addiu      $v0, $s7, 0x50
/* 1D47C 8002CC7C 1000B2AF */  sw         $s2, 0x10($sp)
/* 1D480 8002CC80 1400A2AF */  sw         $v0, 0x14($sp)
/* 1D484 8002CC84 7400E28E */  lw         $v0, 0x74($s7)
/* 1D488 8002CC88 5C00A98F */  lw         $t1, 0x5C($sp)
/* 1D48C 8002CC8C 3800F426 */  addiu      $s4, $s7, 0x38
/* 1D490 8002CC90 1800A2AF */  sw         $v0, 0x18($sp)
/* 1D494 8002CC94 7000E28E */  lw         $v0, 0x70($s7)
/* 1D498 8002CC98 21288002 */  addu       $a1, $s4, $zero
/* 1D49C 8002CC9C 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1D4A0 8002CCA0 6800E28E */  lw         $v0, 0x68($s7)
/* 1D4A4 8002CCA4 2800E636 */  ori        $a2, $s7, 0x28
/* 1D4A8 8002CCA8 2800A9AF */  sw         $t1, 0x28($sp)
/* 1D4AC 8002CCAC 6000A98F */  lw         $t1, 0x60($sp)
/* 1D4B0 8002CCB0 21386002 */  addu       $a3, $s3, $zero
/* 1D4B4 8002CCB4 2400BEAF */  sw         $fp, 0x24($sp)
/* 1D4B8 8002CCB8 2C00A9AF */  sw         $t1, 0x2C($sp)
/* 1D4BC 8002CCBC 1DB0000C */  jal        DRAW_DisplayTFace_zclipped_C
/* 1D4C0 8002CCC0 2000A2AF */   sw        $v0, 0x20($sp)
/* 1D4C4 8002CCC4 25800202 */  or         $s0, $s0, $v0
/* 1D4C8 8002CCC8 4A00E296 */  lhu        $v0, 0x4A($s7)
/* 1D4CC 8002CCCC 4E00E396 */  lhu        $v1, 0x4E($s7)
/* 1D4D0 8002CCD0 5600E2A6 */  sh         $v0, 0x56($s7)
/* 1D4D4 8002CCD4 5E00E3A6 */  sh         $v1, 0x5E($s7)
/* 1D4D8 8002CCD8 1000B2AF */  sw         $s2, 0x10($sp)
/* 1D4DC 8002CCDC 1400B3AF */  sw         $s3, 0x14($sp)
/* 1D4E0 8002CCE0 6C00E28E */  lw         $v0, 0x6C($s7)
/* 1D4E4 8002CCE4 5C00A98F */  lw         $t1, 0x5C($sp)
/* 1D4E8 8002CCE8 2120A002 */  addu       $a0, $s5, $zero
/* 1D4EC 8002CCEC 1800A2AF */  sw         $v0, 0x18($sp)
/* 1D4F0 8002CCF0 7000E28E */  lw         $v0, 0x70($s7)
/* 1D4F4 8002CCF4 21288002 */  addu       $a1, $s4, $zero
/* 1D4F8 8002CCF8 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1D4FC 8002CCFC 7400E28E */  lw         $v0, 0x74($s7)
/* 1D500 8002CD00 21302002 */  addu       $a2, $s1, $zero
/* 1D504 8002CD04 2800A9AF */  sw         $t1, 0x28($sp)
/* 1D508 8002CD08 6000A98F */  lw         $t1, 0x60($sp)
/* 1D50C 8002CD0C 2138C002 */  addu       $a3, $s6, $zero
/* 1D510 8002CD10 2400BEAF */  sw         $fp, 0x24($sp)
/* 1D514 8002CD14 2C00A9AF */  sw         $t1, 0x2C($sp)
/* 1D518 8002CD18 1DB0000C */  jal        DRAW_DisplayTFace_zclipped_C
/* 1D51C 8002CD1C 2000A2AF */   sw        $v0, 0x20($sp)
/* 1D520 8002CD20 25800202 */  or         $s0, $s0, $v0
/* 1D524 8002CD24 4C00E226 */  addiu      $v0, $s7, 0x4C
/* 1D528 8002CD28 1000A2AF */  sw         $v0, 0x10($sp)
/* 1D52C 8002CD2C 1400B2AF */  sw         $s2, 0x14($sp)
/* 1D530 8002CD30 6C00E28E */  lw         $v0, 0x6C($s7)
/* 1D534 8002CD34 5C00A98F */  lw         $t1, 0x5C($sp)
/* 1D538 8002CD38 2120A002 */  addu       $a0, $s5, $zero
/* 1D53C 8002CD3C 1800A2AF */  sw         $v0, 0x18($sp)
/* 1D540 8002CD40 6400E28E */  lw         $v0, 0x64($s7)
/* 1D544 8002CD44 2000E536 */  ori        $a1, $s7, 0x20
/* 1D548 8002CD48 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 1D54C 8002CD4C 7000E28E */  lw         $v0, 0x70($s7)
/* 1D550 8002CD50 21308002 */  addu       $a2, $s4, $zero
/* 1D554 8002CD54 2800A9AF */  sw         $t1, 0x28($sp)
/* 1D558 8002CD58 6000A98F */  lw         $t1, 0x60($sp)
/* 1D55C 8002CD5C 2138C002 */  addu       $a3, $s6, $zero
/* 1D560 8002CD60 2400BEAF */  sw         $fp, 0x24($sp)
/* 1D564 8002CD64 2C00A9AF */  sw         $t1, 0x2C($sp)
/* 1D568 8002CD68 1DB0000C */  jal        DRAW_DisplayTFace_zclipped_C
/* 1D56C 8002CD6C 2000A2AF */   sw        $v0, 0x20($sp)
/* 1D570 8002CD70 25800202 */  or         $s0, $s0, $v0
/* 1D574 8002CD74 05001032 */  andi       $s0, $s0, 0x5
/* 1D578 8002CD78 04000224 */  addiu      $v0, $zero, 0x4
/* 1D57C 8002CD7C 02000212 */  beq        $s0, $v0, .L8002CD88
/* 1D580 8002CD80 21100000 */   addu      $v0, $zero, $zero
/* 1D584 8002CD84 0400C28F */  lw         $v0, 0x4($fp)
.L8002CD88:
/* 1D588 8002CD88 5400BF8F */  lw         $ra, 0x54($sp)
/* 1D58C 8002CD8C 5000BE8F */  lw         $fp, 0x50($sp)
/* 1D590 8002CD90 4C00B78F */  lw         $s7, 0x4C($sp)
/* 1D594 8002CD94 4800B68F */  lw         $s6, 0x48($sp)
/* 1D598 8002CD98 4400B58F */  lw         $s5, 0x44($sp)
/* 1D59C 8002CD9C 4000B48F */  lw         $s4, 0x40($sp)
/* 1D5A0 8002CDA0 3C00B38F */  lw         $s3, 0x3C($sp)
/* 1D5A4 8002CDA4 3800B28F */  lw         $s2, 0x38($sp)
/* 1D5A8 8002CDA8 3400B18F */  lw         $s1, 0x34($sp)
/* 1D5AC 8002CDAC 3000B08F */  lw         $s0, 0x30($sp)
/* 1D5B0 8002CDB0 0800E003 */  jr         $ra
/* 1D5B4 8002CDB4 5800BD27 */   addiu     $sp, $sp, 0x58
.size DRAW_Zclip_subdiv, . - DRAW_Zclip_subdiv
