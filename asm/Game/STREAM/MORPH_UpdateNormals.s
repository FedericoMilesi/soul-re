.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_UpdateNormals
/* 4D210 8005CA10 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4D214 8005CA14 21408000 */  addu       $t0, $a0, $zero
/* 4D218 8005CA18 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 4D21C 8005CA1C 2800B0AF */  sw         $s0, 0x28($sp)
/* 4D220 8005CA20 0000028D */  lw         $v0, 0x0($t0)
/* 4D224 8005CA24 00000000 */  nop
/* 4D228 8005CA28 4C00458C */  lw         $a1, 0x4C($v0)
/* 4D22C 8005CA2C 1400468C */  lw         $a2, 0x14($v0)
/* 4D230 8005CA30 2000438C */  lw         $v1, 0x20($v0)
/* 4D234 8005CA34 0B00C018 */  blez       $a2, .L8005CA64
/* 4D238 8005CA38 00000000 */   nop
/* 4D23C 8005CA3C 08006424 */  addiu      $a0, $v1, 0x8
.L8005CA40:
/* 4D240 8005CA40 00008394 */  lhu        $v1, 0x0($a0)
/* 4D244 8005CA44 0000A294 */  lhu        $v0, 0x0($a1)
/* 4D248 8005CA48 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 4D24C 8005CA4C 000082A4 */  sh         $v0, 0x0($a0)
/* 4D250 8005CA50 0000A3A4 */  sh         $v1, 0x0($a1)
/* 4D254 8005CA54 0200A524 */  addiu      $a1, $a1, 0x2
/* 4D258 8005CA58 F9FFC01C */  bgtz       $a2, .L8005CA40
/* 4D25C 8005CA5C 0C008424 */   addiu     $a0, $a0, 0xC
/* 4D260 8005CA60 0000028D */  lw         $v0, 0x0($t0)
.L8005CA64:
/* 4D264 8005CA64 00000000 */  nop
/* 4D268 8005CA68 3C00478C */  lw         $a3, 0x3C($v0)
/* 4D26C 8005CA6C 00000000 */  nop
/* 4D270 8005CA70 2000E010 */  beqz       $a3, .L8005CAF4
/* 4D274 8005CA74 00000000 */   nop
/* 4D278 8005CA78 0600E284 */  lh         $v0, 0x6($a3)
/* 4D27C 8005CA7C 0600E394 */  lhu        $v1, 0x6($a3)
/* 4D280 8005CA80 1C004004 */  bltz       $v0, .L8005CAF4
/* 4D284 8005CA84 00000000 */   nop
/* 4D288 8005CA88 0600E624 */  addiu      $a2, $a3, 0x6
.L8005CA8C:
/* 4D28C 8005CA8C 00140300 */  sll        $v0, $v1, 16
/* 4D290 8005CA90 03140200 */  sra        $v0, $v0, 16
/* 4D294 8005CA94 40180200 */  sll        $v1, $v0, 1
/* 4D298 8005CA98 21186200 */  addu       $v1, $v1, $v0
/* 4D29C 8005CA9C 80180300 */  sll        $v1, $v1, 2
/* 4D2A0 8005CAA0 0000028D */  lw         $v0, 0x0($t0)
/* 4D2A4 8005CAA4 0000E494 */  lhu        $a0, 0x0($a3)
/* 4D2A8 8005CAA8 1C00458C */  lw         $a1, 0x1C($v0)
/* 4D2AC 8005CAAC 0200C294 */  lhu        $v0, 0x2($a2)
/* 4D2B0 8005CAB0 2128A300 */  addu       $a1, $a1, $v1
/* 4D2B4 8005CAB4 21104400 */  addu       $v0, $v0, $a0
/* 4D2B8 8005CAB8 0000A2A4 */  sh         $v0, 0x0($a1)
/* 4D2BC 8005CABC 0400C294 */  lhu        $v0, 0x4($a2)
/* 4D2C0 8005CAC0 FCFFC394 */  lhu        $v1, -0x4($a2)
/* 4D2C4 8005CAC4 00000000 */  nop
/* 4D2C8 8005CAC8 21104300 */  addu       $v0, $v0, $v1
/* 4D2CC 8005CACC 0200A2A4 */  sh         $v0, 0x2($a1)
/* 4D2D0 8005CAD0 0600C294 */  lhu        $v0, 0x6($a2)
/* 4D2D4 8005CAD4 FEFFC394 */  lhu        $v1, -0x2($a2)
/* 4D2D8 8005CAD8 0E00C624 */  addiu      $a2, $a2, 0xE
/* 4D2DC 8005CADC 21104300 */  addu       $v0, $v0, $v1
/* 4D2E0 8005CAE0 0400A2A4 */  sh         $v0, 0x4($a1)
/* 4D2E4 8005CAE4 0000C284 */  lh         $v0, 0x0($a2)
/* 4D2E8 8005CAE8 0000C394 */  lhu        $v1, 0x0($a2)
/* 4D2EC 8005CAEC E7FF4104 */  bgez       $v0, .L8005CA8C
/* 4D2F0 8005CAF0 0E00E724 */   addiu     $a3, $a3, 0xE
.L8005CAF4:
/* 4D2F4 8005CAF4 0000038D */  lw         $v1, 0x0($t0)
/* 4D2F8 8005CAF8 00000000 */  nop
/* 4D2FC 8005CAFC 4000648C */  lw         $a0, 0x40($v1)
/* 4D300 8005CB00 00000000 */  nop
/* 4D304 8005CB04 1E008010 */  beqz       $a0, .L8005CB80
/* 4D308 8005CB08 00000000 */   nop
/* 4D30C 8005CB0C 1C00628C */  lw         $v0, 0x1C($v1)
/* 4D310 8005CB10 1000638C */  lw         $v1, 0x10($v1)
/* 4D314 8005CB14 21284000 */  addu       $a1, $v0, $zero
/* 4D318 8005CB18 40100300 */  sll        $v0, $v1, 1
/* 4D31C 8005CB1C 21104300 */  addu       $v0, $v0, $v1
/* 4D320 8005CB20 80100200 */  sll        $v0, $v0, 2
/* 4D324 8005CB24 2130A200 */  addu       $a2, $a1, $v0
/* 4D328 8005CB28 2B10A600 */  sltu       $v0, $a1, $a2
/* 4D32C 8005CB2C 14004010 */  beqz       $v0, .L8005CB80
/* 4D330 8005CB30 00000000 */   nop
/* 4D334 8005CB34 0A00A324 */  addiu      $v1, $a1, 0xA
.L8005CB38:
/* 4D338 8005CB38 00008290 */  lbu        $v0, 0x0($a0)
/* 4D33C 8005CB3C 00000000 */  nop
/* 4D340 8005CB40 1F004230 */  andi       $v0, $v0, 0x1F
/* 4D344 8005CB44 C0100200 */  sll        $v0, $v0, 3
/* 4D348 8005CB48 FEFF62A0 */  sb         $v0, -0x2($v1)
/* 4D34C 8005CB4C 00008294 */  lhu        $v0, 0x0($a0)
/* 4D350 8005CB50 0C00A524 */  addiu      $a1, $a1, 0xC
/* 4D354 8005CB54 82100200 */  srl        $v0, $v0, 2
/* 4D358 8005CB58 F8004230 */  andi       $v0, $v0, 0xF8
/* 4D35C 8005CB5C FFFF62A0 */  sb         $v0, -0x1($v1)
/* 4D360 8005CB60 00008294 */  lhu        $v0, 0x0($a0)
/* 4D364 8005CB64 02008424 */  addiu      $a0, $a0, 0x2
/* 4D368 8005CB68 C2110200 */  srl        $v0, $v0, 7
/* 4D36C 8005CB6C F8004230 */  andi       $v0, $v0, 0xF8
/* 4D370 8005CB70 000062A0 */  sb         $v0, 0x0($v1)
/* 4D374 8005CB74 2B10A600 */  sltu       $v0, $a1, $a2
/* 4D378 8005CB78 EFFF4014 */  bnez       $v0, .L8005CB38
/* 4D37C 8005CB7C 0C006324 */   addiu     $v1, $v1, 0xC
.L8005CB80:
/* 4D380 8005CB80 0000048D */  lw         $a0, 0x0($t0)
/* 4D384 8005CB84 00000000 */  nop
/* 4D388 8005CB88 4400828C */  lw         $v0, 0x44($a0)
/* 4D38C 8005CB8C 00000000 */  nop
/* 4D390 8005CB90 80004018 */  blez       $v0, .L8005CD94
/* 4D394 8005CB94 21400000 */   addu      $t0, $zero, $zero
/* 4D398 8005CB98 21300001 */  addu       $a2, $t0, $zero
.L8005CB9C:
/* 4D39C 8005CB9C 4800828C */  lw         $v0, 0x48($a0)
/* 4D3A0 8005CBA0 00000000 */  nop
/* 4D3A4 8005CBA4 2110C200 */  addu       $v0, $a2, $v0
/* 4D3A8 8005CBA8 0000438C */  lw         $v1, 0x0($v0)
/* 4D3AC 8005CBAC 0400428C */  lw         $v0, 0x4($v0)
/* 4D3B0 8005CBB0 00000000 */  nop
/* 4D3B4 8005CBB4 2B106200 */  sltu       $v0, $v1, $v0
/* 4D3B8 8005CBB8 22004010 */  beqz       $v0, .L8005CC44
/* 4D3BC 8005CBBC 1C006524 */   addiu     $a1, $v1, 0x1C
/* 4D3C0 8005CBC0 2138C000 */  addu       $a3, $a2, $zero
.L8005CBC4:
/* 4D3C4 8005CBC4 03006988 */  lwl        $t1, 0x3($v1)
/* 4D3C8 8005CBC8 00006998 */  lwr        $t1, 0x0($v1)
/* 4D3CC 8005CBCC 07006A88 */  lwl        $t2, 0x7($v1)
/* 4D3D0 8005CBD0 04006A98 */  lwr        $t2, 0x4($v1)
/* 4D3D4 8005CBD4 1300A9AB */  swl        $t1, 0x13($sp)
/* 4D3D8 8005CBD8 1000A9BB */  swr        $t1, 0x10($sp)
/* 4D3DC 8005CBDC 1700AAAB */  swl        $t2, 0x17($sp)
/* 4D3E0 8005CBE0 1400AABB */  swr        $t2, 0x14($sp)
/* 4D3E4 8005CBE4 0300A988 */  lwl        $t1, 0x3($a1)
/* 4D3E8 8005CBE8 0000A998 */  lwr        $t1, 0x0($a1)
/* 4D3EC 8005CBEC 0700AA88 */  lwl        $t2, 0x7($a1)
/* 4D3F0 8005CBF0 0400AA98 */  lwr        $t2, 0x4($a1)
/* 4D3F4 8005CBF4 030069A8 */  swl        $t1, 0x3($v1)
/* 4D3F8 8005CBF8 000069B8 */  swr        $t1, 0x0($v1)
/* 4D3FC 8005CBFC 07006AA8 */  swl        $t2, 0x7($v1)
/* 4D400 8005CC00 04006AB8 */  swr        $t2, 0x4($v1)
/* 4D404 8005CC04 1300A98B */  lwl        $t1, 0x13($sp)
/* 4D408 8005CC08 1000A99B */  lwr        $t1, 0x10($sp)
/* 4D40C 8005CC0C 1700AA8B */  lwl        $t2, 0x17($sp)
/* 4D410 8005CC10 1400AA9B */  lwr        $t2, 0x14($sp)
/* 4D414 8005CC14 0300A9A8 */  swl        $t1, 0x3($a1)
/* 4D418 8005CC18 0000A9B8 */  swr        $t1, 0x0($a1)
/* 4D41C 8005CC1C 0700AAA8 */  swl        $t2, 0x7($a1)
/* 4D420 8005CC20 0400AAB8 */  swr        $t2, 0x4($a1)
/* 4D424 8005CC24 4800828C */  lw         $v0, 0x48($a0)
/* 4D428 8005CC28 00000000 */  nop
/* 4D42C 8005CC2C 2110E200 */  addu       $v0, $a3, $v0
/* 4D430 8005CC30 0400428C */  lw         $v0, 0x4($v0)
/* 4D434 8005CC34 2C006324 */  addiu      $v1, $v1, 0x2C
/* 4D438 8005CC38 2B106200 */  sltu       $v0, $v1, $v0
/* 4D43C 8005CC3C E1FF4014 */  bnez       $v0, .L8005CBC4
/* 4D440 8005CC40 2C00A524 */   addiu     $a1, $a1, 0x2C
.L8005CC44:
/* 4D444 8005CC44 4800828C */  lw         $v0, 0x48($a0)
/* 4D448 8005CC48 00000000 */  nop
/* 4D44C 8005CC4C 2110C200 */  addu       $v0, $a2, $v0
/* 4D450 8005CC50 0400458C */  lw         $a1, 0x4($v0)
/* 4D454 8005CC54 0800428C */  lw         $v0, 0x8($v0)
/* 4D458 8005CC58 00000000 */  nop
/* 4D45C 8005CC5C 2B10A200 */  sltu       $v0, $a1, $v0
/* 4D460 8005CC60 47004010 */  beqz       $v0, .L8005CD80
/* 4D464 8005CC64 00000000 */   nop
/* 4D468 8005CC68 2138C000 */  addu       $a3, $a2, $zero
/* 4D46C 8005CC6C 1C00A324 */  addiu      $v1, $a1, 0x1C
.L8005CC70:
/* 4D470 8005CC70 0300A988 */  lwl        $t1, 0x3($a1)
/* 4D474 8005CC74 0000A998 */  lwr        $t1, 0x0($a1)
/* 4D478 8005CC78 0700AA88 */  lwl        $t2, 0x7($a1)
/* 4D47C 8005CC7C 0400AA98 */  lwr        $t2, 0x4($a1)
/* 4D480 8005CC80 1300A9AB */  swl        $t1, 0x13($sp)
/* 4D484 8005CC84 1000A9BB */  swr        $t1, 0x10($sp)
/* 4D488 8005CC88 1700AAAB */  swl        $t2, 0x17($sp)
/* 4D48C 8005CC8C 1400AABB */  swr        $t2, 0x14($sp)
/* 4D490 8005CC90 0F006988 */  lwl        $t1, 0xF($v1)
/* 4D494 8005CC94 0C006998 */  lwr        $t1, 0xC($v1)
/* 4D498 8005CC98 13006A88 */  lwl        $t2, 0x13($v1)
/* 4D49C 8005CC9C 10006A98 */  lwr        $t2, 0x10($v1)
/* 4D4A0 8005CCA0 0300A9A8 */  swl        $t1, 0x3($a1)
/* 4D4A4 8005CCA4 0000A9B8 */  swr        $t1, 0x0($a1)
/* 4D4A8 8005CCA8 0700AAA8 */  swl        $t2, 0x7($a1)
/* 4D4AC 8005CCAC 0400AAB8 */  swr        $t2, 0x4($a1)
/* 4D4B0 8005CCB0 1300A98B */  lwl        $t1, 0x13($sp)
/* 4D4B4 8005CCB4 1000A99B */  lwr        $t1, 0x10($sp)
/* 4D4B8 8005CCB8 1700AA8B */  lwl        $t2, 0x17($sp)
/* 4D4BC 8005CCBC 1400AA9B */  lwr        $t2, 0x14($sp)
/* 4D4C0 8005CCC0 0F0069A8 */  swl        $t1, 0xF($v1)
/* 4D4C4 8005CCC4 0C0069B8 */  swr        $t1, 0xC($v1)
/* 4D4C8 8005CCC8 13006AA8 */  swl        $t2, 0x13($v1)
/* 4D4CC 8005CCCC 10006AB8 */  swr        $t2, 0x10($v1)
/* 4D4D0 8005CCD0 F7FF6988 */  lwl        $t1, -0x9($v1)
/* 4D4D4 8005CCD4 F4FF6998 */  lwr        $t1, -0xC($v1)
/* 4D4D8 8005CCD8 FBFF6A88 */  lwl        $t2, -0x5($v1)
/* 4D4DC 8005CCDC F8FF6A98 */  lwr        $t2, -0x8($v1)
/* 4D4E0 8005CCE0 FFFF6B88 */  lwl        $t3, -0x1($v1)
/* 4D4E4 8005CCE4 FCFF6B98 */  lwr        $t3, -0x4($v1)
/* 4D4E8 8005CCE8 1B00A9AB */  swl        $t1, 0x1B($sp)
/* 4D4EC 8005CCEC 1800A9BB */  swr        $t1, 0x18($sp)
/* 4D4F0 8005CCF0 1F00AAAB */  swl        $t2, 0x1F($sp)
/* 4D4F4 8005CCF4 1C00AABB */  swr        $t2, 0x1C($sp)
/* 4D4F8 8005CCF8 2300ABAB */  swl        $t3, 0x23($sp)
/* 4D4FC 8005CCFC 2000ABBB */  swr        $t3, 0x20($sp)
/* 4D500 8005CD00 03006988 */  lwl        $t1, 0x3($v1)
/* 4D504 8005CD04 00006998 */  lwr        $t1, 0x0($v1)
/* 4D508 8005CD08 07006A88 */  lwl        $t2, 0x7($v1)
/* 4D50C 8005CD0C 04006A98 */  lwr        $t2, 0x4($v1)
/* 4D510 8005CD10 0B006B88 */  lwl        $t3, 0xB($v1)
/* 4D514 8005CD14 08006B98 */  lwr        $t3, 0x8($v1)
/* 4D518 8005CD18 F7FF69A8 */  swl        $t1, -0x9($v1)
/* 4D51C 8005CD1C F4FF69B8 */  swr        $t1, -0xC($v1)
/* 4D520 8005CD20 FBFF6AA8 */  swl        $t2, -0x5($v1)
/* 4D524 8005CD24 F8FF6AB8 */  swr        $t2, -0x8($v1)
/* 4D528 8005CD28 FFFF6BA8 */  swl        $t3, -0x1($v1)
/* 4D52C 8005CD2C FCFF6BB8 */  swr        $t3, -0x4($v1)
/* 4D530 8005CD30 1B00A98B */  lwl        $t1, 0x1B($sp)
/* 4D534 8005CD34 1800A99B */  lwr        $t1, 0x18($sp)
/* 4D538 8005CD38 1F00AA8B */  lwl        $t2, 0x1F($sp)
/* 4D53C 8005CD3C 1C00AA9B */  lwr        $t2, 0x1C($sp)
/* 4D540 8005CD40 2300AB8B */  lwl        $t3, 0x23($sp)
/* 4D544 8005CD44 2000AB9B */  lwr        $t3, 0x20($sp)
/* 4D548 8005CD48 030069A8 */  swl        $t1, 0x3($v1)
/* 4D54C 8005CD4C 000069B8 */  swr        $t1, 0x0($v1)
/* 4D550 8005CD50 07006AA8 */  swl        $t2, 0x7($v1)
/* 4D554 8005CD54 04006AB8 */  swr        $t2, 0x4($v1)
/* 4D558 8005CD58 0B006BA8 */  swl        $t3, 0xB($v1)
/* 4D55C 8005CD5C 08006BB8 */  swr        $t3, 0x8($v1)
/* 4D560 8005CD60 4800828C */  lw         $v0, 0x48($a0)
/* 4D564 8005CD64 00000000 */  nop
/* 4D568 8005CD68 2110E200 */  addu       $v0, $a3, $v0
/* 4D56C 8005CD6C 0800428C */  lw         $v0, 0x8($v0)
/* 4D570 8005CD70 3000A524 */  addiu      $a1, $a1, 0x30
/* 4D574 8005CD74 2B10A200 */  sltu       $v0, $a1, $v0
/* 4D578 8005CD78 BDFF4014 */  bnez       $v0, .L8005CC70
/* 4D57C 8005CD7C 30006324 */   addiu     $v1, $v1, 0x30
.L8005CD80:
/* 4D580 8005CD80 4400828C */  lw         $v0, 0x44($a0)
/* 4D584 8005CD84 01000825 */  addiu      $t0, $t0, 0x1
/* 4D588 8005CD88 2A100201 */  slt        $v0, $t0, $v0
/* 4D58C 8005CD8C 83FF4014 */  bnez       $v0, .L8005CB9C
/* 4D590 8005CD90 2400C624 */   addiu     $a2, $a2, 0x24
.L8005CD94:
/* 4D594 8005CD94 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4D598 8005CD98 00000000 */  nop
/* 4D59C 8005CD9C 0400508C */  lw         $s0, 0x4($v0)
/* 4D5A0 8005CDA0 00000000 */  nop
/* 4D5A4 8005CDA4 43000012 */  beqz       $s0, .L8005CEB4
/* 4D5A8 8005CDA8 00000000 */   nop
.L8005CDAC:
/* 4D5AC 8005CDAC 2000048E */  lw         $a0, 0x20($s0)
/* 4D5B0 8005CDB0 00000000 */  nop
/* 4D5B4 8005CDB4 3B008010 */  beqz       $a0, .L8005CEA4
/* 4D5B8 8005CDB8 00000000 */   nop
/* 4D5BC 8005CDBC 4400828C */  lw         $v0, 0x44($a0)
/* 4D5C0 8005CDC0 00000000 */  nop
/* 4D5C4 8005CDC4 05004014 */  bnez       $v0, .L8005CDDC
/* 4D5C8 8005CDC8 00000000 */   nop
/* 4D5CC 8005CDCC 48008284 */  lh         $v0, 0x48($a0)
/* 4D5D0 8005CDD0 00000000 */  nop
/* 4D5D4 8005CDD4 33004010 */  beqz       $v0, .L8005CEA4
/* 4D5D8 8005CDD8 00000000 */   nop
.L8005CDDC:
/* 4D5DC 8005CDDC 1800028E */  lw         $v0, 0x18($s0)
/* 4D5E0 8005CDE0 00000000 */  nop
/* 4D5E4 8005CDE4 08004230 */  andi       $v0, $v0, 0x8
/* 4D5E8 8005CDE8 2E004014 */  bnez       $v0, .L8005CEA4
/* 4D5EC 8005CDEC 00000000 */   nop
/* 4D5F0 8005CDF0 5F00098A */  lwl        $t1, 0x5F($s0)
/* 4D5F4 8005CDF4 5C00099A */  lwr        $t1, 0x5C($s0)
/* 4D5F8 8005CDF8 60000A86 */  lh         $t2, 0x60($s0)
/* 4D5FC 8005CDFC 1B00A9AB */  swl        $t1, 0x1B($sp)
/* 4D600 8005CE00 1800A9BB */  swr        $t1, 0x18($sp)
/* 4D604 8005CE04 1C00AAA7 */  sh         $t2, 0x1C($sp)
/* 4D608 8005CE08 20008294 */  lhu        $v0, 0x20($a0)
/* 4D60C 8005CE0C 44008394 */  lhu        $v1, 0x44($a0)
/* 4D610 8005CE10 00000000 */  nop
/* 4D614 8005CE14 21104300 */  addu       $v0, $v0, $v1
/* 4D618 8005CE18 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 4D61C 8005CE1C 22008294 */  lhu        $v0, 0x22($a0)
/* 4D620 8005CE20 46008394 */  lhu        $v1, 0x46($a0)
/* 4D624 8005CE24 00000000 */  nop
/* 4D628 8005CE28 21104300 */  addu       $v0, $v0, $v1
/* 4D62C 8005CE2C 5E0002A6 */  sh         $v0, 0x5E($s0)
/* 4D630 8005CE30 24008294 */  lhu        $v0, 0x24($a0)
/* 4D634 8005CE34 48008394 */  lhu        $v1, 0x48($a0)
/* 4D638 8005CE38 5C000596 */  lhu        $a1, 0x5C($s0)
/* 4D63C 8005CE3C 21104300 */  addu       $v0, $v0, $v1
/* 4D640 8005CE40 600002A6 */  sh         $v0, 0x60($s0)
/* 4D644 8005CE44 1800A297 */  lhu        $v0, 0x18($sp)
/* 4D648 8005CE48 00000000 */  nop
/* 4D64C 8005CE4C 2328A200 */  subu       $a1, $a1, $v0
/* 4D650 8005CE50 1000A5A7 */  sh         $a1, 0x10($sp)
/* 4D654 8005CE54 002C0500 */  sll        $a1, $a1, 16
/* 4D658 8005CE58 5E000496 */  lhu        $a0, 0x5E($s0)
/* 4D65C 8005CE5C 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 4D660 8005CE60 032C0500 */  sra        $a1, $a1, 16
/* 4D664 8005CE64 23208200 */  subu       $a0, $a0, $v0
/* 4D668 8005CE68 1200A4A7 */  sh         $a0, 0x12($sp)
/* 4D66C 8005CE6C 00240400 */  sll        $a0, $a0, 16
/* 4D670 8005CE70 03240400 */  sra        $a0, $a0, 16
/* 4D674 8005CE74 60000396 */  lhu        $v1, 0x60($s0)
/* 4D678 8005CE78 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 4D67C 8005CE7C 2128A400 */  addu       $a1, $a1, $a0
/* 4D680 8005CE80 23186200 */  subu       $v1, $v1, $v0
/* 4D684 8005CE84 1400A3A7 */  sh         $v1, 0x14($sp)
/* 4D688 8005CE88 001C0300 */  sll        $v1, $v1, 16
/* 4D68C 8005CE8C 031C0300 */  sra        $v1, $v1, 16
/* 4D690 8005CE90 2128A300 */  addu       $a1, $a1, $v1
/* 4D694 8005CE94 0300A010 */  beqz       $a1, .L8005CEA4
/* 4D698 8005CE98 21200002 */   addu      $a0, $s0, $zero
/* 4D69C 8005CE9C 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 4D6A0 8005CEA0 1000A527 */   addiu     $a1, $sp, 0x10
.L8005CEA4:
/* 4D6A4 8005CEA4 0800108E */  lw         $s0, 0x8($s0)
/* 4D6A8 8005CEA8 00000000 */  nop
/* 4D6AC 8005CEAC BFFF0016 */  bnez       $s0, .L8005CDAC
/* 4D6B0 8005CEB0 00000000 */   nop
.L8005CEB4:
/* 4D6B4 8005CEB4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 4D6B8 8005CEB8 2800B08F */  lw         $s0, 0x28($sp)
/* 4D6BC 8005CEBC 0800E003 */  jr         $ra
/* 4D6C0 8005CEC0 3000BD27 */   addiu     $sp, $sp, 0x30
.size MORPH_UpdateNormals, . - MORPH_UpdateNormals
