.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_DrawChar2D
/* 1DB28 8002D328 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1DB2C 8002D32C C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 1DB30 8002D330 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 1DB34 8002D334 21B8A000 */  addu       $s7, $a1, $zero
/* 1DB38 8002D338 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1DB3C 8002D33C 2198C000 */  addu       $s3, $a2, $zero
/* 1DB40 8002D340 3000BEAF */  sw         $fp, 0x30($sp)
/* 1DB44 8002D344 3400BFAF */  sw         $ra, 0x34($sp)
/* 1DB48 8002D348 2800B6AF */  sw         $s6, 0x28($sp)
/* 1DB4C 8002D34C 2400B5AF */  sw         $s5, 0x24($sp)
/* 1DB50 8002D350 2000B4AF */  sw         $s4, 0x20($sp)
/* 1DB54 8002D354 1800B2AF */  sw         $s2, 0x18($sp)
/* 1DB58 8002D358 1400B1AF */  sw         $s1, 0x14($sp)
/* 1DB5C 8002D35C 1000B0AF */  sw         $s0, 0x10($sp)
/* 1DB60 8002D360 0800438C */  lw         $v1, 0x8($v0)
/* 1DB64 8002D364 0400428C */  lw         $v0, 0x4($v0)
/* 1DB68 8002D368 D0FF6324 */  addiu      $v1, $v1, -0x30
/* 1DB6C 8002D36C 2B186200 */  sltu       $v1, $v1, $v0
/* 1DB70 8002D370 6E006014 */  bnez       $v1, .L8002D52C
/* 1DB74 8002D374 21F08000 */   addu      $fp, $a0, $zero
/* 1DB78 8002D378 44B4000C */  jal        FONT_Get2DImageIndex
/* 1DB7C 8002D37C FF00C433 */   andi      $a0, $fp, 0xFF
/* 1DB80 8002D380 0D80043C */  lui        $a0, %hi(charMap)
/* 1DB84 8002D384 E0A08424 */  addiu      $a0, $a0, %lo(charMap)
/* 1DB88 8002D388 40180200 */  sll        $v1, $v0, 1
/* 1DB8C 8002D38C 21186200 */  addu       $v1, $v1, $v0
/* 1DB90 8002D390 21186400 */  addu       $v1, $v1, $a0
/* 1DB94 8002D394 00006480 */  lb         $a0, 0x0($v1)
/* 1DB98 8002D398 01007480 */  lb         $s4, 0x1($v1)
/* 1DB9C 8002D39C 02007580 */  lb         $s5, 0x2($v1)
/* 1DBA0 8002D3A0 0B008004 */  bltz       $a0, .L8002D3D0
/* 1DBA4 8002D3A4 0D80023C */   lui       $v0, %hi(fontPos)
/* 1DBA8 8002D3A8 C09F4224 */  addiu      $v0, $v0, %lo(fontPos)
/* 1DBAC 8002D3AC 80180400 */  sll        $v1, $a0, 2
/* 1DBB0 8002D3B0 21186200 */  addu       $v1, $v1, $v0
/* 1DBB4 8002D3B4 02006280 */  lb         $v0, 0x2($v1)
/* 1DBB8 8002D3B8 00000000 */  nop
/* 1DBBC 8002D3BC 02004104 */  bgez       $v0, .L8002D3C8
/* 1DBC0 8002D3C0 21284000 */   addu      $a1, $v0, $zero
/* 1DBC4 8002D3C4 23280500 */  negu       $a1, $a1
.L8002D3C8:
/* 1DBC8 8002D3C8 F5B40008 */  j          .L8002D3D4
/* 1DBCC 8002D3CC 00000000 */   nop
.L8002D3D0:
/* 1DBD0 8002D3D0 08000524 */  addiu      $a1, $zero, 0x8
.L8002D3D4:
/* 1DBD4 8002D3D4 0B008006 */  bltz       $s4, .L8002D404
/* 1DBD8 8002D3D8 0D80023C */   lui       $v0, %hi(fontPos)
/* 1DBDC 8002D3DC C09F4224 */  addiu      $v0, $v0, %lo(fontPos)
/* 1DBE0 8002D3E0 80181400 */  sll        $v1, $s4, 2
/* 1DBE4 8002D3E4 21186200 */  addu       $v1, $v1, $v0
/* 1DBE8 8002D3E8 02006280 */  lb         $v0, 0x2($v1)
/* 1DBEC 8002D3EC 00000000 */  nop
/* 1DBF0 8002D3F0 02004104 */  bgez       $v0, .L8002D3FC
/* 1DBF4 8002D3F4 21884000 */   addu      $s1, $v0, $zero
/* 1DBF8 8002D3F8 23881100 */  negu       $s1, $s1
.L8002D3FC:
/* 1DBFC 8002D3FC 02B50008 */  j          .L8002D408
/* 1DC00 8002D400 00000000 */   nop
.L8002D404:
/* 1DC04 8002D404 2188A000 */  addu       $s1, $a1, $zero
.L8002D408:
/* 1DC08 8002D408 0B00A006 */  bltz       $s5, .L8002D438
/* 1DC0C 8002D40C 0D80023C */   lui       $v0, %hi(fontPos)
/* 1DC10 8002D410 C09F4224 */  addiu      $v0, $v0, %lo(fontPos)
/* 1DC14 8002D414 80181500 */  sll        $v1, $s5, 2
/* 1DC18 8002D418 21186200 */  addu       $v1, $v1, $v0
/* 1DC1C 8002D41C 02006280 */  lb         $v0, 0x2($v1)
/* 1DC20 8002D420 00000000 */  nop
/* 1DC24 8002D424 02004104 */  bgez       $v0, .L8002D430
/* 1DC28 8002D428 21904000 */   addu      $s2, $v0, $zero
/* 1DC2C 8002D42C 23901200 */  negu       $s2, $s2
.L8002D430:
/* 1DC30 8002D430 10B50008 */  j          .L8002D440
/* 1DC34 8002D434 2A102502 */   slt       $v0, $s1, $a1
.L8002D438:
/* 1DC38 8002D438 2190A000 */  addu       $s2, $a1, $zero
/* 1DC3C 8002D43C 2A102502 */  slt        $v0, $s1, $a1
.L8002D440:
/* 1DC40 8002D440 05004010 */  beqz       $v0, .L8002D458
/* 1DC44 8002D444 2A104502 */   slt       $v0, $s2, $a1
/* 1DC48 8002D448 07004010 */  beqz       $v0, .L8002D468
/* 1DC4C 8002D44C 21804002 */   addu      $s0, $s2, $zero
/* 1DC50 8002D450 1AB50008 */  j          .L8002D468
/* 1DC54 8002D454 2180A000 */   addu      $s0, $a1, $zero
.L8002D458:
/* 1DC58 8002D458 2A105102 */  slt        $v0, $s2, $s1
/* 1DC5C 8002D45C 02004010 */  beqz       $v0, .L8002D468
/* 1DC60 8002D460 21804002 */   addu      $s0, $s2, $zero
/* 1DC64 8002D464 21802002 */  addu       $s0, $s1, $zero
.L8002D468:
/* 1DC68 8002D468 0B008004 */  bltz       $a0, .L8002D498
/* 1DC6C 8002D46C 0D80023C */   lui       $v0, %hi(fontPos)
/* 1DC70 8002D470 C09F4224 */  addiu      $v0, $v0, %lo(fontPos)
/* 1DC74 8002D474 80180400 */  sll        $v1, $a0, 2
/* 1DC78 8002D478 21186200 */  addu       $v1, $v1, $v0
/* 1DC7C 8002D47C 03006280 */  lb         $v0, 0x3($v1)
/* 1DC80 8002D480 00000000 */  nop
/* 1DC84 8002D484 02004104 */  bgez       $v0, .L8002D490
/* 1DC88 8002D488 21B04000 */   addu      $s6, $v0, $zero
/* 1DC8C 8002D48C 23B01600 */  negu       $s6, $s6
.L8002D490:
/* 1DC90 8002D490 27B50008 */  j          .L8002D49C
/* 1DC94 8002D494 00000000 */   nop
.L8002D498:
/* 1DC98 8002D498 0C001624 */  addiu      $s6, $zero, 0xC
.L8002D49C:
/* 1DC9C 8002D49C 07008004 */  bltz       $a0, .L8002D4BC
/* 1DCA0 8002D4A0 23280502 */   subu      $a1, $s0, $a1
/* 1DCA4 8002D4A4 C2170500 */  srl        $v0, $a1, 31
/* 1DCA8 8002D4A8 2128A200 */  addu       $a1, $a1, $v0
/* 1DCAC 8002D4AC 43280500 */  sra        $a1, $a1, 1
/* 1DCB0 8002D4B0 2128E502 */  addu       $a1, $s7, $a1
/* 1DCB4 8002D4B4 4AB4000C */  jal        drawChar2DPoly
/* 1DCB8 8002D4B8 21306002 */   addu      $a2, $s3, $zero
.L8002D4BC:
/* 1DCBC 8002D4BC 23101102 */  subu       $v0, $s0, $s1
/* 1DCC0 8002D4C0 C21F0200 */  srl        $v1, $v0, 31
/* 1DCC4 8002D4C4 21104300 */  addu       $v0, $v0, $v1
/* 1DCC8 8002D4C8 43100200 */  sra        $v0, $v0, 1
/* 1DCCC 8002D4CC 2128E202 */  addu       $a1, $s7, $v0
/* 1DCD0 8002D4D0 FF00C433 */  andi       $a0, $fp, 0xFF
/* 1DCD4 8002D4D4 41000224 */  addiu      $v0, $zero, 0x41
/* 1DCD8 8002D4D8 02008214 */  bne        $a0, $v0, .L8002D4E4
/* 1DCDC 8002D4DC 21306002 */   addu      $a2, $s3, $zero
/* 1DCE0 8002D4E0 02006626 */  addiu      $a2, $s3, 0x2
.L8002D4E4:
/* 1DCE4 8002D4E4 27000224 */  addiu      $v0, $zero, 0x27
/* 1DCE8 8002D4E8 02008214 */  bne        $a0, $v0, .L8002D4F4
/* 1DCEC 8002D4EC 00000000 */   nop
/* 1DCF0 8002D4F0 03007326 */  addiu      $s3, $s3, 0x3
.L8002D4F4:
/* 1DCF4 8002D4F4 03008006 */  bltz       $s4, .L8002D504
/* 1DCF8 8002D4F8 00000000 */   nop
/* 1DCFC 8002D4FC 4AB4000C */  jal        drawChar2DPoly
/* 1DD00 8002D500 21208002 */   addu      $a0, $s4, $zero
.L8002D504:
/* 1DD04 8002D504 0900A006 */  bltz       $s5, .L8002D52C
/* 1DD08 8002D508 2120A002 */   addu      $a0, $s5, $zero
/* 1DD0C 8002D50C 23281202 */  subu       $a1, $s0, $s2
/* 1DD10 8002D510 C2170500 */  srl        $v0, $a1, 31
/* 1DD14 8002D514 2128A200 */  addu       $a1, $a1, $v0
/* 1DD18 8002D518 43280500 */  sra        $a1, $a1, 1
/* 1DD1C 8002D51C 2128E502 */  addu       $a1, $s7, $a1
/* 1DD20 8002D520 01006626 */  addiu      $a2, $s3, 0x1
/* 1DD24 8002D524 4AB4000C */  jal        drawChar2DPoly
/* 1DD28 8002D528 2330D600 */   subu      $a2, $a2, $s6
.L8002D52C:
/* 1DD2C 8002D52C 3400BF8F */  lw         $ra, 0x34($sp)
/* 1DD30 8002D530 3000BE8F */  lw         $fp, 0x30($sp)
/* 1DD34 8002D534 2C00B78F */  lw         $s7, 0x2C($sp)
/* 1DD38 8002D538 2800B68F */  lw         $s6, 0x28($sp)
/* 1DD3C 8002D53C 2400B58F */  lw         $s5, 0x24($sp)
/* 1DD40 8002D540 2000B48F */  lw         $s4, 0x20($sp)
/* 1DD44 8002D544 1C00B38F */  lw         $s3, 0x1C($sp)
/* 1DD48 8002D548 1800B28F */  lw         $s2, 0x18($sp)
/* 1DD4C 8002D54C 1400B18F */  lw         $s1, 0x14($sp)
/* 1DD50 8002D550 1000B08F */  lw         $s0, 0x10($sp)
/* 1DD54 8002D554 0800E003 */  jr         $ra
/* 1DD58 8002D558 3800BD27 */   addiu     $sp, $sp, 0x38
.size FONT_DrawChar2D, . - FONT_DrawChar2D
