.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_GetComponentsForTrackingPoint
/* 4E2D4 8005DAD4 21308000 */  addu       $a2, $a0, $zero
/* 4E2D8 8005DAD8 2138A000 */  addu       $a3, $a1, $zero
/* 4E2DC 8005DADC 3CCB86AF */  sw         $a2, %gp_rel(MORPH_SavedFace)($gp)
/* 4E2E0 8005DAE0 2CC787AF */  sw         $a3, %gp_rel(MORPH_SavedLevel)($gp)
/* 4E2E4 8005DAE4 B100C010 */  beqz       $a2, .L8005DDAC
/* 4E2E8 8005DAE8 E0FFBD27 */   addiu     $sp, $sp, -0x20
/* 4E2EC 8005DAEC AF00E010 */  beqz       $a3, .L8005DDAC
/* 4E2F0 8005DAF0 21580000 */   addu      $t3, $zero, $zero
/* 4E2F4 8005DAF4 30C78D27 */  addiu      $t5, $gp, %gp_rel(MORPH_Component)
/* 4E2F8 8005DAF8 2170A001 */  addu       $t6, $t5, $zero
/* 4E2FC 8005DAFC 0000C494 */  lhu        $a0, 0x0($a2)
/* 4E300 8005DB00 0000E38C */  lw         $v1, 0x0($a3)
/* 4E304 8005DB04 40100400 */  sll        $v0, $a0, 1
/* 4E308 8005DB08 21104400 */  addu       $v0, $v0, $a0
/* 4E30C 8005DB0C 1C00648C */  lw         $a0, 0x1C($v1)
/* 4E310 8005DB10 80100200 */  sll        $v0, $v0, 2
/* 4E314 8005DB14 21108200 */  addu       $v0, $a0, $v0
/* 4E318 8005DB18 0000A2AF */  sw         $v0, 0x0($sp)
/* 4E31C 8005DB1C 0200C394 */  lhu        $v1, 0x2($a2)
/* 4E320 8005DB20 21506001 */  addu       $t2, $t3, $zero
/* 4E324 8005DB24 40100300 */  sll        $v0, $v1, 1
/* 4E328 8005DB28 21104300 */  addu       $v0, $v0, $v1
/* 4E32C 8005DB2C 80100200 */  sll        $v0, $v0, 2
/* 4E330 8005DB30 21108200 */  addu       $v0, $a0, $v0
/* 4E334 8005DB34 0400A2AF */  sw         $v0, 0x4($sp)
/* 4E338 8005DB38 0400C394 */  lhu        $v1, 0x4($a2)
/* 4E33C 8005DB3C F4BD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4E340 8005DB40 40100300 */  sll        $v0, $v1, 1
/* 4E344 8005DB44 21104300 */  addu       $v0, $v0, $v1
/* 4E348 8005DB48 80100200 */  sll        $v0, $v0, 2
/* 4E34C 8005DB4C 21208200 */  addu       $a0, $a0, $v0
/* 4E350 8005DB50 0800A4AF */  sw         $a0, 0x8($sp)
/* 4E354 8005DB54 C400A48C */  lw         $a0, 0xC4($a1)
/* 4E358 8005DB58 0000E38C */  lw         $v1, 0x0($a3)
/* 4E35C 8005DB5C C0100400 */  sll        $v0, $a0, 3
/* 4E360 8005DB60 21104400 */  addu       $v0, $v0, $a0
/* 4E364 8005DB64 80100200 */  sll        $v0, $v0, 2
/* 4E368 8005DB68 4800638C */  lw         $v1, 0x48($v1)
/* 4E36C 8005DB6C 5C00A424 */  addiu      $a0, $a1, 0x5C
/* 4E370 8005DB70 21186200 */  addu       $v1, $v1, $v0
/* 4E374 8005DB74 0C006624 */  addiu      $a2, $v1, 0xC
/* 4E378 8005DB78 5C00A294 */  lhu        $v0, 0x5C($a1)
/* 4E37C 8005DB7C 02008594 */  lhu        $a1, 0x2($a0)
/* 4E380 8005DB80 04008494 */  lhu        $a0, 0x4($a0)
/* 4E384 8005DB84 0C006394 */  lhu        $v1, 0xC($v1)
/* 4E388 8005DB88 0200C794 */  lhu        $a3, 0x2($a2)
/* 4E38C 8005DB8C 0400C694 */  lhu        $a2, 0x4($a2)
/* 4E390 8005DB90 23104300 */  subu       $v0, $v0, $v1
/* 4E394 8005DB94 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4E398 8005DB98 1000A227 */  addiu      $v0, $sp, 0x10
/* 4E39C 8005DB9C 2328A700 */  subu       $a1, $a1, $a3
/* 4E3A0 8005DBA0 23208600 */  subu       $a0, $a0, $a2
/* 4E3A4 8005DBA4 020045A4 */  sh         $a1, 0x2($v0)
/* 4E3A8 8005DBA8 040044A4 */  sh         $a0, 0x4($v0)
.L8005DBAC:
/* 4E3AC 8005DBAC 21400000 */  addu       $t0, $zero, $zero
/* 4E3B0 8005DBB0 21480001 */  addu       $t1, $t0, $zero
/* 4E3B4 8005DBB4 21280001 */  addu       $a1, $t0, $zero
/* 4E3B8 8005DBB8 2138A003 */  addu       $a3, $sp, $zero
/* 4E3BC 8005DBBC 38C78C87 */  lh         $t4, %gp_rel(MORPH_Track)($gp)
/* 4E3C0 8005DBC0 1200A687 */  lh         $a2, 0x12($sp)
.L8005DBC4:
/* 4E3C4 8005DBC4 0100A324 */  addiu      $v1, $a1, 0x1
/* 4E3C8 8005DBC8 03006228 */  slti       $v0, $v1, 0x3
/* 4E3CC 8005DBCC 02004014 */  bnez       $v0, .L8005DBD8
/* 4E3D0 8005DBD0 01000224 */   addiu     $v0, $zero, 0x1
/* 4E3D4 8005DBD4 21180000 */  addu       $v1, $zero, $zero
.L8005DBD8:
/* 4E3D8 8005DBD8 03006215 */  bne        $t3, $v0, .L8005DBE8
/* 4E3DC 8005DBDC 00000000 */   nop
/* 4E3E0 8005DBE0 2D00AC10 */  beq        $a1, $t4, .L8005DC98
/* 4E3E4 8005DBE4 00000000 */   nop
.L8005DBE8:
/* 4E3E8 8005DBE8 0000E28C */  lw         $v0, 0x0($a3)
/* 4E3EC 8005DBEC 00000000 */  nop
/* 4E3F0 8005DBF0 02004484 */  lh         $a0, 0x2($v0)
/* 4E3F4 8005DBF4 00000000 */  nop
/* 4E3F8 8005DBF8 2A10C400 */  slt        $v0, $a2, $a0
/* 4E3FC 8005DBFC 09004014 */  bnez       $v0, .L8005DC24
/* 4E400 8005DC00 80100300 */   sll       $v0, $v1, 2
/* 4E404 8005DC04 2110A203 */  addu       $v0, $sp, $v0
/* 4E408 8005DC08 0000428C */  lw         $v0, 0x0($v0)
/* 4E40C 8005DC0C 00000000 */  nop
/* 4E410 8005DC10 02004284 */  lh         $v0, 0x2($v0)
/* 4E414 8005DC14 00000000 */  nop
/* 4E418 8005DC18 2A104600 */  slt        $v0, $v0, $a2
/* 4E41C 8005DC1C 0B004010 */  beqz       $v0, .L8005DC4C
/* 4E420 8005DC20 80100300 */   sll       $v0, $v1, 2
.L8005DC24:
/* 4E424 8005DC24 2110A203 */  addu       $v0, $sp, $v0
/* 4E428 8005DC28 0000428C */  lw         $v0, 0x0($v0)
/* 4E42C 8005DC2C 00000000 */  nop
/* 4E430 8005DC30 02004284 */  lh         $v0, 0x2($v0)
/* 4E434 8005DC34 00000000 */  nop
/* 4E438 8005DC38 2A10C200 */  slt        $v0, $a2, $v0
/* 4E43C 8005DC3C 16004014 */  bnez       $v0, .L8005DC98
/* 4E440 8005DC40 2A108600 */   slt       $v0, $a0, $a2
/* 4E444 8005DC44 14004014 */  bnez       $v0, .L8005DC98
/* 4E448 8005DC48 00000000 */   nop
.L8005DC4C:
/* 4E44C 8005DC4C 80100300 */  sll        $v0, $v1, 2
/* 4E450 8005DC50 2110A203 */  addu       $v0, $sp, $v0
/* 4E454 8005DC54 0000428C */  lw         $v0, 0x0($v0)
/* 4E458 8005DC58 0000E38C */  lw         $v1, 0x0($a3)
/* 4E45C 8005DC5C 02004484 */  lh         $a0, 0x2($v0)
/* 4E460 8005DC60 02006284 */  lh         $v0, 0x2($v1)
/* 4E464 8005DC64 00000000 */  nop
/* 4E468 8005DC68 23208200 */  subu       $a0, $a0, $v0
/* 4E46C 8005DC6C 02008104 */  bgez       $a0, .L8005DC78
/* 4E470 8005DC70 21188000 */   addu      $v1, $a0, $zero
/* 4E474 8005DC74 23180300 */  negu       $v1, $v1
.L8005DC78:
/* 4E478 8005DC78 02000105 */  bgez       $t0, .L8005DC84
/* 4E47C 8005DC7C 21100001 */   addu      $v0, $t0, $zero
/* 4E480 8005DC80 23100200 */  negu       $v0, $v0
.L8005DC84:
/* 4E484 8005DC84 2A104300 */  slt        $v0, $v0, $v1
/* 4E488 8005DC88 03004010 */  beqz       $v0, .L8005DC98
/* 4E48C 8005DC8C 00000000 */   nop
/* 4E490 8005DC90 21408000 */  addu       $t0, $a0, $zero
/* 4E494 8005DC94 2148A000 */  addu       $t1, $a1, $zero
.L8005DC98:
/* 4E498 8005DC98 0100A524 */  addiu      $a1, $a1, 0x1
/* 4E49C 8005DC9C 0300A228 */  slti       $v0, $a1, 0x3
/* 4E4A0 8005DCA0 C8FF4014 */  bnez       $v0, .L8005DBC4
/* 4E4A4 8005DCA4 0400E724 */   addiu     $a3, $a3, 0x4
/* 4E4A8 8005DCA8 38C78227 */  addiu      $v0, $gp, %gp_rel(MORPH_Track)
/* 4E4AC 8005DCAC 21104201 */  addu       $v0, $t2, $v0
/* 4E4B0 8005DCB0 000049A4 */  sh         $t1, 0x0($v0)
/* 4E4B4 8005DCB4 01002425 */  addiu      $a0, $t1, 0x1
/* 4E4B8 8005DCB8 03008228 */  slti       $v0, $a0, 0x3
/* 4E4BC 8005DCBC 02004014 */  bnez       $v0, .L8005DCC8
/* 4E4C0 8005DCC0 00000000 */   nop
/* 4E4C4 8005DCC4 21200000 */  addu       $a0, $zero, $zero
.L8005DCC8:
/* 4E4C8 8005DCC8 0D000011 */  beqz       $t0, .L8005DD00
/* 4E4CC 8005DCCC 80100900 */   sll       $v0, $t1, 2
/* 4E4D0 8005DCD0 2110A203 */  addu       $v0, $sp, $v0
/* 4E4D4 8005DCD4 0000438C */  lw         $v1, 0x0($v0)
/* 4E4D8 8005DCD8 1200A287 */  lh         $v0, 0x12($sp)
/* 4E4DC 8005DCDC 02006384 */  lh         $v1, 0x2($v1)
/* 4E4E0 8005DCE0 00000000 */  nop
/* 4E4E4 8005DCE4 23104300 */  subu       $v0, $v0, $v1
/* 4E4E8 8005DCE8 00130200 */  sll        $v0, $v0, 12
/* 4E4EC 8005DCEC 1A004800 */  div        $zero, $v0, $t0
/* 4E4F0 8005DCF0 12100000 */  mflo       $v0
/* 4E4F4 8005DCF4 21184E01 */  addu       $v1, $t2, $t6
/* 4E4F8 8005DCF8 42770108 */  j          .L8005DD08
/* 4E4FC 8005DCFC 000062A4 */   sh        $v0, 0x0($v1)
.L8005DD00:
/* 4E500 8005DD00 21104E01 */  addu       $v0, $t2, $t6
/* 4E504 8005DD04 000040A4 */  sh         $zero, 0x0($v0)
.L8005DD08:
/* 4E508 8005DD08 80100900 */  sll        $v0, $t1, 2
/* 4E50C 8005DD0C 2118A203 */  addu       $v1, $sp, $v0
/* 4E510 8005DD10 80100400 */  sll        $v0, $a0, 2
/* 4E514 8005DD14 2110A203 */  addu       $v0, $sp, $v0
/* 4E518 8005DD18 0000638C */  lw         $v1, 0x0($v1)
/* 4E51C 8005DD1C 0000428C */  lw         $v0, 0x0($v0)
/* 4E520 8005DD20 00006584 */  lh         $a1, 0x0($v1)
/* 4E524 8005DD24 00004284 */  lh         $v0, 0x0($v0)
/* 4E528 8005DD28 0000A385 */  lh         $v1, 0x0($t5)
/* 4E52C 8005DD2C 23104500 */  subu       $v0, $v0, $a1
/* 4E530 8005DD30 18006200 */  mult       $v1, $v0
/* 4E534 8005DD34 80180B00 */  sll        $v1, $t3, 2
/* 4E538 8005DD38 1800A227 */  addiu      $v0, $sp, 0x18
/* 4E53C 8005DD3C 12200000 */  mflo       $a0
/* 4E540 8005DD40 02008104 */  bgez       $a0, .L8005DD4C
/* 4E544 8005DD44 21184300 */   addu      $v1, $v0, $v1
/* 4E548 8005DD48 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8005DD4C:
/* 4E54C 8005DD4C 03130400 */  sra        $v0, $a0, 12
/* 4E550 8005DD50 2110A200 */  addu       $v0, $a1, $v0
/* 4E554 8005DD54 000062AC */  sw         $v0, 0x0($v1)
/* 4E558 8005DD58 0200AD25 */  addiu      $t5, $t5, 0x2
/* 4E55C 8005DD5C 01006B25 */  addiu      $t3, $t3, 0x1
/* 4E560 8005DD60 02006229 */  slti       $v0, $t3, 0x2
/* 4E564 8005DD64 91FF4014 */  bnez       $v0, .L8005DBAC
/* 4E568 8005DD68 02004A25 */   addiu     $t2, $t2, 0x2
/* 4E56C 8005DD6C 1800A48F */  lw         $a0, 0x18($sp)
/* 4E570 8005DD70 1C00A38F */  lw         $v1, 0x1C($sp)
/* 4E574 8005DD74 00000000 */  nop
/* 4E578 8005DD78 0B008310 */  beq        $a0, $v1, .L8005DDA8
/* 4E57C 8005DD7C 23186400 */   subu      $v1, $v1, $a0
/* 4E580 8005DD80 1000A287 */  lh         $v0, 0x10($sp)
/* 4E584 8005DD84 00000000 */  nop
/* 4E588 8005DD88 23104400 */  subu       $v0, $v0, $a0
/* 4E58C 8005DD8C 00130200 */  sll        $v0, $v0, 12
/* 4E590 8005DD90 1A004300 */  div        $zero, $v0, $v1
/* 4E594 8005DD94 12100000 */  mflo       $v0
/* 4E598 8005DD98 00000000 */  nop
/* 4E59C 8005DD9C 34C782A7 */  sh         $v0, %gp_rel(MORPH_Component + 0x4)($gp)
/* 4E5A0 8005DDA0 6B770108 */  j          .L8005DDAC
/* 4E5A4 8005DDA4 00000000 */   nop
.L8005DDA8:
/* 4E5A8 8005DDA8 34C780A7 */  sh         $zero, %gp_rel(MORPH_Component + 0x4)($gp)
.L8005DDAC:
/* 4E5AC 8005DDAC 0800E003 */  jr         $ra
/* 4E5B0 8005DDB0 2000BD27 */   addiu     $sp, $sp, 0x20
.size MORPH_GetComponentsForTrackingPoint, . - MORPH_GetComponentsForTrackingPoint
