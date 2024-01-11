.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckDroppedLineCollision
/* 5F530 8006ED30 20FFBD27 */  addiu      $sp, $sp, -0xE0
/* 5F534 8006ED34 CC00B3AF */  sw         $s3, 0xCC($sp)
/* 5F538 8006ED38 21988000 */  addu       $s3, $a0, $zero
/* 5F53C 8006ED3C D800B6AF */  sw         $s6, 0xD8($sp)
/* 5F540 8006ED40 21B0A000 */  addu       $s6, $a1, $zero
/* 5F544 8006ED44 DC00BFAF */  sw         $ra, 0xDC($sp)
/* 5F548 8006ED48 D400B5AF */  sw         $s5, 0xD4($sp)
/* 5F54C 8006ED4C D000B4AF */  sw         $s4, 0xD0($sp)
/* 5F550 8006ED50 C800B2AF */  sw         $s2, 0xC8($sp)
/* 5F554 8006ED54 C400B1AF */  sw         $s1, 0xC4($sp)
/* 5F558 8006ED58 0B00C012 */  beqz       $s6, .L8006ED88
/* 5F55C 8006ED5C C000B0AF */   sw        $s0, 0xC0($sp)
/* 5F560 8006ED60 5F00CA8A */  lwl        $t2, 0x5F($s6)
/* 5F564 8006ED64 5C00CA9A */  lwr        $t2, 0x5C($s6)
/* 5F568 8006ED68 6000CB86 */  lh         $t3, 0x60($s6)
/* 5F56C 8006ED6C 4300AAAB */  swl        $t2, 0x43($sp)
/* 5F570 8006ED70 4000AABB */  swr        $t2, 0x40($sp)
/* 5F574 8006ED74 4400ABA7 */  sh         $t3, 0x44($sp)
/* 5F578 8006ED78 4000628E */  lw         $v0, 0x40($s3)
/* 5F57C 8006ED7C 00000000 */  nop
/* 5F580 8006ED80 03004014 */  bnez       $v0, .L8006ED90
/* 5F584 8006ED84 21A80000 */   addu      $s5, $zero, $zero
.L8006ED88:
/* 5F588 8006ED88 71BC0108 */  j          .L8006F1C4
/* 5F58C 8006ED8C 21100000 */   addu      $v0, $zero, $zero
.L8006ED90:
/* 5F590 8006ED90 2190A002 */  addu       $s2, $s5, $zero
/* 5F594 8006ED94 14004294 */  lhu        $v0, 0x14($v0)
/* 5F598 8006ED98 4000638E */  lw         $v1, 0x40($s3)
/* 5F59C 8006ED9C 5800B127 */  addiu      $s1, $sp, 0x58
/* 5F5A0 8006EDA0 5C0062A6 */  sh         $v0, 0x5C($s3)
/* 5F5A4 8006EDA4 18006294 */  lhu        $v0, 0x18($v1)
/* 5F5A8 8006EDA8 4800B027 */  addiu      $s0, $sp, 0x48
/* 5F5AC 8006EDAC 5E0062A6 */  sh         $v0, 0x5E($s3)
/* 5F5B0 8006EDB0 1C006294 */  lhu        $v0, 0x1C($v1)
/* 5F5B4 8006EDB4 5000B427 */  addiu      $s4, $sp, 0x50
/* 5F5B8 8006EDB8 600062A6 */  sh         $v0, 0x60($s3)
.L8006EDBC:
/* 5F5BC 8006EDBC 4200A297 */  lhu        $v0, 0x42($sp)
/* 5F5C0 8006EDC0 4000A797 */  lhu        $a3, 0x40($sp)
/* 5F5C4 8006EDC4 4000638E */  lw         $v1, 0x40($s3)
/* 5F5C8 8006EDC8 5200A2A7 */  sh         $v0, 0x52($sp)
/* 5F5CC 8006EDCC 40111200 */  sll        $v0, $s2, 5
/* 5F5D0 8006EDD0 21186200 */  addu       $v1, $v1, $v0
/* 5F5D4 8006EDD4 5000A7A7 */  sh         $a3, 0x50($sp)
/* 5F5D8 8006EDD8 1C006294 */  lhu        $v0, 0x1C($v1)
/* 5F5DC 8006EDDC 00000000 */  nop
/* 5F5E0 8006EDE0 64004224 */  addiu      $v0, $v0, 0x64
/* 5F5E4 8006EDE4 5400A2A7 */  sh         $v0, 0x54($sp)
/* 5F5E8 8006EDE8 14006594 */  lhu        $a1, 0x14($v1)
/* 5F5EC 8006EDEC 00000000 */  nop
/* 5F5F0 8006EDF0 4800A5A7 */  sh         $a1, 0x48($sp)
/* 5F5F4 8006EDF4 18006294 */  lhu        $v0, 0x18($v1)
/* 5F5F8 8006EDF8 2328A700 */  subu       $a1, $a1, $a3
/* 5F5FC 8006EDFC 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 5F600 8006EE00 1C006294 */  lhu        $v0, 0x1C($v1)
/* 5F604 8006EE04 001C0500 */  sll        $v1, $a1, 16
/* 5F608 8006EE08 031C0300 */  sra        $v1, $v1, 16
/* 5F60C 8006EE0C 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 5F610 8006EE10 40100300 */  sll        $v0, $v1, 1
/* 5F614 8006EE14 21104300 */  addu       $v0, $v0, $v1
/* 5F618 8006EE18 00110200 */  sll        $v0, $v0, 4
/* 5F61C 8006EE1C 23104300 */  subu       $v0, $v0, $v1
/* 5F620 8006EE20 C0100200 */  sll        $v0, $v0, 3
/* 5F624 8006EE24 23104300 */  subu       $v0, $v0, $v1
/* 5F628 8006EE28 02000396 */  lhu        $v1, 0x2($s0)
/* 5F62C 8006EE2C 04000496 */  lhu        $a0, 0x4($s0)
/* 5F630 8006EE30 02008896 */  lhu        $t0, 0x2($s4)
/* 5F634 8006EE34 04008996 */  lhu        $t1, 0x4($s4)
/* 5F638 8006EE38 00110200 */  sll        $v0, $v0, 4
/* 5F63C 8006EE3C 5800A5A7 */  sh         $a1, 0x58($sp)
/* 5F640 8006EE40 23186800 */  subu       $v1, $v1, $t0
/* 5F644 8006EE44 23208900 */  subu       $a0, $a0, $t1
/* 5F648 8006EE48 020023A6 */  sh         $v1, 0x2($s1)
/* 5F64C 8006EE4C 02004104 */  bgez       $v0, .L8006EE58
/* 5F650 8006EE50 040024A6 */   sh        $a0, 0x4($s1)
/* 5F654 8006EE54 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8006EE58:
/* 5F658 8006EE58 5A00A387 */  lh         $v1, 0x5A($sp)
/* 5F65C 8006EE5C 03330200 */  sra        $a2, $v0, 12
/* 5F660 8006EE60 40100300 */  sll        $v0, $v1, 1
/* 5F664 8006EE64 21104300 */  addu       $v0, $v0, $v1
/* 5F668 8006EE68 00110200 */  sll        $v0, $v0, 4
/* 5F66C 8006EE6C 23104300 */  subu       $v0, $v0, $v1
/* 5F670 8006EE70 C0100200 */  sll        $v0, $v0, 3
/* 5F674 8006EE74 23104300 */  subu       $v0, $v0, $v1
/* 5F678 8006EE78 00110200 */  sll        $v0, $v0, 4
/* 5F67C 8006EE7C 02004104 */  bgez       $v0, .L8006EE88
/* 5F680 8006EE80 5800A6A7 */   sh        $a2, 0x58($sp)
/* 5F684 8006EE84 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8006EE88:
/* 5F688 8006EE88 5C00A387 */  lh         $v1, 0x5C($sp)
/* 5F68C 8006EE8C 03130200 */  sra        $v0, $v0, 12
/* 5F690 8006EE90 5A00A2A7 */  sh         $v0, 0x5A($sp)
/* 5F694 8006EE94 40100300 */  sll        $v0, $v1, 1
/* 5F698 8006EE98 21104300 */  addu       $v0, $v0, $v1
/* 5F69C 8006EE9C 00110200 */  sll        $v0, $v0, 4
/* 5F6A0 8006EEA0 23104300 */  subu       $v0, $v0, $v1
/* 5F6A4 8006EEA4 C0100200 */  sll        $v0, $v0, 3
/* 5F6A8 8006EEA8 23104300 */  subu       $v0, $v0, $v1
/* 5F6AC 8006EEAC 00110200 */  sll        $v0, $v0, 4
/* 5F6B0 8006EEB0 02004104 */  bgez       $v0, .L8006EEBC
/* 5F6B4 8006EEB4 00000000 */   nop
/* 5F6B8 8006EEB8 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8006EEBC:
/* 5F6BC 8006EEBC 2120C002 */  addu       $a0, $s6, $zero
/* 5F6C0 8006EEC0 03130200 */  sra        $v0, $v0, 12
/* 5F6C4 8006EEC4 5C00A2A7 */  sh         $v0, 0x5C($sp)
/* 5F6C8 8006EEC8 02002396 */  lhu        $v1, 0x2($s1)
/* 5F6CC 8006EECC 04002596 */  lhu        $a1, 0x4($s1)
/* 5F6D0 8006EED0 2110C700 */  addu       $v0, $a2, $a3
/* 5F6D4 8006EED4 4800A2A7 */  sh         $v0, 0x48($sp)
/* 5F6D8 8006EED8 21186800 */  addu       $v1, $v1, $t0
/* 5F6DC 8006EEDC 2128A900 */  addu       $a1, $a1, $t1
/* 5F6E0 8006EEE0 020003A6 */  sh         $v1, 0x2($s0)
/* 5F6E4 8006EEE4 040005A6 */  sh         $a1, 0x4($s0)
/* 5F6E8 8006EEE8 4B00AA8B */  lwl        $t2, 0x4B($sp)
/* 5F6EC 8006EEEC 4800AA9B */  lwr        $t2, 0x48($sp)
/* 5F6F0 8006EEF0 4C00AB87 */  lh         $t3, 0x4C($sp)
/* 5F6F4 8006EEF4 6300AAAB */  swl        $t2, 0x63($sp)
/* 5F6F8 8006EEF8 6000AABB */  swr        $t2, 0x60($sp)
/* 5F6FC 8006EEFC 6400ABA7 */  sh         $t3, 0x64($sp)
/* 5F700 8006EF00 2400B0AF */  sw         $s0, 0x24($sp)
/* 5F704 8006EF04 34D2010C */  jal        SetNoPtCollideInFamily
/* 5F708 8006EF08 2800B4AF */   sw        $s4, 0x28($sp)
/* 5F70C 8006EF0C 21206002 */  addu       $a0, $s3, $zero
/* 5F710 8006EF10 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 5F714 8006EF14 1000A527 */   addiu     $a1, $sp, 0x10
/* 5F718 8006EF18 46D2010C */  jal        ResetNoPtCollideInFamily
/* 5F71C 8006EF1C 2120C002 */   addu      $a0, $s6, $zero
/* 5F720 8006EF20 1000A287 */  lh         $v0, 0x10($sp)
/* 5F724 8006EF24 00000000 */  nop
/* 5F728 8006EF28 07004010 */  beqz       $v0, .L8006EF48
/* 5F72C 8006EF2C 00000000 */   nop
/* 5F730 8006EF30 2000A287 */  lh         $v0, 0x20($sp)
/* 5F734 8006EF34 00000000 */  nop
/* 5F738 8006EF38 D90E4228 */  slti       $v0, $v0, 0xED9
/* 5F73C 8006EF3C 02004010 */  beqz       $v0, .L8006EF48
/* 5F740 8006EF40 00000000 */   nop
/* 5F744 8006EF44 01001524 */  addiu      $s5, $zero, 0x1
.L8006EF48:
/* 5F748 8006EF48 02005226 */  addiu      $s2, $s2, 0x2
/* 5F74C 8006EF4C 0300422A */  slti       $v0, $s2, 0x3
/* 5F750 8006EF50 03004010 */  beqz       $v0, .L8006EF60
/* 5F754 8006EF54 00000000 */   nop
/* 5F758 8006EF58 98FFA012 */  beqz       $s5, .L8006EDBC
/* 5F75C 8006EF5C 00000000 */   nop
.L8006EF60:
/* 5F760 8006EF60 9400A012 */  beqz       $s5, .L8006F1B4
/* 5F764 8006EF64 7800B027 */   addiu     $s0, $sp, 0x78
/* 5F768 8006EF68 4000628E */  lw         $v0, 0x40($s3)
/* 5F76C 8006EF6C 00000000 */  nop
/* 5F770 8006EF70 14004894 */  lhu        $t0, 0x14($v0)
/* 5F774 8006EF74 00000000 */  nop
/* 5F778 8006EF78 6800A8A7 */  sh         $t0, 0x68($sp)
/* 5F77C 8006EF7C 4000628E */  lw         $v0, 0x40($s3)
/* 5F780 8006EF80 00000000 */  nop
/* 5F784 8006EF84 18004294 */  lhu        $v0, 0x18($v0)
/* 5F788 8006EF88 00000000 */  nop
/* 5F78C 8006EF8C 6A00A2A7 */  sh         $v0, 0x6A($sp)
/* 5F790 8006EF90 4000628E */  lw         $v0, 0x40($s3)
/* 5F794 8006EF94 00000000 */  nop
/* 5F798 8006EF98 1C004294 */  lhu        $v0, 0x1C($v0)
/* 5F79C 8006EF9C 00000000 */  nop
/* 5F7A0 8006EFA0 6C00A2A7 */  sh         $v0, 0x6C($sp)
/* 5F7A4 8006EFA4 4000628E */  lw         $v0, 0x40($s3)
/* 5F7A8 8006EFA8 00000000 */  nop
/* 5F7AC 8006EFAC 54004694 */  lhu        $a2, 0x54($v0)
/* 5F7B0 8006EFB0 00000000 */  nop
/* 5F7B4 8006EFB4 7000A6A7 */  sh         $a2, 0x70($sp)
/* 5F7B8 8006EFB8 4000628E */  lw         $v0, 0x40($s3)
/* 5F7BC 8006EFBC 00000000 */  nop
/* 5F7C0 8006EFC0 58004294 */  lhu        $v0, 0x58($v0)
/* 5F7C4 8006EFC4 21200002 */  addu       $a0, $s0, $zero
/* 5F7C8 8006EFC8 7200A2A7 */  sh         $v0, 0x72($sp)
/* 5F7CC 8006EFCC 4000628E */  lw         $v0, 0x40($s3)
/* 5F7D0 8006EFD0 7000A327 */  addiu      $v1, $sp, 0x70
/* 5F7D4 8006EFD4 5C004294 */  lhu        $v0, 0x5C($v0)
/* 5F7D8 8006EFD8 6800A527 */  addiu      $a1, $sp, 0x68
/* 5F7DC 8006EFDC 7400A2A7 */  sh         $v0, 0x74($sp)
/* 5F7E0 8006EFE0 02006294 */  lhu        $v0, 0x2($v1)
/* 5F7E4 8006EFE4 04006394 */  lhu        $v1, 0x4($v1)
/* 5F7E8 8006EFE8 0200A794 */  lhu        $a3, 0x2($a1)
/* 5F7EC 8006EFEC 0400A594 */  lhu        $a1, 0x4($a1)
/* 5F7F0 8006EFF0 2330C800 */  subu       $a2, $a2, $t0
/* 5F7F4 8006EFF4 7800A6A7 */  sh         $a2, 0x78($sp)
/* 5F7F8 8006EFF8 23104700 */  subu       $v0, $v0, $a3
/* 5F7FC 8006EFFC 23186500 */  subu       $v1, $v1, $a1
/* 5F800 8006F000 020002A6 */  sh         $v0, 0x2($s0)
/* 5F804 8006F004 03E7000C */  jal        MATH3D_Normalize
/* 5F808 8006F008 040003A6 */   sh        $v1, 0x4($s0)
/* 5F80C 8006F00C 8000B227 */  addiu      $s2, $sp, 0x80
/* 5F810 8006F010 21204002 */  addu       $a0, $s2, $zero
/* 5F814 8006F014 21280002 */  addu       $a1, $s0, $zero
/* 5F818 8006F018 0A000224 */  addiu      $v0, $zero, 0xA
/* 5F81C 8006F01C 8000A2A7 */  sh         $v0, 0x80($sp)
/* 5F820 8006F020 00100224 */  addiu      $v0, $zero, 0x1000
/* 5F824 8006F024 8200A0A7 */  sh         $zero, 0x82($sp)
/* 5F828 8006F028 DDE7000C */  jal        MATH3D_AngleBetweenVectors
/* 5F82C 8006F02C 8400A2A7 */   sh        $v0, 0x84($sp)
/* 5F830 8006F030 8800B127 */  addiu      $s1, $sp, 0x88
/* 5F834 8006F034 21202002 */  addu       $a0, $s1, $zero
/* 5F838 8006F038 21280002 */  addu       $a1, $s0, $zero
/* 5F83C 8006F03C 21304002 */  addu       $a2, $s2, $zero
/* 5F840 8006F040 BEE9000C */  jal        MATH3D_CrossProduct
/* 5F844 8006F044 21804000 */   addu      $s0, $v0, $zero
/* 5F848 8006F048 21202002 */  addu       $a0, $s1, $zero
/* 5F84C 8006F04C 9000B127 */  addiu      $s1, $sp, 0x90
/* 5F850 8006F050 21282002 */  addu       $a1, $s1, $zero
/* 5F854 8006F054 00841000 */  sll        $s0, $s0, 16
/* 5F858 8006F058 4000628E */  lw         $v0, 0x40($s3)
/* 5F85C 8006F05C 00000000 */  nop
/* 5F860 8006F060 00004A8C */  lw         $t2, 0x0($v0)
/* 5F864 8006F064 04004B8C */  lw         $t3, 0x4($v0)
/* 5F868 8006F068 08004C8C */  lw         $t4, 0x8($v0)
/* 5F86C 8006F06C 0C004D8C */  lw         $t5, 0xC($v0)
/* 5F870 8006F070 9000AAAF */  sw         $t2, 0x90($sp)
/* 5F874 8006F074 9400ABAF */  sw         $t3, 0x94($sp)
/* 5F878 8006F078 9800ACAF */  sw         $t4, 0x98($sp)
/* 5F87C 8006F07C 9C00ADAF */  sw         $t5, 0x9C($sp)
/* 5F880 8006F080 10004A8C */  lw         $t2, 0x10($v0)
/* 5F884 8006F084 14004B8C */  lw         $t3, 0x14($v0)
/* 5F888 8006F088 18004C8C */  lw         $t4, 0x18($v0)
/* 5F88C 8006F08C 1C004D8C */  lw         $t5, 0x1C($v0)
/* 5F890 8006F090 A000AAAF */  sw         $t2, 0xA0($sp)
/* 5F894 8006F094 A400ABAF */  sw         $t3, 0xA4($sp)
/* 5F898 8006F098 A800ACAF */  sw         $t4, 0xA8($sp)
/* 5F89C 8006F09C AC00ADAF */  sw         $t5, 0xAC($sp)
/* 5F8A0 8006F0A0 18E8000C */  jal        MATH3D_RotMatAboutVec
/* 5F8A4 8006F0A4 03341000 */   sra       $a2, $s0, 16
/* 5F8A8 8006F0A8 B000A427 */  addiu      $a0, $sp, 0xB0
/* 5F8AC 8006F0AC 21282002 */  addu       $a1, $s1, $zero
/* 5F8B0 8006F0B0 1758020C */  jal        G2EulerAngles_FromMatrix
/* 5F8B4 8006F0B4 21300000 */   addu      $a2, $zero, $zero
/* 5F8B8 8006F0B8 B000A297 */  lhu        $v0, 0xB0($sp)
/* 5F8BC 8006F0BC 00000000 */  nop
/* 5F8C0 8006F0C0 740062A6 */  sh         $v0, 0x74($s3)
/* 5F8C4 8006F0C4 B200A297 */  lhu        $v0, 0xB2($sp)
/* 5F8C8 8006F0C8 00000000 */  nop
/* 5F8CC 8006F0CC 760062A6 */  sh         $v0, 0x76($s3)
/* 5F8D0 8006F0D0 B400A297 */  lhu        $v0, 0xB4($sp)
/* 5F8D4 8006F0D4 00000000 */  nop
/* 5F8D8 8006F0D8 780062A6 */  sh         $v0, 0x78($s3)
/* 5F8DC 8006F0DC 5F00CA8A */  lwl        $t2, 0x5F($s6)
/* 5F8E0 8006F0E0 5C00CA9A */  lwr        $t2, 0x5C($s6)
/* 5F8E4 8006F0E4 6000CB86 */  lh         $t3, 0x60($s6)
/* 5F8E8 8006F0E8 5F006AAA */  swl        $t2, 0x5F($s3)
/* 5F8EC 8006F0EC 5C006ABA */  swr        $t2, 0x5C($s3)
/* 5F8F0 8006F0F0 60006BA6 */  sh         $t3, 0x60($s3)
/* 5F8F4 8006F0F4 4000658E */  lw         $a1, 0x40($s3)
/* 5F8F8 8006F0F8 26016286 */  lh         $v0, 0x126($s3)
/* 5F8FC 8006F0FC 1C00638E */  lw         $v1, 0x1C($s3)
/* 5F900 8006F100 80100200 */  sll        $v0, $v0, 2
/* 5F904 8006F104 0C00638C */  lw         $v1, 0xC($v1)
/* 5F908 8006F108 1400A494 */  lhu        $a0, 0x14($a1)
/* 5F90C 8006F10C 21104300 */  addu       $v0, $v0, $v1
/* 5F910 8006F110 5C006396 */  lhu        $v1, 0x5C($s3)
/* 5F914 8006F114 0000468C */  lw         $a2, 0x0($v0)
/* 5F918 8006F118 23186400 */  subu       $v1, $v1, $a0
/* 5F91C 8006F11C B800A3A7 */  sh         $v1, 0xB8($sp)
/* 5F920 8006F120 5E006296 */  lhu        $v0, 0x5E($s3)
/* 5F924 8006F124 1800A394 */  lhu        $v1, 0x18($a1)
/* 5F928 8006F128 00000000 */  nop
/* 5F92C 8006F12C 23104300 */  subu       $v0, $v0, $v1
/* 5F930 8006F130 BA00A2A7 */  sh         $v0, 0xBA($sp)
/* 5F934 8006F134 1C00A294 */  lhu        $v0, 0x1C($a1)
/* 5F938 8006F138 60006396 */  lhu        $v1, 0x60($s3)
/* 5F93C 8006F13C ECFF4224 */  addiu      $v0, $v0, -0x14
/* 5F940 8006F140 23186200 */  subu       $v1, $v1, $v0
/* 5F944 8006F144 BC00A3A7 */  sh         $v1, 0xBC($sp)
/* 5F948 8006F148 1800C28C */  lw         $v0, 0x18($a2)
/* 5F94C 8006F14C 00000000 */  nop
/* 5F950 8006F150 18004018 */  blez       $v0, .L8006F1B4
/* 5F954 8006F154 21200000 */   addu      $a0, $zero, $zero
.L8006F158:
/* 5F958 8006F158 4000638E */  lw         $v1, 0x40($s3)
/* 5F95C 8006F15C 40110400 */  sll        $v0, $a0, 5
/* 5F960 8006F160 21286200 */  addu       $a1, $v1, $v0
/* 5F964 8006F164 B800A387 */  lh         $v1, 0xB8($sp)
/* 5F968 8006F168 1400A28C */  lw         $v0, 0x14($a1)
/* 5F96C 8006F16C 00000000 */  nop
/* 5F970 8006F170 21104300 */  addu       $v0, $v0, $v1
/* 5F974 8006F174 1400A2AC */  sw         $v0, 0x14($a1)
/* 5F978 8006F178 BA00A387 */  lh         $v1, 0xBA($sp)
/* 5F97C 8006F17C 1800A28C */  lw         $v0, 0x18($a1)
/* 5F980 8006F180 00000000 */  nop
/* 5F984 8006F184 21104300 */  addu       $v0, $v0, $v1
/* 5F988 8006F188 1800A2AC */  sw         $v0, 0x18($a1)
/* 5F98C 8006F18C BC00A387 */  lh         $v1, 0xBC($sp)
/* 5F990 8006F190 1C00A28C */  lw         $v0, 0x1C($a1)
/* 5F994 8006F194 00000000 */  nop
/* 5F998 8006F198 21104300 */  addu       $v0, $v0, $v1
/* 5F99C 8006F19C 1C00A2AC */  sw         $v0, 0x1C($a1)
/* 5F9A0 8006F1A0 1800C28C */  lw         $v0, 0x18($a2)
/* 5F9A4 8006F1A4 01008424 */  addiu      $a0, $a0, 0x1
/* 5F9A8 8006F1A8 2A108200 */  slt        $v0, $a0, $v0
/* 5F9AC 8006F1AC EAFF4014 */  bnez       $v0, .L8006F158
/* 5F9B0 8006F1B0 00000000 */   nop
.L8006F1B4:
/* 5F9B4 8006F1B4 60006396 */  lhu        $v1, 0x60($s3)
/* 5F9B8 8006F1B8 01000224 */  addiu      $v0, $zero, 0x1
/* 5F9BC 8006F1BC 14006324 */  addiu      $v1, $v1, 0x14
/* 5F9C0 8006F1C0 600063A6 */  sh         $v1, 0x60($s3)
.L8006F1C4:
/* 5F9C4 8006F1C4 DC00BF8F */  lw         $ra, 0xDC($sp)
/* 5F9C8 8006F1C8 D800B68F */  lw         $s6, 0xD8($sp)
/* 5F9CC 8006F1CC D400B58F */  lw         $s5, 0xD4($sp)
/* 5F9D0 8006F1D0 D000B48F */  lw         $s4, 0xD0($sp)
/* 5F9D4 8006F1D4 CC00B38F */  lw         $s3, 0xCC($sp)
/* 5F9D8 8006F1D8 C800B28F */  lw         $s2, 0xC8($sp)
/* 5F9DC 8006F1DC C400B18F */  lw         $s1, 0xC4($sp)
/* 5F9E0 8006F1E0 C000B08F */  lw         $s0, 0xC0($sp)
/* 5F9E4 8006F1E4 0800E003 */  jr         $ra
/* 5F9E8 8006F1E8 E000BD27 */   addiu     $sp, $sp, 0xE0
.size PHYSOB_CheckDroppedLineCollision, . - PHYSOB_CheckDroppedLineCollision
