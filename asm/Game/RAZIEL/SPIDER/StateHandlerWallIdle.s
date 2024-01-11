.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerWallIdle
/* 917F8 800A0FF8 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 917FC 800A0FFC 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 91800 800A1000 21888000 */  addu       $s1, $a0, $zero
/* 91804 800A1004 3000B2AF */  sw         $s2, 0x30($sp)
/* 91808 800A1008 2190A000 */  addu       $s2, $a1, $zero
/* 9180C 800A100C 4400B7AF */  sw         $s7, 0x44($sp)
/* 91810 800A1010 21B8C000 */  addu       $s7, $a2, $zero
/* 91814 800A1014 4000B6AF */  sw         $s6, 0x40($sp)
/* 91818 800A1018 01001624 */  addiu      $s6, $zero, 0x1
/* 9181C 800A101C 4800BFAF */  sw         $ra, 0x48($sp)
/* 91820 800A1020 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 91824 800A1024 3800B4AF */  sw         $s4, 0x38($sp)
/* 91828 800A1028 3400B3AF */  sw         $s3, 0x34($sp)
/* 9182C 800A102C A9C9010C */  jal        G2EmulationQueryAnimation
/* 91830 800A1030 2800B0AF */   sw        $s0, 0x28($sp)
/* 91834 800A1034 21984000 */  addu       $s3, $v0, $zero
/* 91838 800A1038 C0101200 */  sll        $v0, $s2, 3
/* 9183C 800A103C 21105200 */  addu       $v0, $v0, $s2
/* 91840 800A1040 C0100200 */  sll        $v0, $v0, 3
/* 91844 800A1044 23105200 */  subu       $v0, $v0, $s2
/* 91848 800A1048 80100200 */  sll        $v0, $v0, 2
/* 9184C 800A104C 08004224 */  addiu      $v0, $v0, 0x8
/* 91850 800A1050 21A82202 */  addu       $s5, $s1, $v0
/* 91854 800A1054 02001424 */  addiu      $s4, $zero, 0x2
.L800A1058:
/* 91858 800A1058 39C3010C */  jal        PeekMessageQueue
/* 9185C 800A105C 0400A426 */   addiu     $a0, $s5, 0x4
/* 91860 800A1060 21804000 */  addu       $s0, $v0, $zero
/* 91864 800A1064 95010012 */  beqz       $s0, .L800A16BC
/* 91868 800A1068 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9186C 800A106C 0000038E */  lw         $v1, 0x0($s0)
/* 91870 800A1070 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 91874 800A1074 8D016210 */  beq        $v1, $v0, .L800A16AC
/* 91878 800A1078 2A104300 */   slt       $v0, $v0, $v1
/* 9187C 800A107C 1F004014 */  bnez       $v0, .L800A10FC
/* 91880 800A1080 0104023C */   lui       $v0, (0x4010011 >> 16)
/* 91884 800A1084 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 91888 800A1088 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 9188C 800A108C 87016210 */  beq        $v1, $v0, .L800A16AC
/* 91890 800A1090 2A104300 */   slt       $v0, $v0, $v1
/* 91894 800A1094 0C004014 */  bnez       $v0, .L800A10C8
/* 91898 800A1098 1000023C */   lui       $v0, (0x100000 >> 16)
/* 9189C 800A109C 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 918A0 800A10A0 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 918A4 800A10A4 69006210 */  beq        $v1, $v0, .L800A124C
/* 918A8 800A10A8 2A106200 */   slt       $v0, $v1, $v0
/* 918AC 800A10AC 7F014014 */  bnez       $v0, .L800A16AC
/* 918B0 800A10B0 0080023C */   lui       $v0, (0x80000008 >> 16)
/* 918B4 800A10B4 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 918B8 800A10B8 7C016210 */  beq        $v1, $v0, .L800A16AC
/* 918BC 800A10BC 21202002 */   addu      $a0, $s1, $zero
/* 918C0 800A10C0 A9850208 */  j          .L800A16A4
/* 918C4 800A10C4 21284002 */   addu      $a1, $s2, $zero
.L800A10C8:
/* 918C8 800A10C8 62016210 */  beq        $v1, $v0, .L800A1654
/* 918CC 800A10CC 2A104300 */   slt       $v0, $v0, $v1
/* 918D0 800A10D0 05004014 */  bnez       $v0, .L800A10E8
/* 918D4 800A10D4 1000023C */   lui       $v0, (0x100001 >> 16)
/* 918D8 800A10D8 74016010 */  beqz       $v1, .L800A16AC
/* 918DC 800A10DC 21202002 */   addu      $a0, $s1, $zero
/* 918E0 800A10E0 A9850208 */  j          .L800A16A4
/* 918E4 800A10E4 21284002 */   addu      $a1, $s2, $zero
.L800A10E8:
/* 918E8 800A10E8 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 918EC 800A10EC 26006210 */  beq        $v1, $v0, .L800A1188
/* 918F0 800A10F0 21202002 */   addu      $a0, $s1, $zero
/* 918F4 800A10F4 A9850208 */  j          .L800A16A4
/* 918F8 800A10F8 21284002 */   addu      $a1, $s2, $zero
.L800A10FC:
/* 918FC 800A10FC 11004234 */  ori        $v0, $v0, (0x4010011 & 0xFFFF)
/* 91900 800A1100 B5006210 */  beq        $v1, $v0, .L800A13D8
/* 91904 800A1104 2A104300 */   slt       $v0, $v0, $v1
/* 91908 800A1108 11004014 */  bnez       $v0, .L800A1150
/* 9190C 800A110C 0008023C */   lui       $v0, (0x8000001 >> 16)
/* 91910 800A1110 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 91914 800A1114 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 91918 800A1118 64016210 */  beq        $v1, $v0, .L800A16AC
/* 9191C 800A111C 2A104300 */   slt       $v0, $v0, $v1
/* 91920 800A1120 06004014 */  bnez       $v0, .L800A113C
/* 91924 800A1124 0004023C */   lui       $v0, (0x4000004 >> 16)
/* 91928 800A1128 0001023C */  lui        $v0, (0x1000004 >> 16)
/* 9192C 800A112C 3D006210 */  beq        $v1, $v0, .L800A1224
/* 91930 800A1130 21202002 */   addu      $a0, $s1, $zero
/* 91934 800A1134 A9850208 */  j          .L800A16A4
/* 91938 800A1138 21284002 */   addu      $a1, $s2, $zero
.L800A113C:
/* 9193C 800A113C 04004234 */  ori        $v0, $v0, (0x1000004 & 0xFFFF)
/* 91940 800A1140 5A016210 */  beq        $v1, $v0, .L800A16AC
/* 91944 800A1144 21202002 */   addu      $a0, $s1, $zero
/* 91948 800A1148 A9850208 */  j          .L800A16A4
/* 9194C 800A114C 21284002 */   addu      $a1, $s2, $zero
.L800A1150:
/* 91950 800A1150 01004234 */  ori        $v0, $v0, (0x8000001 & 0xFFFF)
/* 91954 800A1154 68006210 */  beq        $v1, $v0, .L800A12F8
/* 91958 800A1158 2A104300 */   slt       $v0, $v0, $v1
/* 9195C 800A115C 06004014 */  bnez       $v0, .L800A1178
/* 91960 800A1160 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 91964 800A1164 0008023C */  lui        $v0, (0x8000000 >> 16)
/* 91968 800A1168 81006210 */  beq        $v1, $v0, .L800A1370
/* 9196C 800A116C 21202002 */   addu      $a0, $s1, $zero
/* 91970 800A1170 A9850208 */  j          .L800A16A4
/* 91974 800A1174 21284002 */   addu      $a1, $s2, $zero
.L800A1178:
/* 91978 800A1178 CF006210 */  beq        $v1, $v0, .L800A14B8
/* 9197C 800A117C 21202002 */   addu      $a0, $s1, $zero
/* 91980 800A1180 A9850208 */  j          .L800A16A4
/* 91984 800A1184 21284002 */   addu      $a1, $s2, $zero
.L800A1188:
/* 91988 800A1188 09005416 */  bne        $s2, $s4, .L800A11B0
/* 9198C 800A118C 21284002 */   addu      $a1, $s2, $zero
/* 91990 800A1190 21202002 */  addu       $a0, $s1, $zero
/* 91994 800A1194 02000524 */  addiu      $a1, $zero, 0x2
/* 91998 800A1198 21300000 */  addu       $a2, $zero, $zero
/* 9199C 800A119C 2138C000 */  addu       $a3, $a2, $zero
/* 919A0 800A11A0 03000224 */  addiu      $v0, $zero, 0x3
/* 919A4 800A11A4 1000A2AF */  sw         $v0, 0x10($sp)
/* 919A8 800A11A8 72840208 */  j          .L800A11C8
/* 919AC 800A11AC 1400B2AF */   sw        $s2, 0x14($sp)
.L800A11B0:
/* 919B0 800A11B0 21202002 */  addu       $a0, $s1, $zero
/* 919B4 800A11B4 4C000624 */  addiu      $a2, $zero, 0x4C
/* 919B8 800A11B8 21380000 */  addu       $a3, $zero, $zero
/* 919BC 800A11BC 03000224 */  addiu      $v0, $zero, 0x3
/* 919C0 800A11C0 1000A2AF */  sw         $v0, 0x10($sp)
/* 919C4 800A11C4 1400B4AF */  sw         $s4, 0x14($sp)
.L800A11C8:
/* 919C8 800A11C8 20C8010C */  jal        G2EmulationSwitchAnimation
/* 919CC 800A11CC 00000000 */   nop
/* 919D0 800A11D0 D0FC828F */  lw         $v0, %gp_rel(ExtraRot)($gp)
/* 919D4 800A11D4 00000000 */  nop
/* 919D8 800A11D8 000040A4 */  sh         $zero, 0x0($v0)
/* 919DC 800A11DC 020040A4 */  sh         $zero, 0x2($v0)
/* 919E0 800A11E0 040040A4 */  sh         $zero, 0x4($v0)
/* 919E4 800A11E4 0000228E */  lw         $v0, 0x0($s1)
/* 919E8 800A11E8 FFF7033C */  lui        $v1, (0xF7FFEFFF >> 16)
/* 919EC 800A11EC B80040AC */  sw         $zero, 0xB8($v0)
/* 919F0 800A11F0 B40040AC */  sw         $zero, 0xB4($v0)
/* 919F4 800A11F4 0000228E */  lw         $v0, 0x0($s1)
/* 919F8 800A11F8 FFEF6334 */  ori        $v1, $v1, (0xF7FFEFFF & 0xFFFF)
/* 919FC 800A11FC 280140AC */  sw         $zero, 0x128($v0)
/* 91A00 800A1200 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 91A04 800A1204 0000248E */  lw         $a0, 0x0($s1)
/* 91A08 800A1208 24104300 */  and        $v0, $v0, $v1
/* 91A0C 800A120C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 91A10 800A1210 1800828C */  lw         $v0, 0x18($a0)
/* 91A14 800A1214 BFFF0324 */  addiu      $v1, $zero, -0x41
/* 91A18 800A1218 24104300 */  and        $v0, $v0, $v1
/* 91A1C 800A121C AB850208 */  j          .L800A16AC
/* 91A20 800A1220 180082AC */   sw        $v0, 0x18($a0)
.L800A1224:
/* 91A24 800A1224 0A004016 */  bnez       $s2, .L800A1250
/* 91A28 800A1228 F0FF0524 */   addiu     $a1, $zero, -0x10
/* 91A2C 800A122C 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 91A30 800A1230 0400038E */  lw         $v1, 0x4($s0)
/* 91A34 800A1234 00084230 */  andi       $v0, $v0, 0x800
/* 91A38 800A1238 06004010 */  beqz       $v0, .L800A1254
/* 91A3C 800A123C 21300000 */   addu      $a2, $zero, $zero
/* 91A40 800A1240 0C00648C */  lw         $a0, 0xC($v1)
/* 91A44 800A1244 7391020C */  jal        LoseHealth
/* 91A48 800A1248 00000000 */   nop
.L800A124C:
/* 91A4C 800A124C F0FF0524 */  addiu      $a1, $zero, -0x10
.L800A1250:
/* 91A50 800A1250 21300000 */  addu       $a2, $zero, $zero
.L800A1254:
/* 91A54 800A1254 08000224 */  addiu      $v0, $zero, 0x8
/* 91A58 800A1258 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 91A5C 800A125C 9A000224 */  addiu      $v0, $zero, 0x9A
/* 91A60 800A1260 1000A2AF */  sw         $v0, 0x10($sp)
/* 91A64 800A1264 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 91A68 800A1268 0000248E */  lw         $a0, 0x0($s1)
/* 91A6C 800A126C 10004234 */  ori        $v0, $v0, 0x10
/* 91A70 800A1270 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 91A74 800A1274 4E68020C */  jal        SetPhysics
/* 91A78 800A1278 28000724 */   addiu     $a3, $zero, 0x28
/* 91A7C 800A127C 21202002 */  addu       $a0, $s1, $zero
/* 91A80 800A1280 21284002 */  addu       $a1, $s2, $zero
/* 91A84 800A1284 23000624 */  addiu      $a2, $zero, 0x23
/* 91A88 800A1288 21380000 */  addu       $a3, $zero, $zero
/* 91A8C 800A128C 01000224 */  addiu      $v0, $zero, 0x1
/* 91A90 800A1290 1000A0AF */  sw         $zero, 0x10($sp)
/* 91A94 800A1294 20C8010C */  jal        G2EmulationSwitchAnimation
/* 91A98 800A1298 1400A2AF */   sw        $v0, 0x14($sp)
/* 91A9C 800A129C 21202002 */  addu       $a0, $s1, $zero
/* 91AA0 800A12A0 21284002 */  addu       $a1, $s2, $zero
/* 91AA4 800A12A4 0A80063C */  lui        $a2, %hi(StateHandlerWallDismount)
/* 91AA8 800A12A8 E018C624 */  addiu      $a2, $a2, %lo(StateHandlerWallDismount)
/* 91AAC 800A12AC C1CA010C */  jal        StateSwitchStateData
/* 91AB0 800A12B0 21380000 */   addu      $a3, $zero, $zero
/* 91AB4 800A12B4 0000238E */  lw         $v1, 0x0($s1)
/* 91AB8 800A12B8 00000000 */  nop
/* 91ABC 800A12BC 7801628C */  lw         $v0, 0x178($v1)
/* 91AC0 800A12C0 00000000 */  nop
/* 91AC4 800A12C4 40100200 */  sll        $v0, $v0, 1
/* 91AC8 800A12C8 23100200 */  negu       $v0, $v0
/* 91ACC 800A12CC 780162AC */  sw         $v0, 0x178($v1)
/* 91AD0 800A12D0 0000228E */  lw         $v0, 0x0($s1)
/* 91AD4 800A12D4 00000000 */  nop
/* 91AD8 800A12D8 7C0140AC */  sw         $zero, 0x17C($v0)
/* 91ADC 800A12DC 0000228E */  lw         $v0, 0x0($s1)
/* 91AE0 800A12E0 00000000 */  nop
/* 91AE4 800A12E4 740040A4 */  sh         $zero, 0x74($v0)
/* 91AE8 800A12E8 0000228E */  lw         $v0, 0x0($s1)
/* 91AEC 800A12EC 30FD80AF */  sw         $zero, %gp_rel(PhysicsMode)($gp)
/* 91AF0 800A12F0 AB850208 */  j          .L800A16AC
/* 91AF4 800A12F4 760040A4 */   sh        $zero, 0x76($v0)
.L800A12F8:
/* 91AF8 800A12F8 EC004016 */  bnez       $s2, .L800A16AC
/* 91AFC 800A12FC 68000224 */   addiu     $v0, $zero, 0x68
/* 91B00 800A1300 EA006216 */  bne        $s3, $v0, .L800A16AC
/* 91B04 800A1304 21200000 */   addu      $a0, $zero, $zero
/* 91B08 800A1308 21288000 */  addu       $a1, $a0, $zero
/* 91B0C 800A130C 40010624 */  addiu      $a2, $zero, 0x140
/* 91B10 800A1310 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91B14 800A1314 1800A727 */   addiu     $a3, $sp, 0x18
/* 91B18 800A1318 21200000 */  addu       $a0, $zero, $zero
/* 91B1C 800A131C C0FE0524 */  addiu      $a1, $zero, -0x140
/* 91B20 800A1320 40010624 */  addiu      $a2, $zero, 0x140
/* 91B24 800A1324 2000B027 */  addiu      $s0, $sp, 0x20
/* 91B28 800A1328 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91B2C 800A132C 21380002 */   addu      $a3, $s0, $zero
/* 91B30 800A1330 0000248E */  lw         $a0, 0x0($s1)
/* 91B34 800A1334 1800A527 */  addiu      $a1, $sp, 0x18
/* 91B38 800A1338 21300002 */  addu       $a2, $s0, $zero
/* 91B3C 800A133C A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 91B40 800A1340 21380000 */   addu      $a3, $zero, $zero
/* 91B44 800A1344 01004230 */  andi       $v0, $v0, 0x1
/* 91B48 800A1348 D8004014 */  bnez       $v0, .L800A16AC
/* 91B4C 800A134C 01000224 */   addiu     $v0, $zero, 0x1
/* 91B50 800A1350 1000A2AF */  sw         $v0, 0x10($sp)
/* 91B54 800A1354 21202002 */  addu       $a0, $s1, $zero
/* 91B58 800A1358 6A000524 */  addiu      $a1, $zero, 0x6A
/* 91B5C 800A135C 21300000 */  addu       $a2, $zero, $zero
/* 91B60 800A1360 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 91B64 800A1364 03000724 */   addiu     $a3, $zero, 0x3
/* 91B68 800A1368 AB850208 */  j          .L800A16AC
/* 91B6C 800A136C 00000000 */   nop
.L800A1370:
/* 91B70 800A1370 11005416 */  bne        $s2, $s4, .L800A13B8
/* 91B74 800A1374 21284002 */   addu      $a1, $s2, $zero
/* 91B78 800A1378 21202002 */  addu       $a0, $s1, $zero
/* 91B7C 800A137C 02000524 */  addiu      $a1, $zero, 0x2
/* 91B80 800A1380 21300000 */  addu       $a2, $zero, $zero
/* 91B84 800A1384 2138C000 */  addu       $a3, $a2, $zero
/* 91B88 800A1388 03000224 */  addiu      $v0, $zero, 0x3
/* 91B8C 800A138C 1000A2AF */  sw         $v0, 0x10($sp)
/* 91B90 800A1390 20C8010C */  jal        G2EmulationSwitchAnimation
/* 91B94 800A1394 1400B2AF */   sw        $s2, 0x14($sp)
/* 91B98 800A1398 21280000 */  addu       $a1, $zero, $zero
/* 91B9C 800A139C 0E000624 */  addiu      $a2, $zero, 0xE
/* 91BA0 800A13A0 0000248E */  lw         $a0, 0x0($s1)
/* 91BA4 800A13A4 D0FC878F */  lw         $a3, %gp_rel(ExtraRot)($gp)
/* 91BA8 800A13A8 7D42020C */  jal        G2Anim_SetController_Vector
/* 91BAC 800A13AC C8018424 */   addiu     $a0, $a0, 0x1C8
/* 91BB0 800A13B0 AB850208 */  j          .L800A16AC
/* 91BB4 800A13B4 00000000 */   nop
.L800A13B8:
/* 91BB8 800A13B8 4C000624 */  addiu      $a2, $zero, 0x4C
/* 91BBC 800A13BC 21380000 */  addu       $a3, $zero, $zero
/* 91BC0 800A13C0 03000224 */  addiu      $v0, $zero, 0x3
/* 91BC4 800A13C4 1000A2AF */  sw         $v0, 0x10($sp)
/* 91BC8 800A13C8 20C8010C */  jal        G2EmulationSwitchAnimation
/* 91BCC 800A13CC 1400B4AF */   sw        $s4, 0x14($sp)
/* 91BD0 800A13D0 AB850208 */  j          .L800A16AC
/* 91BD4 800A13D4 00000000 */   nop
.L800A13D8:
/* 91BD8 800A13D8 0400058E */  lw         $a1, 0x4($s0)
/* 91BDC 800A13DC 00000000 */  nop
/* 91BE0 800A13E0 2800A28C */  lw         $v0, 0x28($a1)
/* 91BE4 800A13E4 00000000 */  nop
/* 91BE8 800A13E8 1A004014 */  bnez       $v0, .L800A1454
/* 91BEC 800A13EC 21200000 */   addu      $a0, $zero, $zero
/* 91BF0 800A13F0 0000228E */  lw         $v0, 0x0($s1)
/* 91BF4 800A13F4 00000000 */  nop
/* 91BF8 800A13F8 740040A4 */  sh         $zero, 0x74($v0)
/* 91BFC 800A13FC 0000228E */  lw         $v0, 0x0($s1)
/* 91C00 800A1400 21288000 */  addu       $a1, $a0, $zero
/* 91C04 800A1404 760040A4 */  sh         $zero, 0x76($v0)
/* 91C08 800A1408 0000228E */  lw         $v0, 0x0($s1)
/* 91C0C 800A140C 03000624 */  addiu      $a2, $zero, 0x3
/* 91C10 800A1410 4FC6010C */  jal        SetControlInitIdleData
/* 91C14 800A1414 780040A4 */   sh        $zero, 0x78($v0)
/* 91C18 800A1418 21202002 */  addu       $a0, $s1, $zero
/* 91C1C 800A141C 21284002 */  addu       $a1, $s2, $zero
/* 91C20 800A1420 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 91C24 800A1424 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 91C28 800A1428 C1CA010C */  jal        StateSwitchStateData
/* 91C2C 800A142C 21384000 */   addu      $a3, $v0, $zero
/* 91C30 800A1430 0000238E */  lw         $v1, 0x0($s1)
/* 91C34 800A1434 00000000 */  nop
/* 91C38 800A1438 1800628C */  lw         $v0, 0x18($v1)
/* 91C3C 800A143C 00000000 */  nop
/* 91C40 800A1440 40004234 */  ori        $v0, $v0, 0x40
/* 91C44 800A1444 5397020C */  jal        razReaverBladeOn
/* 91C48 800A1448 180062AC */   sw        $v0, 0x18($v1)
/* 91C4C 800A144C AB850208 */  j          .L800A16AC
/* 91C50 800A1450 00000000 */   nop
.L800A1454:
/* 91C54 800A1454 95004016 */  bnez       $s2, .L800A16AC
/* 91C58 800A1458 04004230 */   andi      $v0, $v0, 0x4
/* 91C5C 800A145C 11004010 */  beqz       $v0, .L800A14A4
/* 91C60 800A1460 00000000 */   nop
/* 91C64 800A1464 0000248E */  lw         $a0, 0x0($s1)
/* 91C68 800A1468 938B020C */  jal        SteerSwitchMode
/* 91C6C 800A146C 21280000 */   addu      $a1, $zero, $zero
/* 91C70 800A1470 21200000 */  addu       $a0, $zero, $zero
/* 91C74 800A1474 21288000 */  addu       $a1, $a0, $zero
/* 91C78 800A1478 3CC6010C */  jal        SetControlInitHangData
/* 91C7C 800A147C 03000624 */   addiu     $a2, $zero, 0x3
/* 91C80 800A1480 21202002 */  addu       $a0, $s1, $zero
/* 91C84 800A1484 0B80053C */  lui        $a1, %hi(StateHandlerHang)
/* 91C88 800A1488 F4D2A524 */  addiu      $a1, $a1, %lo(StateHandlerHang)
/* 91C8C 800A148C F4CA010C */  jal        StateSwitchStateCharacterData
/* 91C90 800A1490 21304000 */   addu      $a2, $v0, $zero
/* 91C94 800A1494 5397020C */  jal        razReaverBladeOn
/* 91C98 800A1498 00000000 */   nop
/* 91C9C 800A149C AB850208 */  j          .L800A16AC
/* 91CA0 800A14A0 00000000 */   nop
.L800A14A4:
/* 91CA4 800A14A4 0000248E */  lw         $a0, 0x0($s1)
/* 91CA8 800A14A8 F49B020C */  jal        razSetWallCrawlNodes
/* 91CAC 800A14AC 00000000 */   nop
/* 91CB0 800A14B0 AB850208 */  j          .L800A16AC
/* 91CB4 800A14B4 00000000 */   nop
.L800A14B8:
/* 91CB8 800A14B8 7C004016 */  bnez       $s2, .L800A16AC
/* 91CBC 800A14BC 00000000 */   nop
/* 91CC0 800A14C0 A9C9010C */  jal        G2EmulationQueryAnimation
/* 91CC4 800A14C4 21280000 */   addu      $a1, $zero, $zero
/* 91CC8 800A14C8 21984000 */  addu       $s3, $v0, $zero
/* 91CCC 800A14CC 0010023C */  lui        $v0, (0x10000002 >> 16)
/* 91CD0 800A14D0 0400058E */  lw         $a1, 0x4($s0)
/* 91CD4 800A14D4 02004234 */  ori        $v0, $v0, (0x10000002 & 0xFFFF)
/* 91CD8 800A14D8 2A00A210 */  beq        $a1, $v0, .L800A1584
/* 91CDC 800A14DC 2A104500 */   slt       $v0, $v0, $a1
/* 91CE0 800A14E0 06004014 */  bnez       $v0, .L800A14FC
/* 91CE4 800A14E4 0010023C */   lui       $v0, (0x10000001 >> 16)
/* 91CE8 800A14E8 01004234 */  ori        $v0, $v0, (0x10000001 & 0xFFFF)
/* 91CEC 800A14EC 0B00A210 */  beq        $a1, $v0, .L800A151C
/* 91CF0 800A14F0 68000224 */   addiu     $v0, $zero, 0x68
/* 91CF4 800A14F4 AB850208 */  j          .L800A16AC
/* 91CF8 800A14F8 00000000 */   nop
.L800A14FC:
/* 91CFC 800A14FC 03004234 */  ori        $v0, $v0, (0x10000003 & 0xFFFF)
/* 91D00 800A1500 3500A210 */  beq        $a1, $v0, .L800A15D8
/* 91D04 800A1504 0010023C */   lui       $v0, (0x10000004 >> 16)
/* 91D08 800A1508 04004234 */  ori        $v0, $v0, (0x10000004 & 0xFFFF)
/* 91D0C 800A150C 2800A210 */  beq        $a1, $v0, .L800A15B0
/* 91D10 800A1510 91000224 */   addiu     $v0, $zero, 0x91
/* 91D14 800A1514 AB850208 */  j          .L800A16AC
/* 91D18 800A1518 00000000 */   nop
.L800A151C:
/* 91D1C 800A151C 63006212 */  beq        $s3, $v0, .L800A16AC
/* 91D20 800A1520 21200000 */   addu      $a0, $zero, $zero
/* 91D24 800A1524 21288000 */  addu       $a1, $a0, $zero
/* 91D28 800A1528 A0000624 */  addiu      $a2, $zero, 0xA0
/* 91D2C 800A152C 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91D30 800A1530 1800A727 */   addiu     $a3, $sp, 0x18
/* 91D34 800A1534 21200000 */  addu       $a0, $zero, $zero
/* 91D38 800A1538 C0FE0524 */  addiu      $a1, $zero, -0x140
/* 91D3C 800A153C A0000624 */  addiu      $a2, $zero, 0xA0
/* 91D40 800A1540 2000B027 */  addiu      $s0, $sp, 0x20
/* 91D44 800A1544 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91D48 800A1548 21380002 */   addu      $a3, $s0, $zero
/* 91D4C 800A154C 0000248E */  lw         $a0, 0x0($s1)
/* 91D50 800A1550 1800A527 */  addiu      $a1, $sp, 0x18
/* 91D54 800A1554 21300002 */  addu       $a2, $s0, $zero
/* 91D58 800A1558 A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 91D5C 800A155C 21380000 */   addu      $a3, $zero, $zero
/* 91D60 800A1560 21184000 */  addu       $v1, $v0, $zero
/* 91D64 800A1564 01006230 */  andi       $v0, $v1, 0x1
/* 91D68 800A1568 03004014 */  bnez       $v0, .L800A1578
/* 91D6C 800A156C 00000000 */   nop
/* 91D70 800A1570 4E006014 */  bnez       $v1, .L800A16AC
/* 91D74 800A1574 00000000 */   nop
.L800A1578:
/* 91D78 800A1578 0000248E */  lw         $a0, 0x0($s1)
/* 91D7C 800A157C 90850208 */  j          .L800A1640
/* 91D80 800A1580 19000524 */   addiu     $a1, $zero, 0x19
.L800A1584:
/* 91D84 800A1584 92000224 */  addiu      $v0, $zero, 0x92
/* 91D88 800A1588 48006212 */  beq        $s3, $v0, .L800A16AC
/* 91D8C 800A158C 00000000 */   nop
/* 91D90 800A1590 0000248E */  lw         $a0, 0x0($s1)
/* 91D94 800A1594 CE9E020C */  jal        razSideMoveSpiderCheck
/* 91D98 800A1598 80FF0524 */   addiu     $a1, $zero, -0x80
/* 91D9C 800A159C 43004014 */  bnez       $v0, .L800A16AC
/* 91DA0 800A15A0 1C000524 */   addiu     $a1, $zero, 0x1C
/* 91DA4 800A15A4 0000248E */  lw         $a0, 0x0($s1)
/* 91DA8 800A15A8 91850208 */  j          .L800A1644
/* 91DAC 800A15AC 21300000 */   addu      $a2, $zero, $zero
.L800A15B0:
/* 91DB0 800A15B0 3E006212 */  beq        $s3, $v0, .L800A16AC
/* 91DB4 800A15B4 00000000 */   nop
/* 91DB8 800A15B8 0000248E */  lw         $a0, 0x0($s1)
/* 91DBC 800A15BC CE9E020C */  jal        razSideMoveSpiderCheck
/* 91DC0 800A15C0 80000524 */   addiu     $a1, $zero, 0x80
/* 91DC4 800A15C4 39004014 */  bnez       $v0, .L800A16AC
/* 91DC8 800A15C8 1B000524 */   addiu     $a1, $zero, 0x1B
/* 91DCC 800A15CC 0000248E */  lw         $a0, 0x0($s1)
/* 91DD0 800A15D0 91850208 */  j          .L800A1644
/* 91DD4 800A15D4 21300000 */   addu      $a2, $zero, $zero
.L800A15D8:
/* 91DD8 800A15D8 95000224 */  addiu      $v0, $zero, 0x95
/* 91DDC 800A15DC 33006212 */  beq        $s3, $v0, .L800A16AC
/* 91DE0 800A15E0 21200000 */   addu      $a0, $zero, $zero
/* 91DE4 800A15E4 21288000 */  addu       $a1, $a0, $zero
/* 91DE8 800A15E8 C0FE0624 */  addiu      $a2, $zero, -0x140
/* 91DEC 800A15EC 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91DF0 800A15F0 1800A727 */   addiu     $a3, $sp, 0x18
/* 91DF4 800A15F4 21200000 */  addu       $a0, $zero, $zero
/* 91DF8 800A15F8 C0FE0524 */  addiu      $a1, $zero, -0x140
/* 91DFC 800A15FC 2130A000 */  addu       $a2, $a1, $zero
/* 91E00 800A1600 2000B027 */  addiu      $s0, $sp, 0x20
/* 91E04 800A1604 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91E08 800A1608 21380002 */   addu      $a3, $s0, $zero
/* 91E0C 800A160C 0000248E */  lw         $a0, 0x0($s1)
/* 91E10 800A1610 1800A527 */  addiu      $a1, $sp, 0x18
/* 91E14 800A1614 21300002 */  addu       $a2, $s0, $zero
/* 91E18 800A1618 A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 91E1C 800A161C 21380000 */   addu      $a3, $zero, $zero
/* 91E20 800A1620 21184000 */  addu       $v1, $v0, $zero
/* 91E24 800A1624 01006230 */  andi       $v0, $v1, 0x1
/* 91E28 800A1628 03004014 */  bnez       $v0, .L800A1638
/* 91E2C 800A162C 00000000 */   nop
/* 91E30 800A1630 1E006014 */  bnez       $v1, .L800A16AC
/* 91E34 800A1634 00000000 */   nop
.L800A1638:
/* 91E38 800A1638 0000248E */  lw         $a0, 0x0($s1)
/* 91E3C 800A163C 1A000524 */  addiu      $a1, $zero, 0x1A
.L800A1640:
/* 91E40 800A1640 21300000 */  addu       $a2, $zero, $zero
.L800A1644:
/* 91E44 800A1644 759C020C */  jal        razSwitchVAnimCharacterSingle
/* 91E48 800A1648 2138C000 */   addu      $a3, $a2, $zero
/* 91E4C 800A164C AB850208 */  j          .L800A16AC
/* 91E50 800A1650 00000000 */   nop
.L800A1654:
/* 91E54 800A1654 15004016 */  bnez       $s2, .L800A16AC
/* 91E58 800A1658 21B00000 */   addu      $s6, $zero, $zero
/* 91E5C 800A165C 21200000 */  addu       $a0, $zero, $zero
/* 91E60 800A1660 21288000 */  addu       $a1, $a0, $zero
/* 91E64 800A1664 4FC6010C */  jal        SetControlInitIdleData
/* 91E68 800A1668 03000624 */   addiu     $a2, $zero, 0x3
/* 91E6C 800A166C 21202002 */  addu       $a0, $s1, $zero
/* 91E70 800A1670 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 91E74 800A1674 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 91E78 800A1678 F4CA010C */  jal        StateSwitchStateCharacterData
/* 91E7C 800A167C 21304000 */   addu      $a2, $v0, $zero
/* 91E80 800A1680 0000238E */  lw         $v1, 0x0($s1)
/* 91E84 800A1684 00000000 */  nop
/* 91E88 800A1688 1800628C */  lw         $v0, 0x18($v1)
/* 91E8C 800A168C 00000000 */  nop
/* 91E90 800A1690 40004234 */  ori        $v0, $v0, 0x40
/* 91E94 800A1694 5397020C */  jal        razReaverBladeOn
/* 91E98 800A1698 180062AC */   sw        $v0, 0x18($v1)
/* 91E9C 800A169C AB850208 */  j          .L800A16AC
/* 91EA0 800A16A0 21B00000 */   addu      $s6, $zero, $zero
.L800A16A4:
/* 91EA4 800A16A4 B9BF020C */  jal        DefaultStateHandler
/* 91EA8 800A16A8 2130E002 */   addu      $a2, $s7, $zero
.L800A16AC:
/* 91EAC 800A16AC 27C3010C */  jal        DeMessageQueue
/* 91EB0 800A16B0 0400A426 */   addiu     $a0, $s5, 0x4
/* 91EB4 800A16B4 16840208 */  j          .L800A1058
/* 91EB8 800A16B8 00000000 */   nop
.L800A16BC:
/* 91EBC 800A16BC 7D00C012 */  beqz       $s6, .L800A18B4
/* 91EC0 800A16C0 0080033C */   lui       $v1, (0x8000000F >> 16)
/* 91EC4 800A16C4 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 91EC8 800A16C8 00000000 */  nop
/* 91ECC 800A16CC 0000428C */  lw         $v0, 0x0($v0)
/* 91ED0 800A16D0 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 91ED4 800A16D4 24104300 */  and        $v0, $v0, $v1
/* 91ED8 800A16D8 0D004014 */  bnez       $v0, .L800A1710
/* 91EDC 800A16DC 00000000 */   nop
/* 91EE0 800A16E0 3CFB828F */  lw         $v0, %gp_rel(Raziel + 0x50C)($gp)
/* 91EE4 800A16E4 00000000 */  nop
/* 91EE8 800A16E8 01004230 */  andi       $v0, $v0, 0x1
/* 91EEC 800A16EC 08004010 */  beqz       $v0, .L800A1710
/* 91EF0 800A16F0 21202002 */   addu      $a0, $s1, $zero
/* 91EF4 800A16F4 6A000524 */  addiu      $a1, $zero, 0x6A
/* 91EF8 800A16F8 21300000 */  addu       $a2, $zero, $zero
/* 91EFC 800A16FC 03000724 */  addiu      $a3, $zero, 0x3
/* 91F00 800A1700 01000224 */  addiu      $v0, $zero, 0x1
/* 91F04 800A1704 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 91F08 800A1708 1000A2AF */   sw        $v0, 0x10($sp)
/* 91F0C 800A170C 3CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x50C)($gp)
.L800A1710:
/* 91F10 800A1710 68004016 */  bnez       $s2, .L800A18B4
/* 91F14 800A1714 91000224 */   addiu     $v0, $zero, 0x91
/* 91F18 800A1718 2C006212 */  beq        $s3, $v0, .L800A17CC
/* 91F1C 800A171C 9200622A */   slti      $v0, $s3, 0x92
/* 91F20 800A1720 05004010 */  beqz       $v0, .L800A1738
/* 91F24 800A1724 68000224 */   addiu     $v0, $zero, 0x68
/* 91F28 800A1728 0A006212 */  beq        $s3, $v0, .L800A1754
/* 91F2C 800A172C 21200000 */   addu      $a0, $zero, $zero
/* 91F30 800A1730 2D860208 */  j          .L800A18B4
/* 91F34 800A1734 00000000 */   nop
.L800A1738:
/* 91F38 800A1738 92000224 */  addiu      $v0, $zero, 0x92
/* 91F3C 800A173C 1C006212 */  beq        $s3, $v0, .L800A17B0
/* 91F40 800A1740 95000224 */   addiu     $v0, $zero, 0x95
/* 91F44 800A1744 28006212 */  beq        $s3, $v0, .L800A17E8
/* 91F48 800A1748 21200000 */   addu      $a0, $zero, $zero
/* 91F4C 800A174C 2D860208 */  j          .L800A18B4
/* 91F50 800A1750 00000000 */   nop
.L800A1754:
/* 91F54 800A1754 21288000 */  addu       $a1, $a0, $zero
/* 91F58 800A1758 A0000624 */  addiu      $a2, $zero, 0xA0
/* 91F5C 800A175C 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91F60 800A1760 1800A727 */   addiu     $a3, $sp, 0x18
/* 91F64 800A1764 21200000 */  addu       $a0, $zero, $zero
/* 91F68 800A1768 C0FE0524 */  addiu      $a1, $zero, -0x140
/* 91F6C 800A176C A0000624 */  addiu      $a2, $zero, 0xA0
/* 91F70 800A1770 2000B027 */  addiu      $s0, $sp, 0x20
/* 91F74 800A1774 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91F78 800A1778 21380002 */   addu      $a3, $s0, $zero
/* 91F7C 800A177C 0000248E */  lw         $a0, 0x0($s1)
/* 91F80 800A1780 1800A527 */  addiu      $a1, $sp, 0x18
/* 91F84 800A1784 21300002 */  addu       $a2, $s0, $zero
/* 91F88 800A1788 A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 91F8C 800A178C 21380000 */   addu      $a3, $zero, $zero
/* 91F90 800A1790 21184000 */  addu       $v1, $v0, $zero
/* 91F94 800A1794 01006230 */  andi       $v0, $v1, 0x1
/* 91F98 800A1798 46004014 */  bnez       $v0, .L800A18B4
/* 91F9C 800A179C 00000000 */   nop
/* 91FA0 800A17A0 44006010 */  beqz       $v1, .L800A18B4
/* 91FA4 800A17A4 01000224 */   addiu     $v0, $zero, 0x1
/* 91FA8 800A17A8 28860208 */  j          .L800A18A0
/* 91FAC 800A17AC 1000A2AF */   sw        $v0, 0x10($sp)
.L800A17B0:
/* 91FB0 800A17B0 0000248E */  lw         $a0, 0x0($s1)
/* 91FB4 800A17B4 CE9E020C */  jal        razSideMoveSpiderCheck
/* 91FB8 800A17B8 80FF0524 */   addiu     $a1, $zero, -0x80
/* 91FBC 800A17BC 3D004010 */  beqz       $v0, .L800A18B4
/* 91FC0 800A17C0 01000224 */   addiu     $v0, $zero, 0x1
/* 91FC4 800A17C4 28860208 */  j          .L800A18A0
/* 91FC8 800A17C8 1000A2AF */   sw        $v0, 0x10($sp)
.L800A17CC:
/* 91FCC 800A17CC 0000248E */  lw         $a0, 0x0($s1)
/* 91FD0 800A17D0 CE9E020C */  jal        razSideMoveSpiderCheck
/* 91FD4 800A17D4 80000524 */   addiu     $a1, $zero, 0x80
/* 91FD8 800A17D8 36004010 */  beqz       $v0, .L800A18B4
/* 91FDC 800A17DC 01000224 */   addiu     $v0, $zero, 0x1
/* 91FE0 800A17E0 28860208 */  j          .L800A18A0
/* 91FE4 800A17E4 1000A2AF */   sw        $v0, 0x10($sp)
.L800A17E8:
/* 91FE8 800A17E8 21288000 */  addu       $a1, $a0, $zero
/* 91FEC 800A17EC 21308000 */  addu       $a2, $a0, $zero
/* 91FF0 800A17F0 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 91FF4 800A17F4 1800A727 */   addiu     $a3, $sp, 0x18
/* 91FF8 800A17F8 21200000 */  addu       $a0, $zero, $zero
/* 91FFC 800A17FC 21288000 */  addu       $a1, $a0, $zero
/* 92000 800A1800 C0FE0624 */  addiu      $a2, $zero, -0x140
/* 92004 800A1804 2000B027 */  addiu      $s0, $sp, 0x20
/* 92008 800A1808 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 9200C 800A180C 21380002 */   addu      $a3, $s0, $zero
/* 92010 800A1810 0000248E */  lw         $a0, 0x0($s1)
/* 92014 800A1814 1800A527 */  addiu      $a1, $sp, 0x18
/* 92018 800A1818 21300002 */  addu       $a2, $s0, $zero
/* 9201C 800A181C A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 92020 800A1820 21380000 */   addu      $a3, $zero, $zero
/* 92024 800A1824 07004014 */  bnez       $v0, .L800A1844
/* 92028 800A1828 94002426 */   addiu     $a0, $s1, 0x94
/* 9202C 800A182C 0000228E */  lw         $v0, 0x0($s1)
/* 92030 800A1830 00000000 */  nop
/* 92034 800A1834 2801428C */  lw         $v0, 0x128($v0)
/* 92038 800A1838 00000000 */  nop
/* 9203C 800A183C 06004010 */  beqz       $v0, .L800A1858
/* 92040 800A1840 C0FE0624 */   addiu     $a2, $zero, -0x140
.L800A1844:
/* 92044 800A1844 1000053C */  lui        $a1, (0x100000 >> 16)
/* 92048 800A1848 4EC3010C */  jal        EnMessageQueueData
/* 9204C 800A184C 21300000 */   addu      $a2, $zero, $zero
/* 92050 800A1850 2D860208 */  j          .L800A18B4
/* 92054 800A1854 00000000 */   nop
.L800A1858:
/* 92058 800A1858 21200000 */  addu       $a0, $zero, $zero
/* 9205C 800A185C 21288000 */  addu       $a1, $a0, $zero
/* 92060 800A1860 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 92064 800A1864 1800A727 */   addiu     $a3, $sp, 0x18
/* 92068 800A1868 21200000 */  addu       $a0, $zero, $zero
/* 9206C 800A186C C0FE0524 */  addiu      $a1, $zero, -0x140
/* 92070 800A1870 2130A000 */  addu       $a2, $a1, $zero
/* 92074 800A1874 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 92078 800A1878 21380002 */   addu      $a3, $s0, $zero
/* 9207C 800A187C 0000248E */  lw         $a0, 0x0($s1)
/* 92080 800A1880 1800A527 */  addiu      $a1, $sp, 0x18
/* 92084 800A1884 21300002 */  addu       $a2, $s0, $zero
/* 92088 800A1888 A2DF010C */  jal        PHYSICS_CheckForValidMove
/* 9208C 800A188C 21380000 */   addu      $a3, $zero, $zero
/* 92090 800A1890 01004230 */  andi       $v0, $v0, 0x1
/* 92094 800A1894 07004014 */  bnez       $v0, .L800A18B4
/* 92098 800A1898 01000224 */   addiu     $v0, $zero, 0x1
/* 9209C 800A189C 1000A2AF */  sw         $v0, 0x10($sp)
.L800A18A0:
/* 920A0 800A18A0 21202002 */  addu       $a0, $s1, $zero
/* 920A4 800A18A4 6A000524 */  addiu      $a1, $zero, 0x6A
/* 920A8 800A18A8 21300000 */  addu       $a2, $zero, $zero
/* 920AC 800A18AC FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 920B0 800A18B0 03000724 */   addiu     $a3, $zero, 0x3
.L800A18B4:
/* 920B4 800A18B4 4800BF8F */  lw         $ra, 0x48($sp)
/* 920B8 800A18B8 4400B78F */  lw         $s7, 0x44($sp)
/* 920BC 800A18BC 4000B68F */  lw         $s6, 0x40($sp)
/* 920C0 800A18C0 3C00B58F */  lw         $s5, 0x3C($sp)
/* 920C4 800A18C4 3800B48F */  lw         $s4, 0x38($sp)
/* 920C8 800A18C8 3400B38F */  lw         $s3, 0x34($sp)
/* 920CC 800A18CC 3000B28F */  lw         $s2, 0x30($sp)
/* 920D0 800A18D0 2C00B18F */  lw         $s1, 0x2C($sp)
/* 920D4 800A18D4 2800B08F */  lw         $s0, 0x28($sp)
/* 920D8 800A18D8 0800E003 */  jr         $ra
/* 920DC 800A18DC 5000BD27 */   addiu     $sp, $sp, 0x50
.size StateHandlerWallIdle, . - StateHandlerWallIdle
