.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InteractPhysOb
/* 5A344 80069B44 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 5A348 80069B48 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5A34C 80069B4C 21888000 */  addu       $s1, $a0, $zero
/* 5A350 80069B50 2400B3AF */  sw         $s3, 0x24($sp)
/* 5A354 80069B54 2198A000 */  addu       $s3, $a1, $zero
/* 5A358 80069B58 3400B7AF */  sw         $s7, 0x34($sp)
/* 5A35C 80069B5C 21B8C000 */  addu       $s7, $a2, $zero
/* 5A360 80069B60 2800B4AF */  sw         $s4, 0x28($sp)
/* 5A364 80069B64 21A0E000 */  addu       $s4, $a3, $zero
/* 5A368 80069B68 3800BFAF */  sw         $ra, 0x38($sp)
/* 5A36C 80069B6C 3000B6AF */  sw         $s6, 0x30($sp)
/* 5A370 80069B70 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 5A374 80069B74 2000B2AF */  sw         $s2, 0x20($sp)
/* 5A378 80069B78 1800B0AF */  sw         $s0, 0x18($sp)
/* 5A37C 80069B7C 2400328E */  lw         $s2, 0x24($s1)
/* 5A380 80069B80 CFA3010C */  jal        CheckPhysObFamily
/* 5A384 80069B84 03000524 */   addiu     $a1, $zero, 0x3
/* 5A388 80069B88 BB004010 */  beqz       $v0, .L80069E78
/* 5A38C 80069B8C 01000224 */   addiu     $v0, $zero, 0x1
/* 5A390 80069B90 6C01228E */  lw         $v0, 0x16C($s1)
/* 5A394 80069B94 14004392 */  lbu        $v1, 0x14($s2)
/* 5A398 80069B98 04005624 */  addiu      $s6, $v0, 0x4
/* 5A39C 80069B9C 21A84000 */  addu       $s5, $v0, $zero
/* 5A3A0 80069BA0 FF000224 */  addiu      $v0, $zero, 0xFF
/* 5A3A4 80069BA4 47006210 */  beq        $v1, $v0, .L80069CC4
/* 5A3A8 80069BA8 02000224 */   addiu     $v0, $zero, 0x2
/* 5A3AC 80069BAC 25008212 */  beq        $s4, $v0, .L80069C44
/* 5A3B0 80069BB0 0300822A */   slti      $v0, $s4, 0x3
/* 5A3B4 80069BB4 05004010 */  beqz       $v0, .L80069BCC
/* 5A3B8 80069BB8 01000224 */   addiu     $v0, $zero, 0x1
/* 5A3BC 80069BBC 08008212 */  beq        $s4, $v0, .L80069BE0
/* 5A3C0 80069BC0 FEFF0324 */   addiu     $v1, $zero, -0x2
/* 5A3C4 80069BC4 21A70108 */  j          .L80069C84
/* 5A3C8 80069BC8 00000000 */   nop
.L80069BCC:
/* 5A3CC 80069BCC 09000224 */  addiu      $v0, $zero, 0x9
/* 5A3D0 80069BD0 28008212 */  beq        $s4, $v0, .L80069C74
/* 5A3D4 80069BD4 21202002 */   addu      $a0, $s1, $zero
/* 5A3D8 80069BD8 21A70108 */  j          .L80069C84
/* 5A3DC 80069BDC 00000000 */   nop
.L80069BE0:
/* 5A3E0 80069BE0 0000A28E */  lw         $v0, 0x0($s5)
/* 5A3E4 80069BE4 00000000 */  nop
/* 5A3E8 80069BE8 80104234 */  ori        $v0, $v0, 0x1080
/* 5A3EC 80069BEC 24104300 */  and        $v0, $v0, $v1
/* 5A3F0 80069BF0 0100033C */  lui        $v1, (0x10000 >> 16)
/* 5A3F4 80069BF4 0000A2AE */  sw         $v0, 0x0($s5)
/* 5A3F8 80069BF8 24104300 */  and        $v0, $v0, $v1
/* 5A3FC 80069BFC 08004010 */  beqz       $v0, .L80069C20
/* 5A400 80069C00 21202002 */   addu      $a0, $s1, $zero
/* 5A404 80069C04 4C01708E */  lw         $s0, 0x14C($s3)
/* 5A408 80069C08 A7B7010C */  jal        PhysObGetLight
/* 5A40C 80069C0C 21200002 */   addu      $a0, $s0, $zero
/* 5A410 80069C10 21200002 */  addu       $a0, $s0, $zero
/* 5A414 80069C14 65AB010C */  jal        PHYSOB_StartLighting
/* 5A418 80069C18 21284000 */   addu      $a1, $v0, $zero
/* 5A41C 80069C1C 21202002 */  addu       $a0, $s1, $zero
.L80069C20:
/* 5A420 80069C20 18004296 */  lhu        $v0, 0x18($s2)
/* 5A424 80069C24 21286002 */  addu       $a1, $s3, $zero
/* 5A428 80069C28 0400A2A6 */  sh         $v0, 0x4($s5)
/* 5A42C 80069C2C 1A004296 */  lhu        $v0, 0x1A($s2)
/* 5A430 80069C30 2130E002 */  addu       $a2, $s7, $zero
/* 5A434 80069C34 47D5000C */  jal        INSTANCE_LinkToParent
/* 5A438 80069C38 0200C2A6 */   sh        $v0, 0x2($s6)
/* 5A43C 80069C3C 21A70108 */  j          .L80069C84
/* 5A440 80069C40 00000000 */   nop
.L80069C44:
/* 5A444 80069C44 4C01708E */  lw         $s0, 0x14C($s3)
/* 5A448 80069C48 A5A3010C */  jal        CheckPhysOb
/* 5A44C 80069C4C 21200002 */   addu      $a0, $s0, $zero
/* 5A450 80069C50 0C004010 */  beqz       $v0, .L80069C84
/* 5A454 80069C54 00000000 */   nop
/* 5A458 80069C58 A7B7010C */  jal        PhysObGetLight
/* 5A45C 80069C5C 21200002 */   addu      $a0, $s0, $zero
/* 5A460 80069C60 21200002 */  addu       $a0, $s0, $zero
/* 5A464 80069C64 A3AB010C */  jal        PHYSOB_StartBurning
/* 5A468 80069C68 21284000 */   addu      $a1, $v0, $zero
/* 5A46C 80069C6C 21A70108 */  j          .L80069C84
/* 5A470 80069C70 00000000 */   nop
.L80069C74:
/* 5A474 80069C74 0400053C */  lui        $a1, (0x40002 >> 16)
/* 5A478 80069C78 0200A534 */  ori        $a1, $a1, (0x40002 & 0xFFFF)
/* 5A47C 80069C7C A1D1000C */  jal        INSTANCE_Post
/* 5A480 80069C80 05000624 */   addiu     $a2, $zero, 0x5
.L80069C84:
/* 5A484 80069C84 0C004296 */  lhu        $v0, 0xC($s2)
/* 5A488 80069C88 00000000 */  nop
/* 5A48C 80069C8C 05008216 */  bne        $s4, $v0, .L80069CA4
/* 5A490 80069C90 00000000 */   nop
/* 5A494 80069C94 1400228E */  lw         $v0, 0x14($s1)
/* 5A498 80069C98 00000000 */  nop
/* 5A49C 80069C9C 08004234 */  ori        $v0, $v0, 0x8
/* 5A4A0 80069CA0 140022AE */  sw         $v0, 0x14($s1)
.L80069CA4:
/* 5A4A4 80069CA4 0E004296 */  lhu        $v0, 0xE($s2)
/* 5A4A8 80069CA8 00000000 */  nop
/* 5A4AC 80069CAC 05008216 */  bne        $s4, $v0, .L80069CC4
/* 5A4B0 80069CB0 00000000 */   nop
/* 5A4B4 80069CB4 1400228E */  lw         $v0, 0x14($s1)
/* 5A4B8 80069CB8 00000000 */  nop
/* 5A4BC 80069CBC 10004234 */  ori        $v0, $v0, 0x10
/* 5A4C0 80069CC0 140022AE */  sw         $v0, 0x14($s1)
.L80069CC4:
/* 5A4C4 80069CC4 11004392 */  lbu        $v1, 0x11($s2)
/* 5A4C8 80069CC8 FF000224 */  addiu      $v0, $zero, 0xFF
/* 5A4CC 80069CCC 26006210 */  beq        $v1, $v0, .L80069D68
/* 5A4D0 80069CD0 00000000 */   nop
/* 5A4D4 80069CD4 06004296 */  lhu        $v0, 0x6($s2)
/* 5A4D8 80069CD8 00000000 */  nop
/* 5A4DC 80069CDC 00804230 */  andi       $v0, $v0, 0x8000
/* 5A4E0 80069CE0 21004010 */  beqz       $v0, .L80069D68
/* 5A4E4 80069CE4 21202002 */   addu      $a0, $s1, $zero
/* 5A4E8 80069CE8 21306000 */  addu       $a2, $v1, $zero
/* 5A4EC 80069CEC 21280000 */  addu       $a1, $zero, $zero
/* 5A4F0 80069CF0 2138A000 */  addu       $a3, $a1, $zero
/* 5A4F4 80069CF4 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5A4F8 80069CF8 1000A0AF */   sw        $zero, 0x10($sp)
/* 5A4FC 80069CFC 15004292 */  lbu        $v0, 0x15($s2)
/* 5A500 80069D00 00000000 */  nop
/* 5A504 80069D04 30004330 */  andi       $v1, $v0, 0x30
/* 5A508 80069D08 10000224 */  addiu      $v0, $zero, 0x10
/* 5A50C 80069D0C 0E006210 */  beq        $v1, $v0, .L80069D48
/* 5A510 80069D10 11006228 */   slti      $v0, $v1, 0x11
/* 5A514 80069D14 05004010 */  beqz       $v0, .L80069D2C
/* 5A518 80069D18 20000224 */   addiu     $v0, $zero, 0x20
/* 5A51C 80069D1C 07006010 */  beqz       $v1, .L80069D3C
/* 5A520 80069D20 21202002 */   addu      $a0, $s1, $zero
/* 5A524 80069D24 5AA70108 */  j          .L80069D68
/* 5A528 80069D28 00000000 */   nop
.L80069D2C:
/* 5A52C 80069D2C 0A006210 */  beq        $v1, $v0, .L80069D58
/* 5A530 80069D30 21202002 */   addu      $a0, $s1, $zero
/* 5A534 80069D34 5AA70108 */  j          .L80069D68
/* 5A538 80069D38 00000000 */   nop
.L80069D3C:
/* 5A53C 80069D3C 21280000 */  addu       $a1, $zero, $zero
/* 5A540 80069D40 58A70108 */  j          .L80069D60
/* 5A544 80069D44 02000624 */   addiu     $a2, $zero, 0x2
.L80069D48:
/* 5A548 80069D48 21202002 */  addu       $a0, $s1, $zero
/* 5A54C 80069D4C 21280000 */  addu       $a1, $zero, $zero
/* 5A550 80069D50 58A70108 */  j          .L80069D60
/* 5A554 80069D54 01000624 */   addiu     $a2, $zero, 0x1
.L80069D58:
/* 5A558 80069D58 21280000 */  addu       $a1, $zero, $zero
/* 5A55C 80069D5C 2130A000 */  addu       $a2, $a1, $zero
.L80069D60:
/* 5A560 80069D60 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5A564 80069D64 00000000 */   nop
.L80069D68:
/* 5A568 80069D68 1C00228E */  lw         $v0, 0x1C($s1)
/* 5A56C 80069D6C 00000000 */  nop
/* 5A570 80069D70 0C00438C */  lw         $v1, 0xC($v0)
/* 5A574 80069D74 00000000 */  nop
/* 5A578 80069D78 30006010 */  beqz       $v1, .L80069E3C
/* 5A57C 80069D7C 00000000 */   nop
/* 5A580 80069D80 15004292 */  lbu        $v0, 0x15($s2)
/* 5A584 80069D84 00000000 */  nop
/* 5A588 80069D88 80004230 */  andi       $v0, $v0, 0x80
/* 5A58C 80069D8C 17004010 */  beqz       $v0, .L80069DEC
/* 5A590 80069D90 00000000 */   nop
/* 5A594 80069D94 0000628C */  lw         $v0, 0x0($v1)
/* 5A598 80069D98 00000000 */  nop
/* 5A59C 80069D9C 1800428C */  lw         $v0, 0x18($v0)
/* 5A5A0 80069DA0 00000000 */  nop
/* 5A5A4 80069DA4 25004018 */  blez       $v0, .L80069E3C
/* 5A5A8 80069DA8 21800000 */   addu      $s0, $zero, $zero
/* 5A5AC 80069DAC 21202002 */  addu       $a0, $s1, $zero
.L80069DB0:
/* 5A5B0 80069DB0 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 5A5B4 80069DB4 21280002 */   addu      $a1, $s0, $zero
/* 5A5B8 80069DB8 1C00228E */  lw         $v0, 0x1C($s1)
/* 5A5BC 80069DBC 00000000 */  nop
/* 5A5C0 80069DC0 0C00428C */  lw         $v0, 0xC($v0)
/* 5A5C4 80069DC4 00000000 */  nop
/* 5A5C8 80069DC8 0000428C */  lw         $v0, 0x0($v0)
/* 5A5CC 80069DCC 00000000 */  nop
/* 5A5D0 80069DD0 1800428C */  lw         $v0, 0x18($v0)
/* 5A5D4 80069DD4 01001026 */  addiu      $s0, $s0, 0x1
/* 5A5D8 80069DD8 2A100202 */  slt        $v0, $s0, $v0
/* 5A5DC 80069DDC F4FF4014 */  bnez       $v0, .L80069DB0
/* 5A5E0 80069DE0 21202002 */   addu      $a0, $s1, $zero
/* 5A5E4 80069DE4 90A70108 */  j          .L80069E40
/* 5A5E8 80069DE8 0800A0AE */   sw        $zero, 0x8($s5)
.L80069DEC:
/* 5A5EC 80069DEC 0000628C */  lw         $v0, 0x0($v1)
/* 5A5F0 80069DF0 00000000 */  nop
/* 5A5F4 80069DF4 1800428C */  lw         $v0, 0x18($v0)
/* 5A5F8 80069DF8 00000000 */  nop
/* 5A5FC 80069DFC 0F004018 */  blez       $v0, .L80069E3C
/* 5A600 80069E00 21800000 */   addu      $s0, $zero, $zero
/* 5A604 80069E04 21202002 */  addu       $a0, $s1, $zero
.L80069E08:
/* 5A608 80069E08 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 5A60C 80069E0C 21280002 */   addu      $a1, $s0, $zero
/* 5A610 80069E10 1C00228E */  lw         $v0, 0x1C($s1)
/* 5A614 80069E14 00000000 */  nop
/* 5A618 80069E18 0C00428C */  lw         $v0, 0xC($v0)
/* 5A61C 80069E1C 00000000 */  nop
/* 5A620 80069E20 0000428C */  lw         $v0, 0x0($v0)
/* 5A624 80069E24 00000000 */  nop
/* 5A628 80069E28 1800428C */  lw         $v0, 0x18($v0)
/* 5A62C 80069E2C 01001026 */  addiu      $s0, $s0, 0x1
/* 5A630 80069E30 2A100202 */  slt        $v0, $s0, $v0
/* 5A634 80069E34 F4FF4014 */  bnez       $v0, .L80069E08
/* 5A638 80069E38 21202002 */   addu      $a0, $s1, $zero
.L80069E3C:
/* 5A63C 80069E3C 0800A0AE */  sw         $zero, 0x8($s5)
.L80069E40:
/* 5A640 80069E40 2600A0A6 */  sh         $zero, 0x26($s5)
/* 5A644 80069E44 2400A0A6 */  sh         $zero, 0x24($s5)
/* 5A648 80069E48 18004296 */  lhu        $v0, 0x18($s2)
/* 5A64C 80069E4C 00000000 */  nop
/* 5A650 80069E50 0000C2A6 */  sh         $v0, 0x0($s6)
/* 5A654 80069E54 1A004396 */  lhu        $v1, 0x1A($s2)
/* 5A658 80069E58 21100000 */  addu       $v0, $zero, $zero
/* 5A65C 80069E5C 0200C3A6 */  sh         $v1, 0x2($s6)
/* 5A660 80069E60 740120AE */  sw         $zero, 0x174($s1)
/* 5A664 80069E64 780120AE */  sw         $zero, 0x178($s1)
/* 5A668 80069E68 7C0120AE */  sw         $zero, 0x17C($s1)
/* 5A66C 80069E6C 800120AE */  sw         $zero, 0x180($s1)
/* 5A670 80069E70 840120AE */  sw         $zero, 0x184($s1)
/* 5A674 80069E74 880120AE */  sw         $zero, 0x188($s1)
.L80069E78:
/* 5A678 80069E78 3800BF8F */  lw         $ra, 0x38($sp)
/* 5A67C 80069E7C 3400B78F */  lw         $s7, 0x34($sp)
/* 5A680 80069E80 3000B68F */  lw         $s6, 0x30($sp)
/* 5A684 80069E84 2C00B58F */  lw         $s5, 0x2C($sp)
/* 5A688 80069E88 2800B48F */  lw         $s4, 0x28($sp)
/* 5A68C 80069E8C 2400B38F */  lw         $s3, 0x24($sp)
/* 5A690 80069E90 2000B28F */  lw         $s2, 0x20($sp)
/* 5A694 80069E94 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5A698 80069E98 1800B08F */  lw         $s0, 0x18($sp)
/* 5A69C 80069E9C 0800E003 */  jr         $ra
/* 5A6A0 80069EA0 4000BD27 */   addiu     $sp, $sp, 0x40
.size InteractPhysOb, . - InteractPhysOb
