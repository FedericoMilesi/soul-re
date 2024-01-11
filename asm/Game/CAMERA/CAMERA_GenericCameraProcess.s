.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_GenericCameraProcess
/* A768 80019F68 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* A76C 80019F6C 2800B0AF */  sw         $s0, 0x28($sp)
/* A770 80019F70 21808000 */  addu       $s0, $a0, $zero
/* A774 80019F74 0100033C */  lui        $v1, (0x10000 >> 16)
/* A778 80019F78 3400BFAF */  sw         $ra, 0x34($sp)
/* A77C 80019F7C 3000B2AF */  sw         $s2, 0x30($sp)
/* A780 80019F80 2C00B1AF */  sw         $s1, 0x2C($sp)
/* A784 80019F84 E800028E */  lw         $v0, 0xE8($s0)
/* A788 80019F88 0801118E */  lw         $s1, 0x108($s0)
/* A78C 80019F8C 24104300 */  and        $v0, $v0, $v1
/* A790 80019F90 06004014 */  bnez       $v0, .L80019FAC
/* A794 80019F94 40000224 */   addiu     $v0, $zero, 0x40
/* A798 80019F98 9C04028E */  lw         $v0, 0x49C($s0)
/* A79C 80019F9C 0004033C */  lui        $v1, (0x4000000 >> 16)
/* A7A0 80019FA0 24104300 */  and        $v0, $v0, $v1
/* A7A4 80019FA4 02004010 */  beqz       $v0, .L80019FB0
/* A7A8 80019FA8 40000224 */   addiu     $v0, $zero, 0x40
.L80019FAC:
/* A7AC 80019FAC 880102A6 */  sh         $v0, 0x188($s0)
.L80019FB0:
/* A7B0 80019FB0 9C04028E */  lw         $v0, 0x49C($s0)
/* A7B4 80019FB4 0002033C */  lui        $v1, (0x2000000 >> 16)
/* A7B8 80019FB8 24104300 */  and        $v0, $v0, $v1
/* A7BC 80019FBC 02004014 */  bnez       $v0, .L80019FC8
/* A7C0 80019FC0 00080224 */   addiu     $v0, $zero, 0x800
/* A7C4 80019FC4 D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
.L80019FC8:
/* A7C8 80019FC8 0D5A000C */  jal        CAMERA_SetMaxVel
/* A7CC 80019FCC 21200002 */   addu      $a0, $s0, $zero
/* A7D0 80019FD0 21200002 */  addu       $a0, $s0, $zero
/* A7D4 80019FD4 AA011226 */  addiu      $s2, $s0, 0x1AA
/* A7D8 80019FD8 B95A000C */  jal        CAMERA_SetFocus
/* A7DC 80019FDC 21284002 */   addu      $a1, $s2, $zero
/* A7E0 80019FE0 E800028E */  lw         $v0, 0xE8($s0)
/* A7E4 80019FE4 0100033C */  lui        $v1, (0x10000 >> 16)
/* A7E8 80019FE8 24104300 */  and        $v0, $v0, $v1
/* A7EC 80019FEC 06004014 */  bnez       $v0, .L8001A008
/* A7F0 80019FF0 21200002 */   addu      $a0, $s0, $zero
/* A7F4 80019FF4 9C04028E */  lw         $v0, 0x49C($s0)
/* A7F8 80019FF8 0004033C */  lui        $v1, (0x4000000 >> 16)
/* A7FC 80019FFC 24104300 */  and        $v0, $v0, $v1
/* A800 8001A000 05004010 */  beqz       $v0, .L8001A018
/* A804 8001A004 00000000 */   nop
.L8001A008:
/* A808 8001A008 9672000C */  jal        CAMERA_FollowPlayerTilt
/* A80C 8001A00C 21282002 */   addu      $a1, $s1, $zero
/* A810 8001A010 3B680008 */  j          .L8001A0EC
/* A814 8001A014 00000000 */   nop
.L8001A018:
/* A818 8001A018 F771000C */  jal        CAMERA_UpdateFocusRotationX
/* A81C 8001A01C 21282002 */   addu      $a1, $s1, $zero
/* A820 8001A020 F0000386 */  lh         $v1, 0xF0($s0)
/* A824 8001A024 0D000224 */  addiu      $v0, $zero, 0xD
/* A828 8001A028 30006214 */  bne        $v1, $v0, .L8001A0EC
/* A82C 8001A02C 00000000 */   nop
/* A830 8001A030 A004028E */  lw         $v0, 0x4A0($s0)
/* A834 8001A034 00000000 */  nop
/* A838 8001A038 2C004018 */  blez       $v0, .L8001A0EC
/* A83C 8001A03C 0082023C */   lui       $v0, (0x82000400 >> 16)
/* A840 8001A040 9C04048E */  lw         $a0, 0x49C($s0)
/* A844 8001A044 00044234 */  ori        $v0, $v0, (0x82000400 & 0xFFFF)
/* A848 8001A048 24108200 */  and        $v0, $a0, $v0
/* A84C 8001A04C 27004014 */  bnez       $v0, .L8001A0EC
/* A850 8001A050 00000000 */   nop
/* A854 8001A054 AE040286 */  lh         $v0, 0x4AE($s0)
/* A858 8001A058 00000000 */  nop
/* A85C 8001A05C 23004014 */  bnez       $v0, .L8001A0EC
/* A860 8001A060 03000224 */   addiu     $v0, $zero, 0x3
/* A864 8001A064 F6000386 */  lh         $v1, 0xF6($s0)
/* A868 8001A068 00000000 */  nop
/* A86C 8001A06C 1F006210 */  beq        $v1, $v0, .L8001A0EC
/* A870 8001A070 00208230 */   andi      $v0, $a0, 0x2000
/* A874 8001A074 1D004014 */  bnez       $v0, .L8001A0EC
/* A878 8001A078 01000224 */   addiu     $v0, $zero, 0x1
/* A87C 8001A07C 8FBF8393 */  lbu        $v1, %gp_rel(gameTrackerX + 0x1C7)($gp)
/* A880 8001A080 00000000 */  nop
/* A884 8001A084 19006210 */  beq        $v1, $v0, .L8001A0EC
/* A888 8001A088 2000A427 */   addiu     $a0, $sp, 0x20
/* A88C 8001A08C 21284002 */  addu       $a1, $s2, $zero
/* A890 8001A090 C45E000C */  jal        CAMERA_CalcRotation
/* A894 8001A094 21300002 */   addu      $a2, $s0, $zero
/* A898 8001A098 2400A487 */  lh         $a0, 0x24($sp)
/* A89C 8001A09C 40010586 */  lh         $a1, 0x140($s0)
/* A8A0 8001A0A0 DA59000C */  jal        CAMERA_SignedAngleDifference
/* A8A4 8001A0A4 00000000 */   nop
/* A8A8 8001A0A8 9C04038E */  lw         $v1, 0x49C($s0)
/* A8AC 8001A0AC 00000000 */  nop
/* A8B0 8001A0B0 02006330 */  andi       $v1, $v1, 0x2
/* A8B4 8001A0B4 04006010 */  beqz       $v1, .L8001A0C8
/* A8B8 8001A0B8 21204000 */   addu      $a0, $v0, $zero
/* A8BC 8001A0BC 00140400 */  sll        $v0, $a0, 16
/* A8C0 8001A0C0 37680008 */  j          .L8001A0DC
/* A8C4 8001A0C4 43240200 */   sra       $a0, $v0, 17
.L8001A0C8:
/* A8C8 8001A0C8 001C0400 */  sll        $v1, $a0, 16
/* A8CC 8001A0CC 031C0300 */  sra        $v1, $v1, 16
/* A8D0 8001A0D0 40100300 */  sll        $v0, $v1, 1
/* A8D4 8001A0D4 21104300 */  addu       $v0, $v0, $v1
/* A8D8 8001A0D8 82200200 */  srl        $a0, $v0, 2
.L8001A0DC:
/* A8DC 8001A0DC 40010296 */  lhu        $v0, 0x140($s0)
/* A8E0 8001A0E0 00000000 */  nop
/* A8E4 8001A0E4 21104400 */  addu       $v0, $v0, $a0
/* A8E8 8001A0E8 B60102A6 */  sh         $v0, 0x1B6($s0)
.L8001A0EC:
/* A8EC 8001A0EC 9C04038E */  lw         $v1, 0x49C($s0)
/* A8F0 8001A0F0 00000000 */  nop
/* A8F4 8001A0F4 16006104 */  bgez       $v1, .L8001A150
/* A8F8 8001A0F8 00000000 */   nop
/* A8FC 8001A0FC 019F020C */  jal        RAZIEL_QueryEngagedInstance
/* A900 8001A100 0E000424 */   addiu     $a0, $zero, 0xE
/* A904 8001A104 4F004010 */  beqz       $v0, .L8001A244
/* A908 8001A108 940F0324 */   addiu     $v1, $zero, 0xF94
/* A90C 8001A10C 78004284 */  lh         $v0, 0x78($v0)
/* A910 8001A110 BA0103A6 */  sh         $v1, 0x1BA($s0)
/* A914 8001A114 40000324 */  addiu      $v1, $zero, 0x40
/* A918 8001A118 880103A6 */  sh         $v1, 0x188($s0)
/* A91C 8001A11C 08000324 */  addiu      $v1, $zero, 0x8
/* A920 8001A120 C40103A6 */  sh         $v1, 0x1C4($s0)
/* A924 8001A124 01000324 */  addiu      $v1, $zero, 0x1
/* A928 8001A128 AE0403A6 */  sh         $v1, 0x4AE($s0)
/* A92C 8001A12C 080400A6 */  sh         $zero, 0x408($s0)
/* A930 8001A130 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* A934 8001A134 FFFB4224 */  addiu      $v0, $v0, -0x401
/* A938 8001A138 FF07422C */  sltiu      $v0, $v0, 0x7FF
/* A93C 8001A13C 01004238 */  xori       $v0, $v0, 0x1
/* A940 8001A140 C0120200 */  sll        $v0, $v0, 11
/* A944 8001A144 C00102A6 */  sh         $v0, 0x1C0($s0)
/* A948 8001A148 91680008 */  j          .L8001A244
/* A94C 8001A14C B60102A6 */   sh        $v0, 0x1B6($s0)
.L8001A150:
/* A950 8001A150 E800048E */  lw         $a0, 0xE8($s0)
/* A954 8001A154 00000000 */  nop
/* A958 8001A158 00208230 */  andi       $v0, $a0, 0x2000
/* A95C 8001A15C 05004014 */  bnez       $v0, .L8001A174
/* A960 8001A160 0002023C */   lui       $v0, (0x2000000 >> 16)
/* A964 8001A164 0020023C */  lui        $v0, (0x20000000 >> 16)
/* A968 8001A168 24106200 */  and        $v0, $v1, $v0
/* A96C 8001A16C 06004010 */  beqz       $v0, .L8001A188
/* A970 8001A170 0002023C */   lui       $v0, (0x2000000 >> 16)
.L8001A174:
/* A974 8001A174 24106200 */  and        $v0, $v1, $v0
/* A978 8001A178 32004014 */  bnez       $v0, .L8001A244
/* A97C 8001A17C 40000224 */   addiu     $v0, $zero, 0x40
/* A980 8001A180 69680008 */  j          .L8001A1A4
/* A984 8001A184 880102A6 */   sh        $v0, 0x188($s0)
.L8001A188:
/* A988 8001A188 0100023C */  lui        $v0, (0x10000 >> 16)
/* A98C 8001A18C 24108200 */  and        $v0, $a0, $v0
/* A990 8001A190 04004014 */  bnez       $v0, .L8001A1A4
/* A994 8001A194 0004023C */   lui       $v0, (0x4000000 >> 16)
/* A998 8001A198 24106200 */  and        $v0, $v1, $v0
/* A99C 8001A19C 05004010 */  beqz       $v0, .L8001A1B4
/* A9A0 8001A1A0 00046230 */   andi      $v0, $v1, 0x400
.L8001A1A4:
/* A9A4 8001A1A4 5973000C */  jal        CAMERA_FollowGoBehindPlayer
/* A9A8 8001A1A8 21200002 */   addu      $a0, $s0, $zero
/* A9AC 8001A1AC 91680008 */  j          .L8001A244
/* A9B0 8001A1B0 00000000 */   nop
.L8001A1B4:
/* A9B4 8001A1B4 21004010 */  beqz       $v0, .L8001A23C
/* A9B8 8001A1B8 00000000 */   nop
/* A9BC 8001A1BC 9804028E */  lw         $v0, 0x498($s0)
/* A9C0 8001A1C0 00000000 */  nop
/* A9C4 8001A1C4 00044230 */  andi       $v0, $v0, 0x400
/* A9C8 8001A1C8 1C004014 */  bnez       $v0, .L8001A23C
/* A9CC 8001A1CC 00000000 */   nop
/* A9D0 8001A1D0 B4000386 */  lh         $v1, 0xB4($s0)
/* A9D4 8001A1D4 00000000 */  nop
/* A9D8 8001A1D8 02006104 */  bgez       $v1, .L8001A1E4
/* A9DC 8001A1DC 21106000 */   addu      $v0, $v1, $zero
/* A9E0 8001A1E0 FF036224 */  addiu      $v0, $v1, 0x3FF
.L8001A1E4:
/* A9E4 8001A1E4 83120200 */  sra        $v0, $v0, 10
/* A9E8 8001A1E8 80120200 */  sll        $v0, $v0, 10
/* A9EC 8001A1EC 23106200 */  subu       $v0, $v1, $v0
/* A9F0 8001A1F0 00140200 */  sll        $v0, $v0, 16
/* A9F4 8001A1F4 031C0200 */  sra        $v1, $v0, 16
/* A9F8 8001A1F8 01026228 */  slti       $v0, $v1, 0x201
/* A9FC 8001A1FC 03004014 */  bnez       $v0, .L8001A20C
/* AA00 8001A200 00040224 */   addiu     $v0, $zero, 0x400
/* AA04 8001A204 84680008 */  j          .L8001A210
/* AA08 8001A208 23184300 */   subu      $v1, $v0, $v1
.L8001A20C:
/* AA0C 8001A20C 23180300 */  negu       $v1, $v1
.L8001A210:
/* AA10 8001A210 02006104 */  bgez       $v1, .L8001A21C
/* AA14 8001A214 21106000 */   addu      $v0, $v1, $zero
/* AA18 8001A218 23100200 */  negu       $v0, $v0
.L8001A21C:
/* AA1C 8001A21C 81004228 */  slti       $v0, $v0, 0x81
/* AA20 8001A220 06004014 */  bnez       $v0, .L8001A23C
/* AA24 8001A224 00000000 */   nop
/* AA28 8001A228 B4000286 */  lh         $v0, 0xB4($s0)
/* AA2C 8001A22C 00000000 */  nop
/* AA30 8001A230 21186200 */  addu       $v1, $v1, $v0
/* AA34 8001A234 FF0F6330 */  andi       $v1, $v1, 0xFFF
/* AA38 8001A238 B60103A6 */  sh         $v1, 0x1B6($s0)
.L8001A23C:
/* AA3C 8001A23C 1A73000C */  jal        CAMERA_FollowGoBehindPlayerWithTimer
/* AA40 8001A240 21200002 */   addu      $a0, $s0, $zero
.L8001A244:
/* AA44 8001A244 E800028E */  lw         $v0, 0xE8($s0)
/* AA48 8001A248 00000000 */  nop
/* AA4C 8001A24C 00184230 */  andi       $v0, $v0, 0x1800
/* AA50 8001A250 16004014 */  bnez       $v0, .L8001A2AC
/* AA54 8001A254 0002033C */   lui       $v1, (0x2000000 >> 16)
/* AA58 8001A258 9C04028E */  lw         $v0, 0x49C($s0)
/* AA5C 8001A25C 00000000 */  nop
/* AA60 8001A260 24104300 */  and        $v0, $v0, $v1
/* AA64 8001A264 06004010 */  beqz       $v0, .L8001A280
/* AA68 8001A268 1800A427 */   addiu     $a0, $sp, 0x18
/* AA6C 8001A26C 2967000C */  jal        CAMERA_CombatCamDist
/* AA70 8001A270 21200002 */   addu      $a0, $s0, $zero
/* AA74 8001A274 D4AB8787 */  lh         $a3, %gp_rel(combat_cam_distance)($gp)
/* AA78 8001A278 A3680008 */  j          .L8001A28C
/* AA7C 8001A27C 1800A427 */   addiu     $a0, $sp, 0x18
.L8001A280:
/* AA80 8001A280 A8010786 */  lh         $a3, 0x1A8($s0)
/* AA84 8001A284 00000000 */  nop
/* AA88 8001A288 D4AB87A7 */  sh         $a3, %gp_rel(combat_cam_distance)($gp)
.L8001A28C:
/* AA8C 8001A28C 00010526 */  addiu      $a1, $s0, 0x100
/* AA90 8001A290 6F5A000C */  jal        CAMERA_CalcPosition
/* AA94 8001A294 3C010626 */   addiu     $a2, $s0, 0x13C
/* AA98 8001A298 21200002 */  addu       $a0, $s0, $zero
/* AA9C 8001A29C 1800A527 */  addiu      $a1, $sp, 0x18
/* AAA0 8001A2A0 6175000C */  jal        CAMERA_DoCameraCollision2
/* AAA4 8001A2A4 21300000 */   addu      $a2, $zero, $zero
/* AAA8 8001A2A8 800402AE */  sw         $v0, 0x480($s0)
.L8001A2AC:
/* AAAC 8001A2AC 9C04028E */  lw         $v0, 0x49C($s0)
/* AAB0 8001A2B0 00000000 */  nop
/* AAB4 8001A2B4 02004104 */  bgez       $v0, .L8001A2C0
/* AAB8 8001A2B8 D0070224 */   addiu     $v0, $zero, 0x7D0
/* AABC 8001A2BC B00102A6 */  sh         $v0, 0x1B0($s0)
.L8001A2C0:
/* AAC0 8001A2C0 0E71000C */  jal        CAMERA_UpdateFocusDistance
/* AAC4 8001A2C4 21200002 */   addu      $a0, $s0, $zero
/* AAC8 8001A2C8 4271000C */  jal        CAMERA_UpdateFocusTilt
/* AACC 8001A2CC 21200002 */   addu      $a0, $s0, $zero
/* AAD0 8001A2D0 BC71000C */  jal        CAMERA_UpdateFocusRotate
/* AAD4 8001A2D4 21200002 */   addu      $a0, $s0, $zero
/* AAD8 8001A2D8 E800028E */  lw         $v0, 0xE8($s0)
/* AADC 8001A2DC 00000000 */  nop
/* AAE0 8001A2E0 00184230 */  andi       $v0, $v0, 0x1800
/* AAE4 8001A2E4 12004010 */  beqz       $v0, .L8001A330
/* AAE8 8001A2E8 AA010226 */   addiu     $v0, $s0, 0x1AA
/* AAEC 8001A2EC AA010396 */  lhu        $v1, 0x1AA($s0)
/* AAF0 8001A2F0 02004494 */  lhu        $a0, 0x2($v0)
/* AAF4 8001A2F4 04004594 */  lhu        $a1, 0x4($v0)
/* AAF8 8001A2F8 00010226 */  addiu      $v0, $s0, 0x100
/* AAFC 8001A2FC 000103A6 */  sh         $v1, 0x100($s0)
/* AB00 8001A300 020044A4 */  sh         $a0, 0x2($v0)
/* AB04 8001A304 040045A4 */  sh         $a1, 0x4($v0)
/* AB08 8001A308 E800028E */  lw         $v0, 0xE8($s0)
/* AB0C 8001A30C A8010396 */  lhu        $v1, 0x1A8($s0)
/* AB10 8001A310 00104230 */  andi       $v0, $v0, 0x1000
/* AB14 8001A314 26004010 */  beqz       $v0, .L8001A3B0
/* AB18 8001A318 060103A6 */   sh        $v1, 0x106($s0)
/* AB1C 8001A31C 88040586 */  lh         $a1, 0x488($s0)
/* AB20 8001A320 9358000C */  jal        CAMERA_SetZRotation
/* AB24 8001A324 21200002 */   addu      $a0, $s0, $zero
/* AB28 8001A328 ED680008 */  j          .L8001A3B4
/* AB2C 8001A32C 21200002 */   addu      $a0, $s0, $zero
.L8001A330:
/* AB30 8001A330 AD01088A */  lwl        $t0, 0x1AD($s0)
/* AB34 8001A334 AA01089A */  lwr        $t0, 0x1AA($s0)
/* AB38 8001A338 AE010986 */  lh         $t1, 0x1AE($s0)
/* AB3C 8001A33C 2300A8AB */  swl        $t0, 0x23($sp)
/* AB40 8001A340 2000A8BB */  swr        $t0, 0x20($sp)
/* AB44 8001A344 2400A9A7 */  sh         $t1, 0x24($sp)
/* AB48 8001A348 E800028E */  lw         $v0, 0xE8($s0)
/* AB4C 8001A34C 0100113C */  lui        $s1, (0x10000 >> 16)
/* AB50 8001A350 24105100 */  and        $v0, $v0, $s1
/* AB54 8001A354 04004014 */  bnez       $v0, .L8001A368
/* AB58 8001A358 2000A627 */   addiu     $a2, $sp, 0x20
/* AB5C 8001A35C 04010296 */  lhu        $v0, 0x104($s0)
/* AB60 8001A360 00000000 */  nop
/* AB64 8001A364 2400A2A7 */  sh         $v0, 0x24($sp)
.L8001A368:
/* AB68 8001A368 01000424 */  addiu      $a0, $zero, 0x1
/* AB6C 8001A36C 00010526 */  addiu      $a1, $s0, 0x100
/* AB70 8001A370 60010226 */  addiu      $v0, $s0, 0x160
/* AB74 8001A374 1000A2AF */  sw         $v0, 0x10($sp)
/* AB78 8001A378 94010286 */  lh         $v0, 0x194($s0)
/* AB7C 8001A37C 58010726 */  addiu      $a3, $s0, 0x158
/* AB80 8001A380 CD5C000C */  jal        CriticalDampPosition
/* AB84 8001A384 1400A2AF */   sw        $v0, 0x14($sp)
/* AB88 8001A388 E800028E */  lw         $v0, 0xE8($s0)
/* AB8C 8001A38C 00000000 */  nop
/* AB90 8001A390 24105100 */  and        $v0, $v0, $s1
/* AB94 8001A394 06004014 */  bnez       $v0, .L8001A3B0
/* AB98 8001A398 00000000 */   nop
/* AB9C 8001A39C 04010586 */  lh         $a1, 0x104($s0)
/* ABA0 8001A3A0 AE010686 */  lh         $a2, 0x1AE($s0)
/* ABA4 8001A3A4 8D66000C */  jal        CAMERA_update_z_damped
/* ABA8 8001A3A8 21200002 */   addu      $a0, $s0, $zero
/* ABAC 8001A3AC 040102A6 */  sh         $v0, 0x104($s0)
.L8001A3B0:
/* ABB0 8001A3B0 21200002 */  addu       $a0, $s0, $zero
.L8001A3B4:
/* ABB4 8001A3B4 D273000C */  jal        CAMERA_CalcFollowPosition
/* ABB8 8001A3B8 3C010526 */   addiu     $a1, $s0, 0x13C
/* ABBC 8001A3BC 6873000C */  jal        CAMERA_CalculateLead
/* ABC0 8001A3C0 21200002 */   addu      $a0, $s0, $zero
/* ABC4 8001A3C4 7571000C */  jal        CAMERA_UpdateFocusRoll
/* ABC8 8001A3C8 21200002 */   addu      $a0, $s0, $zero
/* ABCC 8001A3CC 3400BF8F */  lw         $ra, 0x34($sp)
/* ABD0 8001A3D0 3000B28F */  lw         $s2, 0x30($sp)
/* ABD4 8001A3D4 2C00B18F */  lw         $s1, 0x2C($sp)
/* ABD8 8001A3D8 2800B08F */  lw         $s0, 0x28($sp)
/* ABDC 8001A3DC 0800E003 */  jr         $ra
/* ABE0 8001A3E0 3800BD27 */   addiu     $sp, $sp, 0x38
.size CAMERA_GenericCameraProcess, . - CAMERA_GenericCameraProcess
