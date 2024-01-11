.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AddClippedTri
/* 4EF48 8005E748 A0FDBD27 */  addiu      $sp, $sp, -0x260
/* 4EF4C 8005E74C FFFF0234 */  ori        $v0, $zero, 0xFFFF
/* 4EF50 8005E750 2000A827 */  addiu      $t0, $sp, 0x20
/* 4EF54 8005E754 2001A927 */  addiu      $t1, $sp, 0x120
/* 4EF58 8005E758 4C02B5AF */  sw         $s5, 0x24C($sp)
/* 4EF5C 8005E75C 21A80000 */  addu       $s5, $zero, $zero
/* 4EF60 8005E760 21180001 */  addu       $v1, $t0, $zero
/* 4EF64 8005E764 5C02BFAF */  sw         $ra, 0x25C($sp)
/* 4EF68 8005E768 5802BEAF */  sw         $fp, 0x258($sp)
/* 4EF6C 8005E76C 5402B7AF */  sw         $s7, 0x254($sp)
/* 4EF70 8005E770 5002B6AF */  sw         $s6, 0x250($sp)
/* 4EF74 8005E774 4802B4AF */  sw         $s4, 0x248($sp)
/* 4EF78 8005E778 4402B3AF */  sw         $s3, 0x244($sp)
/* 4EF7C 8005E77C 4002B2AF */  sw         $s2, 0x240($sp)
/* 4EF80 8005E780 3C02B1AF */  sw         $s1, 0x23C($sp)
/* 4EF84 8005E784 3802B0AF */  sw         $s0, 0x238($sp)
/* 4EF88 8005E788 6402A5AF */  sw         $a1, 0x264($sp)
/* 4EF8C 8005E78C 6802A6AF */  sw         $a2, 0x268($sp)
/* 4EF90 8005E790 0000C2AC */  sw         $v0, 0x0($a2)
/* 4EF94 8005E794 2C02A8AF */  sw         $t0, 0x22C($sp)
/* 4EF98 8005E798 3002A9AF */  sw         $t1, 0x230($sp)
.L8005E79C:
/* 4EF9C 8005E79C 00008284 */  lh         $v0, 0x0($a0)
/* 4EFA0 8005E7A0 00000000 */  nop
/* 4EFA4 8005E7A4 00140200 */  sll        $v0, $v0, 16
/* 4EFA8 8005E7A8 000062AC */  sw         $v0, 0x0($v1)
/* 4EFAC 8005E7AC 02008284 */  lh         $v0, 0x2($a0)
/* 4EFB0 8005E7B0 0100B526 */  addiu      $s5, $s5, 0x1
/* 4EFB4 8005E7B4 00140200 */  sll        $v0, $v0, 16
/* 4EFB8 8005E7B8 040062AC */  sw         $v0, 0x4($v1)
/* 4EFBC 8005E7BC 04008284 */  lh         $v0, 0x4($a0)
/* 4EFC0 8005E7C0 08008424 */  addiu      $a0, $a0, 0x8
/* 4EFC4 8005E7C4 00140200 */  sll        $v0, $v0, 16
/* 4EFC8 8005E7C8 080062AC */  sw         $v0, 0x8($v1)
/* 4EFCC 8005E7CC 0300A22A */  slti       $v0, $s5, 0x3
/* 4EFD0 8005E7D0 F2FF4014 */  bnez       $v0, .L8005E79C
/* 4EFD4 8005E7D4 10006324 */   addiu     $v1, $v1, 0x10
/* 4EFD8 8005E7D8 03001E24 */  addiu      $fp, $zero, 0x3
/* 4EFDC 8005E7DC 21A80000 */  addu       $s5, $zero, $zero
/* 4EFE0 8005E7E0 0300A22A */  slti       $v0, $s5, 0x3
.L8005E7E4:
/* 4EFE4 8005E7E4 06004014 */  bnez       $v0, .L8005E800
/* 4EFE8 8005E7E8 2002B5AF */   sw        $s5, 0x220($sp)
/* 4EFEC 8005E7EC FDFFAA26 */  addiu      $t2, $s5, -0x3
/* 4EFF0 8005E7F0 01000B24 */  addiu      $t3, $zero, 0x1
/* 4EFF4 8005E7F4 2002AAAF */  sw         $t2, 0x220($sp)
/* 4EFF8 8005E7F8 017A0108 */  j          .L8005E804
/* 4EFFC 8005E7FC 2402ABAF */   sw        $t3, 0x224($sp)
.L8005E800:
/* 4F000 8005E800 2402A0AF */  sw         $zero, 0x224($sp)
.L8005E804:
/* 4F004 8005E804 2402A48F */  lw         $a0, 0x224($sp)
/* 4F008 8005E808 2002A58F */  lw         $a1, 0x220($sp)
/* 4F00C 8005E80C 2C02A78F */  lw         $a3, 0x22C($sp)
/* 4F010 8005E810 8D79010C */  jal        GetPlaneDist
/* 4F014 8005E814 2130A002 */   addu      $a2, $s5, $zero
/* 4F018 8005E818 21B84000 */  addu       $s7, $v0, $zero
/* 4F01C 8005E81C 01001624 */  addiu      $s6, $zero, 0x1
/* 4F020 8005E820 21980000 */  addu       $s3, $zero, $zero
/* 4F024 8005E824 4600C01B */  blez       $fp, .L8005E940
/* 4F028 8005E828 2802A0AF */   sw        $zero, 0x228($sp)
/* 4F02C 8005E82C 2C02B48F */  lw         $s4, 0x22C($sp)
/* 4F030 8005E830 3002B08F */  lw         $s0, 0x230($sp)
.L8005E834:
/* 4F034 8005E834 2A10DE02 */  slt        $v0, $s6, $fp
/* 4F038 8005E838 02004014 */  bnez       $v0, .L8005E844
/* 4F03C 8005E83C 2130A002 */   addu      $a2, $s5, $zero
/* 4F040 8005E840 21B00000 */  addu       $s6, $zero, $zero
.L8005E844:
/* 4F044 8005E844 00111600 */  sll        $v0, $s6, 4
/* 4F048 8005E848 2402A48F */  lw         $a0, 0x224($sp)
/* 4F04C 8005E84C 2C02A88F */  lw         $t0, 0x22C($sp)
/* 4F050 8005E850 2002A58F */  lw         $a1, 0x220($sp)
/* 4F054 8005E854 21880201 */  addu       $s1, $t0, $v0
/* 4F058 8005E858 8D79010C */  jal        GetPlaneDist
/* 4F05C 8005E85C 21382002 */   addu      $a3, $s1, $zero
/* 4F060 8005E860 1800E01A */  blez       $s7, .L8005E8C4
/* 4F064 8005E864 21904000 */   addu      $s2, $v0, $zero
/* 4F068 8005E868 2300401E */  bgtz       $s2, .L8005E8F8
/* 4F06C 8005E86C 21282002 */   addu      $a1, $s1, $zero
/* 4F070 8005E870 0000898E */  lw         $t1, 0x0($s4)
/* 4F074 8005E874 04008A8E */  lw         $t2, 0x4($s4)
/* 4F078 8005E878 08008B8E */  lw         $t3, 0x8($s4)
/* 4F07C 8005E87C 0C00888E */  lw         $t0, 0xC($s4)
/* 4F080 8005E880 000009AE */  sw         $t1, 0x0($s0)
/* 4F084 8005E884 04000AAE */  sw         $t2, 0x4($s0)
/* 4F088 8005E888 08000BAE */  sw         $t3, 0x8($s0)
/* 4F08C 8005E88C 0C0008AE */  sw         $t0, 0xC($s0)
/* 4F090 8005E890 10001026 */  addiu      $s0, $s0, 0x10
/* 4F094 8005E894 01007326 */  addiu      $s3, $s3, 0x1
/* 4F098 8005E898 21200002 */  addu       $a0, $s0, $zero
/* 4F09C 8005E89C 21308002 */  addu       $a2, $s4, $zero
/* 4F0A0 8005E8A0 2402A98F */  lw         $t1, 0x224($sp)
/* 4F0A4 8005E8A4 2002AA8F */  lw         $t2, 0x220($sp)
/* 4F0A8 8005E8A8 21384002 */  addu       $a3, $s2, $zero
/* 4F0AC 8005E8AC 1000B7AF */  sw         $s7, 0x10($sp)
/* 4F0B0 8005E8B0 1400A9AF */  sw         $t1, 0x14($sp)
/* 4F0B4 8005E8B4 B079010C */  jal        CalcVert
/* 4F0B8 8005E8B8 1800AAAF */   sw        $t2, 0x18($sp)
/* 4F0BC 8005E8BC 477A0108 */  j          .L8005E91C
/* 4F0C0 8005E8C0 10001026 */   addiu     $s0, $s0, 0x10
.L8005E8C4:
/* 4F0C4 8005E8C4 1600401A */  blez       $s2, .L8005E920
/* 4F0C8 8005E8C8 21200002 */   addu      $a0, $s0, $zero
/* 4F0CC 8005E8CC 21288002 */  addu       $a1, $s4, $zero
/* 4F0D0 8005E8D0 21302002 */  addu       $a2, $s1, $zero
/* 4F0D4 8005E8D4 2402AB8F */  lw         $t3, 0x224($sp)
/* 4F0D8 8005E8D8 2002A88F */  lw         $t0, 0x220($sp)
/* 4F0DC 8005E8DC 2138E002 */  addu       $a3, $s7, $zero
/* 4F0E0 8005E8E0 1000B2AF */  sw         $s2, 0x10($sp)
/* 4F0E4 8005E8E4 1400ABAF */  sw         $t3, 0x14($sp)
/* 4F0E8 8005E8E8 B079010C */  jal        CalcVert
/* 4F0EC 8005E8EC 1800A8AF */   sw        $t0, 0x18($sp)
/* 4F0F0 8005E8F0 477A0108 */  j          .L8005E91C
/* 4F0F4 8005E8F4 10001026 */   addiu     $s0, $s0, 0x10
.L8005E8F8:
/* 4F0F8 8005E8F8 0000898E */  lw         $t1, 0x0($s4)
/* 4F0FC 8005E8FC 04008A8E */  lw         $t2, 0x4($s4)
/* 4F100 8005E900 08008B8E */  lw         $t3, 0x8($s4)
/* 4F104 8005E904 0C00888E */  lw         $t0, 0xC($s4)
/* 4F108 8005E908 000009AE */  sw         $t1, 0x0($s0)
/* 4F10C 8005E90C 04000AAE */  sw         $t2, 0x4($s0)
/* 4F110 8005E910 08000BAE */  sw         $t3, 0x8($s0)
/* 4F114 8005E914 0C0008AE */  sw         $t0, 0xC($s0)
/* 4F118 8005E918 10001026 */  addiu      $s0, $s0, 0x10
.L8005E91C:
/* 4F11C 8005E91C 01007326 */  addiu      $s3, $s3, 0x1
.L8005E920:
/* 4F120 8005E920 21B84002 */  addu       $s7, $s2, $zero
/* 4F124 8005E924 10009426 */  addiu      $s4, $s4, 0x10
/* 4F128 8005E928 2802A98F */  lw         $t1, 0x228($sp)
/* 4F12C 8005E92C 0100D626 */  addiu      $s6, $s6, 0x1
/* 4F130 8005E930 01002925 */  addiu      $t1, $t1, 0x1
/* 4F134 8005E934 2A103E01 */  slt        $v0, $t1, $fp
/* 4F138 8005E938 BEFF4014 */  bnez       $v0, .L8005E834
/* 4F13C 8005E93C 2802A9AF */   sw        $t1, 0x228($sp)
.L8005E940:
/* 4F140 8005E940 3002A28F */  lw         $v0, 0x230($sp)
/* 4F144 8005E944 2C02AA8F */  lw         $t2, 0x22C($sp)
/* 4F148 8005E948 21F06002 */  addu       $fp, $s3, $zero
/* 4F14C 8005E94C 2C02A2AF */  sw         $v0, 0x22C($sp)
/* 4F150 8005E950 0300C22B */  slti       $v0, $fp, 0x3
/* 4F154 8005E954 03004010 */  beqz       $v0, .L8005E964
/* 4F158 8005E958 3002AAAF */   sw        $t2, 0x230($sp)
/* 4F15C 8005E95C 707A0108 */  j          .L8005E9C0
/* 4F160 8005E960 2B101E00 */   sltu      $v0, $zero, $fp
.L8005E964:
/* 4F164 8005E964 0100B526 */  addiu      $s5, $s5, 0x1
/* 4F168 8005E968 0500A22A */  slti       $v0, $s5, 0x5
/* 4F16C 8005E96C 9DFF4014 */  bnez       $v0, .L8005E7E4
/* 4F170 8005E970 0300A22A */   slti      $v0, $s5, 0x3
/* 4F174 8005E974 1100C01B */  blez       $fp, .L8005E9BC
/* 4F178 8005E978 21A80000 */   addu      $s5, $zero, $zero
/* 4F17C 8005E97C 2C02B08F */  lw         $s0, 0x22C($sp)
.L8005E980:
/* 4F180 8005E980 6402A58F */  lw         $a1, 0x264($sp)
/* 4F184 8005E984 2A79010C */  jal        AddVertex
/* 4F188 8005E988 21200002 */   addu      $a0, $s0, $zero
/* 4F18C 8005E98C 6802AB8F */  lw         $t3, 0x268($sp)
/* 4F190 8005E990 00000000 */  nop
/* 4F194 8005E994 0000638D */  lw         $v1, 0x0($t3)
/* 4F198 8005E998 00000000 */  nop
/* 4F19C 8005E99C 2A184300 */  slt        $v1, $v0, $v1
/* 4F1A0 8005E9A0 02006010 */  beqz       $v1, .L8005E9AC
/* 4F1A4 8005E9A4 00000000 */   nop
/* 4F1A8 8005E9A8 000062AD */  sw         $v0, 0x0($t3)
.L8005E9AC:
/* 4F1AC 8005E9AC 0100B526 */  addiu      $s5, $s5, 0x1
/* 4F1B0 8005E9B0 2A10BE02 */  slt        $v0, $s5, $fp
/* 4F1B4 8005E9B4 F2FF4014 */  bnez       $v0, .L8005E980
/* 4F1B8 8005E9B8 10001026 */   addiu     $s0, $s0, 0x10
.L8005E9BC:
/* 4F1BC 8005E9BC 01000224 */  addiu      $v0, $zero, 0x1
.L8005E9C0:
/* 4F1C0 8005E9C0 5C02BF8F */  lw         $ra, 0x25C($sp)
/* 4F1C4 8005E9C4 5802BE8F */  lw         $fp, 0x258($sp)
/* 4F1C8 8005E9C8 5402B78F */  lw         $s7, 0x254($sp)
/* 4F1CC 8005E9CC 5002B68F */  lw         $s6, 0x250($sp)
/* 4F1D0 8005E9D0 4C02B58F */  lw         $s5, 0x24C($sp)
/* 4F1D4 8005E9D4 4802B48F */  lw         $s4, 0x248($sp)
/* 4F1D8 8005E9D8 4402B38F */  lw         $s3, 0x244($sp)
/* 4F1DC 8005E9DC 4002B28F */  lw         $s2, 0x240($sp)
/* 4F1E0 8005E9E0 3C02B18F */  lw         $s1, 0x23C($sp)
/* 4F1E4 8005E9E4 3802B08F */  lw         $s0, 0x238($sp)
/* 4F1E8 8005E9E8 0800E003 */  jr         $ra
/* 4F1EC 8005E9EC 6002BD27 */   addiu     $sp, $sp, 0x260
.size AddClippedTri, . - AddClippedTri
