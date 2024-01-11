.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CinematicProcess
/* ABE4 8001A3E4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* ABE8 8001A3E8 2000B2AF */  sw         $s2, 0x20($sp)
/* ABEC 8001A3EC 21908000 */  addu       $s2, $a0, $zero
/* ABF0 8001A3F0 1800B0AF */  sw         $s0, 0x18($sp)
/* ABF4 8001A3F4 21800000 */  addu       $s0, $zero, $zero
/* ABF8 8001A3F8 2400B3AF */  sw         $s3, 0x24($sp)
/* ABFC 8001A3FC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* AC00 8001A400 2800B4AF */  sw         $s4, 0x28($sp)
/* AC04 8001A404 1C00B1AF */  sw         $s1, 0x1C($sp)
/* AC08 8001A408 2404548E */  lw         $s4, 0x424($s2)
/* AC0C 8001A40C F4004286 */  lh         $v0, 0xF4($s2)
/* AC10 8001A410 2804518E */  lw         $s1, 0x428($s2)
/* AC14 8001A414 74004014 */  bnez       $v0, .L8001A5E8
/* AC18 8001A418 21980002 */   addu      $s3, $s0, $zero
/* AC1C 8001A41C 03002016 */  bnez       $s1, .L8001A42C
/* AC20 8001A420 00000000 */   nop
/* AC24 8001A424 B95A000C */  jal        CAMERA_SetFocus
/* AC28 8001A428 AA014526 */   addiu     $a1, $s2, 0x1AA
.L8001A42C:
/* AC2C 8001A42C 64008012 */  beqz       $s4, .L8001A5C0
/* AC30 8001A430 3C014426 */   addiu     $a0, $s2, 0x13C
/* AC34 8001A434 0000848E */  lw         $a0, 0x0($s4)
/* AC38 8001A438 7856000C */  jal        SplineGetNextPointDC
/* AC3C 8001A43C 10008526 */   addiu     $a1, $s4, 0x10
/* AC40 8001A440 21804000 */  addu       $s0, $v0, $zero
/* AC44 8001A444 12000012 */  beqz       $s0, .L8001A490
/* AC48 8001A448 00000000 */   nop
/* AC4C 8001A44C 34044286 */  lh         $v0, 0x434($s2)
/* AC50 8001A450 00000000 */  nop
/* AC54 8001A454 08004014 */  bnez       $v0, .L8001A478
/* AC58 8001A458 2C044226 */   addiu     $v0, $s2, 0x42C
/* AC5C 8001A45C 00000296 */  lhu        $v0, 0x0($s0)
/* AC60 8001A460 02000396 */  lhu        $v1, 0x2($s0)
/* AC64 8001A464 04000496 */  lhu        $a0, 0x4($s0)
/* AC68 8001A468 000042A6 */  sh         $v0, 0x0($s2)
/* AC6C 8001A46C 020043A6 */  sh         $v1, 0x2($s2)
/* AC70 8001A470 24690008 */  j          .L8001A490
/* AC74 8001A474 040044A6 */   sh        $a0, 0x4($s2)
.L8001A478:
/* AC78 8001A478 2C044396 */  lhu        $v1, 0x42C($s2)
/* AC7C 8001A47C 02004494 */  lhu        $a0, 0x2($v0)
/* AC80 8001A480 04004294 */  lhu        $v0, 0x4($v0)
/* AC84 8001A484 000043A6 */  sh         $v1, 0x0($s2)
/* AC88 8001A488 020044A6 */  sh         $a0, 0x2($s2)
/* AC8C 8001A48C 040042A6 */  sh         $v0, 0x4($s2)
.L8001A490:
/* AC90 8001A490 34044286 */  lh         $v0, 0x434($s2)
/* AC94 8001A494 00000000 */  nop
/* AC98 8001A498 0B004010 */  beqz       $v0, .L8001A4C8
/* AC9C 8001A49C 21204002 */   addu      $a0, $s2, $zero
/* ACA0 8001A4A0 505A000C */  jal        CAMERA_SetTarget
/* ACA4 8001A4A4 21280002 */   addu      $a1, $s0, $zero
/* ACA8 8001A4A8 00000296 */  lhu        $v0, 0x0($s0)
/* ACAC 8001A4AC 02000396 */  lhu        $v1, 0x2($s0)
/* ACB0 8001A4B0 04000496 */  lhu        $a0, 0x4($s0)
/* ACB4 8001A4B4 2C0442A6 */  sh         $v0, 0x42C($s2)
/* ACB8 8001A4B8 2C044226 */  addiu      $v0, $s2, 0x42C
/* ACBC 8001A4BC 020043A4 */  sh         $v1, 0x2($v0)
/* ACC0 8001A4C0 52690008 */  j          .L8001A548
/* ACC4 8001A4C4 040044A4 */   sh        $a0, 0x4($v0)
.L8001A4C8:
/* ACC8 8001A4C8 12002012 */  beqz       $s1, .L8001A514
/* ACCC 8001A4CC 00000000 */   nop
/* ACD0 8001A4D0 0000248E */  lw         $a0, 0x0($s1)
/* ACD4 8001A4D4 7856000C */  jal        SplineGetNextPointDC
/* ACD8 8001A4D8 10002526 */   addiu     $a1, $s1, 0x10
/* ACDC 8001A4DC 21984000 */  addu       $s3, $v0, $zero
/* ACE0 8001A4E0 19006012 */  beqz       $s3, .L8001A548
/* ACE4 8001A4E4 21204002 */   addu      $a0, $s2, $zero
/* ACE8 8001A4E8 00006296 */  lhu        $v0, 0x0($s3)
/* ACEC 8001A4EC 02006396 */  lhu        $v1, 0x2($s3)
/* ACF0 8001A4F0 04006696 */  lhu        $a2, 0x4($s3)
/* ACF4 8001A4F4 21286002 */  addu       $a1, $s3, $zero
/* ACF8 8001A4F8 AA0142A6 */  sh         $v0, 0x1AA($s2)
/* ACFC 8001A4FC AA014226 */  addiu      $v0, $s2, 0x1AA
/* AD00 8001A500 020043A4 */  sh         $v1, 0x2($v0)
/* AD04 8001A504 505A000C */  jal        CAMERA_SetTarget
/* AD08 8001A508 040046A4 */   sh        $a2, 0x4($v0)
/* AD0C 8001A50C 52690008 */  j          .L8001A548
/* AD10 8001A510 00000000 */   nop
.L8001A514:
/* AD14 8001A514 0D5A000C */  jal        CAMERA_SetMaxVel
/* AD18 8001A518 21204002 */   addu      $a0, $s2, $zero
/* AD1C 8001A51C 01000424 */  addiu      $a0, $zero, 0x1
/* AD20 8001A520 00014526 */  addiu      $a1, $s2, 0x100
/* AD24 8001A524 AA014626 */  addiu      $a2, $s2, 0x1AA
/* AD28 8001A528 60014226 */  addiu      $v0, $s2, 0x160
/* AD2C 8001A52C 1000A2AF */  sw         $v0, 0x10($sp)
/* AD30 8001A530 94014286 */  lh         $v0, 0x194($s2)
/* AD34 8001A534 58014726 */  addiu      $a3, $s2, 0x158
/* AD38 8001A538 40140200 */  sll        $v0, $v0, 17
/* AD3C 8001A53C 03140200 */  sra        $v0, $v0, 16
/* AD40 8001A540 CD5C000C */  jal        CriticalDampPosition
/* AD44 8001A544 1400A2AF */   sw        $v0, 0x14($sp)
.L8001A548:
/* AD48 8001A548 00004296 */  lhu        $v0, 0x0($s2)
/* AD4C 8001A54C 02004396 */  lhu        $v1, 0x2($s2)
/* AD50 8001A550 04004496 */  lhu        $a0, 0x4($s2)
/* AD54 8001A554 980142A6 */  sh         $v0, 0x198($s2)
/* AD58 8001A558 98014226 */  addiu      $v0, $s2, 0x198
/* AD5C 8001A55C 020043A4 */  sh         $v1, 0x2($v0)
/* AD60 8001A560 16008012 */  beqz       $s4, .L8001A5BC
/* AD64 8001A564 040044A4 */   sh        $a0, 0x4($v0)
/* AD68 8001A568 2804428E */  lw         $v0, 0x428($s2)
/* AD6C 8001A56C 00000000 */  nop
/* AD70 8001A570 05004014 */  bnez       $v0, .L8001A588
/* AD74 8001A574 00000000 */   nop
/* AD78 8001A578 34044286 */  lh         $v0, 0x434($s2)
/* AD7C 8001A57C 00000000 */  nop
/* AD80 8001A580 0F004010 */  beqz       $v0, .L8001A5C0
/* AD84 8001A584 3C014426 */   addiu     $a0, $s2, 0x13C
.L8001A588:
/* AD88 8001A588 0D5A000C */  jal        CAMERA_SetMaxVel
/* AD8C 8001A58C 21204002 */   addu      $a0, $s2, $zero
/* AD90 8001A590 01000424 */  addiu      $a0, $zero, 0x1
/* AD94 8001A594 00014526 */  addiu      $a1, $s2, 0x100
/* AD98 8001A598 AA014626 */  addiu      $a2, $s2, 0x1AA
/* AD9C 8001A59C 60014226 */  addiu      $v0, $s2, 0x160
/* ADA0 8001A5A0 1000A2AF */  sw         $v0, 0x10($sp)
/* ADA4 8001A5A4 94014286 */  lh         $v0, 0x194($s2)
/* ADA8 8001A5A8 58014726 */  addiu      $a3, $s2, 0x158
/* ADAC 8001A5AC 40140200 */  sll        $v0, $v0, 17
/* ADB0 8001A5B0 03140200 */  sra        $v0, $v0, 16
/* ADB4 8001A5B4 CD5C000C */  jal        CriticalDampPosition
/* ADB8 8001A5B8 1400A2AF */   sw        $v0, 0x14($sp)
.L8001A5BC:
/* ADBC 8001A5BC 3C014426 */  addiu      $a0, $s2, 0x13C
.L8001A5C0:
/* ADC0 8001A5C0 00014526 */  addiu      $a1, $s2, 0x100
/* ADC4 8001A5C4 C45E000C */  jal        CAMERA_CalcRotation
/* ADC8 8001A5C8 21304002 */   addu      $a2, $s2, $zero
/* ADCC 8001A5CC 0100022E */  sltiu      $v0, $s0, 0x1
/* ADD0 8001A5D0 0100632E */  sltiu      $v1, $s3, 0x1
/* ADD4 8001A5D4 24104300 */  and        $v0, $v0, $v1
/* ADD8 8001A5D8 AF004010 */  beqz       $v0, .L8001A898
/* ADDC 8001A5DC 01000224 */   addiu     $v0, $zero, 0x1
/* ADE0 8001A5E0 266A0008 */  j          .L8001A898
/* ADE4 8001A5E4 360442A6 */   sh        $v0, 0x436($s2)
.L8001A5E8:
/* ADE8 8001A5E8 04000424 */  addiu      $a0, $zero, 0x4
/* ADEC 8001A5EC 21284002 */  addu       $a1, $s2, $zero
/* ADF0 8001A5F0 98014626 */  addiu      $a2, $s2, 0x198
/* ADF4 8001A5F4 50014226 */  addiu      $v0, $s2, 0x150
/* ADF8 8001A5F8 1000A2AF */  sw         $v0, 0x10($sp)
/* ADFC 8001A5FC C4014296 */  lhu        $v0, 0x1C4($s2)
/* AE00 8001A600 48014726 */  addiu      $a3, $s2, 0x148
/* AE04 8001A604 23100200 */  negu       $v0, $v0
/* AE08 8001A608 00140200 */  sll        $v0, $v0, 16
/* AE0C 8001A60C 03140200 */  sra        $v0, $v0, 16
/* AE10 8001A610 CD5C000C */  jal        CriticalDampPosition
/* AE14 8001A614 1400A2AF */   sw        $v0, 0x14($sp)
/* AE18 8001A618 2804428E */  lw         $v0, 0x428($s2)
/* AE1C 8001A61C 00000000 */  nop
/* AE20 8001A620 5E004010 */  beqz       $v0, .L8001A79C
/* AE24 8001A624 04000424 */   addiu     $a0, $zero, 0x4
/* AE28 8001A628 00015026 */  addiu      $s0, $s2, 0x100
/* AE2C 8001A62C 21280002 */  addu       $a1, $s0, $zero
/* AE30 8001A630 AA014626 */  addiu      $a2, $s2, 0x1AA
/* AE34 8001A634 60014226 */  addiu      $v0, $s2, 0x160
/* AE38 8001A638 1000A2AF */  sw         $v0, 0x10($sp)
/* AE3C 8001A63C C4014296 */  lhu        $v0, 0x1C4($s2)
/* AE40 8001A640 58014726 */  addiu      $a3, $s2, 0x158
/* AE44 8001A644 23100200 */  negu       $v0, $v0
/* AE48 8001A648 00140200 */  sll        $v0, $v0, 16
/* AE4C 8001A64C 03140200 */  sra        $v0, $v0, 16
/* AE50 8001A650 CD5C000C */  jal        CriticalDampPosition
/* AE54 8001A654 1400A2AF */   sw        $v0, 0x14($sp)
/* AE58 8001A658 21204002 */  addu       $a0, $s2, $zero
/* AE5C 8001A65C 505A000C */  jal        CAMERA_SetTarget
/* AE60 8001A660 21280002 */   addu      $a1, $s0, $zero
/* AE64 8001A664 00004486 */  lh         $a0, 0x0($s2)
/* AE68 8001A668 98014386 */  lh         $v1, 0x198($s2)
/* AE6C 8001A66C 00000000 */  nop
/* AE70 8001A670 23108300 */  subu       $v0, $a0, $v1
/* AE74 8001A674 05004004 */  bltz       $v0, .L8001A68C
/* AE78 8001A678 09004228 */   slti      $v0, $v0, 0x9
/* AE7C 8001A67C 07004014 */  bnez       $v0, .L8001A69C
/* AE80 8001A680 A0015026 */   addiu     $s0, $s2, 0x1A0
/* AE84 8001A684 286A0008 */  j          .L8001A8A0
/* AE88 8001A688 21200002 */   addu      $a0, $s0, $zero
.L8001A68C:
/* AE8C 8001A68C 23106400 */  subu       $v0, $v1, $a0
/* AE90 8001A690 09004228 */  slti       $v0, $v0, 0x9
/* AE94 8001A694 81004010 */  beqz       $v0, .L8001A89C
/* AE98 8001A698 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A69C:
/* AE9C 8001A69C 02004486 */  lh         $a0, 0x2($s2)
/* AEA0 8001A6A0 9A014386 */  lh         $v1, 0x19A($s2)
/* AEA4 8001A6A4 00000000 */  nop
/* AEA8 8001A6A8 23108300 */  subu       $v0, $a0, $v1
/* AEAC 8001A6AC 05004004 */  bltz       $v0, .L8001A6C4
/* AEB0 8001A6B0 09004228 */   slti      $v0, $v0, 0x9
/* AEB4 8001A6B4 07004014 */  bnez       $v0, .L8001A6D4
/* AEB8 8001A6B8 A0015026 */   addiu     $s0, $s2, 0x1A0
/* AEBC 8001A6BC 286A0008 */  j          .L8001A8A0
/* AEC0 8001A6C0 21200002 */   addu      $a0, $s0, $zero
.L8001A6C4:
/* AEC4 8001A6C4 23106400 */  subu       $v0, $v1, $a0
/* AEC8 8001A6C8 09004228 */  slti       $v0, $v0, 0x9
/* AECC 8001A6CC 73004010 */  beqz       $v0, .L8001A89C
/* AED0 8001A6D0 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A6D4:
/* AED4 8001A6D4 04004486 */  lh         $a0, 0x4($s2)
/* AED8 8001A6D8 9C014386 */  lh         $v1, 0x19C($s2)
/* AEDC 8001A6DC 00000000 */  nop
/* AEE0 8001A6E0 23108300 */  subu       $v0, $a0, $v1
/* AEE4 8001A6E4 05004004 */  bltz       $v0, .L8001A6FC
/* AEE8 8001A6E8 09004228 */   slti      $v0, $v0, 0x9
/* AEEC 8001A6EC 07004014 */  bnez       $v0, .L8001A70C
/* AEF0 8001A6F0 A0015026 */   addiu     $s0, $s2, 0x1A0
/* AEF4 8001A6F4 286A0008 */  j          .L8001A8A0
/* AEF8 8001A6F8 21200002 */   addu      $a0, $s0, $zero
.L8001A6FC:
/* AEFC 8001A6FC 23106400 */  subu       $v0, $v1, $a0
/* AF00 8001A700 09004228 */  slti       $v0, $v0, 0x9
/* AF04 8001A704 65004010 */  beqz       $v0, .L8001A89C
/* AF08 8001A708 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A70C:
/* AF0C 8001A70C 00014486 */  lh         $a0, 0x100($s2)
/* AF10 8001A710 AA014386 */  lh         $v1, 0x1AA($s2)
/* AF14 8001A714 00000000 */  nop
/* AF18 8001A718 23108300 */  subu       $v0, $a0, $v1
/* AF1C 8001A71C 05004004 */  bltz       $v0, .L8001A734
/* AF20 8001A720 09004228 */   slti      $v0, $v0, 0x9
/* AF24 8001A724 07004014 */  bnez       $v0, .L8001A744
/* AF28 8001A728 A0015026 */   addiu     $s0, $s2, 0x1A0
/* AF2C 8001A72C 286A0008 */  j          .L8001A8A0
/* AF30 8001A730 21200002 */   addu      $a0, $s0, $zero
.L8001A734:
/* AF34 8001A734 23106400 */  subu       $v0, $v1, $a0
/* AF38 8001A738 09004228 */  slti       $v0, $v0, 0x9
/* AF3C 8001A73C 57004010 */  beqz       $v0, .L8001A89C
/* AF40 8001A740 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A744:
/* AF44 8001A744 02014486 */  lh         $a0, 0x102($s2)
/* AF48 8001A748 AC014386 */  lh         $v1, 0x1AC($s2)
/* AF4C 8001A74C 00000000 */  nop
/* AF50 8001A750 23108300 */  subu       $v0, $a0, $v1
/* AF54 8001A754 05004004 */  bltz       $v0, .L8001A76C
/* AF58 8001A758 09004228 */   slti      $v0, $v0, 0x9
/* AF5C 8001A75C 07004014 */  bnez       $v0, .L8001A77C
/* AF60 8001A760 A0015026 */   addiu     $s0, $s2, 0x1A0
/* AF64 8001A764 286A0008 */  j          .L8001A8A0
/* AF68 8001A768 21200002 */   addu      $a0, $s0, $zero
.L8001A76C:
/* AF6C 8001A76C 23106400 */  subu       $v0, $v1, $a0
/* AF70 8001A770 09004228 */  slti       $v0, $v0, 0x9
/* AF74 8001A774 49004010 */  beqz       $v0, .L8001A89C
/* AF78 8001A778 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A77C:
/* AF7C 8001A77C 04014486 */  lh         $a0, 0x104($s2)
/* AF80 8001A780 AE014386 */  lh         $v1, 0x1AE($s2)
/* AF84 8001A784 00000000 */  nop
/* AF88 8001A788 23108300 */  subu       $v0, $a0, $v1
/* AF8C 8001A78C 39004104 */  bgez       $v0, .L8001A874
/* AF90 8001A790 09004228 */   slti      $v0, $v0, 0x9
/* AF94 8001A794 226A0008 */  j          .L8001A888
/* AF98 8001A798 23106400 */   subu      $v0, $v1, $a0
.L8001A79C:
/* AF9C 8001A79C 21204002 */  addu       $a0, $s2, $zero
/* AFA0 8001A7A0 AA015026 */  addiu      $s0, $s2, 0x1AA
/* AFA4 8001A7A4 B95A000C */  jal        CAMERA_SetFocus
/* AFA8 8001A7A8 21280002 */   addu      $a1, $s0, $zero
/* AFAC 8001A7AC 04000424 */  addiu      $a0, $zero, 0x4
/* AFB0 8001A7B0 00015126 */  addiu      $s1, $s2, 0x100
/* AFB4 8001A7B4 21282002 */  addu       $a1, $s1, $zero
/* AFB8 8001A7B8 21300002 */  addu       $a2, $s0, $zero
/* AFBC 8001A7BC 60014226 */  addiu      $v0, $s2, 0x160
/* AFC0 8001A7C0 1000A2AF */  sw         $v0, 0x10($sp)
/* AFC4 8001A7C4 C4014296 */  lhu        $v0, 0x1C4($s2)
/* AFC8 8001A7C8 58014726 */  addiu      $a3, $s2, 0x158
/* AFCC 8001A7CC 23100200 */  negu       $v0, $v0
/* AFD0 8001A7D0 00140200 */  sll        $v0, $v0, 16
/* AFD4 8001A7D4 03140200 */  sra        $v0, $v0, 16
/* AFD8 8001A7D8 CD5C000C */  jal        CriticalDampPosition
/* AFDC 8001A7DC 1400A2AF */   sw        $v0, 0x14($sp)
/* AFE0 8001A7E0 21204002 */  addu       $a0, $s2, $zero
/* AFE4 8001A7E4 505A000C */  jal        CAMERA_SetTarget
/* AFE8 8001A7E8 21282002 */   addu      $a1, $s1, $zero
/* AFEC 8001A7EC 00004486 */  lh         $a0, 0x0($s2)
/* AFF0 8001A7F0 98014386 */  lh         $v1, 0x198($s2)
/* AFF4 8001A7F4 00000000 */  nop
/* AFF8 8001A7F8 23108300 */  subu       $v0, $a0, $v1
/* AFFC 8001A7FC 05004004 */  bltz       $v0, .L8001A814
/* B000 8001A800 09004228 */   slti      $v0, $v0, 0x9
/* B004 8001A804 07004014 */  bnez       $v0, .L8001A824
/* B008 8001A808 A0015026 */   addiu     $s0, $s2, 0x1A0
/* B00C 8001A80C 286A0008 */  j          .L8001A8A0
/* B010 8001A810 21200002 */   addu      $a0, $s0, $zero
.L8001A814:
/* B014 8001A814 23106400 */  subu       $v0, $v1, $a0
/* B018 8001A818 09004228 */  slti       $v0, $v0, 0x9
/* B01C 8001A81C 1F004010 */  beqz       $v0, .L8001A89C
/* B020 8001A820 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A824:
/* B024 8001A824 02004486 */  lh         $a0, 0x2($s2)
/* B028 8001A828 9A014386 */  lh         $v1, 0x19A($s2)
/* B02C 8001A82C 00000000 */  nop
/* B030 8001A830 23108300 */  subu       $v0, $a0, $v1
/* B034 8001A834 05004004 */  bltz       $v0, .L8001A84C
/* B038 8001A838 09004228 */   slti      $v0, $v0, 0x9
/* B03C 8001A83C 07004014 */  bnez       $v0, .L8001A85C
/* B040 8001A840 A0015026 */   addiu     $s0, $s2, 0x1A0
/* B044 8001A844 286A0008 */  j          .L8001A8A0
/* B048 8001A848 21200002 */   addu      $a0, $s0, $zero
.L8001A84C:
/* B04C 8001A84C 23106400 */  subu       $v0, $v1, $a0
/* B050 8001A850 09004228 */  slti       $v0, $v0, 0x9
/* B054 8001A854 11004010 */  beqz       $v0, .L8001A89C
/* B058 8001A858 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A85C:
/* B05C 8001A85C 04004486 */  lh         $a0, 0x4($s2)
/* B060 8001A860 9C014386 */  lh         $v1, 0x19C($s2)
/* B064 8001A864 00000000 */  nop
/* B068 8001A868 23108300 */  subu       $v0, $a0, $v1
/* B06C 8001A86C 05004004 */  bltz       $v0, .L8001A884
/* B070 8001A870 09004228 */   slti      $v0, $v0, 0x9
.L8001A874:
/* B074 8001A874 07004014 */  bnez       $v0, .L8001A894
/* B078 8001A878 A0015026 */   addiu     $s0, $s2, 0x1A0
/* B07C 8001A87C 286A0008 */  j          .L8001A8A0
/* B080 8001A880 21200002 */   addu      $a0, $s0, $zero
.L8001A884:
/* B084 8001A884 23106400 */  subu       $v0, $v1, $a0
.L8001A888:
/* B088 8001A888 09004228 */  slti       $v0, $v0, 0x9
/* B08C 8001A88C 03004010 */  beqz       $v0, .L8001A89C
/* B090 8001A890 A0015026 */   addiu     $s0, $s2, 0x1A0
.L8001A894:
/* B094 8001A894 F40040A6 */  sh         $zero, 0xF4($s2)
.L8001A898:
/* B098 8001A898 A0015026 */  addiu      $s0, $s2, 0x1A0
.L8001A89C:
/* B09C 8001A89C 21200002 */  addu       $a0, $s0, $zero
.L8001A8A0:
/* B0A0 8001A8A0 00014526 */  addiu      $a1, $s2, 0x100
/* B0A4 8001A8A4 C45E000C */  jal        CAMERA_CalcRotation
/* B0A8 8001A8A8 21304002 */   addu      $a2, $s2, $zero
/* B0AC 8001A8AC A0014296 */  lhu        $v0, 0x1A0($s2)
/* B0B0 8001A8B0 02000396 */  lhu        $v1, 0x2($s0)
/* B0B4 8001A8B4 04000496 */  lhu        $a0, 0x4($s0)
/* B0B8 8001A8B8 B00042A6 */  sh         $v0, 0xB0($s2)
/* B0BC 8001A8BC B0004226 */  addiu      $v0, $s2, 0xB0
/* B0C0 8001A8C0 020043A4 */  sh         $v1, 0x2($v0)
/* B0C4 8001A8C4 040044A4 */  sh         $a0, 0x4($v0)
/* B0C8 8001A8C8 B0004296 */  lhu        $v0, 0xB0($s2)
/* B0CC 8001A8CC B4004396 */  lhu        $v1, 0xB4($s2)
/* B0D0 8001A8D0 21204002 */  addu       $a0, $s2, $zero
/* B0D4 8001A8D4 B20482A4 */  sh         $v0, 0x4B2($a0)
/* B0D8 8001A8D8 7571000C */  jal        CAMERA_UpdateFocusRoll
/* B0DC 8001A8DC FC0083A4 */   sh        $v1, 0xFC($a0)
/* B0E0 8001A8E0 2C00BF8F */  lw         $ra, 0x2C($sp)
/* B0E4 8001A8E4 2800B48F */  lw         $s4, 0x28($sp)
/* B0E8 8001A8E8 2400B38F */  lw         $s3, 0x24($sp)
/* B0EC 8001A8EC 2000B28F */  lw         $s2, 0x20($sp)
/* B0F0 8001A8F0 1C00B18F */  lw         $s1, 0x1C($sp)
/* B0F4 8001A8F4 1800B08F */  lw         $s0, 0x18($sp)
/* B0F8 8001A8F8 0800E003 */  jr         $ra
/* B0FC 8001A8FC 3000BD27 */   addiu     $sp, $sp, 0x30
.size CAMERA_CinematicProcess, . - CAMERA_CinematicProcess
