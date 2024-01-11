.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerCrouch
/* 998E8 800A90E8 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 998EC 800A90EC 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 998F0 800A90F0 21988000 */  addu       $s3, $a0, $zero
/* 998F4 800A90F4 3000B4AF */  sw         $s4, 0x30($sp)
/* 998F8 800A90F8 21A0A000 */  addu       $s4, $a1, $zero
/* 998FC 800A90FC 4400BFAF */  sw         $ra, 0x44($sp)
/* 99900 800A9100 4000BEAF */  sw         $fp, 0x40($sp)
/* 99904 800A9104 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 99908 800A9108 3800B6AF */  sw         $s6, 0x38($sp)
/* 9990C 800A910C 3400B5AF */  sw         $s5, 0x34($sp)
/* 99910 800A9110 2800B2AF */  sw         $s2, 0x28($sp)
/* 99914 800A9114 2400B1AF */  sw         $s1, 0x24($sp)
/* 99918 800A9118 2000B0AF */  sw         $s0, 0x20($sp)
/* 9991C 800A911C 5000A6AF */  sw         $a2, 0x50($sp)
/* 99920 800A9120 2197020C */  jal        razGetHeldItem
/* 99924 800A9124 1800A0AF */   sw        $zero, 0x18($sp)
/* 99928 800A9128 21A84000 */  addu       $s5, $v0, $zero
/* 9992C 800A912C 01001724 */  addiu      $s7, $zero, 0x1
/* 99930 800A9130 C0101400 */  sll        $v0, $s4, 3
/* 99934 800A9134 21105400 */  addu       $v0, $v0, $s4
/* 99938 800A9138 C0100200 */  sll        $v0, $v0, 3
/* 9993C 800A913C 23105400 */  subu       $v0, $v0, $s4
/* 99940 800A9140 80F00200 */  sll        $fp, $v0, 2
/* 99944 800A9144 21B07E02 */  addu       $s6, $s3, $fp
/* 99948 800A9148 2120D303 */  addu       $a0, $fp, $s3
.L800A914C:
/* 9994C 800A914C 39C3010C */  jal        PeekMessageQueue
/* 99950 800A9150 0C008424 */   addiu     $a0, $a0, 0xC
/* 99954 800A9154 21884000 */  addu       $s1, $v0, $zero
/* 99958 800A9158 9F012012 */  beqz       $s1, .L800A97D8
/* 9995C 800A915C 21206002 */   addu      $a0, $s3, $zero
/* 99960 800A9160 A9C9010C */  jal        G2EmulationQueryAnimation
/* 99964 800A9164 21288002 */   addu      $a1, $s4, $zero
/* 99968 800A9168 1000043C */  lui        $a0, (0x100001 >> 16)
/* 9996C 800A916C 01008434 */  ori        $a0, $a0, (0x100001 & 0xFFFF)
/* 99970 800A9170 0000238E */  lw         $v1, 0x0($s1)
/* 99974 800A9174 00000000 */  nop
/* 99978 800A9178 45006410 */  beq        $v1, $a0, .L800A9290
/* 9997C 800A917C 21804000 */   addu      $s0, $v0, $zero
/* 99980 800A9180 2A108300 */  slt        $v0, $a0, $v1
/* 99984 800A9184 20004014 */  bnez       $v0, .L800A9208
/* 99988 800A9188 0204023C */   lui       $v0, (0x4020000 >> 16)
/* 9998C 800A918C 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 99990 800A9190 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 99994 800A9194 8B016210 */  beq        $v1, $v0, .L800A97C4
/* 99998 800A9198 2A104300 */   slt       $v0, $v0, $v1
/* 9999C 800A919C 0B004014 */  bnez       $v0, .L800A91CC
/* 999A0 800A91A0 0080023C */   lui       $v0, (0x80000001 >> 16)
/* 999A4 800A91A4 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 999A8 800A91A8 19016210 */  beq        $v1, $v0, .L800A9610
/* 999AC 800A91AC 2A106200 */   slt       $v0, $v1, $v0
/* 999B0 800A91B0 59014014 */  bnez       $v0, .L800A9718
/* 999B4 800A91B4 0080023C */   lui       $v0, (0x80000004 >> 16)
/* 999B8 800A91B8 04004234 */  ori        $v0, $v0, (0x80000004 & 0xFFFF)
/* 999BC 800A91BC 81016210 */  beq        $v1, $v0, .L800A97C4
/* 999C0 800A91C0 00000000 */   nop
/* 999C4 800A91C4 EEA50208 */  j          .L800A97B8
/* 999C8 800A91C8 21206002 */   addu      $a0, $s3, $zero
.L800A91CC:
/* 999CC 800A91CC 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 999D0 800A91D0 73016210 */  beq        $v1, $v0, .L800A97A0
/* 999D4 800A91D4 2A104300 */   slt       $v0, $v0, $v1
/* 999D8 800A91D8 07004014 */  bnez       $v0, .L800A91F8
/* 999DC 800A91DC 1000023C */   lui       $v0, (0x100000 >> 16)
/* 999E0 800A91E0 0080023C */  lui        $v0, (0x80000010 >> 16)
/* 999E4 800A91E4 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 999E8 800A91E8 24016210 */  beq        $v1, $v0, .L800A967C
/* 999EC 800A91EC 21206002 */   addu      $a0, $s3, $zero
/* 999F0 800A91F0 EEA50208 */  j          .L800A97B8
/* 999F4 800A91F4 00000000 */   nop
.L800A91F8:
/* 999F8 800A91F8 A6006210 */  beq        $v1, $v0, .L800A9494
/* 999FC 800A91FC 21206002 */   addu      $a0, $s3, $zero
/* 99A00 800A9200 EEA50208 */  j          .L800A97B8
/* 99A04 800A9204 00000000 */   nop
.L800A9208:
/* 99A08 800A9208 6E016210 */  beq        $v1, $v0, .L800A97C4
/* 99A0C 800A920C 2A104300 */   slt       $v0, $v0, $v1
/* 99A10 800A9210 11004014 */  bnez       $v0, .L800A9258
/* 99A14 800A9214 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 99A18 800A9218 0002023C */  lui        $v0, (0x2000000 >> 16)
/* 99A1C 800A921C A9006210 */  beq        $v1, $v0, .L800A94C4
/* 99A20 800A9220 2A104300 */   slt       $v0, $v0, $v1
/* 99A24 800A9224 07004014 */  bnez       $v0, .L800A9244
/* 99A28 800A9228 0104023C */   lui       $v0, (0x4010400 >> 16)
/* 99A2C 800A922C 1000023C */  lui        $v0, (0x100004 >> 16)
/* 99A30 800A9230 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 99A34 800A9234 4B006210 */  beq        $v1, $v0, .L800A9364
/* 99A38 800A9238 21206002 */   addu      $a0, $s3, $zero
/* 99A3C 800A923C EEA50208 */  j          .L800A97B8
/* 99A40 800A9240 00000000 */   nop
.L800A9244:
/* 99A44 800A9244 00044234 */  ori        $v0, $v0, (0x4010400 & 0xFFFF)
/* 99A48 800A9248 5E016210 */  beq        $v1, $v0, .L800A97C4
/* 99A4C 800A924C 00000000 */   nop
/* 99A50 800A9250 EEA50208 */  j          .L800A97B8
/* 99A54 800A9254 21206002 */   addu      $a0, $s3, $zero
.L800A9258:
/* 99A58 800A9258 42016210 */  beq        $v1, $v0, .L800A9764
/* 99A5C 800A925C 2A104300 */   slt       $v0, $v0, $v1
/* 99A60 800A9260 06004014 */  bnez       $v0, .L800A927C
/* 99A64 800A9264 0020023C */   lui       $v0, (0x20000008 >> 16)
/* 99A68 800A9268 0008023C */  lui        $v0, (0x8000008 >> 16)
/* 99A6C 800A926C 4C006210 */  beq        $v1, $v0, .L800A93A0
/* 99A70 800A9270 21206002 */   addu      $a0, $s3, $zero
/* 99A74 800A9274 EEA50208 */  j          .L800A97B8
/* 99A78 800A9278 00000000 */   nop
.L800A927C:
/* 99A7C 800A927C 08004234 */  ori        $v0, $v0, (0x8000008 & 0xFFFF)
/* 99A80 800A9280 0E016210 */  beq        $v1, $v0, .L800A96BC
/* 99A84 800A9284 21206002 */   addu      $a0, $s3, $zero
/* 99A88 800A9288 EEA50208 */  j          .L800A97B8
/* 99A8C 800A928C 00000000 */   nop
.L800A9290:
/* 99A90 800A9290 2C008016 */  bnez       $s4, .L800A9344
/* 99A94 800A9294 40000224 */   addiu     $v0, $zero, 0x40
/* 99A98 800A9298 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 99A9C 800A929C 0000648E */  lw         $a0, 0x0($s3)
/* 99AA0 800A92A0 09810234 */  ori        $v0, $zero, 0x8109
/* 99AA4 800A92A4 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 99AA8 800A92A8 03000224 */  addiu      $v0, $zero, 0x3
/* 99AAC 800A92AC 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 99AB0 800A92B0 938B020C */  jal        SteerSwitchMode
/* 99AB4 800A92B4 21280000 */   addu      $a1, $zero, $zero
/* 99AB8 800A92B8 0400228E */  lw         $v0, 0x4($s1)
/* 99ABC 800A92BC 00000000 */  nop
/* 99AC0 800A92C0 0C004010 */  beqz       $v0, .L800A92F4
/* 99AC4 800A92C4 48000524 */   addiu     $a1, $zero, 0x48
/* 99AC8 800A92C8 0000648E */  lw         $a0, 0x0($s3)
/* 99ACC 800A92CC 21300000 */  addu       $a2, $zero, $zero
/* 99AD0 800A92D0 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 99AD4 800A92D4 2138C000 */   addu      $a3, $a2, $zero
/* 99AD8 800A92D8 14004010 */  beqz       $v0, .L800A932C
/* 99ADC 800A92DC 21206002 */   addu      $a0, $s3, $zero
/* 99AE0 800A92E0 1000B7AF */  sw         $s7, 0x10($sp)
/* 99AE4 800A92E4 03000524 */  addiu      $a1, $zero, 0x3
/* 99AE8 800A92E8 21300000 */  addu       $a2, $zero, $zero
/* 99AEC 800A92EC C9A40208 */  j          .L800A9324
/* 99AF0 800A92F0 2138A000 */   addu      $a3, $a1, $zero
.L800A92F4:
/* 99AF4 800A92F4 0000648E */  lw         $a0, 0x0($s3)
/* 99AF8 800A92F8 4C000524 */  addiu      $a1, $zero, 0x4C
/* 99AFC 800A92FC 21300000 */  addu       $a2, $zero, $zero
/* 99B00 800A9300 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 99B04 800A9304 2138C000 */   addu      $a3, $a2, $zero
/* 99B08 800A9308 08004010 */  beqz       $v0, .L800A932C
/* 99B0C 800A930C 02000224 */   addiu     $v0, $zero, 0x2
/* 99B10 800A9310 1000A2AF */  sw         $v0, 0x10($sp)
/* 99B14 800A9314 21206002 */  addu       $a0, $s3, $zero
/* 99B18 800A9318 04000524 */  addiu      $a1, $zero, 0x4
/* 99B1C 800A931C 21300000 */  addu       $a2, $zero, $zero
/* 99B20 800A9320 08000724 */  addiu      $a3, $zero, 0x8
.L800A9324:
/* 99B24 800A9324 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 99B28 800A9328 00000000 */   nop
.L800A932C:
/* 99B2C 800A932C 0500A012 */  beqz       $s5, .L800A9344
/* 99B30 800A9330 2120A002 */   addu      $a0, $s5, $zero
/* 99B34 800A9334 8000053C */  lui        $a1, (0x80002C >> 16)
/* 99B38 800A9338 2C00A534 */  ori        $a1, $a1, (0x80002C & 0xFFFF)
/* 99B3C 800A933C A1D1000C */  jal        INSTANCE_Post
/* 99B40 800A9340 21300000 */   addu      $a2, $zero, $zero
.L800A9344:
/* 99B44 800A9344 0400228E */  lw         $v0, 0x4($s1)
/* 99B48 800A9348 00000000 */  nop
/* 99B4C 800A934C 03004010 */  beqz       $v0, .L800A935C
/* 99B50 800A9350 48000224 */   addiu     $v0, $zero, 0x48
/* 99B54 800A9354 F1A50208 */  j          .L800A97C4
/* 99B58 800A9358 2001C2AE */   sw        $v0, 0x120($s6)
.L800A935C:
/* 99B5C 800A935C F1A50208 */  j          .L800A97C4
/* 99B60 800A9360 2001C0AE */   sw        $zero, 0x120($s6)
.L800A9364:
/* 99B64 800A9364 18018016 */  bnez       $s4, .L800A97C8
/* 99B68 800A9368 2120D303 */   addu      $a0, $fp, $s3
/* 99B6C 800A936C 0000648E */  lw         $a0, 0x0($s3)
/* 99B70 800A9370 EC92000C */  jal        COLLIDE_SegmentCollisionOn
/* 99B74 800A9374 01000524 */   addiu     $a1, $zero, 0x1
/* 99B78 800A9378 1201A012 */  beqz       $s5, .L800A97C4
/* 99B7C 800A937C 2000053C */   lui       $a1, (0x200003 >> 16)
/* 99B80 800A9380 2120A002 */  addu       $a0, $s5, $zero
/* 99B84 800A9384 0300A534 */  ori        $a1, $a1, (0x200003 & 0xFFFF)
/* 99B88 800A9388 A1D1000C */  jal        INSTANCE_Post
/* 99B8C 800A938C 07000624 */   addiu     $a2, $zero, 0x7
/* 99B90 800A9390 2120A002 */  addu       $a0, $s5, $zero
/* 99B94 800A9394 8000053C */  lui        $a1, (0x80002B >> 16)
/* 99B98 800A9398 6BA50208 */  j          .L800A95AC
/* 99B9C 800A939C 2B00A534 */   ori       $a1, $a1, (0x80002B & 0xFFFF)
.L800A93A0:
/* 99BA0 800A93A0 05000224 */  addiu      $v0, $zero, 0x5
/* 99BA4 800A93A4 03000212 */  beq        $s0, $v0, .L800A93B4
/* 99BA8 800A93A8 55000224 */   addiu     $v0, $zero, 0x55
/* 99BAC 800A93AC 13000216 */  bne        $s0, $v0, .L800A93FC
/* 99BB0 800A93B0 00000000 */   nop
.L800A93B4:
/* 99BB4 800A93B4 21200000 */  addu       $a0, $zero, $zero
/* 99BB8 800A93B8 21288000 */  addu       $a1, $a0, $zero
/* 99BBC 800A93BC 4FC6010C */  jal        SetControlInitIdleData
/* 99BC0 800A93C0 03000624 */   addiu     $a2, $zero, 0x3
/* 99BC4 800A93C4 21206002 */  addu       $a0, $s3, $zero
/* 99BC8 800A93C8 21288002 */  addu       $a1, $s4, $zero
/* 99BCC 800A93CC 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 99BD0 800A93D0 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 99BD4 800A93D4 C1CA010C */  jal        StateSwitchStateData
/* 99BD8 800A93D8 21384000 */   addu      $a3, $v0, $zero
/* 99BDC 800A93DC FFF7033C */  lui        $v1, (0xF7FFEFFF >> 16)
/* 99BE0 800A93E0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 99BE4 800A93E4 FFEF6334 */  ori        $v1, $v1, (0xF7FFEFFF & 0xFFFF)
/* 99BE8 800A93E8 1C01D7AE */  sw         $s7, 0x11C($s6)
/* 99BEC 800A93EC 24104300 */  and        $v0, $v0, $v1
/* 99BF0 800A93F0 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 99BF4 800A93F4 F2A50208 */  j          .L800A97C8
/* 99BF8 800A93F8 2120D303 */   addu      $a0, $fp, $s3
.L800A93FC:
/* 99BFC 800A93FC F2009716 */  bne        $s4, $s7, .L800A97C8
/* 99C00 800A9400 2120D303 */   addu      $a0, $fp, $s3
/* 99C04 800A9404 3C02638E */  lw         $v1, 0x23C($s3)
/* 99C08 800A9408 50000224 */  addiu      $v0, $zero, 0x50
/* 99C0C 800A940C 0F006214 */  bne        $v1, $v0, .L800A944C
/* 99C10 800A9410 4C000524 */   addiu     $a1, $zero, 0x4C
/* 99C14 800A9414 0E00A012 */  beqz       $s5, .L800A9450
/* 99C18 800A9418 21300000 */   addu      $a2, $zero, $zero
/* 99C1C 800A941C 1800A88F */  lw         $t0, 0x18($sp)
/* 99C20 800A9420 00000000 */  nop
/* 99C24 800A9424 0B000015 */  bnez       $t0, .L800A9454
/* 99C28 800A9428 2110A000 */   addu      $v0, $a1, $zero
/* 99C2C 800A942C 2120A002 */  addu       $a0, $s5, $zero
/* 99C30 800A9430 8000053C */  lui        $a1, (0x800008 >> 16)
/* 99C34 800A9434 0800A534 */  ori        $a1, $a1, (0x800008 & 0xFFFF)
/* 99C38 800A9438 A1D1000C */  jal        INSTANCE_Post
/* 99C3C 800A943C 21300000 */   addu      $a2, $zero, $zero
/* 99C40 800A9440 8597020C */  jal        razReaverOn
/* 99C44 800A9444 00000000 */   nop
/* 99C48 800A9448 4C000524 */  addiu      $a1, $zero, 0x4C
.L800A944C:
/* 99C4C 800A944C 21300000 */  addu       $a2, $zero, $zero
.L800A9450:
/* 99C50 800A9450 2110A000 */  addu       $v0, $a1, $zero
.L800A9454:
/* 99C54 800A9454 200162AE */  sw         $v0, 0x120($s3)
/* 99C58 800A9458 2001C2AE */  sw         $v0, 0x120($s6)
/* 99C5C 800A945C 0000648E */  lw         $a0, 0x0($s3)
/* 99C60 800A9460 2138C000 */  addu       $a3, $a2, $zero
/* 99C64 800A9464 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 99C68 800A9468 580362AE */   sw        $v0, 0x358($s3)
/* 99C6C 800A946C D5004010 */  beqz       $v0, .L800A97C4
/* 99C70 800A9470 02000224 */   addiu     $v0, $zero, 0x2
/* 99C74 800A9474 1000A2AF */  sw         $v0, 0x10($sp)
/* 99C78 800A9478 21206002 */  addu       $a0, $s3, $zero
/* 99C7C 800A947C 04000524 */  addiu      $a1, $zero, 0x4
/* 99C80 800A9480 21300000 */  addu       $a2, $zero, $zero
/* 99C84 800A9484 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 99C88 800A9488 08000724 */   addiu     $a3, $zero, 0x8
/* 99C8C 800A948C F2A50208 */  j          .L800A97C8
/* 99C90 800A9490 2120D303 */   addu      $a0, $fp, $s3
.L800A9494:
/* 99C94 800A9494 21200000 */  addu       $a0, $zero, $zero
/* 99C98 800A9498 21288000 */  addu       $a1, $a0, $zero
/* 99C9C 800A949C 4FC6010C */  jal        SetControlInitIdleData
/* 99CA0 800A94A0 03000624 */   addiu     $a2, $zero, 0x3
/* 99CA4 800A94A4 21206002 */  addu       $a0, $s3, $zero
/* 99CA8 800A94A8 21288002 */  addu       $a1, $s4, $zero
/* 99CAC 800A94AC 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 99CB0 800A94B0 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 99CB4 800A94B4 C1CA010C */  jal        StateSwitchStateData
/* 99CB8 800A94B8 21384000 */   addu      $a3, $v0, $zero
/* 99CBC 800A94BC F2A50208 */  j          .L800A97C8
/* 99CC0 800A94C0 2120D303 */   addu      $a0, $fp, $s3
.L800A94C4:
/* 99CC4 800A94C4 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 99CC8 800A94C8 00000000 */  nop
/* 99CCC 800A94CC 04004230 */  andi       $v0, $v0, 0x4
/* 99CD0 800A94D0 BC004010 */  beqz       $v0, .L800A97C4
/* 99CD4 800A94D4 03000224 */   addiu     $v0, $zero, 0x3
/* 99CD8 800A94D8 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 99CDC 800A94DC 00000000 */  nop
/* 99CE0 800A94E0 B8006210 */  beq        $v1, $v0, .L800A97C4
/* 99CE4 800A94E4 05000224 */   addiu     $v0, $zero, 0x5
/* 99CE8 800A94E8 B6000212 */  beq        $s0, $v0, .L800A97C4
/* 99CEC 800A94EC 55000224 */   addiu     $v0, $zero, 0x55
/* 99CF0 800A94F0 B4000212 */  beq        $s0, $v0, .L800A97C4
/* 99CF4 800A94F4 0408023C */   lui       $v0, (0x8041000 >> 16)
/* 99CF8 800A94F8 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 99CFC 800A94FC 00104234 */  ori        $v0, $v0, (0x8041000 & 0xFFFF)
/* 99D00 800A9500 25186200 */  or         $v1, $v1, $v0
/* 99D04 800A9504 F7FF0224 */  addiu      $v0, $zero, -0x9
/* 99D08 800A9508 24186200 */  and        $v1, $v1, $v0
/* 99D0C 800A950C C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 99D10 800A9510 AC008016 */  bnez       $s4, .L800A97C4
/* 99D14 800A9514 21900000 */   addu      $s2, $zero, $zero
/* 99D18 800A9518 08001124 */  addiu      $s1, $zero, 0x8
/* 99D1C 800A951C 21806002 */  addu       $s0, $s3, $zero
.L800A9520:
/* 99D20 800A9520 1C0100AE */  sw         $zero, 0x11C($s0)
/* 99D24 800A9524 21207102 */  addu       $a0, $s3, $s1
/* 99D28 800A9528 36C3010C */  jal        PurgeMessageQueue
/* 99D2C 800A952C 04008424 */   addiu     $a0, $a0, 0x4
/* 99D30 800A9530 1C013126 */  addiu      $s1, $s1, 0x11C
/* 99D34 800A9534 01005226 */  addiu      $s2, $s2, 0x1
/* 99D38 800A9538 0300422A */  slti       $v0, $s2, 0x3
/* 99D3C 800A953C F8FF4014 */  bnez       $v0, .L800A9520
/* 99D40 800A9540 1C011026 */   addiu     $s0, $s0, 0x11C
/* 99D44 800A9544 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 99D48 800A9548 0000648E */  lw         $a0, 0x0($s3)
/* 99D4C 800A954C 1000458C */  lw         $a1, 0x10($v0)
/* 99D50 800A9550 6C98020C */  jal        razCenterWithBlock
/* 99D54 800A9554 73FF0624 */   addiu     $a2, $zero, -0x8D
/* 99D58 800A9558 21300000 */  addu       $a2, $zero, $zero
/* 99D5C 800A955C D0F98487 */  lh         $a0, %gp_rel(Raziel + 0x3A0)($gp)
/* 99D60 800A9560 D2F98587 */  lh         $a1, %gp_rel(Raziel + 0x3A2)($gp)
/* 99D64 800A9564 2138C000 */  addu       $a3, $a2, $zero
/* 99D68 800A9568 1000A0AF */  sw         $zero, 0x10($sp)
/* 99D6C 800A956C 23200400 */  negu       $a0, $a0
/* 99D70 800A9570 21C4010C */  jal        SetObjectData
/* 99D74 800A9574 23280500 */   negu      $a1, $a1
/* 99D78 800A9578 8000053C */  lui        $a1, (0x800001 >> 16)
/* 99D7C 800A957C 0100A534 */  ori        $a1, $a1, (0x800001 & 0xFFFF)
/* 99D80 800A9580 08FA838F */  lw         $v1, %gp_rel(Raziel + 0x3D8)($gp)
/* 99D84 800A9584 21804000 */  addu       $s0, $v0, $zero
/* 99D88 800A9588 1000648C */  lw         $a0, 0x10($v1)
/* 99D8C 800A958C A1D1000C */  jal        INSTANCE_Post
/* 99D90 800A9590 21300002 */   addu      $a2, $s0, $zero
/* 99D94 800A9594 0C00028E */  lw         $v0, 0xC($s0)
/* 99D98 800A9598 00000000 */  nop
/* 99D9C 800A959C 01004230 */  andi       $v0, $v0, 0x1
/* 99DA0 800A95A0 06004014 */  bnez       $v0, .L800A95BC
/* 99DA4 800A95A4 1000053C */   lui       $a1, (0x100000 >> 16)
/* 99DA8 800A95A8 0000648E */  lw         $a0, 0x0($s3)
.L800A95AC:
/* 99DAC 800A95AC A1D1000C */  jal        INSTANCE_Post
/* 99DB0 800A95B0 21300000 */   addu      $a2, $zero, $zero
/* 99DB4 800A95B4 F2A50208 */  j          .L800A97C8
/* 99DB8 800A95B8 2120D303 */   addu      $a0, $fp, $s3
.L800A95BC:
/* 99DBC 800A95BC 0000648E */  lw         $a0, 0x0($s3)
/* 99DC0 800A95C0 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 99DC4 800A95C4 01000524 */   addiu     $a1, $zero, 0x1
/* 99DC8 800A95C8 0C00028E */  lw         $v0, 0xC($s0)
/* 99DCC 800A95CC 00000000 */  nop
/* 99DD0 800A95D0 08004230 */  andi       $v0, $v0, 0x8
/* 99DD4 800A95D4 04004010 */  beqz       $v0, .L800A95E8
/* 99DD8 800A95D8 55000524 */   addiu     $a1, $zero, 0x55
/* 99DDC 800A95DC 1000B7AF */  sw         $s7, 0x10($sp)
/* 99DE0 800A95E0 7DA50208 */  j          .L800A95F4
/* 99DE4 800A95E4 21206002 */   addu      $a0, $s3, $zero
.L800A95E8:
/* 99DE8 800A95E8 1000B7AF */  sw         $s7, 0x10($sp)
/* 99DEC 800A95EC 21206002 */  addu       $a0, $s3, $zero
/* 99DF0 800A95F0 05000524 */  addiu      $a1, $zero, 0x5
.L800A95F4:
/* 99DF4 800A95F4 21300000 */  addu       $a2, $zero, $zero
/* 99DF8 800A95F8 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 99DFC 800A95FC 2138C000 */   addu      $a3, $a2, $zero
/* 99E00 800A9600 C89E020C */  jal        razSetPlayerEventHistory
/* 99E04 800A9604 02000424 */   addiu     $a0, $zero, 0x2
/* 99E08 800A9608 F2A50208 */  j          .L800A97C8
/* 99E0C 800A960C 2120D303 */   addu      $a0, $fp, $s3
.L800A9610:
/* 99E10 800A9610 6D008016 */  bnez       $s4, .L800A97C8
/* 99E14 800A9614 2120D303 */   addu      $a0, $fp, $s3
/* 99E18 800A9618 05000224 */  addiu      $v0, $zero, 0x5
/* 99E1C 800A961C 6A000212 */  beq        $s0, $v0, .L800A97C8
/* 99E20 800A9620 55000224 */   addiu     $v0, $zero, 0x55
/* 99E24 800A9624 68000212 */  beq        $s0, $v0, .L800A97C8
/* 99E28 800A9628 20000524 */   addiu     $a1, $zero, 0x20
/* 99E2C 800A962C 21300000 */  addu       $a2, $zero, $zero
/* 99E30 800A9630 2110A000 */  addu       $v0, $a1, $zero
/* 99E34 800A9634 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 99E38 800A9638 0000648E */  lw         $a0, 0x0($s3)
/* 99E3C 800A963C 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 99E40 800A9640 2138C000 */   addu      $a3, $a2, $zero
/* 99E44 800A9644 06004010 */  beqz       $v0, .L800A9660
/* 99E48 800A9648 21206002 */   addu      $a0, $s3, $zero
/* 99E4C 800A964C 1000B7AF */  sw         $s7, 0x10($sp)
/* 99E50 800A9650 26000524 */  addiu      $a1, $zero, 0x26
/* 99E54 800A9654 21300000 */  addu       $a2, $zero, $zero
/* 99E58 800A9658 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 99E5C 800A965C 01000724 */   addiu     $a3, $zero, 0x1
.L800A9660:
/* 99E60 800A9660 21206002 */  addu       $a0, $s3, $zero
/* 99E64 800A9664 0B80053C */  lui        $a1, %hi(StateHandlerCompression)
/* 99E68 800A9668 ACB5A524 */  addiu      $a1, $a1, %lo(StateHandlerCompression)
/* 99E6C 800A966C F4CA010C */  jal        StateSwitchStateCharacterData
/* 99E70 800A9670 21300000 */   addu      $a2, $zero, $zero
/* 99E74 800A9674 F2A50208 */  j          .L800A97C8
/* 99E78 800A9678 2120D303 */   addu      $a0, $fp, $s3
.L800A967C:
/* 99E7C 800A967C 10008016 */  bnez       $s4, .L800A96C0
/* 99E80 800A9680 05000224 */   addiu     $v0, $zero, 0x5
/* 99E84 800A9684 0000628E */  lw         $v0, 0x0($s3)
/* 99E88 800A9688 00000000 */  nop
/* 99E8C 800A968C B400428C */  lw         $v0, 0xB4($v0)
/* 99E90 800A9690 00000000 */  nop
/* 99E94 800A9694 09004010 */  beqz       $v0, .L800A96BC
/* 99E98 800A9698 94006426 */   addiu     $a0, $s3, 0x94
/* 99E9C 800A969C 0080053C */  lui        $a1, (0x80000010 >> 16)
/* 99EA0 800A96A0 1000A534 */  ori        $a1, $a1, (0x80000010 & 0xFFFF)
/* 99EA4 800A96A4 4EC3010C */  jal        EnMessageQueueData
/* 99EA8 800A96A8 21300000 */   addu      $a2, $zero, $zero
/* 99EAC 800A96AC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 99EB0 800A96B0 8000033C */  lui        $v1, (0x800000 >> 16)
/* 99EB4 800A96B4 25104300 */  or         $v0, $v0, $v1
/* 99EB8 800A96B8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800A96BC:
/* 99EBC 800A96BC 05000224 */  addiu      $v0, $zero, 0x5
.L800A96C0:
/* 99EC0 800A96C0 40000212 */  beq        $s0, $v0, .L800A97C4
/* 99EC4 800A96C4 55000224 */   addiu     $v0, $zero, 0x55
/* 99EC8 800A96C8 3E000212 */  beq        $s0, $v0, .L800A97C4
/* 99ECC 800A96CC 50000224 */   addiu     $v0, $zero, 0x50
/* 99ED0 800A96D0 2001C38E */  lw         $v1, 0x120($s6)
/* 99ED4 800A96D4 00000000 */  nop
/* 99ED8 800A96D8 3B006210 */  beq        $v1, $v0, .L800A97C8
/* 99EDC 800A96DC 2120D303 */   addu      $a0, $fp, $s3
/* 99EE0 800A96E0 21200000 */  addu       $a0, $zero, $zero
/* 99EE4 800A96E4 21288000 */  addu       $a1, $a0, $zero
/* 99EE8 800A96E8 4FC6010C */  jal        SetControlInitIdleData
/* 99EEC 800A96EC 03000624 */   addiu     $a2, $zero, 0x3
/* 99EF0 800A96F0 21206002 */  addu       $a0, $s3, $zero
/* 99EF4 800A96F4 21288002 */  addu       $a1, $s4, $zero
/* 99EF8 800A96F8 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 99EFC 800A96FC E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 99F00 800A9700 C1CA010C */  jal        StateSwitchStateData
/* 99F04 800A9704 21384000 */   addu      $a3, $v0, $zero
/* 99F08 800A9708 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 99F0C 800A970C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 99F10 800A9710 F2A50208 */  j          .L800A97C8
/* 99F14 800A9714 2120D303 */   addu      $a0, $fp, $s3
.L800A9718:
/* 99F18 800A9718 2A00A012 */  beqz       $s5, .L800A97C4
/* 99F1C 800A971C 01000824 */   addiu     $t0, $zero, 0x1
/* 99F20 800A9720 21288002 */  addu       $a1, $s4, $zero
/* 99F24 800A9724 50000624 */  addiu      $a2, $zero, 0x50
/* 99F28 800A9728 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 99F2C 800A972C 1800A8AF */  sw         $t0, 0x18($sp)
/* 99F30 800A9730 1000A2AF */  sw         $v0, 0x10($sp)
/* 99F34 800A9734 0000648E */  lw         $a0, 0x0($s3)
/* 99F38 800A9738 5E9C020C */  jal        razSwitchVAnimGroup
/* 99F3C 800A973C 21384000 */   addu      $a3, $v0, $zero
/* 99F40 800A9740 2120A002 */  addu       $a0, $s5, $zero
/* 99F44 800A9744 2000053C */  lui        $a1, (0x200005 >> 16)
/* 99F48 800A9748 0500A534 */  ori        $a1, $a1, (0x200005 & 0xFFFF)
/* 99F4C 800A974C 21300000 */  addu       $a2, $zero, $zero
/* 99F50 800A9750 50000224 */  addiu      $v0, $zero, 0x50
/* 99F54 800A9754 A1D1000C */  jal        INSTANCE_Post
/* 99F58 800A9758 2001C2AE */   sw        $v0, 0x120($s6)
/* 99F5C 800A975C F2A50208 */  j          .L800A97C8
/* 99F60 800A9760 2120D303 */   addu      $a0, $fp, $s3
.L800A9764:
/* 99F64 800A9764 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 99F68 800A9768 03000224 */  addiu      $v0, $zero, 0x3
/* 99F6C 800A976C 15006210 */  beq        $v1, $v0, .L800A97C4
/* 99F70 800A9770 05000224 */   addiu     $v0, $zero, 0x5
/* 99F74 800A9774 13000212 */  beq        $s0, $v0, .L800A97C4
/* 99F78 800A9778 55000224 */   addiu     $v0, $zero, 0x55
/* 99F7C 800A977C 11000212 */  beq        $s0, $v0, .L800A97C4
/* 99F80 800A9780 21288002 */   addu      $a1, $s4, $zero
/* 99F84 800A9784 21206002 */  addu       $a0, $s3, $zero
/* 99F88 800A9788 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 99F8C 800A978C A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 99F90 800A9790 C1CA010C */  jal        StateSwitchStateData
/* 99F94 800A9794 03000724 */   addiu     $a3, $zero, 0x3
/* 99F98 800A9798 F2A50208 */  j          .L800A97C8
/* 99F9C 800A979C 2120D303 */   addu      $a0, $fp, $s3
.L800A97A0:
/* 99FA0 800A97A0 05000224 */  addiu      $v0, $zero, 0x5
/* 99FA4 800A97A4 07000212 */  beq        $s0, $v0, .L800A97C4
/* 99FA8 800A97A8 55000224 */   addiu     $v0, $zero, 0x55
/* 99FAC 800A97AC 05000212 */  beq        $s0, $v0, .L800A97C4
/* 99FB0 800A97B0 00000000 */   nop
/* 99FB4 800A97B4 21206002 */  addu       $a0, $s3, $zero
.L800A97B8:
/* 99FB8 800A97B8 5000A68F */  lw         $a2, 0x50($sp)
/* 99FBC 800A97BC B9BF020C */  jal        DefaultStateHandler
/* 99FC0 800A97C0 21288002 */   addu      $a1, $s4, $zero
.L800A97C4:
/* 99FC4 800A97C4 2120D303 */  addu       $a0, $fp, $s3
.L800A97C8:
/* 99FC8 800A97C8 27C3010C */  jal        DeMessageQueue
/* 99FCC 800A97CC 0C008424 */   addiu     $a0, $a0, 0xC
/* 99FD0 800A97D0 53A40208 */  j          .L800A914C
/* 99FD4 800A97D4 2120D303 */   addu      $a0, $fp, $s3
.L800A97D8:
/* 99FD8 800A97D8 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 99FDC 800A97DC 9CA4838F */  lw         $v1, %gp_rel(RazielCommands + 0x18)($gp)
/* 99FE0 800A97E0 0000428C */  lw         $v0, 0x0($v0)
/* 99FE4 800A97E4 00000000 */  nop
/* 99FE8 800A97E8 24104300 */  and        $v0, $v0, $v1
/* 99FEC 800A97EC 10004014 */  bnez       $v0, .L800A9830
/* 99FF0 800A97F0 C0101400 */   sll       $v0, $s4, 3
/* 99FF4 800A97F4 21105400 */  addu       $v0, $v0, $s4
/* 99FF8 800A97F8 C0100200 */  sll        $v0, $v0, 3
/* 99FFC 800A97FC 23105400 */  subu       $v0, $v0, $s4
/* 9A000 800A9800 80200200 */  sll        $a0, $v0, 2
/* 9A004 800A9804 21106402 */  addu       $v0, $s3, $a0
/* 9A008 800A9808 0800438C */  lw         $v1, 0x8($v0)
/* 9A00C 800A980C 0B80023C */  lui        $v0, %hi(StateHandlerCrouch)
/* 9A010 800A9810 E8904224 */  addiu      $v0, $v0, %lo(StateHandlerCrouch)
/* 9A014 800A9814 06006214 */  bne        $v1, $v0, .L800A9830
/* 9A018 800A9818 21209300 */   addu      $a0, $a0, $s3
/* 9A01C 800A981C 0C008424 */  addiu      $a0, $a0, 0xC
/* 9A020 800A9820 0020053C */  lui        $a1, (0x20000008 >> 16)
/* 9A024 800A9824 0800A534 */  ori        $a1, $a1, (0x20000008 & 0xFFFF)
/* 9A028 800A9828 4EC3010C */  jal        EnMessageQueueData
/* 9A02C 800A982C 21300000 */   addu      $a2, $zero, $zero
.L800A9830:
/* 9A030 800A9830 4400BF8F */  lw         $ra, 0x44($sp)
/* 9A034 800A9834 4000BE8F */  lw         $fp, 0x40($sp)
/* 9A038 800A9838 3C00B78F */  lw         $s7, 0x3C($sp)
/* 9A03C 800A983C 3800B68F */  lw         $s6, 0x38($sp)
/* 9A040 800A9840 3400B58F */  lw         $s5, 0x34($sp)
/* 9A044 800A9844 3000B48F */  lw         $s4, 0x30($sp)
/* 9A048 800A9848 2C00B38F */  lw         $s3, 0x2C($sp)
/* 9A04C 800A984C 2800B28F */  lw         $s2, 0x28($sp)
/* 9A050 800A9850 2400B18F */  lw         $s1, 0x24($sp)
/* 9A054 800A9854 2000B08F */  lw         $s0, 0x20($sp)
/* 9A058 800A9858 0800E003 */  jr         $ra
/* 9A05C 800A985C 4800BD27 */   addiu     $sp, $sp, 0x48
.size StateHandlerCrouch, . - StateHandlerCrouch
