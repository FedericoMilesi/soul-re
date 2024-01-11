.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_AddOffsets
/* 4DB34 8005D334 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4DB38 8005D338 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 4DB3C 8005D33C 3000B2AF */  sw         $s2, 0x30($sp)
/* 4DB40 8005D340 3400BFAF */  sw         $ra, 0x34($sp)
/* 4DB44 8005D344 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 4DB48 8005D348 2800B0AF */  sw         $s0, 0x28($sp)
/* 4DB4C 8005D34C 0400508C */  lw         $s0, 0x4($v0)
/* 4DB50 8005D350 F501A228 */  slti       $v0, $a1, 0x1F5
/* 4DB54 8005D354 10004010 */  beqz       $v0, .L8005D398
/* 4DB58 8005D358 21908000 */   addu      $s2, $a0, $zero
/* 4DB5C 8005D35C 40100500 */  sll        $v0, $a1, 1
/* 4DB60 8005D360 18004200 */  mult       $v0, $v0
/* 4DB64 8005D364 12180000 */  mflo       $v1
/* 4DB68 8005D368 00000000 */  nop
/* 4DB6C 8005D36C 00000000 */  nop
/* 4DB70 8005D370 18006200 */  mult       $v1, $v0
/* 4DB74 8005D374 12100000 */  mflo       $v0
/* 4DB78 8005D378 1B43033C */  lui        $v1, (0x431BDE83 >> 16)
/* 4DB7C 8005D37C 83DE6334 */  ori        $v1, $v1, (0x431BDE83 & 0xFFFF)
/* 4DB80 8005D380 18004300 */  mult       $v0, $v1
/* 4DB84 8005D384 C3170200 */  sra        $v0, $v0, 31
/* 4DB88 8005D388 10180000 */  mfhi       $v1
/* 4DB8C 8005D38C C31C0300 */  sra        $v1, $v1, 19
/* 4DB90 8005D390 F7740108 */  j          .L8005D3DC
/* 4DB94 8005D394 23286200 */   subu      $a1, $v1, $v0
.L8005D398:
/* 4DB98 8005D398 E8030424 */  addiu      $a0, $zero, 0x3E8
/* 4DB9C 8005D39C 23108500 */  subu       $v0, $a0, $a1
/* 4DBA0 8005D3A0 40100200 */  sll        $v0, $v0, 1
/* 4DBA4 8005D3A4 18004200 */  mult       $v0, $v0
/* 4DBA8 8005D3A8 12180000 */  mflo       $v1
/* 4DBAC 8005D3AC 00000000 */  nop
/* 4DBB0 8005D3B0 00000000 */  nop
/* 4DBB4 8005D3B4 18006200 */  mult       $v1, $v0
/* 4DBB8 8005D3B8 12180000 */  mflo       $v1
/* 4DBBC 8005D3BC 1B43023C */  lui        $v0, (0x431BDE83 >> 16)
/* 4DBC0 8005D3C0 83DE4234 */  ori        $v0, $v0, (0x431BDE83 & 0xFFFF)
/* 4DBC4 8005D3C4 18006200 */  mult       $v1, $v0
/* 4DBC8 8005D3C8 C31F0300 */  sra        $v1, $v1, 31
/* 4DBCC 8005D3CC 10100000 */  mfhi       $v0
/* 4DBD0 8005D3D0 C3140200 */  sra        $v0, $v0, 19
/* 4DBD4 8005D3D4 23104300 */  subu       $v0, $v0, $v1
/* 4DBD8 8005D3D8 23288200 */  subu       $a1, $a0, $v0
.L8005D3DC:
/* 4DBDC 8005D3DC 6210023C */  lui        $v0, (0x10624DD3 >> 16)
/* 4DBE0 8005D3E0 D34D4234 */  ori        $v0, $v0, (0x10624DD3 & 0xFFFF)
/* 4DBE4 8005D3E4 001B0500 */  sll        $v1, $a1, 12
/* 4DBE8 8005D3E8 18006200 */  mult       $v1, $v0
/* 4DBEC 8005D3EC 0000428E */  lw         $v0, 0x0($s2)
/* 4DBF0 8005D3F0 C31F0300 */  sra        $v1, $v1, 31
/* 4DBF4 8005D3F4 3C00468C */  lw         $a2, 0x3C($v0)
/* 4DBF8 8005D3F8 10680000 */  mfhi       $t5
/* 4DBFC 8005D3FC 83110D00 */  sra        $v0, $t5, 6
/* 4DC00 8005D400 2B00C010 */  beqz       $a2, .L8005D4B0
/* 4DC04 8005D404 23884300 */   subu      $s1, $v0, $v1
/* 4DC08 8005D408 0600C284 */  lh         $v0, 0x6($a2)
/* 4DC0C 8005D40C 0600C394 */  lhu        $v1, 0x6($a2)
/* 4DC10 8005D410 27004004 */  bltz       $v0, .L8005D4B0
/* 4DC14 8005D414 00000000 */   nop
/* 4DC18 8005D418 0600C524 */  addiu      $a1, $a2, 0x6
.L8005D41C:
/* 4DC1C 8005D41C 0000C284 */  lh         $v0, 0x0($a2)
/* 4DC20 8005D420 00000000 */  nop
/* 4DC24 8005D424 18005100 */  mult       $v0, $s1
/* 4DC28 8005D428 0000448E */  lw         $a0, 0x0($s2)
/* 4DC2C 8005D42C 00140300 */  sll        $v0, $v1, 16
/* 4DC30 8005D430 03140200 */  sra        $v0, $v0, 16
/* 4DC34 8005D434 40180200 */  sll        $v1, $v0, 1
/* 4DC38 8005D438 21186200 */  addu       $v1, $v1, $v0
/* 4DC3C 8005D43C 1C00828C */  lw         $v0, 0x1C($a0)
/* 4DC40 8005D440 80180300 */  sll        $v1, $v1, 2
/* 4DC44 8005D444 21384300 */  addu       $a3, $v0, $v1
/* 4DC48 8005D448 0200A294 */  lhu        $v0, 0x2($a1)
/* 4DC4C 8005D44C 12680000 */  mflo       $t5
/* 4DC50 8005D450 031B0D00 */  sra        $v1, $t5, 12
/* 4DC54 8005D454 21104300 */  addu       $v0, $v0, $v1
/* 4DC58 8005D458 0000E2A4 */  sh         $v0, 0x0($a3)
/* 4DC5C 8005D45C FCFFA284 */  lh         $v0, -0x4($a1)
/* 4DC60 8005D460 00000000 */  nop
/* 4DC64 8005D464 18005100 */  mult       $v0, $s1
/* 4DC68 8005D468 0400A294 */  lhu        $v0, 0x4($a1)
/* 4DC6C 8005D46C 12680000 */  mflo       $t5
/* 4DC70 8005D470 031B0D00 */  sra        $v1, $t5, 12
/* 4DC74 8005D474 21104300 */  addu       $v0, $v0, $v1
/* 4DC78 8005D478 0200E2A4 */  sh         $v0, 0x2($a3)
/* 4DC7C 8005D47C FEFFA284 */  lh         $v0, -0x2($a1)
/* 4DC80 8005D480 00000000 */  nop
/* 4DC84 8005D484 18005100 */  mult       $v0, $s1
/* 4DC88 8005D488 0600A394 */  lhu        $v1, 0x6($a1)
/* 4DC8C 8005D48C 0E00A524 */  addiu      $a1, $a1, 0xE
/* 4DC90 8005D490 12680000 */  mflo       $t5
/* 4DC94 8005D494 03130D00 */  sra        $v0, $t5, 12
/* 4DC98 8005D498 21186200 */  addu       $v1, $v1, $v0
/* 4DC9C 8005D49C 0400E3A4 */  sh         $v1, 0x4($a3)
/* 4DCA0 8005D4A0 0000A284 */  lh         $v0, 0x0($a1)
/* 4DCA4 8005D4A4 0000A394 */  lhu        $v1, 0x0($a1)
/* 4DCA8 8005D4A8 DCFF4104 */  bgez       $v0, .L8005D41C
/* 4DCAC 8005D4AC 0E00C624 */   addiu     $a2, $a2, 0xE
.L8005D4B0:
/* 4DCB0 8005D4B0 55000012 */  beqz       $s0, .L8005D608
/* 4DCB4 8005D4B4 00000000 */   nop
.L8005D4B8:
/* 4DCB8 8005D4B8 2000048E */  lw         $a0, 0x20($s0)
/* 4DCBC 8005D4BC 00000000 */  nop
/* 4DCC0 8005D4C0 4D008010 */  beqz       $a0, .L8005D5F8
/* 4DCC4 8005D4C4 00000000 */   nop
/* 4DCC8 8005D4C8 4400828C */  lw         $v0, 0x44($a0)
/* 4DCCC 8005D4CC 00000000 */  nop
/* 4DCD0 8005D4D0 05004014 */  bnez       $v0, .L8005D4E8
/* 4DCD4 8005D4D4 00000000 */   nop
/* 4DCD8 8005D4D8 48008284 */  lh         $v0, 0x48($a0)
/* 4DCDC 8005D4DC 00000000 */  nop
/* 4DCE0 8005D4E0 45004010 */  beqz       $v0, .L8005D5F8
/* 4DCE4 8005D4E4 00000000 */   nop
.L8005D4E8:
/* 4DCE8 8005D4E8 1800028E */  lw         $v0, 0x18($s0)
/* 4DCEC 8005D4EC 00000000 */  nop
/* 4DCF0 8005D4F0 08004230 */  andi       $v0, $v0, 0x8
/* 4DCF4 8005D4F4 40004014 */  bnez       $v0, .L8005D5F8
/* 4DCF8 8005D4F8 00000000 */   nop
/* 4DCFC 8005D4FC 44008284 */  lh         $v0, 0x44($a0)
/* 4DD00 8005D500 00000000 */  nop
/* 4DD04 8005D504 18005100 */  mult       $v0, $s1
/* 4DD08 8005D508 12680000 */  mflo       $t5
/* 4DD0C 8005D50C 03130D00 */  sra        $v0, $t5, 12
/* 4DD10 8005D510 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4DD14 8005D514 46008284 */  lh         $v0, 0x46($a0)
/* 4DD18 8005D518 00000000 */  nop
/* 4DD1C 8005D51C 18005100 */  mult       $v0, $s1
/* 4DD20 8005D520 12680000 */  mflo       $t5
/* 4DD24 8005D524 03130D00 */  sra        $v0, $t5, 12
/* 4DD28 8005D528 1200A2A7 */  sh         $v0, 0x12($sp)
/* 4DD2C 8005D52C 48008284 */  lh         $v0, 0x48($a0)
/* 4DD30 8005D530 00000000 */  nop
/* 4DD34 8005D534 18005100 */  mult       $v0, $s1
/* 4DD38 8005D538 12680000 */  mflo       $t5
/* 4DD3C 8005D53C 03130D00 */  sra        $v0, $t5, 12
/* 4DD40 8005D540 1400A2A7 */  sh         $v0, 0x14($sp)
/* 4DD44 8005D544 5F000E8A */  lwl        $t6, 0x5F($s0)
/* 4DD48 8005D548 5C000E9A */  lwr        $t6, 0x5C($s0)
/* 4DD4C 8005D54C 60000F86 */  lh         $t7, 0x60($s0)
/* 4DD50 8005D550 2300AEAB */  swl        $t6, 0x23($sp)
/* 4DD54 8005D554 2000AEBB */  swr        $t6, 0x20($sp)
/* 4DD58 8005D558 2400AFA7 */  sh         $t7, 0x24($sp)
/* 4DD5C 8005D55C 20008294 */  lhu        $v0, 0x20($a0)
/* 4DD60 8005D560 1000A397 */  lhu        $v1, 0x10($sp)
/* 4DD64 8005D564 00000000 */  nop
/* 4DD68 8005D568 21104300 */  addu       $v0, $v0, $v1
/* 4DD6C 8005D56C 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 4DD70 8005D570 22008294 */  lhu        $v0, 0x22($a0)
/* 4DD74 8005D574 1200A397 */  lhu        $v1, 0x12($sp)
/* 4DD78 8005D578 00000000 */  nop
/* 4DD7C 8005D57C 21104300 */  addu       $v0, $v0, $v1
/* 4DD80 8005D580 5E0002A6 */  sh         $v0, 0x5E($s0)
/* 4DD84 8005D584 24008294 */  lhu        $v0, 0x24($a0)
/* 4DD88 8005D588 1400A397 */  lhu        $v1, 0x14($sp)
/* 4DD8C 8005D58C 5C000596 */  lhu        $a1, 0x5C($s0)
/* 4DD90 8005D590 21104300 */  addu       $v0, $v0, $v1
/* 4DD94 8005D594 600002A6 */  sh         $v0, 0x60($s0)
/* 4DD98 8005D598 2000A297 */  lhu        $v0, 0x20($sp)
/* 4DD9C 8005D59C 00000000 */  nop
/* 4DDA0 8005D5A0 2328A200 */  subu       $a1, $a1, $v0
/* 4DDA4 8005D5A4 1800A5A7 */  sh         $a1, 0x18($sp)
/* 4DDA8 8005D5A8 002C0500 */  sll        $a1, $a1, 16
/* 4DDAC 8005D5AC 5E000496 */  lhu        $a0, 0x5E($s0)
/* 4DDB0 8005D5B0 2200A297 */  lhu        $v0, 0x22($sp)
/* 4DDB4 8005D5B4 032C0500 */  sra        $a1, $a1, 16
/* 4DDB8 8005D5B8 23208200 */  subu       $a0, $a0, $v0
/* 4DDBC 8005D5BC 1A00A4A7 */  sh         $a0, 0x1A($sp)
/* 4DDC0 8005D5C0 00240400 */  sll        $a0, $a0, 16
/* 4DDC4 8005D5C4 03240400 */  sra        $a0, $a0, 16
/* 4DDC8 8005D5C8 60000396 */  lhu        $v1, 0x60($s0)
/* 4DDCC 8005D5CC 2400A297 */  lhu        $v0, 0x24($sp)
/* 4DDD0 8005D5D0 2128A400 */  addu       $a1, $a1, $a0
/* 4DDD4 8005D5D4 23186200 */  subu       $v1, $v1, $v0
/* 4DDD8 8005D5D8 1C00A3A7 */  sh         $v1, 0x1C($sp)
/* 4DDDC 8005D5DC 001C0300 */  sll        $v1, $v1, 16
/* 4DDE0 8005D5E0 031C0300 */  sra        $v1, $v1, 16
/* 4DDE4 8005D5E4 2128A300 */  addu       $a1, $a1, $v1
/* 4DDE8 8005D5E8 0300A010 */  beqz       $a1, .L8005D5F8
/* 4DDEC 8005D5EC 21200002 */   addu      $a0, $s0, $zero
/* 4DDF0 8005D5F0 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 4DDF4 8005D5F4 1800A527 */   addiu     $a1, $sp, 0x18
.L8005D5F8:
/* 4DDF8 8005D5F8 0800108E */  lw         $s0, 0x8($s0)
/* 4DDFC 8005D5FC 00000000 */  nop
/* 4DE00 8005D600 ADFF0016 */  bnez       $s0, .L8005D4B8
/* 4DE04 8005D604 00000000 */   nop
.L8005D608:
/* 4DE08 8005D608 0000448E */  lw         $a0, 0x0($s2)
/* 4DE0C 8005D60C 00000000 */  nop
/* 4DE10 8005D610 40008A8C */  lw         $t2, 0x40($a0)
/* 4DE14 8005D614 00000000 */  nop
/* 4DE18 8005D618 33004011 */  beqz       $t2, .L8005D6E8
/* 4DE1C 8005D61C 00000000 */   nop
/* 4DE20 8005D620 1C00828C */  lw         $v0, 0x1C($a0)
/* 4DE24 8005D624 1000838C */  lw         $v1, 0x10($a0)
/* 4DE28 8005D628 21384000 */  addu       $a3, $v0, $zero
/* 4DE2C 8005D62C 40100300 */  sll        $v0, $v1, 1
/* 4DE30 8005D630 21104300 */  addu       $v0, $v0, $v1
/* 4DE34 8005D634 80100200 */  sll        $v0, $v0, 2
/* 4DE38 8005D638 2160E200 */  addu       $t4, $a3, $v0
/* 4DE3C 8005D63C 2B10EC00 */  sltu       $v0, $a3, $t4
/* 4DE40 8005D640 29004010 */  beqz       $v0, .L8005D6E8
/* 4DE44 8005D644 00000000 */   nop
/* 4DE48 8005D648 0A00E824 */  addiu      $t0, $a3, 0xA
.L8005D64C:
/* 4DE4C 8005D64C FCFF0495 */  lhu        $a0, -0x4($t0)
/* 4DE50 8005D650 00004395 */  lhu        $v1, 0x0($t2)
/* 4DE54 8005D654 1F008630 */  andi       $a2, $a0, 0x1F
/* 4DE58 8005D658 C0300600 */  sll        $a2, $a2, 3
/* 4DE5C 8005D65C 1F006230 */  andi       $v0, $v1, 0x1F
/* 4DE60 8005D660 C0100200 */  sll        $v0, $v0, 3
/* 4DE64 8005D664 23104600 */  subu       $v0, $v0, $a2
/* 4DE68 8005D668 18005100 */  mult       $v0, $s1
/* 4DE6C 8005D66C FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* 4DE70 8005D670 82280400 */  srl        $a1, $a0, 2
/* 4DE74 8005D674 F800A530 */  andi       $a1, $a1, 0xF8
/* 4DE78 8005D678 001C0300 */  sll        $v1, $v1, 16
/* 4DE7C 8005D67C 83140300 */  sra        $v0, $v1, 18
/* 4DE80 8005D680 12580000 */  mflo       $t3
/* 4DE84 8005D684 F8004230 */  andi       $v0, $v0, 0xF8
/* 4DE88 8005D688 23104500 */  subu       $v0, $v0, $a1
/* 4DE8C 8005D68C 18005100 */  mult       $v0, $s1
/* 4DE90 8005D690 C2210400 */  srl        $a0, $a0, 7
/* 4DE94 8005D694 F8008430 */  andi       $a0, $a0, 0xF8
/* 4DE98 8005D698 C31D0300 */  sra        $v1, $v1, 23
/* 4DE9C 8005D69C 12480000 */  mflo       $t1
/* 4DEA0 8005D6A0 F8006330 */  andi       $v1, $v1, 0xF8
/* 4DEA4 8005D6A4 23186400 */  subu       $v1, $v1, $a0
/* 4DEA8 8005D6A8 18007100 */  mult       $v1, $s1
/* 4DEAC 8005D6AC 0C00E724 */  addiu      $a3, $a3, 0xC
/* 4DEB0 8005D6B0 02004A25 */  addiu      $t2, $t2, 0x2
/* 4DEB4 8005D6B4 03130B00 */  sra        $v0, $t3, 12
/* 4DEB8 8005D6B8 2130C200 */  addu       $a2, $a2, $v0
/* 4DEBC 8005D6BC FEFF06A1 */  sb         $a2, -0x2($t0)
/* 4DEC0 8005D6C0 03130900 */  sra        $v0, $t1, 12
/* 4DEC4 8005D6C4 2128A200 */  addu       $a1, $a1, $v0
/* 4DEC8 8005D6C8 FFFF05A1 */  sb         $a1, -0x1($t0)
/* 4DECC 8005D6CC 12180000 */  mflo       $v1
/* 4DED0 8005D6D0 03130300 */  sra        $v0, $v1, 12
/* 4DED4 8005D6D4 21208200 */  addu       $a0, $a0, $v0
/* 4DED8 8005D6D8 000004A1 */  sb         $a0, 0x0($t0)
/* 4DEDC 8005D6DC 2B10EC00 */  sltu       $v0, $a3, $t4
/* 4DEE0 8005D6E0 DAFF4014 */  bnez       $v0, .L8005D64C
/* 4DEE4 8005D6E4 0C000825 */   addiu     $t0, $t0, 0xC
.L8005D6E8:
/* 4DEE8 8005D6E8 3400BF8F */  lw         $ra, 0x34($sp)
/* 4DEEC 8005D6EC 3000B28F */  lw         $s2, 0x30($sp)
/* 4DEF0 8005D6F0 2C00B18F */  lw         $s1, 0x2C($sp)
/* 4DEF4 8005D6F4 2800B08F */  lw         $s0, 0x28($sp)
/* 4DEF8 8005D6F8 0800E003 */  jr         $ra
/* 4DEFC 8005D6FC 3800BD27 */   addiu     $sp, $sp, 0x38
.size MORPH_AddOffsets, . - MORPH_AddOffsets
