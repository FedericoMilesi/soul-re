.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerSwimTread
/* 8FEB8 8009F6B8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8FEBC 8009F6BC 2000B2AF */  sw         $s2, 0x20($sp)
/* 8FEC0 8009F6C0 2190A000 */  addu       $s2, $a1, $zero
/* 8FEC4 8009F6C4 2400B3AF */  sw         $s3, 0x24($sp)
/* 8FEC8 8009F6C8 02001324 */  addiu      $s3, $zero, 0x2
/* 8FECC 8009F6CC C0101200 */  sll        $v0, $s2, 3
/* 8FED0 8009F6D0 21105200 */  addu       $v0, $v0, $s2
/* 8FED4 8009F6D4 C0100200 */  sll        $v0, $v0, 3
/* 8FED8 8009F6D8 23105200 */  subu       $v0, $v0, $s2
/* 8FEDC 8009F6DC 3000B6AF */  sw         $s6, 0x30($sp)
/* 8FEE0 8009F6E0 04B06202 */  sllv       $s6, $v0, $s3
/* 8FEE4 8009F6E4 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8FEE8 8009F6E8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8FEEC 8009F6EC 21888000 */  addu       $s1, $a0, $zero
/* 8FEF0 8009F6F0 3400B7AF */  sw         $s7, 0x34($sp)
/* 8FEF4 8009F6F4 0400173C */  lui        $s7, (0x40000 >> 16)
/* 8FEF8 8009F6F8 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 8FEFC 8009F6FC 21A83602 */  addu       $s5, $s1, $s6
/* 8FF00 8009F700 2800B4AF */  sw         $s4, 0x28($sp)
/* 8FF04 8009F704 01001424 */  addiu      $s4, $zero, 0x1
/* 8FF08 8009F708 3800BFAF */  sw         $ra, 0x38($sp)
/* 8FF0C 8009F70C 1800B0AF */  sw         $s0, 0x18($sp)
/* 8FF10 8009F710 00044234 */  ori        $v0, $v0, 0x400
/* 8FF14 8009F714 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8FF18 8009F718 2120D102 */  addu       $a0, $s6, $s1
.L8009F71C:
/* 8FF1C 8009F71C 39C3010C */  jal        PeekMessageQueue
/* 8FF20 8009F720 0C008424 */   addiu     $a0, $a0, 0xC
/* 8FF24 8009F724 21204000 */  addu       $a0, $v0, $zero
/* 8FF28 8009F728 79018010 */  beqz       $a0, .L8009FD10
/* 8FF2C 8009F72C 0004023C */   lui       $v0, (0x4000001 >> 16)
/* 8FF30 8009F730 0000838C */  lw         $v1, 0x0($a0)
/* 8FF34 8009F734 01004234 */  ori        $v0, $v0, (0x4000001 & 0xFFFF)
/* 8FF38 8009F738 70016210 */  beq        $v1, $v0, .L8009FCFC
/* 8FF3C 8009F73C 2A104300 */   slt       $v0, $v0, $v1
/* 8FF40 8009F740 28004014 */  bnez       $v0, .L8009F7E4
/* 8FF44 8009F744 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 8FF48 8009F748 1000023C */  lui        $v0, (0x100001 >> 16)
/* 8FF4C 8009F74C 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8FF50 8009F750 33006210 */  beq        $v1, $v0, .L8009F820
/* 8FF54 8009F754 2A104300 */   slt       $v0, $v0, $v1
/* 8FF58 8009F758 11004014 */  bnez       $v0, .L8009F7A0
/* 8FF5C 8009F75C 1000023C */   lui       $v0, (0x100009 >> 16)
/* 8FF60 8009F760 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 8FF64 8009F764 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8FF68 8009F768 D6006210 */  beq        $v1, $v0, .L8009FAC4
/* 8FF6C 8009F76C 2A104300 */   slt       $v0, $v0, $v1
/* 8FF70 8009F770 06004014 */  bnez       $v0, .L8009F78C
/* 8FF74 8009F774 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 8FF78 8009F778 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 8FF7C 8009F77C A3006210 */  beq        $v1, $v0, .L8009FA0C
/* 8FF80 8009F780 2120D102 */   addu      $a0, $s6, $s1
/* 8FF84 8009F784 407F0208 */  j          .L8009FD00
/* 8FF88 8009F788 00000000 */   nop
.L8009F78C:
/* 8FF8C 8009F78C 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 8FF90 8009F790 2B016210 */  beq        $v1, $v0, .L8009FC40
/* 8FF94 8009F794 2120D102 */   addu      $a0, $s6, $s1
/* 8FF98 8009F798 407F0208 */  j          .L8009FD00
/* 8FF9C 8009F79C 00000000 */   nop
.L8009F7A0:
/* 8FFA0 8009F7A0 09004234 */  ori        $v0, $v0, (0x100009 & 0xFFFF)
/* 8FFA4 8009F7A4 B7006210 */  beq        $v1, $v0, .L8009FA84
/* 8FFA8 8009F7A8 2A104300 */   slt       $v0, $v0, $v1
/* 8FFAC 8009F7AC 06004014 */  bnez       $v0, .L8009F7C8
/* 8FFB0 8009F7B0 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8FFB4 8009F7B4 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8FFB8 8009F7B8 3A006210 */  beq        $v1, $v0, .L8009F8A4
/* 8FFBC 8009F7BC 2120D102 */   addu      $a0, $s6, $s1
/* 8FFC0 8009F7C0 407F0208 */  j          .L8009FD00
/* 8FFC4 8009F7C4 00000000 */   nop
.L8009F7C8:
/* 8FFC8 8009F7C8 14004234 */  ori        $v0, $v0, (0x100014 & 0xFFFF)
/* 8FFCC 8009F7CC 2F016210 */  beq        $v1, $v0, .L8009FC8C
/* 8FFD0 8009F7D0 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 8FFD4 8009F7D4 3F016210 */  beq        $v1, $v0, .L8009FCD4
/* 8FFD8 8009F7D8 00000000 */   nop
/* 8FFDC 8009F7DC 407F0208 */  j          .L8009FD00
/* 8FFE0 8009F7E0 2120D102 */   addu      $a0, $s6, $s1
.L8009F7E4:
/* 8FFE4 8009F7E4 BF006210 */  beq        $v1, $v0, .L8009FAE4
/* 8FFE8 8009F7E8 2A104300 */   slt       $v0, $v0, $v1
/* 8FFEC 8009F7EC 07004014 */  bnez       $v0, .L8009F80C
/* 8FFF0 8009F7F0 0008023C */   lui       $v0, (0x8000001 >> 16)
/* 8FFF4 8009F7F4 0104023C */  lui        $v0, (0x4010010 >> 16)
/* 8FFF8 8009F7F8 10004234 */  ori        $v0, $v0, (0x4010010 & 0xFFFF)
/* 8FFFC 8009F7FC FE006210 */  beq        $v1, $v0, .L8009FBF8
/* 90000 8009F800 21280000 */   addu      $a1, $zero, $zero
/* 90004 8009F804 407F0208 */  j          .L8009FD00
/* 90008 8009F808 2120D102 */   addu      $a0, $s6, $s1
.L8009F80C:
/* 9000C 8009F80C 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 90010 8009F810 34006210 */  beq        $v1, $v0, .L8009F8E4
/* 90014 8009F814 42000224 */   addiu     $v0, $zero, 0x42
/* 90018 8009F818 407F0208 */  j          .L8009FD00
/* 9001C 8009F81C 2120D102 */   addu      $a0, $s6, $s1
.L8009F820:
/* 90020 8009F820 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 90024 8009F824 00000000 */  nop
/* 90028 8009F828 24105700 */  and        $v0, $v0, $s7
/* 9002C 8009F82C 07004014 */  bnez       $v0, .L8009F84C
/* 90030 8009F830 00000000 */   nop
/* 90034 8009F834 16004016 */  bnez       $s2, .L8009F890
/* 90038 8009F838 21202002 */   addu      $a0, $s1, $zero
/* 9003C 8009F83C 0000258E */  lw         $a1, 0x0($s1)
/* 90040 8009F840 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 90044 8009F844 C670000C */  jal        CAMERA_ChangeToUnderWater
/* 90048 8009F848 00000000 */   nop
.L8009F84C:
/* 9004C 8009F84C 10004016 */  bnez       $s2, .L8009F890
/* 90050 8009F850 21202002 */   addu      $a0, $s1, $zero
/* 90054 8009F854 90F997AF */  sw         $s7, %gp_rel(Raziel + 0x360)($gp)
/* 90058 8009F858 0000248E */  lw         $a0, 0x0($s1)
/* 9005C 8009F85C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90060 8009F860 11050324 */  addiu      $v1, $zero, 0x511
/* 90064 8009F864 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 90068 8009F868 8800468C */  lw         $a2, 0x88($v0)
/* 9006C 8009F86C 06000224 */  addiu      $v0, $zero, 0x6
/* 90070 8009F870 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 90074 8009F874 DF9B020C */  jal        razSetSwimVelocity
/* 90078 8009F878 21280000 */   addu      $a1, $zero, $zero
/* 9007C 8009F87C 0000248E */  lw         $a0, 0x0($s1)
/* 90080 8009F880 938B020C */  jal        SteerSwitchMode
/* 90084 8009F884 06000524 */   addiu     $a1, $zero, 0x6
/* 90088 8009F888 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 9008C 8009F88C 21202002 */  addu       $a0, $s1, $zero
.L8009F890:
/* 90090 8009F890 21284002 */  addu       $a1, $s2, $zero
/* 90094 8009F894 3D000624 */  addiu      $a2, $zero, 0x3D
/* 90098 8009F898 21380000 */  addu       $a3, $zero, $zero
/* 9009C 8009F89C 9A7E0208 */  j          .L8009FA68
/* 900A0 8009F8A0 09000224 */   addiu     $v0, $zero, 0x9
.L8009F8A4:
/* 900A4 8009F8A4 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 900A8 8009F8A8 00000000 */  nop
/* 900AC 8009F8AC 24105700 */  and        $v0, $v0, $s7
/* 900B0 8009F8B0 07004014 */  bnez       $v0, .L8009F8D0
/* 900B4 8009F8B4 00000000 */   nop
/* 900B8 8009F8B8 11014016 */  bnez       $s2, .L8009FD00
/* 900BC 8009F8BC 2120D102 */   addu      $a0, $s6, $s1
/* 900C0 8009F8C0 0000258E */  lw         $a1, 0x0($s1)
/* 900C4 8009F8C4 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 900C8 8009F8C8 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 900CC 8009F8CC 00000000 */   nop
.L8009F8D0:
/* 900D0 8009F8D0 0B014016 */  bnez       $s2, .L8009FD00
/* 900D4 8009F8D4 2120D102 */   addu      $a0, $s6, $s1
/* 900D8 8009F8D8 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
/* 900DC 8009F8DC 407F0208 */  j          .L8009FD00
/* 900E0 8009F8E0 00000000 */   nop
.L8009F8E4:
/* 900E4 8009F8E4 0400838C */  lw         $v1, 0x4($a0)
/* 900E8 8009F8E8 00000000 */  nop
/* 900EC 8009F8EC 31006214 */  bne        $v1, $v0, .L8009F9B4
/* 900F0 8009F8F0 3E000224 */   addiu     $v0, $zero, 0x3E
/* 900F4 8009F8F4 2001A28E */  lw         $v0, 0x120($s5)
/* 900F8 8009F8F8 00000000 */  nop
/* 900FC 8009F8FC 24005410 */  beq        $v0, $s4, .L8009F990
/* 90100 8009F900 00000000 */   nop
/* 90104 8009F904 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 90108 8009F908 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9010C 8009F90C 0000428C */  lw         $v0, 0x0($v0)
/* 90110 8009F910 00000000 */  nop
/* 90114 8009F914 24104300 */  and        $v0, $v0, $v1
/* 90118 8009F918 05004010 */  beqz       $v0, .L8009F930
/* 9011C 8009F91C 00000000 */   nop
/* 90120 8009F920 B8F9828F */  lw         $v0, %gp_rel(Raziel + 0x388)($gp)
/* 90124 8009F924 00000000 */  nop
/* 90128 8009F928 0C004014 */  bnez       $v0, .L8009F95C
/* 9012C 8009F92C 21202002 */   addu      $a0, $s1, $zero
.L8009F930:
/* 90130 8009F930 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90134 8009F934 0000248E */  lw         $a0, 0x0($s1)
/* 90138 8009F938 9C00468C */  lw         $a2, 0x9C($v0)
/* 9013C 8009F93C DF9B020C */  jal        razSetSwimVelocity
/* 90140 8009F940 21280000 */   addu      $a1, $zero, $zero
/* 90144 8009F944 21202002 */  addu       $a0, $s1, $zero
/* 90148 8009F948 21284002 */  addu       $a1, $s2, $zero
/* 9014C 8009F94C 3D000624 */  addiu      $a2, $zero, 0x3D
/* 90150 8009F950 21380000 */  addu       $a3, $zero, $zero
/* 90154 8009F954 9A7E0208 */  j          .L8009FA68
/* 90158 8009F958 0F000224 */   addiu     $v0, $zero, 0xF
.L8009F95C:
/* 9015C 8009F95C 21284002 */  addu       $a1, $s2, $zero
/* 90160 8009F960 3E000624 */  addiu      $a2, $zero, 0x3E
/* 90164 8009F964 21380000 */  addu       $a3, $zero, $zero
/* 90168 8009F968 03000224 */  addiu      $v0, $zero, 0x3
/* 9016C 8009F96C 1000A2AF */  sw         $v0, 0x10($sp)
/* 90170 8009F970 20C8010C */  jal        G2EmulationSwitchAnimation
/* 90174 8009F974 1400B3AF */   sw        $s3, 0x14($sp)
/* 90178 8009F978 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9017C 8009F97C FEFF0324 */  addiu      $v1, $zero, -0x2
/* 90180 8009F980 24104300 */  and        $v0, $v0, $v1
/* 90184 8009F984 3CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 90188 8009F988 407F0208 */  j          .L8009FD00
/* 9018C 8009F98C 2120D102 */   addu      $a0, $s6, $s1
.L8009F990:
/* 90190 8009F990 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90194 8009F994 2001A0AE */  sw         $zero, 0x120($s5)
/* 90198 8009F998 0000248E */  lw         $a0, 0x0($s1)
/* 9019C 8009F99C 8000458C */  lw         $a1, 0x80($v0)
/* 901A0 8009F9A0 8400468C */  lw         $a2, 0x84($v0)
/* 901A4 8009F9A4 DF9B020C */  jal        razSetSwimVelocity
/* 901A8 8009F9A8 00000000 */   nop
/* 901AC 8009F9AC 407F0208 */  j          .L8009FD00
/* 901B0 8009F9B0 2120D102 */   addu      $a0, $s6, $s1
.L8009F9B4:
/* 901B4 8009F9B4 D2006214 */  bne        $v1, $v0, .L8009FD00
/* 901B8 8009F9B8 2120D102 */   addu      $a0, $s6, $s1
/* 901BC 8009F9BC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 901C0 8009F9C0 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 901C4 8009F9C4 0000428C */  lw         $v0, 0x0($v0)
/* 901C8 8009F9C8 00000000 */  nop
/* 901CC 8009F9CC 24104300 */  and        $v0, $v0, $v1
/* 901D0 8009F9D0 CB004014 */  bnez       $v0, .L8009FD00
/* 901D4 8009F9D4 00000000 */   nop
/* 901D8 8009F9D8 07005316 */  bne        $s2, $s3, .L8009F9F8
/* 901DC 8009F9DC 21202002 */   addu      $a0, $s1, $zero
/* 901E0 8009F9E0 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 901E4 8009F9E4 0000248E */  lw         $a0, 0x0($s1)
/* 901E8 8009F9E8 8800468C */  lw         $a2, 0x88($v0)
/* 901EC 8009F9EC DF9B020C */  jal        razSetSwimVelocity
/* 901F0 8009F9F0 21280000 */   addu      $a1, $zero, $zero
/* 901F4 8009F9F4 21202002 */  addu       $a0, $s1, $zero
.L8009F9F8:
/* 901F8 8009F9F8 21284002 */  addu       $a1, $s2, $zero
/* 901FC 8009F9FC 3D000624 */  addiu      $a2, $zero, 0x3D
/* 90200 8009FA00 21380000 */  addu       $a3, $zero, $zero
/* 90204 8009FA04 9A7E0208 */  j          .L8009FA68
/* 90208 8009FA08 0F000224 */   addiu     $v0, $zero, 0xF
.L8009FA0C:
/* 9020C 8009FA0C B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* 90210 8009FA10 06000224 */  addiu      $v0, $zero, 0x6
/* 90214 8009FA14 BA006214 */  bne        $v1, $v0, .L8009FD00
/* 90218 8009FA18 00000000 */   nop
/* 9021C 8009FA1C 21202002 */  addu       $a0, $s1, $zero
/* 90220 8009FA20 A9C9010C */  jal        G2EmulationQueryAnimation
/* 90224 8009FA24 21284002 */   addu      $a1, $s2, $zero
/* 90228 8009FA28 42000324 */  addiu      $v1, $zero, 0x42
/* 9022C 8009FA2C 13004310 */  beq        $v0, $v1, .L8009FA7C
/* 90230 8009FA30 00000000 */   nop
/* 90234 8009FA34 08005316 */  bne        $s2, $s3, .L8009FA58
/* 90238 8009FA38 21202002 */   addu      $a0, $s1, $zero
/* 9023C 8009FA3C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90240 8009FA40 0000248E */  lw         $a0, 0x0($s1)
/* 90244 8009FA44 8000458C */  lw         $a1, 0x80($v0)
/* 90248 8009FA48 8400468C */  lw         $a2, 0x84($v0)
/* 9024C 8009FA4C DF9B020C */  jal        razSetSwimVelocity
/* 90250 8009FA50 00000000 */   nop
/* 90254 8009FA54 21202002 */  addu       $a0, $s1, $zero
.L8009FA58:
/* 90258 8009FA58 21284002 */  addu       $a1, $s2, $zero
/* 9025C 8009FA5C 42000624 */  addiu      $a2, $zero, 0x42
/* 90260 8009FA60 21380000 */  addu       $a3, $zero, $zero
/* 90264 8009FA64 05000224 */  addiu      $v0, $zero, 0x5
.L8009FA68:
/* 90268 8009FA68 1000A2AF */  sw         $v0, 0x10($sp)
/* 9026C 8009FA6C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 90270 8009FA70 1400B3AF */   sw        $s3, 0x14($sp)
/* 90274 8009FA74 407F0208 */  j          .L8009FD00
/* 90278 8009FA78 2120D102 */   addu      $a0, $s6, $s1
.L8009FA7C:
/* 9027C 8009FA7C 3F7F0208 */  j          .L8009FCFC
/* 90280 8009FA80 2001B4AE */   sw        $s4, 0x120($s5)
.L8009FA84:
/* 90284 8009FA84 9D004016 */  bnez       $s2, .L8009FCFC
/* 90288 8009FA88 00000000 */   nop
/* 9028C 8009FA8C 0400828C */  lw         $v0, 0x4($a0)
/* 90290 8009FA90 00000000 */  nop
/* 90294 8009FA94 06004010 */  beqz       $v0, .L8009FAB0
/* 90298 8009FA98 00000000 */   nop
/* 9029C 8009FA9C 0000248E */  lw         $a0, 0x0($s1)
/* 902A0 8009FAA0 938B020C */  jal        SteerSwitchMode
/* 902A4 8009FAA4 21280000 */   addu      $a1, $zero, $zero
/* 902A8 8009FAA8 407F0208 */  j          .L8009FD00
/* 902AC 8009FAAC 2120D102 */   addu      $a0, $s6, $s1
.L8009FAB0:
/* 902B0 8009FAB0 0000248E */  lw         $a0, 0x0($s1)
/* 902B4 8009FAB4 938B020C */  jal        SteerSwitchMode
/* 902B8 8009FAB8 06000524 */   addiu     $a1, $zero, 0x6
/* 902BC 8009FABC 407F0208 */  j          .L8009FD00
/* 902C0 8009FAC0 2120D102 */   addu      $a0, $s6, $s1
.L8009FAC4:
/* 902C4 8009FAC4 21202002 */  addu       $a0, $s1, $zero
/* 902C8 8009FAC8 21284002 */  addu       $a1, $s2, $zero
/* 902CC 8009FACC 0A80063C */  lui        $a2, %hi(StateHandlerSwimCoil)
/* 902D0 8009FAD0 38EFC624 */  addiu      $a2, $a2, %lo(StateHandlerSwimCoil)
/* 902D4 8009FAD4 C1CA010C */  jal        StateSwitchStateData
/* 902D8 8009FAD8 21380000 */   addu      $a3, $zero, $zero
/* 902DC 8009FADC 407F0208 */  j          .L8009FD00
/* 902E0 8009FAE0 2120D102 */   addu      $a0, $s6, $s1
.L8009FAE4:
/* 902E4 8009FAE4 68FA828F */  lw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 902E8 8009FAE8 0400908C */  lw         $s0, 0x4($a0)
/* 902EC 8009FAEC 0A005414 */  bne        $v0, $s4, .L8009FB18
/* 902F0 8009FAF0 00000000 */   nop
/* 902F4 8009FAF4 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 902F8 8009FAF8 00000000 */  nop
/* 902FC 8009FAFC 10004230 */  andi       $v0, $v0, 0x10
/* 90300 8009FB00 05004014 */  bnez       $v0, .L8009FB18
/* 90304 8009FB04 0100023C */   lui       $v0, (0x186A0 >> 16)
/* 90308 8009FB08 A0864234 */  ori        $v0, $v0, (0x186A0 & 0xFFFF)
/* 9030C 8009FB0C 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 90310 8009FB10 407F0208 */  j          .L8009FD00
/* 90314 8009FB14 2120D102 */   addu      $a0, $s6, $s1
.L8009FB18:
/* 90318 8009FB18 0D005316 */  bne        $s2, $s3, .L8009FB50
/* 9031C 8009FB1C A0FF0324 */   addiu     $v1, $zero, -0x60
/* 90320 8009FB20 0C000286 */  lh         $v0, 0xC($s0)
/* 90324 8009FB24 0C000496 */  lhu        $a0, 0xC($s0)
/* 90328 8009FB28 08004310 */  beq        $v0, $v1, .L8009FB4C
/* 9032C 8009FB2C 00000000 */   nop
/* 90330 8009FB30 0000238E */  lw         $v1, 0x0($s1)
/* 90334 8009FB34 00000000 */  nop
/* 90338 8009FB38 60006294 */  lhu        $v0, 0x60($v1)
/* 9033C 8009FB3C 00000000 */  nop
/* 90340 8009FB40 A0FF4224 */  addiu      $v0, $v0, -0x60
/* 90344 8009FB44 23104400 */  subu       $v0, $v0, $a0
/* 90348 8009FB48 600062A4 */  sh         $v0, 0x60($v1)
.L8009FB4C:
/* 9034C 8009FB4C 540320AE */  sw         $zero, 0x354($s1)
.L8009FB50:
/* 90350 8009FB50 10000296 */  lhu        $v0, 0x10($s0)
/* 90354 8009FB54 00000000 */  nop
/* 90358 8009FB58 20004230 */  andi       $v0, $v0, 0x20
/* 9035C 8009FB5C 18004010 */  beqz       $v0, .L8009FBC0
/* 90360 8009FB60 21202002 */   addu      $a0, $s1, $zero
/* 90364 8009FB64 21284002 */  addu       $a1, $s2, $zero
/* 90368 8009FB68 23000624 */  addiu      $a2, $zero, 0x23
/* 9036C 8009FB6C 21380000 */  addu       $a3, $zero, $zero
/* 90370 8009FB70 1000A0AF */  sw         $zero, 0x10($sp)
/* 90374 8009FB74 20C8010C */  jal        G2EmulationSwitchAnimation
/* 90378 8009FB78 1400B4AF */   sw        $s4, 0x14($sp)
/* 9037C 8009FB7C 0000248E */  lw         $a0, 0x0($s1)
/* 90380 8009FB80 938B020C */  jal        SteerSwitchMode
/* 90384 8009FB84 04000524 */   addiu     $a1, $zero, 0x4
/* 90388 8009FB88 21202002 */  addu       $a0, $s1, $zero
/* 9038C 8009FB8C 21284002 */  addu       $a1, $s2, $zero
/* 90390 8009FB90 0B80063C */  lui        $a2, %hi(StateHandlerFall)
/* 90394 8009FB94 A8BDC624 */  addiu      $a2, $a2, %lo(StateHandlerFall)
/* 90398 8009FB98 C1CA010C */  jal        StateSwitchStateData
/* 9039C 8009FB9C 21380000 */   addu      $a3, $zero, $zero
/* 903A0 8009FBA0 E0FC8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1)
/* 903A4 8009FBA4 21280000 */  addu       $a1, $zero, $zero
/* 903A8 8009FBA8 2130A000 */  addu       $a2, $a1, $zero
/* 903AC 8009FBAC F0FF0724 */  addiu      $a3, $zero, -0x10
/* 903B0 8009FBB0 00100224 */  addiu      $v0, $zero, 0x1000
/* 903B4 8009FBB4 1000B4AF */  sw         $s4, 0x10($sp)
/* 903B8 8009FBB8 2E69020C */  jal        SetExternalForce
/* 903BC 8009FBBC 1400A2AF */   sw        $v0, 0x14($sp)
.L8009FBC0:
/* 903C0 8009FBC0 10000296 */  lhu        $v0, 0x10($s0)
/* 903C4 8009FBC4 00000000 */  nop
/* 903C8 8009FBC8 80004230 */  andi       $v0, $v0, 0x80
/* 903CC 8009FBCC 4C004010 */  beqz       $v0, .L8009FD00
/* 903D0 8009FBD0 2120D102 */   addu      $a0, $s6, $s1
/* 903D4 8009FBD4 21200000 */  addu       $a0, $zero, $zero
/* 903D8 8009FBD8 21288000 */  addu       $a1, $a0, $zero
/* 903DC 8009FBDC 4FC6010C */  jal        SetControlInitIdleData
/* 903E0 8009FBE0 09000624 */   addiu     $a2, $zero, 0x9
/* 903E4 8009FBE4 21202002 */  addu       $a0, $s1, $zero
/* 903E8 8009FBE8 21284002 */  addu       $a1, $s2, $zero
/* 903EC 8009FBEC 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 903F0 8009FBF0 0C7F0208 */  j          .L8009FC30
/* 903F4 8009FBF4 E084C624 */   addiu     $a2, $a2, %lo(StateHandlerIdle)
.L8009FBF8:
/* 903F8 8009FBF8 0400908C */  lw         $s0, 0x4($a0)
/* 903FC 8009FBFC 2130A000 */  addu       $a2, $a1, $zero
/* 90400 8009FC00 1000A0AF */  sw         $zero, 0x10($sp)
/* 90404 8009FC04 0000248E */  lw         $a0, 0x0($s1)
/* 90408 8009FC08 4E68020C */  jal        SetPhysics
/* 9040C 8009FC0C 2138A000 */   addu      $a3, $a1, $zero
/* 90410 8009FC10 21280000 */  addu       $a1, $zero, $zero
/* 90414 8009FC14 1800048E */  lw         $a0, 0x18($s0)
/* 90418 8009FC18 3CC6010C */  jal        SetControlInitHangData
/* 9041C 8009FC1C 03000624 */   addiu     $a2, $zero, 0x3
/* 90420 8009FC20 21202002 */  addu       $a0, $s1, $zero
/* 90424 8009FC24 21284002 */  addu       $a1, $s2, $zero
/* 90428 8009FC28 0B80063C */  lui        $a2, %hi(StateHandlerHang)
/* 9042C 8009FC2C F4D2C624 */  addiu      $a2, $a2, %lo(StateHandlerHang)
.L8009FC30:
/* 90430 8009FC30 C1CA010C */  jal        StateSwitchStateData
/* 90434 8009FC34 21384000 */   addu      $a3, $v0, $zero
/* 90438 8009FC38 407F0208 */  j          .L8009FD00
/* 9043C 8009FC3C 2120D102 */   addu      $a0, $s6, $s1
.L8009FC40:
/* 90440 8009FC40 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 90444 8009FC44 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 90448 8009FC48 24104300 */  and        $v0, $v0, $v1
/* 9044C 8009FC4C 2C004014 */  bnez       $v0, .L8009FD00
/* 90450 8009FC50 00000000 */   nop
/* 90454 8009FC54 2A004016 */  bnez       $s2, .L8009FD00
/* 90458 8009FC58 0B80053C */   lui       $a1, %hi(StateHandlerGlyphs)
/* 9045C 8009FC5C 21202002 */  addu       $a0, $s1, $zero
/* 90460 8009FC60 50F6A524 */  addiu      $a1, $a1, %lo(StateHandlerGlyphs)
/* 90464 8009FC64 F4CA010C */  jal        StateSwitchStateCharacterData
/* 90468 8009FC68 21300000 */   addu      $a2, $zero, $zero
/* 9046C 8009FC6C 1000B3AF */  sw         $s3, 0x10($sp)
/* 90470 8009FC70 21202002 */  addu       $a0, $s1, $zero
/* 90474 8009FC74 3D000524 */  addiu      $a1, $zero, 0x3D
/* 90478 8009FC78 21300000 */  addu       $a2, $zero, $zero
/* 9047C 8009FC7C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 90480 8009FC80 09000724 */   addiu     $a3, $zero, 0x9
/* 90484 8009FC84 407F0208 */  j          .L8009FD00
/* 90488 8009FC88 2120D102 */   addu      $a0, $s6, $s1
.L8009FC8C:
/* 9048C 8009FC8C 21200000 */  addu       $a0, $zero, $zero
/* 90490 8009FC90 21288000 */  addu       $a1, $a0, $zero
/* 90494 8009FC94 4FC6010C */  jal        SetControlInitIdleData
/* 90498 8009FC98 09000624 */   addiu     $a2, $zero, 0x9
/* 9049C 8009FC9C 21202002 */  addu       $a0, $s1, $zero
/* 904A0 8009FCA0 21284002 */  addu       $a1, $s2, $zero
/* 904A4 8009FCA4 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 904A8 8009FCA8 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 904AC 8009FCAC C1CA010C */  jal        StateSwitchStateData
/* 904B0 8009FCB0 21384000 */   addu      $a3, $v0, $zero
/* 904B4 8009FCB4 12004016 */  bnez       $s2, .L8009FD00
/* 904B8 8009FCB8 2120D102 */   addu      $a0, $s6, $s1
/* 904BC 8009FCBC 0000258E */  lw         $a1, 0x0($s1)
/* 904C0 8009FCC0 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 904C4 8009FCC4 F170000C */  jal        CAMERA_ChangeToOutOfWater
/* 904C8 8009FCC8 00000000 */   nop
/* 904CC 8009FCCC 407F0208 */  j          .L8009FD00
/* 904D0 8009FCD0 2120D102 */   addu      $a0, $s6, $s1
.L8009FCD4:
/* 904D4 8009FCD4 09004016 */  bnez       $s2, .L8009FCFC
/* 904D8 8009FCD8 00000000 */   nop
/* 904DC 8009FCDC 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 904E0 8009FCE0 0400838C */  lw         $v1, 0x4($a0)
/* 904E4 8009FCE4 00084230 */  andi       $v0, $v0, 0x800
/* 904E8 8009FCE8 04004010 */  beqz       $v0, .L8009FCFC
/* 904EC 8009FCEC 00000000 */   nop
/* 904F0 8009FCF0 0C00648C */  lw         $a0, 0xC($v1)
/* 904F4 8009FCF4 7391020C */  jal        LoseHealth
/* 904F8 8009FCF8 00000000 */   nop
.L8009FCFC:
/* 904FC 8009FCFC 2120D102 */  addu       $a0, $s6, $s1
.L8009FD00:
/* 90500 8009FD00 27C3010C */  jal        DeMessageQueue
/* 90504 8009FD04 0C008424 */   addiu     $a0, $a0, 0xC
/* 90508 8009FD08 C77D0208 */  j          .L8009F71C
/* 9050C 8009FD0C 2120D102 */   addu      $a0, $s6, $s1
.L8009FD10:
/* 90510 8009FD10 01000224 */  addiu      $v0, $zero, 0x1
/* 90514 8009FD14 0A004216 */  bne        $s2, $v0, .L8009FD40
/* 90518 8009FD18 02000224 */   addiu     $v0, $zero, 0x2
/* 9051C 8009FD1C 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 90520 8009FD20 00000000 */  nop
/* 90524 8009FD24 01004230 */  andi       $v0, $v0, 0x1
/* 90528 8009FD28 04004010 */  beqz       $v0, .L8009FD3C
/* 9052C 8009FD2C 03000424 */   addiu     $a0, $zero, 0x3
/* 90530 8009FD30 01000524 */  addiu      $a1, $zero, 0x1
/* 90534 8009FD34 8B9D020C */  jal        razLaunchBubbles
/* 90538 8009FD38 21300000 */   addu      $a2, $zero, $zero
.L8009FD3C:
/* 9053C 8009FD3C 02000224 */  addiu      $v0, $zero, 0x2
.L8009FD40:
/* 90540 8009FD40 2F004216 */  bne        $s2, $v0, .L8009FE00
/* 90544 8009FD44 00000000 */   nop
/* 90548 8009FD48 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 9054C 8009FD4C 00000000 */  nop
/* 90550 8009FD50 02004230 */  andi       $v0, $v0, 0x2
/* 90554 8009FD54 07004010 */  beqz       $v0, .L8009FD74
/* 90558 8009FD58 00000000 */   nop
/* 9055C 8009FD5C E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 90560 8009FD60 0000248E */  lw         $a0, 0x0($s1)
/* 90564 8009FD64 8C00458C */  lw         $a1, 0x8C($v0)
/* 90568 8009FD68 9000468C */  lw         $a2, 0x90($v0)
/* 9056C 8009FD6C DF9B020C */  jal        razSetSwimVelocity
/* 90570 8009FD70 00000000 */   nop
.L8009FD74:
/* 90574 8009FD74 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 90578 8009FD78 00000000 */  nop
/* 9057C 8009FD7C 0000448C */  lw         $a0, 0x0($v0)
/* 90580 8009FD80 90A4828F */  lw         $v0, %gp_rel(RazielCommands + 0xC)($gp)
/* 90584 8009FD84 00000000 */  nop
/* 90588 8009FD88 24108200 */  and        $v0, $a0, $v0
/* 9058C 8009FD8C 1C004010 */  beqz       $v0, .L8009FE00
/* 90590 8009FD90 06000224 */   addiu     $v0, $zero, 0x6
/* 90594 8009FD94 B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* 90598 8009FD98 00000000 */  nop
/* 9059C 8009FD9C 18006214 */  bne        $v1, $v0, .L8009FE00
/* 905A0 8009FDA0 01008230 */   andi      $v0, $a0, 0x1
/* 905A4 8009FDA4 16004010 */  beqz       $v0, .L8009FE00
/* 905A8 8009FDA8 21202002 */   addu      $a0, $s1, $zero
/* 905AC 8009FDAC 40000524 */  addiu      $a1, $zero, 0x40
/* 905B0 8009FDB0 21300000 */  addu       $a2, $zero, $zero
/* 905B4 8009FDB4 03000724 */  addiu      $a3, $zero, 0x3
/* 905B8 8009FDB8 01000224 */  addiu      $v0, $zero, 0x1
/* 905BC 8009FDBC FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 905C0 8009FDC0 1000A2AF */   sw        $v0, 0x10($sp)
/* 905C4 8009FDC4 21202002 */  addu       $a0, $s1, $zero
/* 905C8 8009FDC8 0A80053C */  lui        $a1, %hi(StateHandlerSwimDiveIn)
/* 905CC 8009FDCC 80FEA524 */  addiu      $a1, $a1, %lo(StateHandlerSwimDiveIn)
/* 905D0 8009FDD0 F4CA010C */  jal        StateSwitchStateCharacterData
/* 905D4 8009FDD4 21300000 */   addu      $a2, $zero, $zero
/* 905D8 8009FDD8 E8FB828F */  lw         $v0, %gp_rel(PlayerData)($gp)
/* 905DC 8009FDDC 0000248E */  lw         $a0, 0x0($s1)
/* 905E0 8009FDE0 8C00458C */  lw         $a1, 0x8C($v0)
/* 905E4 8009FDE4 9000468C */  lw         $a2, 0x90($v0)
/* 905E8 8009FDE8 DF9B020C */  jal        razSetSwimVelocity
/* 905EC 8009FDEC 00000000 */   nop
/* 905F0 8009FDF0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 905F4 8009FDF4 FFFB0324 */  addiu      $v1, $zero, -0x401
/* 905F8 8009FDF8 24104300 */  and        $v0, $v0, $v1
/* 905FC 8009FDFC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L8009FE00:
/* 90600 8009FE00 14004016 */  bnez       $s2, .L8009FE54
/* 90604 8009FE04 00000000 */   nop
/* 90608 8009FE08 E8FB848F */  lw         $a0, %gp_rel(PlayerData)($gp)
/* 9060C 8009FE0C 40FB8387 */  lh         $v1, %gp_rel(Raziel + 0x510)($gp)
/* 90610 8009FE10 9800828C */  lw         $v0, 0x98($a0)
/* 90614 8009FE14 00000000 */  nop
/* 90618 8009FE18 2A104300 */  slt        $v0, $v0, $v1
/* 9061C 8009FE1C 04004010 */  beqz       $v0, .L8009FE30
/* 90620 8009FE20 00000000 */   nop
/* 90624 8009FE24 98008294 */  lhu        $v0, 0x98($a0)
/* 90628 8009FE28 00000000 */  nop
/* 9062C 8009FE2C 40FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x510)($gp)
.L8009FE30:
/* 90630 8009FE30 40FB8287 */  lh         $v0, %gp_rel(Raziel + 0x510)($gp)
/* 90634 8009FE34 9400838C */  lw         $v1, 0x94($a0)
/* 90638 8009FE38 00000000 */  nop
/* 9063C 8009FE3C 2A104300 */  slt        $v0, $v0, $v1
/* 90640 8009FE40 04004010 */  beqz       $v0, .L8009FE54
/* 90644 8009FE44 00000000 */   nop
/* 90648 8009FE48 94008294 */  lhu        $v0, 0x94($a0)
/* 9064C 8009FE4C 00000000 */  nop
/* 90650 8009FE50 40FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x510)($gp)
.L8009FE54:
/* 90654 8009FE54 3800BF8F */  lw         $ra, 0x38($sp)
/* 90658 8009FE58 3400B78F */  lw         $s7, 0x34($sp)
/* 9065C 8009FE5C 3000B68F */  lw         $s6, 0x30($sp)
/* 90660 8009FE60 2C00B58F */  lw         $s5, 0x2C($sp)
/* 90664 8009FE64 2800B48F */  lw         $s4, 0x28($sp)
/* 90668 8009FE68 2400B38F */  lw         $s3, 0x24($sp)
/* 9066C 8009FE6C 2000B28F */  lw         $s2, 0x20($sp)
/* 90670 8009FE70 1C00B18F */  lw         $s1, 0x1C($sp)
/* 90674 8009FE74 1800B08F */  lw         $s0, 0x18($sp)
/* 90678 8009FE78 0800E003 */  jr         $ra
/* 9067C 8009FE7C 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerSwimTread, . - StateHandlerSwimTread
