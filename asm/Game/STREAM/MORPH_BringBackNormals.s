.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_BringBackNormals
/* 4D6C4 8005CEC4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4D6C8 8005CEC8 21388000 */  addu       $a3, $a0, $zero
/* 4D6CC 8005CECC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 4D6D0 8005CED0 2800B0AF */  sw         $s0, 0x28($sp)
/* 4D6D4 8005CED4 0000E28C */  lw         $v0, 0x0($a3)
/* 4D6D8 8005CED8 00000000 */  nop
/* 4D6DC 8005CEDC 4C00458C */  lw         $a1, 0x4C($v0)
/* 4D6E0 8005CEE0 1400468C */  lw         $a2, 0x14($v0)
/* 4D6E4 8005CEE4 2000438C */  lw         $v1, 0x20($v0)
/* 4D6E8 8005CEE8 0A00C018 */  blez       $a2, .L8005CF14
/* 4D6EC 8005CEEC 08006424 */   addiu     $a0, $v1, 0x8
.L8005CEF0:
/* 4D6F0 8005CEF0 00008394 */  lhu        $v1, 0x0($a0)
/* 4D6F4 8005CEF4 0000A294 */  lhu        $v0, 0x0($a1)
/* 4D6F8 8005CEF8 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 4D6FC 8005CEFC 000082A4 */  sh         $v0, 0x0($a0)
/* 4D700 8005CF00 0000A3A4 */  sh         $v1, 0x0($a1)
/* 4D704 8005CF04 0200A524 */  addiu      $a1, $a1, 0x2
/* 4D708 8005CF08 F9FFC01C */  bgtz       $a2, .L8005CEF0
/* 4D70C 8005CF0C 0C008424 */   addiu     $a0, $a0, 0xC
/* 4D710 8005CF10 0000E28C */  lw         $v0, 0x0($a3)
.L8005CF14:
/* 4D714 8005CF14 00000000 */  nop
/* 4D718 8005CF18 3C00448C */  lw         $a0, 0x3C($v0)
/* 4D71C 8005CF1C 00000000 */  nop
/* 4D720 8005CF20 19008010 */  beqz       $a0, .L8005CF88
/* 4D724 8005CF24 00000000 */   nop
/* 4D728 8005CF28 06008284 */  lh         $v0, 0x6($a0)
/* 4D72C 8005CF2C 06008394 */  lhu        $v1, 0x6($a0)
/* 4D730 8005CF30 15004004 */  bltz       $v0, .L8005CF88
/* 4D734 8005CF34 00140300 */   sll       $v0, $v1, 16
/* 4D738 8005CF38 06008624 */  addiu      $a2, $a0, 0x6
.L8005CF3C:
/* 4D73C 8005CF3C 03140200 */  sra        $v0, $v0, 16
/* 4D740 8005CF40 40180200 */  sll        $v1, $v0, 1
/* 4D744 8005CF44 21186200 */  addu       $v1, $v1, $v0
/* 4D748 8005CF48 0000E28C */  lw         $v0, 0x0($a3)
/* 4D74C 8005CF4C 80180300 */  sll        $v1, $v1, 2
/* 4D750 8005CF50 1C00428C */  lw         $v0, 0x1C($v0)
/* 4D754 8005CF54 0200C494 */  lhu        $a0, 0x2($a2)
/* 4D758 8005CF58 21284300 */  addu       $a1, $v0, $v1
/* 4D75C 8005CF5C 0000A4A4 */  sh         $a0, 0x0($a1)
/* 4D760 8005CF60 0400C294 */  lhu        $v0, 0x4($a2)
/* 4D764 8005CF64 00000000 */  nop
/* 4D768 8005CF68 0200A2A4 */  sh         $v0, 0x2($a1)
/* 4D76C 8005CF6C 0600C294 */  lhu        $v0, 0x6($a2)
/* 4D770 8005CF70 0E00C624 */  addiu      $a2, $a2, 0xE
/* 4D774 8005CF74 0400A2A4 */  sh         $v0, 0x4($a1)
/* 4D778 8005CF78 0000C284 */  lh         $v0, 0x0($a2)
/* 4D77C 8005CF7C 0000C394 */  lhu        $v1, 0x0($a2)
/* 4D780 8005CF80 EEFF4104 */  bgez       $v0, .L8005CF3C
/* 4D784 8005CF84 00140300 */   sll       $v0, $v1, 16
.L8005CF88:
/* 4D788 8005CF88 0000E38C */  lw         $v1, 0x0($a3)
/* 4D78C 8005CF8C 00000000 */  nop
/* 4D790 8005CF90 4000628C */  lw         $v0, 0x40($v1)
/* 4D794 8005CF94 00000000 */  nop
/* 4D798 8005CF98 1B004010 */  beqz       $v0, .L8005D008
/* 4D79C 8005CF9C 00000000 */   nop
/* 4D7A0 8005CFA0 1C00628C */  lw         $v0, 0x1C($v1)
/* 4D7A4 8005CFA4 1000638C */  lw         $v1, 0x10($v1)
/* 4D7A8 8005CFA8 21284000 */  addu       $a1, $v0, $zero
/* 4D7AC 8005CFAC 40100300 */  sll        $v0, $v1, 1
/* 4D7B0 8005CFB0 21104300 */  addu       $v0, $v0, $v1
/* 4D7B4 8005CFB4 80100200 */  sll        $v0, $v0, 2
/* 4D7B8 8005CFB8 2130A200 */  addu       $a2, $a1, $v0
/* 4D7BC 8005CFBC 2B10A600 */  sltu       $v0, $a1, $a2
/* 4D7C0 8005CFC0 11004010 */  beqz       $v0, .L8005D008
/* 4D7C4 8005CFC4 0A00A424 */   addiu     $a0, $a1, 0xA
.L8005CFC8:
/* 4D7C8 8005CFC8 0C00A524 */  addiu      $a1, $a1, 0xC
/* 4D7CC 8005CFCC FCFF8290 */  lbu        $v0, -0x4($a0)
/* 4D7D0 8005CFD0 FCFF8394 */  lhu        $v1, -0x4($a0)
/* 4D7D4 8005CFD4 1F004230 */  andi       $v0, $v0, 0x1F
/* 4D7D8 8005CFD8 C0100200 */  sll        $v0, $v0, 3
/* 4D7DC 8005CFDC 82180300 */  srl        $v1, $v1, 2
/* 4D7E0 8005CFE0 FEFF82A0 */  sb         $v0, -0x2($a0)
/* 4D7E4 8005CFE4 FCFF8294 */  lhu        $v0, -0x4($a0)
/* 4D7E8 8005CFE8 F8006330 */  andi       $v1, $v1, 0xF8
/* 4D7EC 8005CFEC FFFF83A0 */  sb         $v1, -0x1($a0)
/* 4D7F0 8005CFF0 C2110200 */  srl        $v0, $v0, 7
/* 4D7F4 8005CFF4 F8004230 */  andi       $v0, $v0, 0xF8
/* 4D7F8 8005CFF8 000082A0 */  sb         $v0, 0x0($a0)
/* 4D7FC 8005CFFC 2B10A600 */  sltu       $v0, $a1, $a2
/* 4D800 8005D000 F1FF4014 */  bnez       $v0, .L8005CFC8
/* 4D804 8005D004 0C008424 */   addiu     $a0, $a0, 0xC
.L8005D008:
/* 4D808 8005D008 0000E48C */  lw         $a0, 0x0($a3)
/* 4D80C 8005D00C 00000000 */  nop
/* 4D810 8005D010 4400828C */  lw         $v0, 0x44($a0)
/* 4D814 8005D014 00000000 */  nop
/* 4D818 8005D018 80004018 */  blez       $v0, .L8005D21C
/* 4D81C 8005D01C 21400000 */   addu      $t0, $zero, $zero
/* 4D820 8005D020 21300001 */  addu       $a2, $t0, $zero
.L8005D024:
/* 4D824 8005D024 4800828C */  lw         $v0, 0x48($a0)
/* 4D828 8005D028 00000000 */  nop
/* 4D82C 8005D02C 2110C200 */  addu       $v0, $a2, $v0
/* 4D830 8005D030 0000438C */  lw         $v1, 0x0($v0)
/* 4D834 8005D034 0400428C */  lw         $v0, 0x4($v0)
/* 4D838 8005D038 00000000 */  nop
/* 4D83C 8005D03C 2B106200 */  sltu       $v0, $v1, $v0
/* 4D840 8005D040 22004010 */  beqz       $v0, .L8005D0CC
/* 4D844 8005D044 1C006524 */   addiu     $a1, $v1, 0x1C
/* 4D848 8005D048 2138C000 */  addu       $a3, $a2, $zero
.L8005D04C:
/* 4D84C 8005D04C 03006988 */  lwl        $t1, 0x3($v1)
/* 4D850 8005D050 00006998 */  lwr        $t1, 0x0($v1)
/* 4D854 8005D054 07006A88 */  lwl        $t2, 0x7($v1)
/* 4D858 8005D058 04006A98 */  lwr        $t2, 0x4($v1)
/* 4D85C 8005D05C 1300A9AB */  swl        $t1, 0x13($sp)
/* 4D860 8005D060 1000A9BB */  swr        $t1, 0x10($sp)
/* 4D864 8005D064 1700AAAB */  swl        $t2, 0x17($sp)
/* 4D868 8005D068 1400AABB */  swr        $t2, 0x14($sp)
/* 4D86C 8005D06C 0300A988 */  lwl        $t1, 0x3($a1)
/* 4D870 8005D070 0000A998 */  lwr        $t1, 0x0($a1)
/* 4D874 8005D074 0700AA88 */  lwl        $t2, 0x7($a1)
/* 4D878 8005D078 0400AA98 */  lwr        $t2, 0x4($a1)
/* 4D87C 8005D07C 030069A8 */  swl        $t1, 0x3($v1)
/* 4D880 8005D080 000069B8 */  swr        $t1, 0x0($v1)
/* 4D884 8005D084 07006AA8 */  swl        $t2, 0x7($v1)
/* 4D888 8005D088 04006AB8 */  swr        $t2, 0x4($v1)
/* 4D88C 8005D08C 1300A98B */  lwl        $t1, 0x13($sp)
/* 4D890 8005D090 1000A99B */  lwr        $t1, 0x10($sp)
/* 4D894 8005D094 1700AA8B */  lwl        $t2, 0x17($sp)
/* 4D898 8005D098 1400AA9B */  lwr        $t2, 0x14($sp)
/* 4D89C 8005D09C 0300A9A8 */  swl        $t1, 0x3($a1)
/* 4D8A0 8005D0A0 0000A9B8 */  swr        $t1, 0x0($a1)
/* 4D8A4 8005D0A4 0700AAA8 */  swl        $t2, 0x7($a1)
/* 4D8A8 8005D0A8 0400AAB8 */  swr        $t2, 0x4($a1)
/* 4D8AC 8005D0AC 4800828C */  lw         $v0, 0x48($a0)
/* 4D8B0 8005D0B0 00000000 */  nop
/* 4D8B4 8005D0B4 2110E200 */  addu       $v0, $a3, $v0
/* 4D8B8 8005D0B8 0400428C */  lw         $v0, 0x4($v0)
/* 4D8BC 8005D0BC 2C006324 */  addiu      $v1, $v1, 0x2C
/* 4D8C0 8005D0C0 2B106200 */  sltu       $v0, $v1, $v0
/* 4D8C4 8005D0C4 E1FF4014 */  bnez       $v0, .L8005D04C
/* 4D8C8 8005D0C8 2C00A524 */   addiu     $a1, $a1, 0x2C
.L8005D0CC:
/* 4D8CC 8005D0CC 4800828C */  lw         $v0, 0x48($a0)
/* 4D8D0 8005D0D0 00000000 */  nop
/* 4D8D4 8005D0D4 2110C200 */  addu       $v0, $a2, $v0
/* 4D8D8 8005D0D8 0400458C */  lw         $a1, 0x4($v0)
/* 4D8DC 8005D0DC 0800428C */  lw         $v0, 0x8($v0)
/* 4D8E0 8005D0E0 00000000 */  nop
/* 4D8E4 8005D0E4 2B10A200 */  sltu       $v0, $a1, $v0
/* 4D8E8 8005D0E8 47004010 */  beqz       $v0, .L8005D208
/* 4D8EC 8005D0EC 00000000 */   nop
/* 4D8F0 8005D0F0 2138C000 */  addu       $a3, $a2, $zero
/* 4D8F4 8005D0F4 1C00A324 */  addiu      $v1, $a1, 0x1C
.L8005D0F8:
/* 4D8F8 8005D0F8 0300A988 */  lwl        $t1, 0x3($a1)
/* 4D8FC 8005D0FC 0000A998 */  lwr        $t1, 0x0($a1)
/* 4D900 8005D100 0700AA88 */  lwl        $t2, 0x7($a1)
/* 4D904 8005D104 0400AA98 */  lwr        $t2, 0x4($a1)
/* 4D908 8005D108 1300A9AB */  swl        $t1, 0x13($sp)
/* 4D90C 8005D10C 1000A9BB */  swr        $t1, 0x10($sp)
/* 4D910 8005D110 1700AAAB */  swl        $t2, 0x17($sp)
/* 4D914 8005D114 1400AABB */  swr        $t2, 0x14($sp)
/* 4D918 8005D118 0F006988 */  lwl        $t1, 0xF($v1)
/* 4D91C 8005D11C 0C006998 */  lwr        $t1, 0xC($v1)
/* 4D920 8005D120 13006A88 */  lwl        $t2, 0x13($v1)
/* 4D924 8005D124 10006A98 */  lwr        $t2, 0x10($v1)
/* 4D928 8005D128 0300A9A8 */  swl        $t1, 0x3($a1)
/* 4D92C 8005D12C 0000A9B8 */  swr        $t1, 0x0($a1)
/* 4D930 8005D130 0700AAA8 */  swl        $t2, 0x7($a1)
/* 4D934 8005D134 0400AAB8 */  swr        $t2, 0x4($a1)
/* 4D938 8005D138 1300A98B */  lwl        $t1, 0x13($sp)
/* 4D93C 8005D13C 1000A99B */  lwr        $t1, 0x10($sp)
/* 4D940 8005D140 1700AA8B */  lwl        $t2, 0x17($sp)
/* 4D944 8005D144 1400AA9B */  lwr        $t2, 0x14($sp)
/* 4D948 8005D148 0F0069A8 */  swl        $t1, 0xF($v1)
/* 4D94C 8005D14C 0C0069B8 */  swr        $t1, 0xC($v1)
/* 4D950 8005D150 13006AA8 */  swl        $t2, 0x13($v1)
/* 4D954 8005D154 10006AB8 */  swr        $t2, 0x10($v1)
/* 4D958 8005D158 F7FF6988 */  lwl        $t1, -0x9($v1)
/* 4D95C 8005D15C F4FF6998 */  lwr        $t1, -0xC($v1)
/* 4D960 8005D160 FBFF6A88 */  lwl        $t2, -0x5($v1)
/* 4D964 8005D164 F8FF6A98 */  lwr        $t2, -0x8($v1)
/* 4D968 8005D168 FFFF6B88 */  lwl        $t3, -0x1($v1)
/* 4D96C 8005D16C FCFF6B98 */  lwr        $t3, -0x4($v1)
/* 4D970 8005D170 1B00A9AB */  swl        $t1, 0x1B($sp)
/* 4D974 8005D174 1800A9BB */  swr        $t1, 0x18($sp)
/* 4D978 8005D178 1F00AAAB */  swl        $t2, 0x1F($sp)
/* 4D97C 8005D17C 1C00AABB */  swr        $t2, 0x1C($sp)
/* 4D980 8005D180 2300ABAB */  swl        $t3, 0x23($sp)
/* 4D984 8005D184 2000ABBB */  swr        $t3, 0x20($sp)
/* 4D988 8005D188 03006988 */  lwl        $t1, 0x3($v1)
/* 4D98C 8005D18C 00006998 */  lwr        $t1, 0x0($v1)
/* 4D990 8005D190 07006A88 */  lwl        $t2, 0x7($v1)
/* 4D994 8005D194 04006A98 */  lwr        $t2, 0x4($v1)
/* 4D998 8005D198 0B006B88 */  lwl        $t3, 0xB($v1)
/* 4D99C 8005D19C 08006B98 */  lwr        $t3, 0x8($v1)
/* 4D9A0 8005D1A0 F7FF69A8 */  swl        $t1, -0x9($v1)
/* 4D9A4 8005D1A4 F4FF69B8 */  swr        $t1, -0xC($v1)
/* 4D9A8 8005D1A8 FBFF6AA8 */  swl        $t2, -0x5($v1)
/* 4D9AC 8005D1AC F8FF6AB8 */  swr        $t2, -0x8($v1)
/* 4D9B0 8005D1B0 FFFF6BA8 */  swl        $t3, -0x1($v1)
/* 4D9B4 8005D1B4 FCFF6BB8 */  swr        $t3, -0x4($v1)
/* 4D9B8 8005D1B8 1B00A98B */  lwl        $t1, 0x1B($sp)
/* 4D9BC 8005D1BC 1800A99B */  lwr        $t1, 0x18($sp)
/* 4D9C0 8005D1C0 1F00AA8B */  lwl        $t2, 0x1F($sp)
/* 4D9C4 8005D1C4 1C00AA9B */  lwr        $t2, 0x1C($sp)
/* 4D9C8 8005D1C8 2300AB8B */  lwl        $t3, 0x23($sp)
/* 4D9CC 8005D1CC 2000AB9B */  lwr        $t3, 0x20($sp)
/* 4D9D0 8005D1D0 030069A8 */  swl        $t1, 0x3($v1)
/* 4D9D4 8005D1D4 000069B8 */  swr        $t1, 0x0($v1)
/* 4D9D8 8005D1D8 07006AA8 */  swl        $t2, 0x7($v1)
/* 4D9DC 8005D1DC 04006AB8 */  swr        $t2, 0x4($v1)
/* 4D9E0 8005D1E0 0B006BA8 */  swl        $t3, 0xB($v1)
/* 4D9E4 8005D1E4 08006BB8 */  swr        $t3, 0x8($v1)
/* 4D9E8 8005D1E8 4800828C */  lw         $v0, 0x48($a0)
/* 4D9EC 8005D1EC 00000000 */  nop
/* 4D9F0 8005D1F0 2110E200 */  addu       $v0, $a3, $v0
/* 4D9F4 8005D1F4 0800428C */  lw         $v0, 0x8($v0)
/* 4D9F8 8005D1F8 3000A524 */  addiu      $a1, $a1, 0x30
/* 4D9FC 8005D1FC 2B10A200 */  sltu       $v0, $a1, $v0
/* 4DA00 8005D200 BDFF4014 */  bnez       $v0, .L8005D0F8
/* 4DA04 8005D204 30006324 */   addiu     $v1, $v1, 0x30
.L8005D208:
/* 4DA08 8005D208 4400828C */  lw         $v0, 0x44($a0)
/* 4DA0C 8005D20C 01000825 */  addiu      $t0, $t0, 0x1
/* 4DA10 8005D210 2A100201 */  slt        $v0, $t0, $v0
/* 4DA14 8005D214 83FF4014 */  bnez       $v0, .L8005D024
/* 4DA18 8005D218 2400C624 */   addiu     $a2, $a2, 0x24
.L8005D21C:
/* 4DA1C 8005D21C FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4DA20 8005D220 00000000 */  nop
/* 4DA24 8005D224 0400508C */  lw         $s0, 0x4($v0)
/* 4DA28 8005D228 00000000 */  nop
/* 4DA2C 8005D22C 3D000012 */  beqz       $s0, .L8005D324
/* 4DA30 8005D230 00000000 */   nop
.L8005D234:
/* 4DA34 8005D234 2000038E */  lw         $v1, 0x20($s0)
/* 4DA38 8005D238 00000000 */  nop
/* 4DA3C 8005D23C 35006010 */  beqz       $v1, .L8005D314
/* 4DA40 8005D240 00000000 */   nop
/* 4DA44 8005D244 4400628C */  lw         $v0, 0x44($v1)
/* 4DA48 8005D248 00000000 */  nop
/* 4DA4C 8005D24C 05004014 */  bnez       $v0, .L8005D264
/* 4DA50 8005D250 00000000 */   nop
/* 4DA54 8005D254 48006284 */  lh         $v0, 0x48($v1)
/* 4DA58 8005D258 00000000 */  nop
/* 4DA5C 8005D25C 2D004010 */  beqz       $v0, .L8005D314
/* 4DA60 8005D260 00000000 */   nop
.L8005D264:
/* 4DA64 8005D264 1800028E */  lw         $v0, 0x18($s0)
/* 4DA68 8005D268 00000000 */  nop
/* 4DA6C 8005D26C 08004230 */  andi       $v0, $v0, 0x8
/* 4DA70 8005D270 28004014 */  bnez       $v0, .L8005D314
/* 4DA74 8005D274 00000000 */   nop
/* 4DA78 8005D278 5F00098A */  lwl        $t1, 0x5F($s0)
/* 4DA7C 8005D27C 5C00099A */  lwr        $t1, 0x5C($s0)
/* 4DA80 8005D280 60000A86 */  lh         $t2, 0x60($s0)
/* 4DA84 8005D284 1B00A9AB */  swl        $t1, 0x1B($sp)
/* 4DA88 8005D288 1800A9BB */  swr        $t1, 0x18($sp)
/* 4DA8C 8005D28C 1C00AAA7 */  sh         $t2, 0x1C($sp)
/* 4DA90 8005D290 20006294 */  lhu        $v0, 0x20($v1)
/* 4DA94 8005D294 00000000 */  nop
/* 4DA98 8005D298 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 4DA9C 8005D29C 22006294 */  lhu        $v0, 0x22($v1)
/* 4DAA0 8005D2A0 5C000596 */  lhu        $a1, 0x5C($s0)
/* 4DAA4 8005D2A4 5E0002A6 */  sh         $v0, 0x5E($s0)
/* 4DAA8 8005D2A8 24006294 */  lhu        $v0, 0x24($v1)
/* 4DAAC 8005D2AC 00000000 */  nop
/* 4DAB0 8005D2B0 600002A6 */  sh         $v0, 0x60($s0)
/* 4DAB4 8005D2B4 1800A297 */  lhu        $v0, 0x18($sp)
/* 4DAB8 8005D2B8 00000000 */  nop
/* 4DABC 8005D2BC 2328A200 */  subu       $a1, $a1, $v0
/* 4DAC0 8005D2C0 1000A5A7 */  sh         $a1, 0x10($sp)
/* 4DAC4 8005D2C4 002C0500 */  sll        $a1, $a1, 16
/* 4DAC8 8005D2C8 5E000496 */  lhu        $a0, 0x5E($s0)
/* 4DACC 8005D2CC 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 4DAD0 8005D2D0 032C0500 */  sra        $a1, $a1, 16
/* 4DAD4 8005D2D4 23208200 */  subu       $a0, $a0, $v0
/* 4DAD8 8005D2D8 1200A4A7 */  sh         $a0, 0x12($sp)
/* 4DADC 8005D2DC 00240400 */  sll        $a0, $a0, 16
/* 4DAE0 8005D2E0 03240400 */  sra        $a0, $a0, 16
/* 4DAE4 8005D2E4 60000396 */  lhu        $v1, 0x60($s0)
/* 4DAE8 8005D2E8 1C00A297 */  lhu        $v0, 0x1C($sp)
/* 4DAEC 8005D2EC 2128A400 */  addu       $a1, $a1, $a0
/* 4DAF0 8005D2F0 23186200 */  subu       $v1, $v1, $v0
/* 4DAF4 8005D2F4 1400A3A7 */  sh         $v1, 0x14($sp)
/* 4DAF8 8005D2F8 001C0300 */  sll        $v1, $v1, 16
/* 4DAFC 8005D2FC 031C0300 */  sra        $v1, $v1, 16
/* 4DB00 8005D300 2128A300 */  addu       $a1, $a1, $v1
/* 4DB04 8005D304 0300A010 */  beqz       $a1, .L8005D314
/* 4DB08 8005D308 21200002 */   addu      $a0, $s0, $zero
/* 4DB0C 8005D30C 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 4DB10 8005D310 1000A527 */   addiu     $a1, $sp, 0x10
.L8005D314:
/* 4DB14 8005D314 0800108E */  lw         $s0, 0x8($s0)
/* 4DB18 8005D318 00000000 */  nop
/* 4DB1C 8005D31C C5FF0016 */  bnez       $s0, .L8005D234
/* 4DB20 8005D320 00000000 */   nop
.L8005D324:
/* 4DB24 8005D324 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 4DB28 8005D328 2800B08F */  lw         $s0, 0x28($sp)
/* 4DB2C 8005D32C 0800E003 */  jr         $ra
/* 4DB30 8005D330 3000BD27 */   addiu     $sp, $sp, 0x30
.size MORPH_BringBackNormals, . - MORPH_BringBackNormals
