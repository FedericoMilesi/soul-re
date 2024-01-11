.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_FollowPlayerTilt
/* D258 8001CA58 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* D25C 8001CA5C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* D260 8001CA60 21888000 */  addu       $s1, $a0, $zero
/* D264 8001CA64 2120A000 */  addu       $a0, $a1, $zero
/* D268 8001CA68 09000524 */  addiu      $a1, $zero, 0x9
/* D26C 8001CA6C 3800BFAF */  sw         $ra, 0x38($sp)
/* D270 8001CA70 3400B3AF */  sw         $s3, 0x34($sp)
/* D274 8001CA74 3000B2AF */  sw         $s2, 0x30($sp)
/* D278 8001CA78 92D1000C */  jal        INSTANCE_Query
/* D27C 8001CA7C 2800B0AF */   sw        $s0, 0x28($sp)
/* D280 8001CA80 21204000 */  addu       $a0, $v0, $zero
/* D284 8001CA84 E800228E */  lw         $v0, 0xE8($s1)
/* D288 8001CA88 0100033C */  lui        $v1, (0x10000 >> 16)
/* D28C 8001CA8C 24104300 */  and        $v0, $v0, $v1
/* D290 8001CA90 02004010 */  beqz       $v0, .L8001CA9C
/* D294 8001CA94 01001324 */   addiu     $s3, $zero, 0x1
/* D298 8001CA98 05001324 */  addiu      $s3, $zero, 0x5
.L8001CA9C:
/* D29C 8001CA9C 9C04228E */  lw         $v0, 0x49C($s1)
/* D2A0 8001CAA0 0004033C */  lui        $v1, (0x4000000 >> 16)
/* D2A4 8001CAA4 24104300 */  and        $v0, $v0, $v1
/* D2A8 8001CAA8 06004010 */  beqz       $v0, .L8001CAC4
/* D2AC 8001CAAC 20001224 */   addiu     $s2, $zero, 0x20
/* D2B0 8001CAB0 0801228E */  lw         $v0, 0x108($s1)
/* D2B4 8001CAB4 00000000 */  nop
/* D2B8 8001CAB8 74004294 */  lhu        $v0, 0x74($v0)
/* D2BC 8001CABC 04730008 */  j          .L8001CC10
/* D2C0 8001CAC0 23100200 */   negu      $v0, $v0
.L8001CAC4:
/* D2C4 8001CAC4 40008230 */  andi       $v0, $a0, 0x40
/* D2C8 8001CAC8 04004010 */  beqz       $v0, .L8001CADC
/* D2CC 8001CACC 55FF0224 */   addiu     $v0, $zero, -0xAB
/* D2D0 8001CAD0 9E0122A6 */  sh         $v0, 0x19E($s1)
/* D2D4 8001CAD4 05730008 */  j          .L8001CC14
/* D2D8 8001CAD8 20001224 */   addiu     $s2, $zero, 0x20
.L8001CADC:
/* D2DC 8001CADC 1800A427 */  addiu      $a0, $sp, 0x18
/* D2E0 8001CAE0 BE63000C */  jal        CAMERA_CalcFocusOffsetForSwim
/* D2E4 8001CAE4 21282002 */   addu      $a1, $s1, $zero
/* D2E8 8001CAE8 1C00A397 */  lhu        $v1, 0x1C($sp)
/* D2EC 8001CAEC 1800A297 */  lhu        $v0, 0x18($sp)
/* D2F0 8001CAF0 1A00A497 */  lhu        $a0, 0x1A($sp)
/* D2F4 8001CAF4 2400A3A7 */  sh         $v1, 0x24($sp)
/* D2F8 8001CAF8 2000A2A7 */  sh         $v0, 0x20($sp)
/* D2FC 8001CAFC 2200A4A7 */  sh         $a0, 0x22($sp)
/* D300 8001CB00 B6012586 */  lh         $a1, 0x1B6($s1)
/* D304 8001CB04 3862000C */  jal        CAMERA_CalcTilt
/* D308 8001CB08 2000A427 */   addiu     $a0, $sp, 0x20
/* D30C 8001CB0C 00044224 */  addiu      $v0, $v0, 0x400
/* D310 8001CB10 9E0122A6 */  sh         $v0, 0x19E($s1)
/* D314 8001CB14 9E012296 */  lhu        $v0, 0x19E($s1)
/* D318 8001CB18 FE002586 */  lh         $a1, 0xFE($s1)
/* D31C 8001CB1C 80FF4224 */  addiu      $v0, $v0, -0x80
/* D320 8001CB20 00240200 */  sll        $a0, $v0, 16
/* D324 8001CB24 03240400 */  sra        $a0, $a0, 16
/* D328 8001CB28 7EE8000C */  jal        AngleDiff
/* D32C 8001CB2C 9E0122A6 */   sh        $v0, 0x19E($s1)
/* D330 8001CB30 00140200 */  sll        $v0, $v0, 16
/* D334 8001CB34 08004004 */  bltz       $v0, .L8001CB58
/* D338 8001CB38 00000000 */   nop
/* D33C 8001CB3C 9E012486 */  lh         $a0, 0x19E($s1)
/* D340 8001CB40 FE002586 */  lh         $a1, 0xFE($s1)
/* D344 8001CB44 7EE8000C */  jal        AngleDiff
/* D348 8001CB48 00000000 */   nop
/* D34C 8001CB4C 00140200 */  sll        $v0, $v0, 16
/* D350 8001CB50 DD720008 */  j          .L8001CB74
/* D354 8001CB54 03140200 */   sra       $v0, $v0, 16
.L8001CB58:
/* D358 8001CB58 9E012486 */  lh         $a0, 0x19E($s1)
/* D35C 8001CB5C FE002586 */  lh         $a1, 0xFE($s1)
/* D360 8001CB60 7EE8000C */  jal        AngleDiff
/* D364 8001CB64 00000000 */   nop
/* D368 8001CB68 00140200 */  sll        $v0, $v0, 16
/* D36C 8001CB6C 03140200 */  sra        $v0, $v0, 16
/* D370 8001CB70 23100200 */  negu       $v0, $v0
.L8001CB74:
/* D374 8001CB74 03004104 */  bgez       $v0, .L8001CB84
/* D378 8001CB78 03910200 */   sra       $s2, $v0, 4
/* D37C 8001CB7C 0F004224 */  addiu      $v0, $v0, 0xF
/* D380 8001CB80 03910200 */  sra        $s2, $v0, 4
.L8001CB84:
/* D384 8001CB84 2100422A */  slti       $v0, $s2, 0x21
/* D388 8001CB88 02004014 */  bnez       $v0, .L8001CB94
/* D38C 8001CB8C 00000000 */   nop
/* D390 8001CB90 20001224 */  addiu      $s2, $zero, 0x20
.L8001CB94:
/* D394 8001CB94 0801228E */  lw         $v0, 0x108($s1)
/* D398 8001CB98 00000000 */  nop
/* D39C 8001CB9C 3800448C */  lw         $a0, 0x38($v0)
/* D3A0 8001CBA0 1C66010C */  jal        STREAM_GetLevelWithID
/* D3A4 8001CBA4 00000000 */   nop
/* D3A8 8001CBA8 3800428C */  lw         $v0, 0x38($v0)
/* D3AC 8001CBAC 04012386 */  lh         $v1, 0x104($s1)
/* D3B0 8001CBB0 06012486 */  lh         $a0, 0x106($s1)
/* D3B4 8001CBB4 60FF4224 */  addiu      $v0, $v0, -0xA0
/* D3B8 8001CBB8 23806200 */  subu       $s0, $v1, $v0
/* D3BC 8001CBBC 02000106 */  bgez       $s0, .L8001CBC8
/* D3C0 8001CBC0 21100002 */   addu      $v0, $s0, $zero
/* D3C4 8001CBC4 23100200 */  negu       $v0, $v0
.L8001CBC8:
/* D3C8 8001CBC8 2A104400 */  slt        $v0, $v0, $a0
/* D3CC 8001CBCC 11004010 */  beqz       $v0, .L8001CC14
/* D3D0 8001CBD0 18008400 */   mult      $a0, $a0
/* D3D4 8001CBD4 12100000 */  mflo       $v0
/* D3D8 8001CBD8 00000000 */  nop
/* D3DC 8001CBDC 00000000 */  nop
/* D3E0 8001CBE0 18001002 */  mult       $s0, $s0
/* D3E4 8001CBE4 12180000 */  mflo       $v1
/* D3E8 8001CBE8 A6E7000C */  jal        MATH3D_FastSqrt0
/* D3EC 8001CBEC 23204300 */   subu      $a0, $v0, $v1
/* D3F0 8001CBF0 21200002 */  addu       $a0, $s0, $zero
/* D3F4 8001CBF4 26F3020C */  jal        ratan2
/* D3F8 8001CBF8 21284000 */   addu      $a1, $v0, $zero
/* D3FC 8001CBFC 9E012386 */  lh         $v1, 0x19E($s1)
/* D400 8001CC00 00000000 */  nop
/* D404 8001CC04 2A186200 */  slt        $v1, $v1, $v0
/* D408 8001CC08 03006010 */  beqz       $v1, .L8001CC18
/* D40C 8001CC0C 21206002 */   addu      $a0, $s3, $zero
.L8001CC10:
/* D410 8001CC10 9E0122A6 */  sh         $v0, 0x19E($s1)
.L8001CC14:
/* D414 8001CC14 21206002 */  addu       $a0, $s3, $zero
.L8001CC18:
/* D418 8001CC18 FE002526 */  addiu      $a1, $s1, 0xFE
/* D41C 8001CC1C 9E012686 */  lh         $a2, 0x19E($s1)
/* D420 8001CC20 46012226 */  addiu      $v0, $s1, 0x146
/* D424 8001CC24 1000A2AF */  sw         $v0, 0x10($sp)
/* D428 8001CC28 00141200 */  sll        $v0, $s2, 16
/* D42C 8001CC2C 03140200 */  sra        $v0, $v0, 16
/* D430 8001CC30 44012726 */  addiu      $a3, $s1, 0x144
/* D434 8001CC34 7E5E000C */  jal        CriticalDampAngle
/* D438 8001CC38 1400A2AF */   sw        $v0, 0x14($sp)
/* D43C 8001CC3C FE002296 */  lhu        $v0, 0xFE($s1)
/* D440 8001CC40 00000000 */  nop
/* D444 8001CC44 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* D448 8001CC48 BA0122A6 */  sh         $v0, 0x1BA($s1)
/* D44C 8001CC4C 3800BF8F */  lw         $ra, 0x38($sp)
/* D450 8001CC50 3400B38F */  lw         $s3, 0x34($sp)
/* D454 8001CC54 3000B28F */  lw         $s2, 0x30($sp)
/* D458 8001CC58 2C00B18F */  lw         $s1, 0x2C($sp)
/* D45C 8001CC5C 2800B08F */  lw         $s0, 0x28($sp)
/* D460 8001CC60 0800E003 */  jr         $ra
/* D464 8001CC64 4000BD27 */   addiu     $sp, $sp, 0x40
.size CAMERA_FollowPlayerTilt, . - CAMERA_FollowPlayerTilt
