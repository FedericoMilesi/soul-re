.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerSwimCoil
/* 8F738 8009EF38 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8F73C 8009EF3C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8F740 8009EF40 21888000 */  addu       $s1, $a0, $zero
/* 8F744 8009EF44 2000B2AF */  sw         $s2, 0x20($sp)
/* 8F748 8009EF48 2190A000 */  addu       $s2, $a1, $zero
/* 8F74C 8009EF4C 3400B7AF */  sw         $s7, 0x34($sp)
/* 8F750 8009EF50 21B8C000 */  addu       $s7, $a2, $zero
/* 8F754 8009EF54 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 8F758 8009EF58 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8F75C 8009EF5C FFFB0324 */  addiu      $v1, $zero, -0x401
/* 8F760 8009EF60 3800BFAF */  sw         $ra, 0x38($sp)
/* 8F764 8009EF64 3000B6AF */  sw         $s6, 0x30($sp)
/* 8F768 8009EF68 2800B4AF */  sw         $s4, 0x28($sp)
/* 8F76C 8009EF6C 2400B3AF */  sw         $s3, 0x24($sp)
/* 8F770 8009EF70 1800B0AF */  sw         $s0, 0x18($sp)
/* 8F774 8009EF74 24104300 */  and        $v0, $v0, $v1
/* 8F778 8009EF78 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8F77C 8009EF7C C0101200 */  sll        $v0, $s2, 3
/* 8F780 8009EF80 21105200 */  addu       $v0, $v0, $s2
/* 8F784 8009EF84 C0100200 */  sll        $v0, $v0, 3
/* 8F788 8009EF88 23105200 */  subu       $v0, $v0, $s2
/* 8F78C 8009EF8C 80100200 */  sll        $v0, $v0, 2
/* 8F790 8009EF90 21102202 */  addu       $v0, $s1, $v0
/* 8F794 8009EF94 1C01568C */  lw         $s6, 0x11C($v0)
/* 8F798 8009EF98 23004016 */  bnez       $s2, .L8009F028
/* 8F79C 8009EF9C 01001524 */   addiu     $s5, $zero, 0x1
/* 8F7A0 8009EFA0 78FB828F */  lw         $v0, %gp_rel(Raziel + 0x548)($gp)
/* 8F7A4 8009EFA4 00000000 */  nop
/* 8F7A8 8009EFA8 04004010 */  beqz       $v0, .L8009EFBC
/* 8F7AC 8009EFAC 03000424 */   addiu     $a0, $zero, 0x3
/* 8F7B0 8009EFB0 21288000 */  addu       $a1, $a0, $zero
/* 8F7B4 8009EFB4 8B9D020C */  jal        razLaunchBubbles
/* 8F7B8 8009EFB8 2130A002 */   addu      $a2, $s5, $zero
.L8009EFBC:
/* 8F7BC 8009EFBC 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 8F7C0 8009EFC0 00000000 */  nop
/* 8F7C4 8009EFC4 02004230 */  andi       $v0, $v0, 0x2
/* 8F7C8 8009EFC8 04004010 */  beqz       $v0, .L8009EFDC
/* 8F7CC 8009EFCC 03000424 */   addiu     $a0, $zero, 0x3
/* 8F7D0 8009EFD0 06000524 */  addiu      $a1, $zero, 0x6
/* 8F7D4 8009EFD4 8B9D020C */  jal        razLaunchBubbles
/* 8F7D8 8009EFD8 01000624 */   addiu     $a2, $zero, 0x1
.L8009EFDC:
/* 8F7DC 8009EFDC 0000238E */  lw         $v1, 0x0($s1)
/* 8F7E0 8009EFE0 00000000 */  nop
/* 8F7E4 8009EFE4 2801628C */  lw         $v0, 0x128($v1)
/* 8F7E8 8009EFE8 00000000 */  nop
/* 8F7EC 8009EFEC 0F004010 */  beqz       $v0, .L8009F02C
/* 8F7F0 8009EFF0 C0101200 */   sll       $v0, $s2, 3
/* 8F7F4 8009EFF4 4000648C */  lw         $a0, 0x40($v1)
/* 8F7F8 8009EFF8 44016384 */  lh         $v1, 0x144($v1)
/* 8F7FC 8009EFFC 1C01828C */  lw         $v0, 0x11C($a0)
/* 8F800 8009F000 00000000 */  nop
/* 8F804 8009F004 2A106200 */  slt        $v0, $v1, $v0
/* 8F808 8009F008 06004014 */  bnez       $v0, .L8009F024
/* 8F80C 8009F00C 06000224 */   addiu     $v0, $zero, 0x6
/* 8F810 8009F010 9C01828C */  lw         $v0, 0x19C($a0)
/* 8F814 8009F014 00000000 */  nop
/* 8F818 8009F018 2A106200 */  slt        $v0, $v1, $v0
/* 8F81C 8009F01C 02004010 */  beqz       $v0, .L8009F028
/* 8F820 8009F020 06000224 */   addiu     $v0, $zero, 0x6
.L8009F024:
/* 8F824 8009F024 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
.L8009F028:
/* 8F828 8009F028 C0101200 */  sll        $v0, $s2, 3
.L8009F02C:
/* 8F82C 8009F02C 21105200 */  addu       $v0, $v0, $s2
/* 8F830 8009F030 C0100200 */  sll        $v0, $v0, 3
/* 8F834 8009F034 23105200 */  subu       $v0, $v0, $s2
/* 8F838 8009F038 80100200 */  sll        $v0, $v0, 2
/* 8F83C 8009F03C 08004324 */  addiu      $v1, $v0, 0x8
/* 8F840 8009F040 21982302 */  addu       $s3, $s1, $v1
/* 8F844 8009F044 21A02202 */  addu       $s4, $s1, $v0
.L8009F048:
/* 8F848 8009F048 39C3010C */  jal        PeekMessageQueue
/* 8F84C 8009F04C 04006426 */   addiu     $a0, $s3, 0x4
/* 8F850 8009F050 21804000 */  addu       $s0, $v0, $zero
/* 8F854 8009F054 7A010012 */  beqz       $s0, .L8009F640
/* 8F858 8009F058 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 8F85C 8009F05C 0000038E */  lw         $v1, 0x0($s0)
/* 8F860 8009F060 00000000 */  nop
/* 8F864 8009F064 52016210 */  beq        $v1, $v0, .L8009F5B0
/* 8F868 8009F068 2A104300 */   slt       $v0, $v0, $v1
/* 8F86C 8009F06C 29004014 */  bnez       $v0, .L8009F114
/* 8F870 8009F070 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 8F874 8009F074 1000023C */  lui        $v0, (0x100000 >> 16)
/* 8F878 8009F078 D8006210 */  beq        $v1, $v0, .L8009F3DC
/* 8F87C 8009F07C 2A104300 */   slt       $v0, $v0, $v1
/* 8F880 8009F080 0F004014 */  bnez       $v0, .L8009F0C0
/* 8F884 8009F084 1000023C */   lui       $v0, (0x100009 >> 16)
/* 8F888 8009F088 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 8F88C 8009F08C 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 8F890 8009F090 B5006210 */  beq        $v1, $v0, .L8009F368
/* 8F894 8009F094 2A106200 */   slt       $v0, $v1, $v0
/* 8F898 8009F098 65014014 */  bnez       $v0, .L8009F630
/* 8F89C 8009F09C 0080023C */   lui       $v0, (0x80000008 >> 16)
/* 8F8A0 8009F0A0 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8F8A4 8009F0A4 62016210 */  beq        $v1, $v0, .L8009F630
/* 8F8A8 8009F0A8 0080023C */   lui       $v0, (0x80000010 >> 16)
/* 8F8AC 8009F0AC 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 8F8B0 8009F0B0 5F016210 */  beq        $v1, $v0, .L8009F630
/* 8F8B4 8009F0B4 21202002 */   addu      $a0, $s1, $zero
/* 8F8B8 8009F0B8 8A7D0208 */  j          .L8009F628
/* 8F8BC 8009F0BC 21284002 */   addu      $a1, $s2, $zero
.L8009F0C0:
/* 8F8C0 8009F0C0 09004234 */  ori        $v0, $v0, (0x100009 & 0xFFFF)
/* 8F8C4 8009F0C4 5A016210 */  beq        $v1, $v0, .L8009F630
/* 8F8C8 8009F0C8 2A104300 */   slt       $v0, $v0, $v1
/* 8F8CC 8009F0CC 09004014 */  bnez       $v0, .L8009F0F4
/* 8F8D0 8009F0D0 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8F8D4 8009F0D4 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8F8D8 8009F0D8 3A006210 */  beq        $v1, $v0, .L8009F1C4
/* 8F8DC 8009F0DC 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8F8E0 8009F0E0 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8F8E4 8009F0E4 5D006210 */  beq        $v1, $v0, .L8009F25C
/* 8F8E8 8009F0E8 21202002 */   addu      $a0, $s1, $zero
/* 8F8EC 8009F0EC 8A7D0208 */  j          .L8009F628
/* 8F8F0 8009F0F0 21284002 */   addu      $a1, $s2, $zero
.L8009F0F4:
/* 8F8F4 8009F0F4 11004234 */  ori        $v0, $v0, (0x100011 & 0xFFFF)
/* 8F8F8 8009F0F8 5F006210 */  beq        $v1, $v0, .L8009F278
/* 8F8FC 8009F0FC 1000023C */   lui       $v0, (0x100014 >> 16)
/* 8F900 8009F100 14004234 */  ori        $v0, $v0, (0x100014 & 0xFFFF)
/* 8F904 8009F104 36016210 */  beq        $v1, $v0, .L8009F5E0
/* 8F908 8009F108 21202002 */   addu      $a0, $s1, $zero
/* 8F90C 8009F10C 8A7D0208 */  j          .L8009F628
/* 8F910 8009F110 21284002 */   addu      $a1, $s2, $zero
.L8009F114:
/* 8F914 8009F114 E0006210 */  beq        $v1, $v0, .L8009F498
/* 8F918 8009F118 2A104300 */   slt       $v0, $v0, $v1
/* 8F91C 8009F11C 15004014 */  bnez       $v0, .L8009F174
/* 8F920 8009F120 0008023C */   lui       $v0, (0x8000004 >> 16)
/* 8F924 8009F124 0004023C */  lui        $v0, (0x4000001 >> 16)
/* 8F928 8009F128 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 8F92C 8009F12C 40016210 */  beq        $v1, $v0, .L8009F630
/* 8F930 8009F130 2A104300 */   slt       $v0, $v0, $v1
/* 8F934 8009F134 07004014 */  bnez       $v0, .L8009F154
/* 8F938 8009F138 0004023C */   lui       $v0, (0x4000004 >> 16)
/* 8F93C 8009F13C 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 8F940 8009F140 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8F944 8009F144 3A016210 */  beq        $v1, $v0, .L8009F630
/* 8F948 8009F148 21202002 */   addu      $a0, $s1, $zero
/* 8F94C 8009F14C 8A7D0208 */  j          .L8009F628
/* 8F950 8009F150 21284002 */   addu      $a1, $s2, $zero
.L8009F154:
/* 8F954 8009F154 04004234 */  ori        $v0, $v0, (0x4000004 & 0xFFFF)
/* 8F958 8009F158 35016210 */  beq        $v1, $v0, .L8009F630
/* 8F95C 8009F15C 0104023C */   lui       $v0, (0x4010200 >> 16)
/* 8F960 8009F160 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* 8F964 8009F164 32016210 */  beq        $v1, $v0, .L8009F630
/* 8F968 8009F168 21202002 */   addu      $a0, $s1, $zero
/* 8F96C 8009F16C 8A7D0208 */  j          .L8009F628
/* 8F970 8009F170 21284002 */   addu      $a1, $s2, $zero
.L8009F174:
/* 8F974 8009F174 04004234 */  ori        $v0, $v0, (0x8000004 & 0xFFFF)
/* 8F978 8009F178 90006210 */  beq        $v1, $v0, .L8009F3BC
/* 8F97C 8009F17C 2A104300 */   slt       $v0, $v0, $v1
/* 8F980 8009F180 08004014 */  bnez       $v0, .L8009F1A4
/* 8F984 8009F184 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 8F988 8009F188 0008023C */  lui        $v0, (0x8000003 >> 16)
/* 8F98C 8009F18C 6B006210 */  beq        $v1, $v0, .L8009F33C
/* 8F990 8009F190 03004234 */   ori       $v0, $v0, (0x8000003 & 0xFFFF)
/* 8F994 8009F194 5F006210 */  beq        $v1, $v0, .L8009F314
/* 8F998 8009F198 21202002 */   addu      $a0, $s1, $zero
/* 8F99C 8009F19C 8A7D0208 */  j          .L8009F628
/* 8F9A0 8009F1A0 21284002 */   addu      $a1, $s2, $zero
.L8009F1A4:
/* 8F9A4 8009F1A4 01004234 */  ori        $v0, $v0, (0x20000001 & 0xFFFF)
/* 8F9A8 8009F1A8 21016210 */  beq        $v1, $v0, .L8009F630
/* 8F9AC 8009F1AC 0020023C */   lui       $v0, (0x20000008 >> 16)
/* 8F9B0 8009F1B0 08004234 */  ori        $v0, $v0, (0x20000008 & 0xFFFF)
/* 8F9B4 8009F1B4 44006210 */  beq        $v1, $v0, .L8009F2C8
/* 8F9B8 8009F1B8 21202002 */   addu      $a0, $s1, $zero
/* 8F9BC 8009F1BC 8A7D0208 */  j          .L8009F628
/* 8F9C0 8009F1C0 21284002 */   addu      $a1, $s2, $zero
.L8009F1C4:
/* 8F9C4 8009F1C4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8F9C8 8009F1C8 0400103C */  lui        $s0, (0x40004 >> 16)
/* 8F9CC 8009F1CC 07005010 */  beq        $v0, $s0, .L8009F1EC
/* 8F9D0 8009F1D0 00000000 */   nop
/* 8F9D4 8009F1D4 13004016 */  bnez       $s2, .L8009F224
/* 8F9D8 8009F1D8 21202002 */   addu      $a0, $s1, $zero
/* 8F9DC 8009F1DC 0000258E */  lw         $a1, 0x0($s1)
/* 8F9E0 8009F1E0 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 8F9E4 8009F1E4 C670000C */  jal        CAMERA_ChangeToUnderWater
/* 8F9E8 8009F1E8 00000000 */   nop
.L8009F1EC:
/* 8F9EC 8009F1EC 0D004016 */  bnez       $s2, .L8009F224
/* 8F9F0 8009F1F0 21202002 */   addu      $a0, $s1, $zero
/* 8F9F4 8009F1F4 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8F9F8 8009F1F8 90F990AF */  sw         $s0, %gp_rel(Raziel + 0x360)($gp)
/* 8F9FC 8009F1FC 0000248E */  lw         $a0, 0x0($s1)
/* 8FA00 8009F200 6800458C */  lw         $a1, 0x68($v0)
/* 8FA04 8009F204 6C00468C */  lw         $a2, 0x6C($v0)
/* 8FA08 8009F208 11010224 */  addiu      $v0, $zero, 0x111
/* 8FA0C 8009F20C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8FA10 8009F210 DF9B020C */  jal        razSetSwimVelocity
/* 8FA14 8009F214 00000000 */   nop
/* 8FA18 8009F218 31CC020C */  jal        SetTimer
/* 8FA1C 8009F21C 05000424 */   addiu     $a0, $zero, 0x5
/* 8FA20 8009F220 21202002 */  addu       $a0, $s1, $zero
.L8009F224:
/* 8FA24 8009F224 21284002 */  addu       $a1, $s2, $zero
/* 8FA28 8009F228 41000624 */  addiu      $a2, $zero, 0x41
/* 8FA2C 8009F22C 21380000 */  addu       $a3, $zero, $zero
/* 8FA30 8009F230 05000224 */  addiu      $v0, $zero, 0x5
/* 8FA34 8009F234 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 8FA38 8009F238 09000224 */  addiu      $v0, $zero, 0x9
/* 8FA3C 8009F23C 1000A2AF */  sw         $v0, 0x10($sp)
/* 8FA40 8009F240 02000224 */  addiu      $v0, $zero, 0x2
/* 8FA44 8009F244 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8FA48 8009F248 1400A2AF */   sw        $v0, 0x14($sp)
/* 8FA4C 8009F24C 1C0180AE */  sw         $zero, 0x11C($s4)
/* 8FA50 8009F250 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 8FA54 8009F254 8C7D0208 */  j          .L8009F630
/* 8FA58 8009F258 00000000 */   nop
.L8009F25C:
/* 8FA5C 8009F25C 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8FA60 8009F260 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8FA64 8009F264 24104300 */  and        $v0, $v0, $v1
/* 8FA68 8009F268 E7004010 */  beqz       $v0, .L8009F608
/* 8FA6C 8009F26C 00000000 */   nop
/* 8FA70 8009F270 8C7D0208 */  j          .L8009F630
/* 8FA74 8009F274 00000000 */   nop
.L8009F278:
/* 8FA78 8009F278 E8FB858F */  lw         $a1, %gp_rel(PlayerData)($gp)
/* 8FA7C 8009F27C 0400038E */  lw         $v1, (0x40004 & 0xFFFF)($s0)
/* 8FA80 8009F280 6800A28C */  lw         $v0, 0x68($a1)
/* 8FA84 8009F284 00000000 */  nop
/* 8FA88 8009F288 07006214 */  bne        $v1, $v0, .L8009F2A8
/* 8FA8C 8009F28C 00000000 */   nop
/* 8FA90 8009F290 0000248E */  lw         $a0, 0x0($s1)
/* 8FA94 8009F294 7000A68C */  lw         $a2, 0x70($a1)
/* 8FA98 8009F298 DF9B020C */  jal        razSetSwimVelocity
/* 8FA9C 8009F29C 21280000 */   addu      $a1, $zero, $zero
/* 8FAA0 8009F2A0 E8FB858F */  lw         $a1, %gp_rel(PlayerData)($gp)
/* 8FAA4 8009F2A4 0400038E */  lw         $v1, (0x40004 & 0xFFFF)($s0)
.L8009F2A8:
/* 8FAA8 8009F2A8 7400A28C */  lw         $v0, 0x74($a1)
/* 8FAAC 8009F2AC 00000000 */  nop
/* 8FAB0 8009F2B0 DF006214 */  bne        $v1, $v0, .L8009F630
/* 8FAB4 8009F2B4 00000000 */   nop
/* 8FAB8 8009F2B8 0000248E */  lw         $a0, 0x0($s1)
/* 8FABC 8009F2BC 7C00A68C */  lw         $a2, 0x7C($a1)
/* 8FAC0 8009F2C0 227D0208 */  j          .L8009F488
/* 8FAC4 8009F2C4 00000000 */   nop
.L8009F2C8:
/* 8FAC8 8009F2C8 A9C9010C */  jal        G2EmulationQueryAnimation
/* 8FACC 8009F2CC 21284002 */   addu      $a1, $s2, $zero
/* 8FAD0 8009F2D0 43000324 */  addiu      $v1, $zero, 0x43
/* 8FAD4 8009F2D4 0D004310 */  beq        $v0, $v1, .L8009F30C
/* 8FAD8 8009F2D8 21202002 */   addu      $a0, $s1, $zero
/* 8FADC 8009F2DC F6C9010C */  jal        G2EmulationQueryFrame
/* 8FAE0 8009F2E0 21284002 */   addu      $a1, $s2, $zero
/* 8FAE4 8009F2E4 02004228 */  slti       $v0, $v0, 0x2
/* 8FAE8 8009F2E8 03004014 */  bnez       $v0, .L8009F2F8
/* 8FAEC 8009F2EC 8C006426 */   addiu     $a0, $s3, 0x8C
/* 8FAF0 8009F2F0 C17C0208 */  j          .L8009F304
/* 8FAF4 8009F2F4 1000053C */   lui       $a1, (0x100000 >> 16)
.L8009F2F8:
/* 8FAF8 8009F2F8 0400A012 */  beqz       $s5, .L8009F30C
/* 8FAFC 8009F2FC 0020053C */   lui       $a1, (0x20000008 >> 16)
/* 8FB00 8009F300 0800A534 */  ori        $a1, $a1, (0x20000008 & 0xFFFF)
.L8009F304:
/* 8FB04 8009F304 4EC3010C */  jal        EnMessageQueueData
/* 8FB08 8009F308 21300000 */   addu      $a2, $zero, $zero
.L8009F30C:
/* 8FB0C 8009F30C 8C7D0208 */  j          .L8009F630
/* 8FB10 8009F310 21A80000 */   addu      $s5, $zero, $zero
.L8009F314:
/* 8FB14 8009F314 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8FB18 8009F318 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 8FB1C 8009F31C 0000428C */  lw         $v0, 0x0($v0)
/* 8FB20 8009F320 00000000 */  nop
/* 8FB24 8009F324 24104300 */  and        $v0, $v0, $v1
/* 8FB28 8009F328 C1004010 */  beqz       $v0, .L8009F630
/* 8FB2C 8009F32C 8C006426 */   addiu     $a0, $s3, 0x8C
/* 8FB30 8009F330 0080053C */  lui        $a1, (0x80000001 >> 16)
/* 8FB34 8009F334 D67C0208 */  j          .L8009F358
/* 8FB38 8009F338 0100A534 */   ori       $a1, $a1, (0x80000001 & 0xFFFF)
.L8009F33C:
/* 8FB3C 8009F33C 21202002 */  addu       $a0, $s1, $zero
/* 8FB40 8009F340 A9C9010C */  jal        G2EmulationQueryAnimation
/* 8FB44 8009F344 21284002 */   addu      $a1, $s2, $zero
/* 8FB48 8009F348 43000324 */  addiu      $v1, $zero, 0x43
/* 8FB4C 8009F34C B8004314 */  bne        $v0, $v1, .L8009F630
/* 8FB50 8009F350 8C006426 */   addiu     $a0, $s3, 0x8C
/* 8FB54 8009F354 1000053C */  lui        $a1, (0x100000 >> 16)
.L8009F358:
/* 8FB58 8009F358 4EC3010C */  jal        EnMessageQueueData
/* 8FB5C 8009F35C 21300000 */   addu      $a2, $zero, $zero
/* 8FB60 8009F360 8C7D0208 */  j          .L8009F630
/* 8FB64 8009F364 00000000 */   nop
.L8009F368:
/* 8FB68 8009F368 21202002 */  addu       $a0, $s1, $zero
/* 8FB6C 8009F36C A9C9010C */  jal        G2EmulationQueryAnimation
/* 8FB70 8009F370 21284002 */   addu      $a1, $s2, $zero
/* 8FB74 8009F374 43000324 */  addiu      $v1, $zero, 0x43
/* 8FB78 8009F378 AD004310 */  beq        $v0, $v1, .L8009F630
/* 8FB7C 8009F37C 21202002 */   addu      $a0, $s1, $zero
/* 8FB80 8009F380 21284002 */  addu       $a1, $s2, $zero
/* 8FB84 8009F384 21306000 */  addu       $a2, $v1, $zero
/* 8FB88 8009F388 21380000 */  addu       $a3, $zero, $zero
/* 8FB8C 8009F38C 03000224 */  addiu      $v0, $zero, 0x3
/* 8FB90 8009F390 1000A2AF */  sw         $v0, 0x10($sp)
/* 8FB94 8009F394 01000224 */  addiu      $v0, $zero, 0x1
/* 8FB98 8009F398 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8FB9C 8009F39C 1400A2AF */   sw        $v0, 0x14($sp)
/* 8FBA0 8009F3A0 A3004016 */  bnez       $s2, .L8009F630
/* 8FBA4 8009F3A4 2C010224 */   addiu     $v0, $zero, 0x12C
/* 8FBA8 8009F3A8 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 8FBAC 8009F3AC 0000238E */  lw         $v1, 0x0($s1)
/* 8FBB0 8009F3B0 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 8FBB4 8009F3B4 8C7D0208 */  j          .L8009F630
/* 8FBB8 8009F3B8 F80162AC */   sw        $v0, 0x1F8($v1)
.L8009F3BC:
/* 8FBBC 8009F3BC E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8FBC0 8009F3C0 0000248E */  lw         $a0, 0x0($s1)
/* 8FBC4 8009F3C4 7400458C */  lw         $a1, 0x74($v0)
/* 8FBC8 8009F3C8 7800468C */  lw         $a2, 0x78($v0)
/* 8FBCC 8009F3CC DF9B020C */  jal        razSetSwimVelocity
/* 8FBD0 8009F3D0 00000000 */   nop
/* 8FBD4 8009F3D4 8C7D0208 */  j          .L8009F630
/* 8FBD8 8009F3D8 00000000 */   nop
.L8009F3DC:
/* 8FBDC 8009F3DC 4000C232 */  andi       $v0, $s6, 0x40
/* 8FBE0 8009F3E0 08004010 */  beqz       $v0, .L8009F404
/* 8FBE4 8009F3E4 21202002 */   addu      $a0, $s1, $zero
/* 8FBE8 8009F3E8 21284002 */  addu       $a1, $s2, $zero
/* 8FBEC 8009F3EC 0A80063C */  lui        $a2, %hi(StateHandlerSwimTread)
/* 8FBF0 8009F3F0 B8F6C624 */  addiu      $a2, $a2, %lo(StateHandlerSwimTread)
/* 8FBF4 8009F3F4 C1CA010C */  jal        StateSwitchStateData
/* 8FBF8 8009F3F8 21380000 */   addu      $a3, $zero, $zero
/* 8FBFC 8009F3FC 1D7D0208 */  j          .L8009F474
/* 8FC00 8009F400 00000000 */   nop
.L8009F404:
/* 8FC04 8009F404 02000324 */  addiu      $v1, $zero, 0x2
/* 8FC08 8009F408 09004316 */  bne        $s2, $v1, .L8009F430
/* 8FC0C 8009F40C 21284002 */   addu      $a1, $s2, $zero
/* 8FC10 8009F410 21202002 */  addu       $a0, $s1, $zero
/* 8FC14 8009F414 21286000 */  addu       $a1, $v1, $zero
/* 8FC18 8009F418 3D000624 */  addiu      $a2, $zero, 0x3D
/* 8FC1C 8009F41C 21380000 */  addu       $a3, $zero, $zero
/* 8FC20 8009F420 03000224 */  addiu      $v0, $zero, 0x3
/* 8FC24 8009F424 1000A2AF */  sw         $v0, 0x10($sp)
/* 8FC28 8009F428 117D0208 */  j          .L8009F444
/* 8FC2C 8009F42C 1400B2AF */   sw        $s2, 0x14($sp)
.L8009F430:
/* 8FC30 8009F430 3F000624 */  addiu      $a2, $zero, 0x3F
/* 8FC34 8009F434 21380000 */  addu       $a3, $zero, $zero
/* 8FC38 8009F438 10000224 */  addiu      $v0, $zero, 0x10
/* 8FC3C 8009F43C 1000A2AF */  sw         $v0, 0x10($sp)
/* 8FC40 8009F440 1400A3AF */  sw         $v1, 0x14($sp)
.L8009F444:
/* 8FC44 8009F444 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8FC48 8009F448 00000000 */   nop
/* 8FC4C 8009F44C 21202002 */  addu       $a0, $s1, $zero
/* 8FC50 8009F450 21284002 */  addu       $a1, $s2, $zero
/* 8FC54 8009F454 0A80063C */  lui        $a2, %hi(StateHandlerSwim)
/* 8FC58 8009F458 0C02C624 */  addiu      $a2, $a2, %lo(StateHandlerSwim)
/* 8FC5C 8009F45C C1CA010C */  jal        StateSwitchStateData
/* 8FC60 8009F460 21380000 */   addu      $a3, $zero, $zero
/* 8FC64 8009F464 2001828E */  lw         $v0, 0x120($s4)
/* 8FC68 8009F468 00000000 */  nop
/* 8FC6C 8009F46C 02004234 */  ori        $v0, $v0, 0x2
/* 8FC70 8009F470 200182AE */  sw         $v0, 0x120($s4)
.L8009F474:
/* 8FC74 8009F474 6E004016 */  bnez       $s2, .L8009F630
/* 8FC78 8009F478 00000000 */   nop
/* 8FC7C 8009F47C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 8FC80 8009F480 0000248E */  lw         $a0, 0x0($s1)
/* 8FC84 8009F484 7C00468C */  lw         $a2, 0x7C($v0)
.L8009F488:
/* 8FC88 8009F488 DF9B020C */  jal        razSetSwimVelocity
/* 8FC8C 8009F48C 21280000 */   addu      $a1, $zero, $zero
/* 8FC90 8009F490 8C7D0208 */  j          .L8009F630
/* 8FC94 8009F494 00000000 */   nop
.L8009F498:
/* 8FC98 8009F498 0400048E */  lw         $a0, (0x40004 & 0xFFFF)($s0)
/* 8FC9C 8009F49C 00000000 */  nop
/* 8FCA0 8009F4A0 10008284 */  lh         $v0, 0x10($a0)
/* 8FCA4 8009F4A4 00000000 */  nop
/* 8FCA8 8009F4A8 1C0182AE */  sw         $v0, 0x11C($s4)
/* 8FCAC 8009F4AC 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 8FCB0 8009F4B0 01000224 */  addiu      $v0, $zero, 0x1
/* 8FCB4 8009F4B4 0A006214 */  bne        $v1, $v0, .L8009F4E0
/* 8FCB8 8009F4B8 00000000 */   nop
/* 8FCBC 8009F4BC 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 8FCC0 8009F4C0 00000000 */  nop
/* 8FCC4 8009F4C4 10004230 */  andi       $v0, $v0, 0x10
/* 8FCC8 8009F4C8 05004014 */  bnez       $v0, .L8009F4E0
/* 8FCCC 8009F4CC 0100023C */   lui       $v0, (0x186A0 >> 16)
/* 8FCD0 8009F4D0 A0864234 */  ori        $v0, $v0, (0x186A0 & 0xFFFF)
/* 8FCD4 8009F4D4 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 8FCD8 8009F4D8 8C7D0208 */  j          .L8009F630
/* 8FCDC 8009F4DC 00000000 */   nop
.L8009F4E0:
/* 8FCE0 8009F4E0 10008294 */  lhu        $v0, 0x10($a0)
/* 8FCE4 8009F4E4 00000000 */  nop
/* 8FCE8 8009F4E8 20024230 */  andi       $v0, $v0, 0x220
/* 8FCEC 8009F4EC 50004010 */  beqz       $v0, .L8009F630
/* 8FCF0 8009F4F0 00000000 */   nop
/* 8FCF4 8009F4F4 1F004016 */  bnez       $s2, .L8009F574
/* 8FCF8 8009F4F8 21202002 */   addu      $a0, $s1, $zero
/* 8FCFC 8009F4FC F0FF0524 */  addiu      $a1, $zero, -0x10
/* 8FD00 8009F500 21300000 */  addu       $a2, $zero, $zero
/* 8FD04 8009F504 10000224 */  addiu      $v0, $zero, 0x10
/* 8FD08 8009F508 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8FD0C 8009F50C C3000224 */  addiu      $v0, $zero, 0xC3
/* 8FD10 8009F510 1000A2AF */  sw         $v0, 0x10($sp)
/* 8FD14 8009F514 0000248E */  lw         $a0, 0x0($s1)
/* 8FD18 8009F518 4E68020C */  jal        SetPhysics
/* 8FD1C 8009F51C 15000724 */   addiu     $a3, $zero, 0x15
/* 8FD20 8009F520 0000248E */  lw         $a0, 0x0($s1)
/* 8FD24 8009F524 938B020C */  jal        SteerSwitchMode
/* 8FD28 8009F528 04000524 */   addiu     $a1, $zero, 0x4
/* 8FD2C 8009F52C E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 8FD30 8009F530 0000228E */  lw         $v0, 0x0($s1)
/* 8FD34 8009F534 21280000 */  addu       $a1, $zero, $zero
/* 8FD38 8009F538 78004284 */  lh         $v0, 0x78($v0)
/* 8FD3C 8009F53C 2130A000 */  addu       $a2, $a1, $zero
/* 8FD40 8009F540 C0F982AF */  sw         $v0, %gp_rel(Raziel + 0x390)($gp)
/* 8FD44 8009F544 0000228E */  lw         $v0, 0x0($s1)
/* 8FD48 8009F548 00000000 */  nop
/* 8FD4C 8009F54C 78004394 */  lhu        $v1, 0x78($v0)
/* 8FD50 8009F550 01000224 */  addiu      $v0, $zero, 0x1
/* 8FD54 8009F554 1000A2AF */  sw         $v0, 0x10($sp)
/* 8FD58 8009F558 00100224 */  addiu      $v0, $zero, 0x1000
/* 8FD5C 8009F55C 1400A2AF */  sw         $v0, 0x14($sp)
/* 8FD60 8009F560 B6F983A7 */  sh         $v1, %gp_rel(Raziel + 0x386)($gp)
/* 8FD64 8009F564 2E69020C */  jal        SetExternalForce
/* 8FD68 8009F568 F0FF0724 */   addiu     $a3, $zero, -0x10
/* 8FD6C 8009F56C 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 8FD70 8009F570 21202002 */  addu       $a0, $s1, $zero
.L8009F574:
/* 8FD74 8009F574 21284002 */  addu       $a1, $s2, $zero
/* 8FD78 8009F578 23000624 */  addiu      $a2, $zero, 0x23
/* 8FD7C 8009F57C 21380000 */  addu       $a3, $zero, $zero
/* 8FD80 8009F580 01000224 */  addiu      $v0, $zero, 0x1
/* 8FD84 8009F584 1000A0AF */  sw         $zero, 0x10($sp)
/* 8FD88 8009F588 20C8010C */  jal        G2EmulationSwitchAnimation
/* 8FD8C 8009F58C 1400A2AF */   sw        $v0, 0x14($sp)
/* 8FD90 8009F590 21202002 */  addu       $a0, $s1, $zero
/* 8FD94 8009F594 21284002 */  addu       $a1, $s2, $zero
/* 8FD98 8009F598 0B80063C */  lui        $a2, %hi(StateHandlerJump)
/* 8FD9C 8009F59C 70B9C624 */  addiu      $a2, $a2, %lo(StateHandlerJump)
/* 8FDA0 8009F5A0 C1CA010C */  jal        StateSwitchStateData
/* 8FDA4 8009F5A4 21380000 */   addu      $a3, $zero, $zero
/* 8FDA8 8009F5A8 8C7D0208 */  j          .L8009F630
/* 8FDAC 8009F5AC 00000000 */   nop
.L8009F5B0:
/* 8FDB0 8009F5B0 1F004016 */  bnez       $s2, .L8009F630
/* 8FDB4 8009F5B4 00000000 */   nop
/* 8FDB8 8009F5B8 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 8FDBC 8009F5BC 0400038E */  lw         $v1, (0x40004 & 0xFFFF)($s0)
/* 8FDC0 8009F5C0 00084230 */  andi       $v0, $v0, 0x800
/* 8FDC4 8009F5C4 1A004010 */  beqz       $v0, .L8009F630
/* 8FDC8 8009F5C8 00000000 */   nop
/* 8FDCC 8009F5CC 0C00648C */  lw         $a0, 0xC($v1)
/* 8FDD0 8009F5D0 7391020C */  jal        LoseHealth
/* 8FDD4 8009F5D4 00000000 */   nop
/* 8FDD8 8009F5D8 8C7D0208 */  j          .L8009F630
/* 8FDDC 8009F5DC 00000000 */   nop
.L8009F5E0:
/* 8FDE0 8009F5E0 21200000 */  addu       $a0, $zero, $zero
/* 8FDE4 8009F5E4 21288000 */  addu       $a1, $a0, $zero
/* 8FDE8 8009F5E8 4FC6010C */  jal        SetControlInitIdleData
/* 8FDEC 8009F5EC 09000624 */   addiu     $a2, $zero, 0x9
/* 8FDF0 8009F5F0 21202002 */  addu       $a0, $s1, $zero
/* 8FDF4 8009F5F4 21284002 */  addu       $a1, $s2, $zero
/* 8FDF8 8009F5F8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 8FDFC 8009F5FC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 8FE00 8009F600 C1CA010C */  jal        StateSwitchStateData
/* 8FE04 8009F604 21384000 */   addu      $a3, $v0, $zero
.L8009F608:
/* 8FE08 8009F608 09004016 */  bnez       $s2, .L8009F630
/* 8FE0C 8009F60C 00000000 */   nop
/* 8FE10 8009F610 0000258E */  lw         $a1, 0x0($s1)
/* 8FE14 8009F614 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 8FE18 8009F618 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 8FE1C 8009F61C 00000000 */   nop
/* 8FE20 8009F620 8C7D0208 */  j          .L8009F630
/* 8FE24 8009F624 00000000 */   nop
.L8009F628:
/* 8FE28 8009F628 B9BF020C */  jal        DefaultStateHandler
/* 8FE2C 8009F62C 2130E002 */   addu      $a2, $s7, $zero
.L8009F630:
/* 8FE30 8009F630 27C3010C */  jal        DeMessageQueue
/* 8FE34 8009F634 04006426 */   addiu     $a0, $s3, 0x4
/* 8FE38 8009F638 127C0208 */  j          .L8009F048
/* 8FE3C 8009F63C 00000000 */   nop
.L8009F640:
/* 8FE40 8009F640 1200A012 */  beqz       $s5, .L8009F68C
/* 8FE44 8009F644 00000000 */   nop
/* 8FE48 8009F648 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 8FE4C 8009F64C 9CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x18)($gp)
/* 8FE50 8009F650 0000428C */  lw         $v0, 0x0($v0)
/* 8FE54 8009F654 00000000 */  nop
/* 8FE58 8009F658 24104300 */  and        $v0, $v0, $v1
/* 8FE5C 8009F65C 0B004014 */  bnez       $v0, .L8009F68C
/* 8FE60 8009F660 C0201200 */   sll       $a0, $s2, 3
/* 8FE64 8009F664 21209200 */  addu       $a0, $a0, $s2
/* 8FE68 8009F668 C0200400 */  sll        $a0, $a0, 3
/* 8FE6C 8009F66C 23209200 */  subu       $a0, $a0, $s2
/* 8FE70 8009F670 80200400 */  sll        $a0, $a0, 2
/* 8FE74 8009F674 21209100 */  addu       $a0, $a0, $s1
/* 8FE78 8009F678 94008424 */  addiu      $a0, $a0, 0x94
/* 8FE7C 8009F67C 0020053C */  lui        $a1, (0x20000008 >> 16)
/* 8FE80 8009F680 0800A534 */  ori        $a1, $a1, (0x20000008 & 0xFFFF)
/* 8FE84 8009F684 4EC3010C */  jal        EnMessageQueueData
/* 8FE88 8009F688 21300000 */   addu      $a2, $zero, $zero
.L8009F68C:
/* 8FE8C 8009F68C 3800BF8F */  lw         $ra, 0x38($sp)
/* 8FE90 8009F690 3400B78F */  lw         $s7, 0x34($sp)
/* 8FE94 8009F694 3000B68F */  lw         $s6, 0x30($sp)
/* 8FE98 8009F698 2C00B58F */  lw         $s5, 0x2C($sp)
/* 8FE9C 8009F69C 2800B48F */  lw         $s4, 0x28($sp)
/* 8FEA0 8009F6A0 2400B38F */  lw         $s3, 0x24($sp)
/* 8FEA4 8009F6A4 2000B28F */  lw         $s2, 0x20($sp)
/* 8FEA8 8009F6A8 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8FEAC 8009F6AC 1800B08F */  lw         $s0, 0x18($sp)
/* 8FEB0 8009F6B0 0800E003 */  jr         $ra
/* 8FEB4 8009F6B4 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerSwimCoil, . - StateHandlerSwimCoil
