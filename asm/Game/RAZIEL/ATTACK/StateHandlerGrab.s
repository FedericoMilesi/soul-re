.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerGrab
/* 8EEC4 8009E6C4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8EEC8 8009E6C8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8EECC 8009E6CC 21888000 */  addu       $s1, $a0, $zero
/* 8EED0 8009E6D0 2400B3AF */  sw         $s3, 0x24($sp)
/* 8EED4 8009E6D4 2198A000 */  addu       $s3, $a1, $zero
/* 8EED8 8009E6D8 3400B7AF */  sw         $s7, 0x34($sp)
/* 8EEDC 8009E6DC 21B8C000 */  addu       $s7, $a2, $zero
/* 8EEE0 8009E6E0 3800BFAF */  sw         $ra, 0x38($sp)
/* 8EEE4 8009E6E4 3000B6AF */  sw         $s6, 0x30($sp)
/* 8EEE8 8009E6E8 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 8EEEC 8009E6EC 2800B4AF */  sw         $s4, 0x28($sp)
/* 8EEF0 8009E6F0 2000B2AF */  sw         $s2, 0x20($sp)
/* 8EEF4 8009E6F4 A9C9010C */  jal        G2EmulationQueryAnimation
/* 8EEF8 8009E6F8 1800B0AF */   sw        $s0, 0x18($sp)
/* 8EEFC 8009E6FC 21A04000 */  addu       $s4, $v0, $zero
/* 8EF00 8009E700 C0101300 */  sll        $v0, $s3, 3
/* 8EF04 8009E704 21105300 */  addu       $v0, $v0, $s3
/* 8EF08 8009E708 C0100200 */  sll        $v0, $v0, 3
/* 8EF0C 8009E70C 23105300 */  subu       $v0, $v0, $s3
/* 8EF10 8009E710 80100200 */  sll        $v0, $v0, 2
/* 8EF14 8009E714 08004324 */  addiu      $v1, $v0, 0x8
/* 8EF18 8009E718 21B02302 */  addu       $s6, $s1, $v1
/* 8EF1C 8009E71C 21A82202 */  addu       $s5, $s1, $v0
.L8009E720:
/* 8EF20 8009E720 39C3010C */  jal        PeekMessageQueue
/* 8EF24 8009E724 0400C426 */   addiu     $a0, $s6, 0x4
/* 8EF28 8009E728 21904000 */  addu       $s2, $v0, $zero
/* 8EF2C 8009E72C B4014012 */  beqz       $s2, .L8009EE00
/* 8EF30 8009E730 1000023C */   lui       $v0, (0x100015 >> 16)
/* 8EF34 8009E734 0000438E */  lw         $v1, 0x0($s2)
/* 8EF38 8009E738 15004234 */  ori        $v0, $v0, (0x100015 & 0xFFFF)
/* 8EF3C 8009E73C 1F016210 */  beq        $v1, $v0, .L8009EBBC
/* 8EF40 8009E740 2A104300 */   slt       $v0, $v0, $v1
/* 8EF44 8009E744 23004014 */  bnez       $v0, .L8009E7D4
/* 8EF48 8009E748 00000000 */   nop
/* 8EF4C 8009E74C BE006010 */  beqz       $v1, .L8009EA48
/* 8EF50 8009E750 00000000 */   nop
/* 8EF54 8009E754 1000601C */  bgtz       $v1, .L8009E798
/* 8EF58 8009E758 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8EF5C 8009E75C 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 8EF60 8009E760 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8EF64 8009E764 A2016210 */  beq        $v1, $v0, .L8009EDF0
/* 8EF68 8009E768 2A104300 */   slt       $v0, $v0, $v1
/* 8EF6C 8009E76C 05004014 */  bnez       $v0, .L8009E784
/* 8EF70 8009E770 0080023C */   lui       $v0, (0x80000020 >> 16)
/* 8EF74 8009E774 9E016210 */  beq        $v1, $v0, .L8009EDF0
/* 8EF78 8009E778 21202002 */   addu      $a0, $s1, $zero
/* 8EF7C 8009E77C 7A7B0208 */  j          .L8009EDE8
/* 8EF80 8009E780 21286002 */   addu      $a1, $s3, $zero
.L8009E784:
/* 8EF84 8009E784 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8EF88 8009E788 99016210 */  beq        $v1, $v0, .L8009EDF0
/* 8EF8C 8009E78C 21202002 */   addu      $a0, $s1, $zero
/* 8EF90 8009E790 7A7B0208 */  j          .L8009EDE8
/* 8EF94 8009E794 21286002 */   addu      $a1, $s3, $zero
.L8009E798:
/* 8EF98 8009E798 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8EF9C 8009E79C 8C006210 */  beq        $v1, $v0, .L8009E9D0
/* 8EFA0 8009E7A0 2A104300 */   slt       $v0, $v0, $v1
/* 8EFA4 8009E7A4 06004014 */  bnez       $v0, .L8009E7C0
/* 8EFA8 8009E7A8 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8EFAC 8009E7AC 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8EFB0 8009E7B0 2D006210 */  beq        $v1, $v0, .L8009E868
/* 8EFB4 8009E7B4 21202002 */   addu      $a0, $s1, $zero
/* 8EFB8 8009E7B8 7A7B0208 */  j          .L8009EDE8
/* 8EFBC 8009E7BC 21286002 */   addu      $a1, $s3, $zero
.L8009E7C0:
/* 8EFC0 8009E7C0 14004234 */  ori        $v0, $v0, (0x100014 & 0xFFFF)
/* 8EFC4 8009E7C4 2F016210 */  beq        $v1, $v0, .L8009EC84
/* 8EFC8 8009E7C8 21202002 */   addu      $a0, $s1, $zero
/* 8EFCC 8009E7CC 7A7B0208 */  j          .L8009EDE8
/* 8EFD0 8009E7D0 21286002 */   addu      $a1, $s3, $zero
.L8009E7D4:
/* 8EFD4 8009E7D4 0104023C */  lui        $v0, (0x4010080 >> 16)
/* 8EFD8 8009E7D8 80004234 */  ori        $v0, $v0, (0x4010080 & 0xFFFF)
/* 8EFDC 8009E7DC 72016210 */  beq        $v1, $v0, .L8009EDA8
/* 8EFE0 8009E7E0 2A104300 */   slt       $v0, $v0, $v1
/* 8EFE4 8009E7E4 10004014 */  bnez       $v0, .L8009E828
/* 8EFE8 8009E7E8 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 8EFEC 8009E7EC 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 8EFF0 8009E7F0 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8EFF4 8009E7F4 7E016210 */  beq        $v1, $v0, .L8009EDF0
/* 8EFF8 8009E7F8 2A104300 */   slt       $v0, $v0, $v1
/* 8EFFC 8009E7FC 05004014 */  bnez       $v0, .L8009E814
/* 8F000 8009E800 0001023C */   lui       $v0, (0x1000006 >> 16)
/* 8F004 8009E804 42016210 */  beq        $v1, $v0, .L8009ED10
/* 8F008 8009E808 21202002 */   addu      $a0, $s1, $zero
/* 8F00C 8009E80C 7A7B0208 */  j          .L8009EDE8
/* 8F010 8009E810 21286002 */   addu      $a1, $s3, $zero
.L8009E814:
/* 8F014 8009E814 06004234 */  ori        $v0, $v0, (0x1000006 & 0xFFFF)
/* 8F018 8009E818 30016210 */  beq        $v1, $v0, .L8009ECDC
/* 8F01C 8009E81C 21202002 */   addu      $a0, $s1, $zero
/* 8F020 8009E820 7A7B0208 */  j          .L8009EDE8
/* 8F024 8009E824 21286002 */   addu      $a1, $s3, $zero
.L8009E828:
/* 8F028 8009E828 A5006210 */  beq        $v1, $v0, .L8009EAC0
/* 8F02C 8009E82C 2A104300 */   slt       $v0, $v0, $v1
/* 8F030 8009E830 06004014 */  bnez       $v0, .L8009E84C
/* 8F034 8009E834 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 8F038 8009E838 0204023C */  lui        $v0, (0x4020000 >> 16)
/* 8F03C 8009E83C 6C016210 */  beq        $v1, $v0, .L8009EDF0
/* 8F040 8009E840 21202002 */   addu      $a0, $s1, $zero
/* 8F044 8009E844 7A7B0208 */  j          .L8009EDE8
/* 8F048 8009E848 21286002 */   addu      $a1, $s3, $zero
.L8009E84C:
/* 8F04C 8009E84C 67006210 */  beq        $v1, $v0, .L8009E9EC
/* 8F050 8009E850 0020023C */   lui       $v0, (0x20000020 >> 16)
/* 8F054 8009E854 20004234 */  ori        $v0, $v0, (0x20000020 & 0xFFFF)
/* 8F058 8009E858 B5006210 */  beq        $v1, $v0, .L8009EB30
/* 8F05C 8009E85C 21202002 */   addu      $a0, $s1, $zero
/* 8F060 8009E860 7A7B0208 */  j          .L8009EDE8
/* 8F064 8009E864 21286002 */   addu      $a1, $s3, $zero
.L8009E868:
/* 8F068 8009E868 0D006016 */  bnez       $s3, .L8009E8A0
/* 8F06C 8009E86C 0401033C */   lui       $v1, (0x1043009 >> 16)
/* 8F070 8009E870 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8F074 8009E874 00000000 */  nop
/* 8F078 8009E878 1400428C */  lw         $v0, 0x14($v0)
/* 8F07C 8009E87C 09306334 */  ori        $v1, $v1, (0x1043009 & 0xFFFF)
/* 8F080 8009E880 1800428C */  lw         $v0, 0x18($v0)
/* 8F084 8009E884 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 8F088 8009E888 94FA82AF */  sw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8F08C 8009E88C 0000248E */  lw         $a0, 0x0($s1)
/* 8F090 8009E890 03000224 */  addiu      $v0, $zero, 0x3
/* 8F094 8009E894 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 8F098 8009E898 938B020C */  jal        SteerSwitchMode
/* 8F09C 8009E89C 21280000 */   addu      $a1, $zero, $zero
.L8009E8A0:
/* 8F0A0 8009E8A0 0400428E */  lw         $v0, 0x4($s2)
/* 8F0A4 8009E8A4 00000000 */  nop
/* 8F0A8 8009E8A8 31004010 */  beqz       $v0, .L8009E970
/* 8F0AC 8009E8AC 00000000 */   nop
/* 8F0B0 8009E8B0 C89E020C */  jal        razSetPlayerEventHistory
/* 8F0B4 8009E8B4 40000424 */   addiu     $a0, $zero, 0x40
/* 8F0B8 8009E8B8 02000224 */  addiu      $v0, $zero, 0x2
/* 8F0BC 8009E8BC 08006216 */  bne        $s3, $v0, .L8009E8E0
/* 8F0C0 8009E8C0 21202002 */   addu      $a0, $s1, $zero
/* 8F0C4 8009E8C4 21284000 */  addu       $a1, $v0, $zero
/* 8F0C8 8009E8C8 21300000 */  addu       $a2, $zero, $zero
/* 8F0CC 8009E8CC 2138C000 */  addu       $a3, $a2, $zero
/* 8F0D0 8009E8D0 03000224 */  addiu      $v0, $zero, 0x3
/* 8F0D4 8009E8D4 1000A2AF */  sw         $v0, 0x10($sp)
/* 8F0D8 8009E8D8 407A0208 */  j          .L8009E900
/* 8F0DC 8009E8DC 1400B3AF */   sw        $s3, 0x14($sp)
.L8009E8E0:
/* 8F0E0 8009E8E0 21286002 */  addu       $a1, $s3, $zero
/* 8F0E4 8009E8E4 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8F0E8 8009E8E8 21380000 */  addu       $a3, $zero, $zero
/* 8F0EC 8009E8EC 00004690 */  lbu        $a2, 0x0($v0)
/* 8F0F0 8009E8F0 01004390 */  lbu        $v1, 0x1($v0)
/* 8F0F4 8009E8F4 01000224 */  addiu      $v0, $zero, 0x1
/* 8F0F8 8009E8F8 1400A2AF */  sw         $v0, 0x14($sp)
/* 8F0FC 8009E8FC 1000A3AF */  sw         $v1, 0x10($sp)
.L8009E900:
/* 8F100 8009E900 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8F104 8009E904 00000000 */   nop
/* 8F108 8009E908 16006016 */  bnez       $s3, .L8009E964
/* 8F10C 8009E90C 0020023C */   lui       $v0, (0x20000000 >> 16)
/* 8F110 8009E910 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8F114 8009E914 00000000 */  nop
/* 8F118 8009E918 00014230 */  andi       $v0, $v0, 0x100
/* 8F11C 8009E91C 0A004010 */  beqz       $v0, .L8009E948
/* 8F120 8009E920 C8000624 */   addiu     $a2, $zero, 0xC8
/* 8F124 8009E924 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8F128 8009E928 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8F12C 8009E92C 4000458C */  lw         $a1, 0x40($v0)
/* 8F130 8009E930 01006290 */  lbu        $v0, 0x1($v1)
/* 8F134 8009E934 1400A0AF */  sw         $zero, 0x14($sp)
/* 8F138 8009E938 1000A2AF */  sw         $v0, 0x10($sp)
/* 8F13C 8009E93C 0000248E */  lw         $a0, 0x0($s1)
/* 8F140 8009E940 7E94020C */  jal        razAlignYRotMoveInterp
/* 8F144 8009E944 21380000 */   addu      $a3, $zero, $zero
.L8009E948:
/* 8F148 8009E948 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8F14C 8009E94C 00000000 */  nop
/* 8F150 8009E950 04004390 */  lbu        $v1, 0x4($v0)
/* 8F154 8009E954 01004490 */  lbu        $a0, 0x1($v0)
/* 8F158 8009E958 31CC020C */  jal        SetTimer
/* 8F15C 8009E95C 21206400 */   addu      $a0, $v1, $a0
/* 8F160 8009E960 0020023C */  lui        $v0, (0x20000000 >> 16)
.L8009E964:
/* 8F164 8009E964 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8F168 8009E968 717A0208 */  j          .L8009E9C4
/* 8F16C 8009E96C 0B000224 */   addiu     $v0, $zero, 0xB
.L8009E970:
/* 8F170 8009E970 14006016 */  bnez       $s3, .L8009E9C4
/* 8F174 8009E974 0D000224 */   addiu     $v0, $zero, 0xD
/* 8F178 8009E978 21202002 */  addu       $a0, $s1, $zero
/* 8F17C 8009E97C 47000524 */  addiu      $a1, $zero, 0x47
/* 8F180 8009E980 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8F184 8009E984 21300000 */  addu       $a2, $zero, $zero
/* 8F188 8009E988 01004790 */  lbu        $a3, 0x1($v0)
/* 8F18C 8009E98C 01000224 */  addiu      $v0, $zero, 0x1
/* 8F190 8009E990 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 8F194 8009E994 1000A2AF */   sw        $v0, 0x10($sp)
/* 8F198 8009E998 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8F19C 8009E99C 00000000 */  nop
/* 8F1A0 8009E9A0 00014230 */  andi       $v0, $v0, 0x100
/* 8F1A4 8009E9A4 06004010 */  beqz       $v0, .L8009E9C0
/* 8F1A8 8009E9A8 0001053C */   lui       $a1, (0x1000002 >> 16)
/* 8F1AC 8009E9AC 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8F1B0 8009E9B0 0200A534 */  ori        $a1, $a1, (0x1000002 & 0xFFFF)
/* 8F1B4 8009E9B4 4000448C */  lw         $a0, 0x40($v0)
/* 8F1B8 8009E9B8 A1D1000C */  jal        INSTANCE_Post
/* 8F1BC 8009E9BC 21300000 */   addu      $a2, $zero, $zero
.L8009E9C0:
/* 8F1C0 8009E9C0 0D000224 */  addiu      $v0, $zero, 0xD
.L8009E9C4:
/* 8F1C4 8009E9C4 2001A2AE */  sw         $v0, 0x120($s5)
/* 8F1C8 8009E9C8 7C7B0208 */  j          .L8009EDF0
/* 8F1CC 8009E9CC 1C01A0AE */   sw        $zero, 0x11C($s5)
.L8009E9D0:
/* 8F1D0 8009E9D0 2197020C */  jal        razGetHeldItem
/* 8F1D4 8009E9D4 00000000 */   nop
/* 8F1D8 8009E9D8 21804000 */  addu       $s0, $v0, $zero
/* 8F1DC 8009E9DC 04010012 */  beqz       $s0, .L8009EDF0
/* 8F1E0 8009E9E0 00000000 */   nop
/* 8F1E4 8009E9E4 0D7B0208 */  j          .L8009EC34
/* 8F1E8 8009E9E8 00000000 */   nop
.L8009E9EC:
/* 8F1EC 8009E9EC 00016016 */  bnez       $s3, .L8009EDF0
/* 8F1F0 8009E9F0 00000000 */   nop
/* 8F1F4 8009E9F4 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8F1F8 8009E9F8 00000000 */  nop
/* 8F1FC 8009E9FC 00006290 */  lbu        $v0, 0x0($v1)
/* 8F200 8009EA00 00000000 */  nop
/* 8F204 8009EA04 FA008212 */  beq        $s4, $v0, .L8009EDF0
/* 8F208 8009EA08 47000224 */   addiu     $v0, $zero, 0x47
/* 8F20C 8009EA0C F8008212 */  beq        $s4, $v0, .L8009EDF0
/* 8F210 8009EA10 00000000 */   nop
/* 8F214 8009EA14 06006290 */  lbu        $v0, 0x6($v1)
/* 8F218 8009EA18 00000000 */  nop
/* 8F21C 8009EA1C F4008212 */  beq        $s4, $v0, .L8009EDF0
/* 8F220 8009EA20 00000000 */   nop
/* 8F224 8009EA24 0000248E */  lw         $a0, 0x0($s1)
/* 8F228 8009EA28 938B020C */  jal        SteerSwitchMode
/* 8F22C 8009EA2C 12000524 */   addiu     $a1, $zero, 0x12
/* 8F230 8009EA30 37000224 */  addiu      $v0, $zero, 0x37
/* 8F234 8009EA34 EE008216 */  bne        $s4, $v0, .L8009EDF0
/* 8F238 8009EA38 21202002 */   addu      $a0, $s1, $zero
/* 8F23C 8009EA3C 21280000 */  addu       $a1, $zero, $zero
/* 8F240 8009EA40 A87A0208 */  j          .L8009EAA0
/* 8F244 8009EA44 01000624 */   addiu     $a2, $zero, 0x1
.L8009EA48:
/* 8F248 8009EA48 E9006016 */  bnez       $s3, .L8009EDF0
/* 8F24C 8009EA4C 00000000 */   nop
/* 8F250 8009EA50 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8F254 8009EA54 00000000 */  nop
/* 8F258 8009EA58 00006290 */  lbu        $v0, 0x0($v1)
/* 8F25C 8009EA5C 00000000 */  nop
/* 8F260 8009EA60 E3008212 */  beq        $s4, $v0, .L8009EDF0
/* 8F264 8009EA64 47000224 */   addiu     $v0, $zero, 0x47
/* 8F268 8009EA68 E1008212 */  beq        $s4, $v0, .L8009EDF0
/* 8F26C 8009EA6C 00000000 */   nop
/* 8F270 8009EA70 06006290 */  lbu        $v0, 0x6($v1)
/* 8F274 8009EA74 00000000 */  nop
/* 8F278 8009EA78 DD008212 */  beq        $s4, $v0, .L8009EDF0
/* 8F27C 8009EA7C 00000000 */   nop
/* 8F280 8009EA80 0000248E */  lw         $a0, 0x0($s1)
/* 8F284 8009EA84 938B020C */  jal        SteerSwitchMode
/* 8F288 8009EA88 21280000 */   addu      $a1, $zero, $zero
/* 8F28C 8009EA8C 01000224 */  addiu      $v0, $zero, 0x1
/* 8F290 8009EA90 D7008216 */  bne        $s4, $v0, .L8009EDF0
/* 8F294 8009EA94 21202002 */   addu      $a0, $s1, $zero
/* 8F298 8009EA98 21280000 */  addu       $a1, $zero, $zero
/* 8F29C 8009EA9C 37000624 */  addiu      $a2, $zero, 0x37
.L8009EAA0:
/* 8F2A0 8009EAA0 2138A000 */  addu       $a3, $a1, $zero
/* 8F2A4 8009EAA4 03000224 */  addiu      $v0, $zero, 0x3
/* 8F2A8 8009EAA8 1000A2AF */  sw         $v0, 0x10($sp)
/* 8F2AC 8009EAAC 02000224 */  addiu      $v0, $zero, 0x2
/* 8F2B0 8009EAB0 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8F2B4 8009EAB4 1400A2AF */   sw        $v0, 0x14($sp)
/* 8F2B8 8009EAB8 7C7B0208 */  j          .L8009EDF0
/* 8F2BC 8009EABC 00000000 */   nop
.L8009EAC0:
/* 8F2C0 8009EAC0 CB006016 */  bnez       $s3, .L8009EDF0
/* 8F2C4 8009EAC4 0B000224 */   addiu     $v0, $zero, 0xB
/* 8F2C8 8009EAC8 2001238E */  lw         $v1, 0x120($s1)
/* 8F2CC 8009EACC 00000000 */  nop
/* 8F2D0 8009EAD0 0D006214 */  bne        $v1, $v0, .L8009EB08
/* 8F2D4 8009EAD4 21200000 */   addu      $a0, $zero, $zero
/* 8F2D8 8009EAD8 21202002 */  addu       $a0, $s1, $zero
/* 8F2DC 8009EADC 21280000 */  addu       $a1, $zero, $zero
/* 8F2E0 8009EAE0 37000624 */  addiu      $a2, $zero, 0x37
/* 8F2E4 8009EAE4 2138A000 */  addu       $a3, $a1, $zero
/* 8F2E8 8009EAE8 03000224 */  addiu      $v0, $zero, 0x3
/* 8F2EC 8009EAEC 1000A2AF */  sw         $v0, 0x10($sp)
/* 8F2F0 8009EAF0 02000224 */  addiu      $v0, $zero, 0x2
/* 8F2F4 8009EAF4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8F2F8 8009EAF8 1400A2AF */   sw        $v0, 0x14($sp)
/* 8F2FC 8009EAFC 0E000224 */  addiu      $v0, $zero, 0xE
/* 8F300 8009EB00 7C7B0208 */  j          .L8009EDF0
/* 8F304 8009EB04 200122AE */   sw        $v0, 0x120($s1)
.L8009EB08:
/* 8F308 8009EB08 21288000 */  addu       $a1, $a0, $zero
/* 8F30C 8009EB0C 4FC6010C */  jal        SetControlInitIdleData
/* 8F310 8009EB10 03000624 */   addiu     $a2, $zero, 0x3
/* 8F314 8009EB14 21202002 */  addu       $a0, $s1, $zero
/* 8F318 8009EB18 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 8F31C 8009EB1C E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 8F320 8009EB20 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8F324 8009EB24 21304000 */   addu      $a2, $v0, $zero
/* 8F328 8009EB28 7C7B0208 */  j          .L8009EDF0
/* 8F32C 8009EB2C 00000000 */   nop
.L8009EB30:
/* 8F330 8009EB30 AF006016 */  bnez       $s3, .L8009EDF0
/* 8F334 8009EB34 00000000 */   nop
/* 8F338 8009EB38 1C01228E */  lw         $v0, 0x11C($s1)
/* 8F33C 8009EB3C 00000000 */  nop
/* 8F340 8009EB40 17004010 */  beqz       $v0, .L8009EBA0
/* 8F344 8009EB44 0C001024 */   addiu     $s0, $zero, 0xC
/* 8F348 8009EB48 2001228E */  lw         $v0, 0x120($s1)
/* 8F34C 8009EB4C 00000000 */  nop
/* 8F350 8009EB50 A7005010 */  beq        $v0, $s0, .L8009EDF0
/* 8F354 8009EB54 21202002 */   addu      $a0, $s1, $zero
/* 8F358 8009EB58 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8F35C 8009EB5C 21300000 */  addu       $a2, $zero, $zero
/* 8F360 8009EB60 06004590 */  lbu        $a1, 0x6($v0)
/* 8F364 8009EB64 07004790 */  lbu        $a3, 0x7($v0)
/* 8F368 8009EB68 01000224 */  addiu      $v0, $zero, 0x1
/* 8F36C 8009EB6C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 8F370 8009EB70 1000A2AF */   sw        $v0, 0x10($sp)
/* 8F374 8009EB74 36C3010C */  jal        PurgeMessageQueue
/* 8F378 8009EB78 21203002 */   addu      $a0, $s1, $s0
/* 8F37C 8009EB7C 94FA838F */  lw         $v1, %gp_rel(Raziel + 0x464)($gp)
/* 8F380 8009EB80 0200023C */  lui        $v0, (0x20000 >> 16)
/* 8F384 8009EB84 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8F388 8009EB88 08006290 */  lbu        $v0, 0x8($v1)
/* 8F38C 8009EB8C 07006490 */  lbu        $a0, 0x7($v1)
/* 8F390 8009EB90 31CC020C */  jal        SetTimer
/* 8F394 8009EB94 21204400 */   addu      $a0, $v0, $a0
/* 8F398 8009EB98 7C7B0208 */  j          .L8009EDF0
/* 8F39C 8009EB9C 200130AE */   sw        $s0, 0x120($s1)
.L8009EBA0:
/* 8F3A0 8009EBA0 94002426 */  addiu      $a0, $s1, 0x94
/* 8F3A4 8009EBA4 0020053C */  lui        $a1, (0x20000020 >> 16)
/* 8F3A8 8009EBA8 2000A534 */  ori        $a1, $a1, (0x20000020 & 0xFFFF)
/* 8F3AC 8009EBAC 4EC3010C */  jal        EnMessageQueueData
/* 8F3B0 8009EBB0 21300000 */   addu      $a2, $zero, $zero
/* 8F3B4 8009EBB4 7C7B0208 */  j          .L8009EDF0
/* 8F3B8 8009EBB8 00000000 */   nop
.L8009EBBC:
/* 8F3BC 8009EBBC 8C006016 */  bnez       $s3, .L8009EDF0
/* 8F3C0 8009EBC0 00000000 */   nop
/* 8F3C4 8009EBC4 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8F3C8 8009EBC8 00000000 */  nop
/* 8F3CC 8009EBCC 00004290 */  lbu        $v0, 0x0($v0)
/* 8F3D0 8009EBD0 00000000 */  nop
/* 8F3D4 8009EBD4 12008216 */  bne        $s4, $v0, .L8009EC20
/* 8F3D8 8009EBD8 00000000 */   nop
/* 8F3DC 8009EBDC 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8F3E0 8009EBE0 00000000 */  nop
/* 8F3E4 8009EBE4 00014230 */  andi       $v0, $v0, 0x100
/* 8F3E8 8009EBE8 81004010 */  beqz       $v0, .L8009EDF0
/* 8F3EC 8009EBEC 0001053C */   lui       $a1, (0x1000002 >> 16)
/* 8F3F0 8009EBF0 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 8F3F4 8009EBF4 0000268E */  lw         $a2, 0x0($s1)
/* 8F3F8 8009EBF8 4000448C */  lw         $a0, 0x40($v0)
/* 8F3FC 8009EBFC A1D1000C */  jal        INSTANCE_Post
/* 8F400 8009EC00 0200A534 */   ori       $a1, $a1, (0x1000002 & 0xFFFF)
/* 8F404 8009EC04 6397020C */  jal        razReaverOff
/* 8F408 8009EC08 00000000 */   nop
/* 8F40C 8009EC0C 01000224 */  addiu      $v0, $zero, 0x1
/* 8F410 8009EC10 1C0122AE */  sw         $v0, 0x11C($s1)
/* 8F414 8009EC14 380222AE */  sw         $v0, 0x238($s1)
/* 8F418 8009EC18 7C7B0208 */  j          .L8009EDF0
/* 8F41C 8009EC1C 540322AE */   sw        $v0, 0x354($s1)
.L8009EC20:
/* 8F420 8009EC20 2197020C */  jal        razGetHeldItem
/* 8F424 8009EC24 00000000 */   nop
/* 8F428 8009EC28 21804000 */  addu       $s0, $v0, $zero
/* 8F42C 8009EC2C 11000012 */  beqz       $s0, .L8009EC74
/* 8F430 8009EC30 00000000 */   nop
.L8009EC34:
/* 8F434 8009EC34 0000248E */  lw         $a0, 0x0($s1)
/* 8F438 8009EC38 64000624 */  addiu      $a2, $zero, 0x64
/* 8F43C 8009EC3C B0C3010C */  jal        SetMonsterThrownData
/* 8F440 8009EC40 74008524 */   addiu     $a1, $a0, 0x74
/* 8F444 8009EC44 21200002 */  addu       $a0, $s0, $zero
/* 8F448 8009EC48 0001053C */  lui        $a1, (0x1000003 >> 16)
/* 8F44C 8009EC4C 0300A534 */  ori        $a1, $a1, (0x1000003 & 0xFFFF)
/* 8F450 8009EC50 A1D1000C */  jal        INSTANCE_Post
/* 8F454 8009EC54 21304000 */   addu      $a2, $v0, $zero
/* 8F458 8009EC58 2197020C */  jal        razGetHeldItem
/* 8F45C 8009EC5C 00000000 */   nop
/* 8F460 8009EC60 21804000 */  addu       $s0, $v0, $zero
/* 8F464 8009EC64 03000012 */  beqz       $s0, .L8009EC74
/* 8F468 8009EC68 00000000 */   nop
/* 8F46C 8009EC6C 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 8F470 8009EC70 21200002 */   addu      $a0, $s0, $zero
.L8009EC74:
/* 8F474 8009EC74 8597020C */  jal        razReaverOn
/* 8F478 8009EC78 00000000 */   nop
/* 8F47C 8009EC7C 7C7B0208 */  j          .L8009EDF0
/* 8F480 8009EC80 00000000 */   nop
.L8009EC84:
/* 8F484 8009EC84 15006016 */  bnez       $s3, .L8009ECDC
/* 8F488 8009EC88 00000000 */   nop
/* 8F48C 8009EC8C 2197020C */  jal        razGetHeldItem
/* 8F490 8009EC90 00000000 */   nop
/* 8F494 8009EC94 21804000 */  addu       $s0, $v0, $zero
/* 8F498 8009EC98 10000012 */  beqz       $s0, .L8009ECDC
/* 8F49C 8009EC9C 0A000624 */   addiu     $a2, $zero, 0xA
/* 8F4A0 8009ECA0 0000248E */  lw         $a0, 0x0($s1)
/* 8F4A4 8009ECA4 B0C3010C */  jal        SetMonsterThrownData
/* 8F4A8 8009ECA8 74008524 */   addiu     $a1, $a0, 0x74
/* 8F4AC 8009ECAC 21200002 */  addu       $a0, $s0, $zero
/* 8F4B0 8009ECB0 0001053C */  lui        $a1, (0x1000003 >> 16)
/* 8F4B4 8009ECB4 0300A534 */  ori        $a1, $a1, (0x1000003 & 0xFFFF)
/* 8F4B8 8009ECB8 A1D1000C */  jal        INSTANCE_Post
/* 8F4BC 8009ECBC 21304000 */   addu      $a2, $v0, $zero
/* 8F4C0 8009ECC0 2197020C */  jal        razGetHeldItem
/* 8F4C4 8009ECC4 00000000 */   nop
/* 8F4C8 8009ECC8 21804000 */  addu       $s0, $v0, $zero
/* 8F4CC 8009ECCC 03000012 */  beqz       $s0, .L8009ECDC
/* 8F4D0 8009ECD0 00000000 */   nop
/* 8F4D4 8009ECD4 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 8F4D8 8009ECD8 21200002 */   addu      $a0, $s0, $zero
.L8009ECDC:
/* 8F4DC 8009ECDC 94FA828F */  lw         $v0, %gp_rel(Raziel + 0x464)($gp)
/* 8F4E0 8009ECE0 21200000 */  addu       $a0, $zero, $zero
/* 8F4E4 8009ECE4 09004690 */  lbu        $a2, 0x9($v0)
/* 8F4E8 8009ECE8 4FC6010C */  jal        SetControlInitIdleData
/* 8F4EC 8009ECEC 21288000 */   addu      $a1, $a0, $zero
/* 8F4F0 8009ECF0 21202002 */  addu       $a0, $s1, $zero
/* 8F4F4 8009ECF4 21286002 */  addu       $a1, $s3, $zero
/* 8F4F8 8009ECF8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 8F4FC 8009ECFC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 8F500 8009ED00 C1CA010C */  jal        StateSwitchStateData
/* 8F504 8009ED04 21384000 */   addu      $a3, $v0, $zero
/* 8F508 8009ED08 7C7B0208 */  j          .L8009EDF0
/* 8F50C 8009ED0C 00000000 */   nop
.L8009ED10:
/* 8F510 8009ED10 37006016 */  bnez       $s3, .L8009EDF0
/* 8F514 8009ED14 00000000 */   nop
/* 8F518 8009ED18 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8F51C 8009ED1C 00000000 */  nop
/* 8F520 8009ED20 00404230 */  andi       $v0, $v0, 0x4000
/* 8F524 8009ED24 32004014 */  bnez       $v0, .L8009EDF0
/* 8F528 8009ED28 00000000 */   nop
/* 8F52C 8009ED2C 34FA828F */  lw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* 8F530 8009ED30 00000000 */  nop
/* 8F534 8009ED34 2E004014 */  bnez       $v0, .L8009EDF0
/* 8F538 8009ED38 00000000 */   nop
/* 8F53C 8009ED3C 2197020C */  jal        razGetHeldItem
/* 8F540 8009ED40 00000000 */   nop
/* 8F544 8009ED44 21804000 */  addu       $s0, $v0, $zero
/* 8F548 8009ED48 09000012 */  beqz       $s0, .L8009ED70
/* 8F54C 8009ED4C 0A000624 */   addiu     $a2, $zero, 0xA
/* 8F550 8009ED50 0000248E */  lw         $a0, 0x0($s1)
/* 8F554 8009ED54 B0C3010C */  jal        SetMonsterThrownData
/* 8F558 8009ED58 74008524 */   addiu     $a1, $a0, 0x74
/* 8F55C 8009ED5C 21200002 */  addu       $a0, $s0, $zero
/* 8F560 8009ED60 0001053C */  lui        $a1, (0x1000003 >> 16)
/* 8F564 8009ED64 0300A534 */  ori        $a1, $a1, (0x1000003 & 0xFFFF)
/* 8F568 8009ED68 A1D1000C */  jal        INSTANCE_Post
/* 8F56C 8009ED6C 21304000 */   addu      $a2, $v0, $zero
.L8009ED70:
/* 8F570 8009ED70 2197020C */  jal        razGetHeldItem
/* 8F574 8009ED74 00000000 */   nop
/* 8F578 8009ED78 21804000 */  addu       $s0, $v0, $zero
/* 8F57C 8009ED7C 04000012 */  beqz       $s0, .L8009ED90
/* 8F580 8009ED80 21202002 */   addu      $a0, $s1, $zero
/* 8F584 8009ED84 76D5000C */  jal        INSTANCE_UnlinkFromParent
/* 8F588 8009ED88 21200002 */   addu      $a0, $s0, $zero
/* 8F58C 8009ED8C 21202002 */  addu       $a0, $s1, $zero
.L8009ED90:
/* 8F590 8009ED90 0400468E */  lw         $a2, 0x4($s2)
/* 8F594 8009ED94 0A80053C */  lui        $a1, %hi(StateHandlerHitReaction)
/* 8F598 8009ED98 F4CA010C */  jal        StateSwitchStateCharacterData
/* 8F59C 8009ED9C 68D5A524 */   addiu     $a1, $a1, %lo(StateHandlerHitReaction)
/* 8F5A0 8009EDA0 7C7B0208 */  j          .L8009EDF0
/* 8F5A4 8009EDA4 00000000 */   nop
.L8009EDA8:
/* 8F5A8 8009EDA8 0E006016 */  bnez       $s3, .L8009EDE4
/* 8F5AC 8009EDAC 21202002 */   addu      $a0, $s1, $zero
/* 8F5B0 8009EDB0 0400428E */  lw         $v0, 0x4($s2)
/* 8F5B4 8009EDB4 00000000 */  nop
/* 8F5B8 8009EDB8 06004010 */  beqz       $v0, .L8009EDD4
/* 8F5BC 8009EDBC 00000000 */   nop
/* 8F5C0 8009EDC0 0000248E */  lw         $a0, 0x0($s1)
/* 8F5C4 8009EDC4 FD98020C */  jal        razResetPauseTranslation
/* 8F5C8 8009EDC8 00000000 */   nop
/* 8F5CC 8009EDCC 797B0208 */  j          .L8009EDE4
/* 8F5D0 8009EDD0 21202002 */   addu      $a0, $s1, $zero
.L8009EDD4:
/* 8F5D4 8009EDD4 0000248E */  lw         $a0, 0x0($s1)
/* 8F5D8 8009EDD8 E098020C */  jal        razSetPauseTranslation
/* 8F5DC 8009EDDC 00000000 */   nop
/* 8F5E0 8009EDE0 21202002 */  addu       $a0, $s1, $zero
.L8009EDE4:
/* 8F5E4 8009EDE4 21286002 */  addu       $a1, $s3, $zero
.L8009EDE8:
/* 8F5E8 8009EDE8 B9BF020C */  jal        DefaultStateHandler
/* 8F5EC 8009EDEC 2130E002 */   addu      $a2, $s7, $zero
.L8009EDF0:
/* 8F5F0 8009EDF0 27C3010C */  jal        DeMessageQueue
/* 8F5F4 8009EDF4 0400C426 */   addiu     $a0, $s6, 0x4
/* 8F5F8 8009EDF8 C8790208 */  j          .L8009E720
/* 8F5FC 8009EDFC 00000000 */   nop
.L8009EE00:
/* 8F600 8009EE00 3800BF8F */  lw         $ra, 0x38($sp)
/* 8F604 8009EE04 3400B78F */  lw         $s7, 0x34($sp)
/* 8F608 8009EE08 3000B68F */  lw         $s6, 0x30($sp)
/* 8F60C 8009EE0C 2C00B58F */  lw         $s5, 0x2C($sp)
/* 8F610 8009EE10 2800B48F */  lw         $s4, 0x28($sp)
/* 8F614 8009EE14 2400B38F */  lw         $s3, 0x24($sp)
/* 8F618 8009EE18 2000B28F */  lw         $s2, 0x20($sp)
/* 8F61C 8009EE1C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8F620 8009EE20 1800B08F */  lw         $s0, 0x18($sp)
/* 8F624 8009EE24 0800E003 */  jr         $ra
/* 8F628 8009EE28 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerGrab, . - StateHandlerGrab
