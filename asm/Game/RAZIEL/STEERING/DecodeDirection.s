.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DecodeDirection
/* 92A88 800A2288 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 92A8C 800A228C 1000B0AF */  sw         $s0, 0x10($sp)
/* 92A90 800A2290 2180C000 */  addu       $s0, $a2, $zero
/* 92A94 800A2294 1800B2AF */  sw         $s2, 0x18($sp)
/* 92A98 800A2298 2190E000 */  addu       $s2, $a3, $zero
/* 92A9C 800A229C 1400B1AF */  sw         $s1, 0x14($sp)
/* 92AA0 800A22A0 21880000 */  addu       $s1, $zero, $zero
/* 92AA4 800A22A4 002C0500 */  sll        $a1, $a1, 16
/* 92AA8 800A22A8 00140400 */  sll        $v0, $a0, 16
/* 92AAC 800A22AC 03240500 */  sra        $a0, $a1, 16
/* 92AB0 800A22B0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 92AB4 800A22B4 7EE8000C */  jal        AngleDiff
/* 92AB8 800A22B8 032C0200 */   sra       $a1, $v0, 16
/* 92ABC 800A22BC 21184000 */  addu       $v1, $v0, $zero
/* 92AC0 800A22C0 FF016224 */  addiu      $v0, $v1, 0x1FF
/* 92AC4 800A22C4 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 92AC8 800A22C8 FF03422C */  sltiu      $v0, $v0, 0x3FF
/* 92ACC 800A22CC 05004010 */  beqz       $v0, .L800A22E4
/* 92AD0 800A22D0 000003A6 */   sh        $v1, 0x0($s0)
/* 92AD4 800A22D4 000040A6 */  sh         $zero, 0x0($s2)
/* 92AD8 800A22D8 0010113C */  lui        $s1, (0x10000001 >> 16)
/* 92ADC 800A22DC D7880208 */  j          .L800A235C
/* 92AE0 800A22E0 01003136 */   ori       $s1, $s1, (0x10000001 & 0xFFFF)
.L800A22E4:
/* 92AE4 800A22E4 00FE6224 */  addiu      $v0, $v1, -0x200
/* 92AE8 800A22E8 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 92AEC 800A22EC 0004422C */  sltiu      $v0, $v0, 0x400
/* 92AF0 800A22F0 05004010 */  beqz       $v0, .L800A2308
/* 92AF4 800A22F4 00040224 */   addiu     $v0, $zero, 0x400
/* 92AF8 800A22F8 000042A6 */  sh         $v0, 0x0($s2)
/* 92AFC 800A22FC 0010113C */  lui        $s1, (0x10000004 >> 16)
/* 92B00 800A2300 D7880208 */  j          .L800A235C
/* 92B04 800A2304 04003136 */   ori       $s1, $s1, (0x10000004 & 0xFFFF)
.L800A2308:
/* 92B08 800A2308 FF056224 */  addiu      $v0, $v1, 0x5FF
/* 92B0C 800A230C FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 92B10 800A2310 0004422C */  sltiu      $v0, $v0, 0x400
/* 92B14 800A2314 05004010 */  beqz       $v0, .L800A232C
/* 92B18 800A2318 00FC0224 */   addiu     $v0, $zero, -0x400
/* 92B1C 800A231C 000042A6 */  sh         $v0, 0x0($s2)
/* 92B20 800A2320 0010113C */  lui        $s1, (0x10000002 >> 16)
/* 92B24 800A2324 D7880208 */  j          .L800A235C
/* 92B28 800A2328 02003136 */   ori       $s1, $s1, (0x10000002 & 0xFFFF)
.L800A232C:
/* 92B2C 800A232C 00140300 */  sll        $v0, $v1, 16
/* 92B30 800A2330 031C0200 */  sra        $v1, $v0, 16
/* 92B34 800A2334 00066228 */  slti       $v0, $v1, 0x600
/* 92B38 800A2338 03004014 */  bnez       $v0, .L800A2348
/* 92B3C 800A233C 01FA6228 */   slti      $v0, $v1, -0x5FF
/* 92B40 800A2340 D4880208 */  j          .L800A2350
/* 92B44 800A2344 00080224 */   addiu     $v0, $zero, 0x800
.L800A2348:
/* 92B48 800A2348 04004010 */  beqz       $v0, .L800A235C
/* 92B4C 800A234C 00F80224 */   addiu     $v0, $zero, -0x800
.L800A2350:
/* 92B50 800A2350 000042A6 */  sh         $v0, 0x0($s2)
/* 92B54 800A2354 0010113C */  lui        $s1, (0x10000003 >> 16)
/* 92B58 800A2358 03003136 */  ori        $s1, $s1, (0x10000003 & 0xFFFF)
.L800A235C:
/* 92B5C 800A235C 21102002 */  addu       $v0, $s1, $zero
/* 92B60 800A2360 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 92B64 800A2364 1800B28F */  lw         $s2, 0x18($sp)
/* 92B68 800A2368 1400B18F */  lw         $s1, 0x14($sp)
/* 92B6C 800A236C 1000B08F */  lw         $s0, 0x10($sp)
/* 92B70 800A2370 0800E003 */  jr         $ra
/* 92B74 800A2374 2000BD27 */   addiu     $sp, $sp, 0x20
.size DecodeDirection, . - DecodeDirection
