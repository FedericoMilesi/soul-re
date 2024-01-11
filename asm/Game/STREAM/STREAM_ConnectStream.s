.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_ConnectStream
/* 4A3C0 80059BC0 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 4A3C4 80059BC4 4800B6AF */  sw         $s6, 0x48($sp)
/* 4A3C8 80059BC8 21B08000 */  addu       $s6, $a0, $zero
/* 4A3CC 80059BCC 5400BFAF */  sw         $ra, 0x54($sp)
/* 4A3D0 80059BD0 5000BEAF */  sw         $fp, 0x50($sp)
/* 4A3D4 80059BD4 4C00B7AF */  sw         $s7, 0x4C($sp)
/* 4A3D8 80059BD8 4400B5AF */  sw         $s5, 0x44($sp)
/* 4A3DC 80059BDC 4000B4AF */  sw         $s4, 0x40($sp)
/* 4A3E0 80059BE0 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 4A3E4 80059BE4 3800B2AF */  sw         $s2, 0x38($sp)
/* 4A3E8 80059BE8 3400B1AF */  sw         $s1, 0x34($sp)
/* 4A3EC 80059BEC CA6C010C */  jal        WARPGATE_UpdateAddToArray
/* 4A3F0 80059BF0 3000B0AF */   sw        $s0, 0x30($sp)
/* 4A3F4 80059BF4 40BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x178)($gp)
/* 4A3F8 80059BF8 0000C28E */  lw         $v0, 0x0($s6)
/* 4A3FC 80059BFC 00000000 */  nop
/* 4A400 80059C00 E6008210 */  beq        $a0, $v0, .L80059F9C
/* 4A404 80059C04 00000000 */   nop
/* 4A408 80059C08 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 4A40C 80059C0C 21980000 */   addu      $s3, $zero, $zero
/* 4A410 80059C10 0800C38E */  lw         $v1, 0x8($s6)
/* 4A414 80059C14 00000000 */  nop
/* 4A418 80059C18 0000638C */  lw         $v1, 0x0($v1)
/* 4A41C 80059C1C 00000000 */  nop
/* 4A420 80059C20 3000638C */  lw         $v1, 0x30($v1)
/* 4A424 80059C24 00000000 */  nop
/* 4A428 80059C28 00007E8C */  lw         $fp, 0x0($v1)
/* 4A42C 80059C2C 04007424 */  addiu      $s4, $v1, 0x4
/* 4A430 80059C30 5000C01B */  blez       $fp, .L80059D74
/* 4A434 80059C34 2800A2AF */   sw        $v0, 0x28($sp)
/* 4A438 80059C38 2C007124 */  addiu      $s1, $v1, 0x2C
.L80059C3C:
/* 4A43C 80059C3C 1000A427 */  addiu      $a0, $sp, 0x10
/* 4A440 80059C40 1CF4020C */  jal        func_800BD070
/* 4A444 80059C44 21288002 */   addu      $a1, $s4, $zero
/* 4A448 80059C48 1000A427 */  addiu      $a0, $sp, 0x10
/* 4A44C 80059C4C 0CF4020C */  jal        func_800BD030
/* 4A450 80059C50 2C000524 */   addiu     $a1, $zero, 0x2C
/* 4A454 80059C54 1A004010 */  beqz       $v0, .L80059CC0
/* 4A458 80059C58 21900000 */   addu      $s2, $zero, $zero
/* 4A45C 80059C5C 000040A0 */  sb         $zero, 0x0($v0)
/* 4A460 80059C60 F9D1010C */  jal        atoi
/* 4A464 80059C64 01004424 */   addiu     $a0, $v0, 0x1
/* 4A468 80059C68 30670108 */  j          .L80059CC0
/* 4A46C 80059C6C 21904000 */   addu      $s2, $v0, $zero
.L80059C70:
/* 4A470 80059C70 18008294 */  lhu        $v0, 0x18($a0)
/* 4A474 80059C74 F0FF2396 */  lhu        $v1, -0x10($s1)
/* 4A478 80059C78 00000000 */  nop
/* 4A47C 80059C7C 23104300 */  subu       $v0, $v0, $v1
/* 4A480 80059C80 2000A2A7 */  sh         $v0, 0x20($sp)
/* 4A484 80059C84 1A008294 */  lhu        $v0, 0x1A($a0)
/* 4A488 80059C88 F2FF2396 */  lhu        $v1, -0xE($s1)
/* 4A48C 80059C8C 00000000 */  nop
/* 4A490 80059C90 23104300 */  subu       $v0, $v0, $v1
/* 4A494 80059C94 2200A2A7 */  sh         $v0, 0x22($sp)
/* 4A498 80059C98 1C008294 */  lhu        $v0, 0x1C($a0)
/* 4A49C 80059C9C F4FF2396 */  lhu        $v1, -0xC($s1)
/* 4A4A0 80059CA0 00000000 */  nop
/* 4A4A4 80059CA4 23104300 */  subu       $v0, $v0, $v1
/* 4A4A8 80059CA8 2400A2A7 */  sh         $v0, 0x24($sp)
/* 4A4AC 80059CAC 0800C48E */  lw         $a0, 0x8($s6)
/* 4A4B0 80059CB0 BD6E010C */  jal        RelocateLevel
/* 4A4B4 80059CB4 2000A527 */   addiu     $a1, $sp, 0x20
/* 4A4B8 80059CB8 59670108 */  j          .L80059D64
/* 4A4BC 80059CBC 01007326 */   addiu     $s3, $s3, 0x1
.L80059CC0:
/* 4A4C0 80059CC0 ECFF248E */  lw         $a0, -0x14($s1)
/* 4A4C4 80059CC4 3266010C */  jal        STREAM_GetStreamUnitWithID
/* 4A4C8 80059CC8 00000000 */   nop
/* 4A4CC 80059CCC 21804000 */  addu       $s0, $v0, $zero
/* 4A4D0 80059CD0 1000A427 */  addiu      $a0, $sp, 0x10
/* 4A4D4 80059CD4 0D80053C */  lui        $a1, %hi(WarpRoomArray + 0x2A8)
/* 4A4D8 80059CD8 1CD2010C */  jal        strcmpi
/* 4A4DC 80059CDC 4019A524 */   addiu     $a1, $a1, %lo(WarpRoomArray + 0x2A8)
/* 4A4E0 80059CE0 07004014 */  bnez       $v0, .L80059D00
/* 4A4E4 80059CE4 00000000 */   nop
/* 4A4E8 80059CE8 2800A48F */  lw         $a0, 0x28($sp)
/* 4A4EC 80059CEC 816D010C */  jal        WARPGATE_IsUnitWarpRoom
/* 4A4F0 80059CF0 00000000 */   nop
/* 4A4F4 80059CF4 02004010 */  beqz       $v0, .L80059D00
/* 4A4F8 80059CF8 00000000 */   nop
/* 4A4FC 80059CFC 2800B08F */  lw         $s0, 0x28($sp)
.L80059D00:
/* 4A500 80059D00 00000000 */  nop
/* 4A504 80059D04 16000012 */  beqz       $s0, .L80059D60
/* 4A508 80059D08 000030AE */   sw        $s0, 0x0($s1)
/* 4A50C 80059D0C 2800A68F */  lw         $a2, 0x28($sp)
/* 4A510 80059D10 00000000 */  nop
/* 4A514 80059D14 12000616 */  bne        $s0, $a2, .L80059D60
/* 4A518 80059D18 00000000 */   nop
/* 4A51C 80059D1C 0800C28C */  lw         $v0, 0x8($a2)
/* 4A520 80059D20 00000000 */  nop
/* 4A524 80059D24 0000428C */  lw         $v0, 0x0($v0)
/* 4A528 80059D28 00000000 */  nop
/* 4A52C 80059D2C 3000428C */  lw         $v0, 0x30($v0)
/* 4A530 80059D30 21800000 */  addu       $s0, $zero, $zero
/* 4A534 80059D34 0000438C */  lw         $v1, 0x0($v0)
/* 4A538 80059D38 00000000 */  nop
/* 4A53C 80059D3C 08006018 */  blez       $v1, .L80059D60
/* 4A540 80059D40 04004424 */   addiu     $a0, $v0, 0x4
.L80059D44:
/* 4A544 80059D44 1000828C */  lw         $v0, 0x10($a0)
/* 4A548 80059D48 00000000 */  nop
/* 4A54C 80059D4C C8FF4212 */  beq        $s2, $v0, .L80059C70
/* 4A550 80059D50 01001026 */   addiu     $s0, $s0, 0x1
/* 4A554 80059D54 2A100302 */  slt        $v0, $s0, $v1
/* 4A558 80059D58 FAFF4014 */  bnez       $v0, .L80059D44
/* 4A55C 80059D5C 5C008424 */   addiu     $a0, $a0, 0x5C
.L80059D60:
/* 4A560 80059D60 01007326 */  addiu      $s3, $s3, 0x1
.L80059D64:
/* 4A564 80059D64 5C003126 */  addiu      $s1, $s1, 0x5C
/* 4A568 80059D68 2A107E02 */  slt        $v0, $s3, $fp
/* 4A56C 80059D6C B3FF4014 */  bnez       $v0, .L80059C3C
/* 4A570 80059D70 5C009426 */   addiu     $s4, $s4, 0x5C
.L80059D74:
/* 4A574 80059D74 3CC79527 */  addiu      $s5, $gp, %gp_rel(StreamTracker)
/* 4A578 80059D78 2C00A0AF */  sw         $zero, 0x2C($sp)
/* 4A57C 80059D7C 44C79727 */  addiu      $s7, $gp, %gp_rel(StreamTracker + 0x8)
.L80059D80:
/* 4A580 80059D80 FCFFE386 */  lh         $v1, -0x4($s7)
/* 4A584 80059D84 02000224 */  addiu      $v0, $zero, 0x2
/* 4A588 80059D88 5E006214 */  bne        $v1, $v0, .L80059F04
/* 4A58C 80059D8C 00000000 */   nop
/* 4A590 80059D90 5C00B612 */  beq        $s5, $s6, .L80059F04
/* 4A594 80059D94 00000000 */   nop
/* 4A598 80059D98 0000E28E */  lw         $v0, 0x0($s7)
/* 4A59C 80059D9C 00000000 */  nop
/* 4A5A0 80059DA0 0000428C */  lw         $v0, 0x0($v0)
/* 4A5A4 80059DA4 00000000 */  nop
/* 4A5A8 80059DA8 3000428C */  lw         $v0, 0x30($v0)
/* 4A5AC 80059DAC 21980000 */  addu       $s3, $zero, $zero
/* 4A5B0 80059DB0 00005E8C */  lw         $fp, 0x0($v0)
/* 4A5B4 80059DB4 00000000 */  nop
/* 4A5B8 80059DB8 5200C01B */  blez       $fp, .L80059F04
/* 4A5BC 80059DBC 04005424 */   addiu     $s4, $v0, 0x4
/* 4A5C0 80059DC0 2C005124 */  addiu      $s1, $v0, 0x2C
.L80059DC4:
/* 4A5C4 80059DC4 21800000 */  addu       $s0, $zero, $zero
/* 4A5C8 80059DC8 1000A427 */  addiu      $a0, $sp, 0x10
/* 4A5CC 80059DCC 1CF4020C */  jal        func_800BD070
/* 4A5D0 80059DD0 21288002 */   addu      $a1, $s4, $zero
/* 4A5D4 80059DD4 1000A427 */  addiu      $a0, $sp, 0x10
/* 4A5D8 80059DD8 0CF4020C */  jal        func_800BD030
/* 4A5DC 80059DDC 2C000524 */   addiu     $a1, $zero, 0x2C
/* 4A5E0 80059DE0 05004010 */  beqz       $v0, .L80059DF8
/* 4A5E4 80059DE4 21900000 */   addu      $s2, $zero, $zero
/* 4A5E8 80059DE8 000040A0 */  sb         $zero, 0x0($v0)
/* 4A5EC 80059DEC F9D1010C */  jal        atoi
/* 4A5F0 80059DF0 01004424 */   addiu     $a0, $v0, 0x1
/* 4A5F4 80059DF4 21904000 */  addu       $s2, $v0, $zero
.L80059DF8:
/* 4A5F8 80059DF8 ECFF238E */  lw         $v1, -0x14($s1)
/* 4A5FC 80059DFC 0000C28E */  lw         $v0, 0x0($s6)
/* 4A600 80059E00 00000000 */  nop
/* 4A604 80059E04 17006214 */  bne        $v1, $v0, .L80059E64
/* 4A608 80059E08 1000A427 */   addiu     $a0, $sp, 0x10
/* 4A60C 80059E0C A3670108 */  j          .L80059E8C
/* 4A610 80059E10 000036AE */   sw        $s6, 0x0($s1)
.L80059E14:
/* 4A614 80059E14 F0FF2296 */  lhu        $v0, -0x10($s1)
/* 4A618 80059E18 18008394 */  lhu        $v1, 0x18($a0)
/* 4A61C 80059E1C 00000000 */  nop
/* 4A620 80059E20 23104300 */  subu       $v0, $v0, $v1
/* 4A624 80059E24 2000A2A7 */  sh         $v0, 0x20($sp)
/* 4A628 80059E28 F2FF2296 */  lhu        $v0, -0xE($s1)
/* 4A62C 80059E2C 1A008394 */  lhu        $v1, 0x1A($a0)
/* 4A630 80059E30 00000000 */  nop
/* 4A634 80059E34 23104300 */  subu       $v0, $v0, $v1
/* 4A638 80059E38 2200A2A7 */  sh         $v0, 0x22($sp)
/* 4A63C 80059E3C F4FF2296 */  lhu        $v0, -0xC($s1)
/* 4A640 80059E40 1C008394 */  lhu        $v1, 0x1C($a0)
/* 4A644 80059E44 00000000 */  nop
/* 4A648 80059E48 23104300 */  subu       $v0, $v0, $v1
/* 4A64C 80059E4C 2400A2A7 */  sh         $v0, 0x24($sp)
/* 4A650 80059E50 0800C48E */  lw         $a0, 0x8($s6)
/* 4A654 80059E54 BD6E010C */  jal        RelocateLevel
/* 4A658 80059E58 2000A527 */   addiu     $a1, $sp, 0x20
/* 4A65C 80059E5C BD670108 */  j          .L80059EF4
/* 4A660 80059E60 01007326 */   addiu     $s3, $s3, 0x1
.L80059E64:
/* 4A664 80059E64 0D80053C */  lui        $a1, %hi(WarpRoomArray + 0x2A8)
/* 4A668 80059E68 1CD2010C */  jal        strcmpi
/* 4A66C 80059E6C 4019A524 */   addiu     $a1, $a1, %lo(WarpRoomArray + 0x2A8)
/* 4A670 80059E70 08004014 */  bnez       $v0, .L80059E94
/* 4A674 80059E74 01000224 */   addiu     $v0, $zero, 0x1
/* 4A678 80059E78 816D010C */  jal        WARPGATE_IsUnitWarpRoom
/* 4A67C 80059E7C 2120C002 */   addu      $a0, $s6, $zero
/* 4A680 80059E80 04004010 */  beqz       $v0, .L80059E94
/* 4A684 80059E84 01000224 */   addiu     $v0, $zero, 0x1
/* 4A688 80059E88 000036AE */  sw         $s6, 0x0($s1)
.L80059E8C:
/* 4A68C 80059E8C 01001024 */  addiu      $s0, $zero, 0x1
/* 4A690 80059E90 01000224 */  addiu      $v0, $zero, 0x1
.L80059E94:
/* 4A694 80059E94 16000216 */  bne        $s0, $v0, .L80059EF0
/* 4A698 80059E98 00000000 */   nop
/* 4A69C 80059E9C 2800A68F */  lw         $a2, 0x28($sp)
/* 4A6A0 80059EA0 00000000 */  nop
/* 4A6A4 80059EA4 1200A616 */  bne        $s5, $a2, .L80059EF0
/* 4A6A8 80059EA8 00000000 */   nop
/* 4A6AC 80059EAC 0800C28E */  lw         $v0, 0x8($s6)
/* 4A6B0 80059EB0 00000000 */  nop
/* 4A6B4 80059EB4 0000428C */  lw         $v0, 0x0($v0)
/* 4A6B8 80059EB8 00000000 */  nop
/* 4A6BC 80059EBC 3000428C */  lw         $v0, 0x30($v0)
/* 4A6C0 80059EC0 21800000 */  addu       $s0, $zero, $zero
/* 4A6C4 80059EC4 0000438C */  lw         $v1, 0x0($v0)
/* 4A6C8 80059EC8 00000000 */  nop
/* 4A6CC 80059ECC 08006018 */  blez       $v1, .L80059EF0
/* 4A6D0 80059ED0 04004424 */   addiu     $a0, $v0, 0x4
.L80059ED4:
/* 4A6D4 80059ED4 1000828C */  lw         $v0, 0x10($a0)
/* 4A6D8 80059ED8 00000000 */  nop
/* 4A6DC 80059EDC CDFF4212 */  beq        $s2, $v0, .L80059E14
/* 4A6E0 80059EE0 01001026 */   addiu     $s0, $s0, 0x1
/* 4A6E4 80059EE4 2A100302 */  slt        $v0, $s0, $v1
/* 4A6E8 80059EE8 FAFF4014 */  bnez       $v0, .L80059ED4
/* 4A6EC 80059EEC 5C008424 */   addiu     $a0, $a0, 0x5C
.L80059EF0:
/* 4A6F0 80059EF0 01007326 */  addiu      $s3, $s3, 0x1
.L80059EF4:
/* 4A6F4 80059EF4 5C003126 */  addiu      $s1, $s1, 0x5C
/* 4A6F8 80059EF8 2A107E02 */  slt        $v0, $s3, $fp
/* 4A6FC 80059EFC B1FF4014 */  bnez       $v0, .L80059DC4
/* 4A700 80059F00 5C009426 */   addiu     $s4, $s4, 0x5C
.L80059F04:
/* 4A704 80059F04 4000F726 */  addiu      $s7, $s7, 0x40
/* 4A708 80059F08 2C00A68F */  lw         $a2, 0x2C($sp)
/* 4A70C 80059F0C 4000B526 */  addiu      $s5, $s5, 0x40
/* 4A710 80059F10 0100C624 */  addiu      $a2, $a2, 0x1
/* 4A714 80059F14 1000C228 */  slti       $v0, $a2, 0x10
/* 4A718 80059F18 99FF4014 */  bnez       $v0, .L80059D80
/* 4A71C 80059F1C 2C00A6AF */   sw        $a2, 0x2C($sp)
/* 4A720 80059F20 0800C38E */  lw         $v1, 0x8($s6)
/* 4A724 80059F24 00000000 */  nop
/* 4A728 80059F28 7800628C */  lw         $v0, 0x78($v1)
/* 4A72C 80059F2C 00000000 */  nop
/* 4A730 80059F30 1A004018 */  blez       $v0, .L80059F9C
/* 4A734 80059F34 21800000 */   addu      $s0, $zero, $zero
/* 4A738 80059F38 0D80123C */  lui        $s2, %hi(WarpRoomArray + 0x2B4)
/* 4A73C 80059F3C 21880002 */  addu       $s1, $s0, $zero
.L80059F40:
/* 4A740 80059F40 7C00648C */  lw         $a0, 0x7C($v1)
/* 4A744 80059F44 4C194526 */  addiu      $a1, $s2, %lo(WarpRoomArray + 0x2B4)
/* 4A748 80059F48 1CD2010C */  jal        strcmpi
/* 4A74C 80059F4C 21209100 */   addu      $a0, $a0, $s1
/* 4A750 80059F50 0B004014 */  bnez       $v0, .L80059F80
/* 4A754 80059F54 01001026 */   addiu     $s0, $s0, 0x1
/* 4A758 80059F58 0800C28E */  lw         $v0, 0x8($s6)
/* 4A75C 80059F5C 00000000 */  nop
/* 4A760 80059F60 7C00438C */  lw         $v1, 0x7C($v0)
/* 4A764 80059F64 00000000 */  nop
/* 4A768 80059F68 21182302 */  addu       $v1, $s1, $v1
/* 4A76C 80059F6C 2C00628C */  lw         $v0, 0x2C($v1)
/* 4A770 80059F70 00000000 */  nop
/* 4A774 80059F74 08004234 */  ori        $v0, $v0, 0x8
/* 4A778 80059F78 E7670108 */  j          .L80059F9C
/* 4A77C 80059F7C 2C0062AC */   sw        $v0, 0x2C($v1)
.L80059F80:
/* 4A780 80059F80 0800C38E */  lw         $v1, 0x8($s6)
/* 4A784 80059F84 00000000 */  nop
/* 4A788 80059F88 7800628C */  lw         $v0, 0x78($v1)
/* 4A78C 80059F8C 00000000 */  nop
/* 4A790 80059F90 2A100202 */  slt        $v0, $s0, $v0
/* 4A794 80059F94 EAFF4014 */  bnez       $v0, .L80059F40
/* 4A798 80059F98 4C003126 */   addiu     $s1, $s1, 0x4C
.L80059F9C:
/* 4A79C 80059F9C 5400BF8F */  lw         $ra, 0x54($sp)
/* 4A7A0 80059FA0 5000BE8F */  lw         $fp, 0x50($sp)
/* 4A7A4 80059FA4 4C00B78F */  lw         $s7, 0x4C($sp)
/* 4A7A8 80059FA8 4800B68F */  lw         $s6, 0x48($sp)
/* 4A7AC 80059FAC 4400B58F */  lw         $s5, 0x44($sp)
/* 4A7B0 80059FB0 4000B48F */  lw         $s4, 0x40($sp)
/* 4A7B4 80059FB4 3C00B38F */  lw         $s3, 0x3C($sp)
/* 4A7B8 80059FB8 3800B28F */  lw         $s2, 0x38($sp)
/* 4A7BC 80059FBC 3400B18F */  lw         $s1, 0x34($sp)
/* 4A7C0 80059FC0 3000B08F */  lw         $s0, 0x30($sp)
/* 4A7C4 80059FC4 0800E003 */  jr         $ra
/* 4A7C8 80059FC8 5800BD27 */   addiu     $sp, $sp, 0x58
.size STREAM_ConnectStream, . - STREAM_ConnectStream
