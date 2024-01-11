.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Panic
/* DBD4 8001D3D4 48FFBD27 */  addiu      $sp, $sp, -0xB8
/* DBD8 8001D3D8 9800B2AF */  sw         $s2, 0x98($sp)
/* DBDC 8001D3DC 21908000 */  addu       $s2, $a0, $zero
/* DBE0 8001D3E0 2110A000 */  addu       $v0, $a1, $zero
/* DBE4 8001D3E4 AC00B7AF */  sw         $s7, 0xAC($sp)
/* DBE8 8001D3E8 21B80000 */  addu       $s7, $zero, $zero
/* DBEC 8001D3EC A800B6AF */  sw         $s6, 0xA8($sp)
/* DBF0 8001D3F0 21B0E002 */  addu       $s6, $s7, $zero
/* DBF4 8001D3F4 9000B0AF */  sw         $s0, 0x90($sp)
/* DBF8 8001D3F8 2800B027 */  addiu      $s0, $sp, 0x28
/* DBFC 8001D3FC 21280002 */  addu       $a1, $s0, $zero
/* DC00 8001D400 1800A627 */  addiu      $a2, $sp, 0x18
/* DC04 8001D404 B000BEAF */  sw         $fp, 0xB0($sp)
/* DC08 8001D408 21F04000 */  addu       $fp, $v0, $zero
/* DC0C 8001D40C B400BFAF */  sw         $ra, 0xB4($sp)
/* DC10 8001D410 A400B5AF */  sw         $s5, 0xA4($sp)
/* DC14 8001D414 A000B4AF */  sw         $s4, 0xA0($sp)
/* DC18 8001D418 9C00B3AF */  sw         $s3, 0x9C($sp)
/* DC1C 8001D41C 9400B1AF */  sw         $s1, 0x94($sp)
/* DC20 8001D420 9174000C */  jal        CAMERA_SetupColInfo
/* DC24 8001D424 8A00A2A7 */   sh        $v0, 0x8A($sp)
/* DC28 8001D428 21880000 */  addu       $s1, $zero, $zero
/* DC2C 8001D42C 21A80002 */  addu       $s5, $s0, $zero
/* DC30 8001D430 2000B427 */  addiu      $s4, $sp, 0x20
/* DC34 8001D434 8800B327 */  addiu      $s3, $sp, 0x88
/* DC38 8001D438 3F01488A */  lwl        $t0, 0x13F($s2)
/* DC3C 8001D43C 3C01489A */  lwr        $t0, 0x13C($s2)
/* DC40 8001D440 4301498A */  lwl        $t1, 0x143($s2)
/* DC44 8001D444 4001499A */  lwr        $t1, 0x140($s2)
/* DC48 8001D448 2300A8AB */  swl        $t0, 0x23($sp)
/* DC4C 8001D44C 2000A8BB */  swr        $t0, 0x20($sp)
/* DC50 8001D450 2700A9AB */  swl        $t1, 0x27($sp)
/* DC54 8001D454 2400A9BB */  swr        $t1, 0x24($sp)
/* DC58 8001D458 2400A297 */  lhu        $v0, 0x24($sp)
/* DC5C 8001D45C 8A00B027 */  addiu      $s0, $sp, 0x8A
/* DC60 8001D460 8800A2A7 */  sh         $v0, 0x88($sp)
/* DC64 8001D464 21204002 */  addu       $a0, $s2, $zero
.L8001D468:
/* DC68 8001D468 2128A002 */  addu       $a1, $s5, $zero
/* DC6C 8001D46C 21308002 */  addu       $a2, $s4, $zero
/* DC70 8001D470 40014296 */  lhu        $v0, 0x140($s2)
/* DC74 8001D474 21386002 */  addu       $a3, $s3, $zero
/* DC78 8001D478 21105100 */  addu       $v0, $v0, $s1
/* DC7C 8001D47C 2400A2A7 */  sh         $v0, 0x24($sp)
/* DC80 8001D480 C174000C */  jal        CAMERA_DoPanicCheck
/* DC84 8001D484 1000B0AF */   sw        $s0, 0x10($sp)
/* DC88 8001D488 7000A28F */  lw         $v0, 0x70($sp)
/* DC8C 8001D48C 00000000 */  nop
/* DC90 8001D490 08004014 */  bnez       $v0, .L8001D4B4
/* DC94 8001D494 21204002 */   addu      $a0, $s2, $zero
/* DC98 8001D498 0100E226 */  addiu      $v0, $s7, 0x1
/* DC9C 8001D49C 21B84000 */  addu       $s7, $v0, $zero
/* DCA0 8001D4A0 00140200 */  sll        $v0, $v0, 16
/* DCA4 8001D4A4 03140200 */  sra        $v0, $v0, 16
/* DCA8 8001D4A8 03004228 */  slti       $v0, $v0, 0x3
/* DCAC 8001D4AC 17004010 */  beqz       $v0, .L8001D50C
/* DCB0 8001D4B0 00000000 */   nop
.L8001D4B4:
/* DCB4 8001D4B4 2128A002 */  addu       $a1, $s5, $zero
/* DCB8 8001D4B8 21308002 */  addu       $a2, $s4, $zero
/* DCBC 8001D4BC 40014296 */  lhu        $v0, 0x140($s2)
/* DCC0 8001D4C0 21386002 */  addu       $a3, $s3, $zero
/* DCC4 8001D4C4 23105100 */  subu       $v0, $v0, $s1
/* DCC8 8001D4C8 2400A2A7 */  sh         $v0, 0x24($sp)
/* DCCC 8001D4CC C174000C */  jal        CAMERA_DoPanicCheck
/* DCD0 8001D4D0 1000B0AF */   sw        $s0, 0x10($sp)
/* DCD4 8001D4D4 7000A28F */  lw         $v0, 0x70($sp)
/* DCD8 8001D4D8 00000000 */  nop
/* DCDC 8001D4DC 07004014 */  bnez       $v0, .L8001D4FC
/* DCE0 8001D4E0 0100C226 */   addiu     $v0, $s6, 0x1
/* DCE4 8001D4E4 21B04000 */  addu       $s6, $v0, $zero
/* DCE8 8001D4E8 00140200 */  sll        $v0, $v0, 16
/* DCEC 8001D4EC 03140200 */  sra        $v0, $v0, 16
/* DCF0 8001D4F0 03004228 */  slti       $v0, $v0, 0x3
/* DCF4 8001D4F4 05004010 */  beqz       $v0, .L8001D50C
/* DCF8 8001D4F8 00000000 */   nop
.L8001D4FC:
/* DCFC 8001D4FC 80003126 */  addiu      $s1, $s1, 0x80
/* DD00 8001D500 0008222A */  slti       $v0, $s1, 0x800
/* DD04 8001D504 D8FF4014 */  bnez       $v0, .L8001D468
/* DD08 8001D508 21204002 */   addu      $a0, $s2, $zero
.L8001D50C:
/* DD0C 8001D50C 8A00A387 */  lh         $v1, 0x8A($sp)
/* DD10 8001D510 00141E00 */  sll        $v0, $fp, 16
/* DD14 8001D514 03140200 */  sra        $v0, $v0, 16
/* DD18 8001D518 05006214 */  bne        $v1, $v0, .L8001D530
/* DD1C 8001D51C 01000224 */   addiu     $v0, $zero, 0x1
/* DD20 8001D520 01800224 */  addiu      $v0, $zero, -0x7FFF
/* DD24 8001D524 6A8E82A7 */  sh         $v0, %gp_rel(panic_count)($gp)
/* DD28 8001D528 55750008 */  j          .L8001D554
/* DD2C 8001D52C 00000000 */   nop
.L8001D530:
/* DD30 8001D530 AE0442A6 */  sh         $v0, 0x4AE($s2)
/* DD34 8001D534 03000224 */  addiu      $v0, $zero, 0x3
/* DD38 8001D538 F60042A6 */  sh         $v0, 0xF6($s2)
/* DD3C 8001D53C 8800A397 */  lhu        $v1, 0x88($sp)
/* DD40 8001D540 90FF0224 */  addiu      $v0, $zero, -0x70
/* DD44 8001D544 C40142A6 */  sh         $v0, 0x1C4($s2)
/* DD48 8001D548 B60143A6 */  sh         $v1, 0x1B6($s2)
/* DD4C 8001D54C C00143A6 */  sh         $v1, 0x1C0($s2)
/* DD50 8001D550 040443A6 */  sh         $v1, 0x404($s2)
.L8001D554:
/* DD54 8001D554 B400BF8F */  lw         $ra, 0xB4($sp)
/* DD58 8001D558 B000BE8F */  lw         $fp, 0xB0($sp)
/* DD5C 8001D55C AC00B78F */  lw         $s7, 0xAC($sp)
/* DD60 8001D560 A800B68F */  lw         $s6, 0xA8($sp)
/* DD64 8001D564 A400B58F */  lw         $s5, 0xA4($sp)
/* DD68 8001D568 A000B48F */  lw         $s4, 0xA0($sp)
/* DD6C 8001D56C 9C00B38F */  lw         $s3, 0x9C($sp)
/* DD70 8001D570 9800B28F */  lw         $s2, 0x98($sp)
/* DD74 8001D574 9400B18F */  lw         $s1, 0x94($sp)
/* DD78 8001D578 9000B08F */  lw         $s0, 0x90($sp)
/* DD7C 8001D57C 0800E003 */  jr         $ra
/* DD80 8001D580 B800BD27 */   addiu     $sp, $sp, 0xB8
.size CAMERA_Panic, . - CAMERA_Panic
