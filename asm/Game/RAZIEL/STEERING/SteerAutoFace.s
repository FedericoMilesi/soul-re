.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SteerAutoFace
/* 93200 800A2A00 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 93204 800A2A04 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 93208 800A2A08 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 9320C 800A2A0C 21988000 */  addu       $s3, $a0, $zero
/* 93210 800A2A10 2800B2AF */  sw         $s2, 0x28($sp)
/* 93214 800A2A14 21900000 */  addu       $s2, $zero, $zero
/* 93218 800A2A18 3000BFAF */  sw         $ra, 0x30($sp)
/* 9321C 800A2A1C 2400B1AF */  sw         $s1, 0x24($sp)
/* 93220 800A2A20 2000B0AF */  sw         $s0, 0x20($sp)
/* 93224 800A2A24 3000458C */  lw         $a1, 0x30($v0)
/* 93228 800A2A28 5C006426 */  addiu      $a0, $s3, 0x5C
/* 9322C 800A2A2C 87E8000C */  jal        MATH3D_AngleFromPosToPos
/* 93230 800A2A30 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 93234 800A2A34 00240200 */  sll        $a0, $v0, 16
/* 93238 800A2A38 B6F98587 */  lh         $a1, %gp_rel(Raziel + 0x386)($gp)
/* 9323C 800A2A3C 6CFB828F */  lw         $v0, %gp_rel(Raziel + 0x53C)($gp)
/* 93240 800A2A40 03240400 */  sra        $a0, $a0, 16
/* 93244 800A2A44 68FB84AF */  sw         $a0, %gp_rel(Raziel + 0x538)($gp)
/* 93248 800A2A48 70FB82AF */  sw         $v0, %gp_rel(Raziel + 0x540)($gp)
/* 9324C 800A2A4C 7EE8000C */  jal        AngleDiff
/* 93250 800A2A50 00000000 */   nop
/* 93254 800A2A54 00140200 */  sll        $v0, $v0, 16
/* 93258 800A2A58 038C0200 */  sra        $s1, $v0, 16
/* 9325C 800A2A5C 7F012226 */  addiu      $v0, $s1, 0x17F
/* 93260 800A2A60 FF02422C */  sltiu      $v0, $v0, 0x2FF
/* 93264 800A2A64 04004010 */  beqz       $v0, .L800A2A78
/* 93268 800A2A68 FF052326 */   addiu     $v1, $s1, 0x5FF
/* 9326C 800A2A6C 01001224 */  addiu      $s2, $zero, 0x1
/* 93270 800A2A70 6CFB80AF */  sw         $zero, %gp_rel(Raziel + 0x53C)($gp)
/* 93274 800A2A74 64FB80AF */  sw         $zero, %gp_rel(Raziel + 0x534)($gp)
.L800A2A78:
/* 93278 800A2A78 8004622C */  sltiu      $v0, $v1, 0x480
/* 9327C 800A2A7C 05004010 */  beqz       $v0, .L800A2A94
/* 93280 800A2A80 01000224 */   addiu     $v0, $zero, 0x1
/* 93284 800A2A84 02001224 */  addiu      $s2, $zero, 0x2
/* 93288 800A2A88 6CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x53C)($gp)
/* 9328C 800A2A8C 00040224 */  addiu      $v0, $zero, 0x400
/* 93290 800A2A90 64FB82AF */  sw         $v0, %gp_rel(Raziel + 0x534)($gp)
.L800A2A94:
/* 93294 800A2A94 80FE2226 */  addiu      $v0, $s1, -0x180
/* 93298 800A2A98 8004422C */  sltiu      $v0, $v0, 0x480
/* 9329C 800A2A9C 05004010 */  beqz       $v0, .L800A2AB4
/* 932A0 800A2AA0 03000224 */   addiu     $v0, $zero, 0x3
/* 932A4 800A2AA4 04001224 */  addiu      $s2, $zero, 0x4
/* 932A8 800A2AA8 6CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x53C)($gp)
/* 932AC 800A2AAC 00FC0224 */  addiu      $v0, $zero, -0x400
/* 932B0 800A2AB0 64FB82AF */  sw         $v0, %gp_rel(Raziel + 0x534)($gp)
.L800A2AB4:
/* 932B4 800A2AB4 FF0B622C */  sltiu      $v0, $v1, 0xBFF
/* 932B8 800A2AB8 06004014 */  bnez       $v0, .L800A2AD4
/* 932BC 800A2ABC 78006426 */   addiu     $a0, $s3, 0x78
/* 932C0 800A2AC0 03001224 */  addiu      $s2, $zero, 0x3
/* 932C4 800A2AC4 02000224 */  addiu      $v0, $zero, 0x2
/* 932C8 800A2AC8 6CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x53C)($gp)
/* 932CC 800A2ACC 00080224 */  addiu      $v0, $zero, 0x800
/* 932D0 800A2AD0 64FB82AF */  sw         $v0, %gp_rel(Raziel + 0x534)($gp)
.L800A2AD4:
/* 932D4 800A2AD4 B6F99097 */  lhu        $s0, %gp_rel(Raziel + 0x386)($gp)
/* 932D8 800A2AD8 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 932DC 800A2ADC 40000224 */  addiu      $v0, $zero, 0x40
/* 932E0 800A2AE0 BCF982A7 */  sh         $v0, %gp_rel(Raziel + 0x38C)($gp)
/* 932E4 800A2AE4 002C1000 */  sll        $a1, $s0, 16
/* 932E8 800A2AE8 032C0500 */  sra        $a1, $a1, 16
/* 932EC 800A2AEC 80320600 */  sll        $a2, $a2, 10
/* 932F0 800A2AF0 53E8000C */  jal        AngleMoveToward
/* 932F4 800A2AF4 03340600 */   sra       $a2, $a2, 16
/* 932F8 800A2AF8 0010043C */  lui        $a0, (0x10001000 >> 16)
/* 932FC 800A2AFC 00108434 */  ori        $a0, $a0, (0x10001000 & 0xFFFF)
/* 93300 800A2B00 FFFF4326 */  addiu      $v1, $s2, -0x1
/* 93304 800A2B04 70FB828F */  lw         $v0, %gp_rel(Raziel + 0x540)($gp)
/* 93308 800A2B08 6CFB83AF */  sw         $v1, %gp_rel(Raziel + 0x53C)($gp)
/* 9330C 800A2B0C 5EFB90A7 */  sh         $s0, %gp_rel(Raziel + 0x52E)($gp)
/* 93310 800A2B10 25006210 */  beq        $v1, $v0, .L800A2BA8
/* 93314 800A2B14 25904402 */   or        $s2, $s2, $a0
/* 93318 800A2B18 C8017026 */  addiu      $s0, $s3, 0x1C8
/* 9331C 800A2B1C 21200002 */  addu       $a0, $s0, $zero
/* 93320 800A2B20 B6F98297 */  lhu        $v0, %gp_rel(Raziel + 0x386)($gp)
/* 93324 800A2B24 01000524 */  addiu      $a1, $zero, 0x1
/* 93328 800A2B28 780062A6 */  sh         $v0, 0x78($s3)
/* 9332C 800A2B2C 64FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x534)($gp)
/* 93330 800A2B30 0A000624 */  addiu      $a2, $zero, 0xA
/* 93334 800A2B34 1800A0A7 */  sh         $zero, 0x18($sp)
/* 93338 800A2B38 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 9333C 800A2B3C E541020C */  jal        G2Anim_IsControllerActive
/* 93340 800A2B40 1C00A2A7 */   sh        $v0, 0x1C($sp)
/* 93344 800A2B44 04004014 */  bnez       $v0, .L800A2B58
/* 93348 800A2B48 21200002 */   addu      $a0, $s0, $zero
/* 9334C 800A2B4C 01000524 */  addiu      $a1, $zero, 0x1
/* 93350 800A2B50 5641020C */  jal        G2Anim_EnableController
/* 93354 800A2B54 0A000624 */   addiu     $a2, $zero, 0xA
.L800A2B58:
/* 93358 800A2B58 A8F9838F */  lw         $v1, %gp_rel(Raziel + 0x378)($gp)
/* 9335C 800A2B5C ACF9828F */  lw         $v0, %gp_rel(Raziel + 0x37C)($gp)
/* 93360 800A2B60 00000000 */  nop
/* 93364 800A2B64 0C006214 */  bne        $v1, $v0, .L800A2B98
/* 93368 800A2B68 21200002 */   addu      $a0, $s0, $zero
/* 9336C 800A2B6C 21206002 */  addu       $a0, $s3, $zero
/* 93370 800A2B70 01000524 */  addiu      $a1, $zero, 0x1
/* 93374 800A2B74 0A000624 */  addiu      $a2, $zero, 0xA
/* 93378 800A2B78 1800A727 */  addiu      $a3, $sp, 0x18
/* 9337C 800A2B7C 04000224 */  addiu      $v0, $zero, 0x4
/* 93380 800A2B80 1000A2AF */  sw         $v0, 0x10($sp)
/* 93384 800A2B84 03000224 */  addiu      $v0, $zero, 0x3
/* 93388 800A2B88 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 9338C 800A2B8C 1400A2AF */   sw        $v0, 0x14($sp)
/* 93390 800A2B90 EA8A0208 */  j          .L800A2BA8
/* 93394 800A2B94 00000000 */   nop
.L800A2B98:
/* 93398 800A2B98 01000524 */  addiu      $a1, $zero, 0x1
/* 9339C 800A2B9C 0A000624 */  addiu      $a2, $zero, 0xA
/* 933A0 800A2BA0 7D42020C */  jal        G2Anim_SetController_Vector
/* 933A4 800A2BA4 1800A727 */   addiu     $a3, $sp, 0x18
.L800A2BA8:
/* 933A8 800A2BA8 78006486 */  lh         $a0, 0x78($s3)
/* 933AC 800A2BAC 68FB8587 */  lh         $a1, %gp_rel(Raziel + 0x538)($gp)
/* 933B0 800A2BB0 7EE8000C */  jal        AngleDiff
/* 933B4 800A2BB4 C8017026 */   addiu     $s0, $s3, 0x1C8
/* 933B8 800A2BB8 00140200 */  sll        $v0, $v0, 16
/* 933BC 800A2BBC 038C0200 */  sra        $s1, $v0, 16
/* 933C0 800A2BC0 21200002 */  addu       $a0, $s0, $zero
/* 933C4 800A2BC4 01000524 */  addiu      $a1, $zero, 0x1
/* 933C8 800A2BC8 F841020C */  jal        G2Anim_IsControllerInterpolating
/* 933CC 800A2BCC 0A000624 */   addiu     $a2, $zero, 0xA
/* 933D0 800A2BD0 16004010 */  beqz       $v0, .L800A2C2C
/* 933D4 800A2BD4 21200002 */   addu      $a0, $s0, $zero
/* 933D8 800A2BD8 0E000524 */  addiu      $a1, $zero, 0xE
/* 933DC 800A2BDC F841020C */  jal        G2Anim_IsControllerInterpolating
/* 933E0 800A2BE0 2130A000 */   addu      $a2, $a1, $zero
/* 933E4 800A2BE4 24004014 */  bnez       $v0, .L800A2C78
/* 933E8 800A2BE8 21104002 */   addu      $v0, $s2, $zero
/* 933EC 800A2BEC 21206002 */  addu       $a0, $s3, $zero
/* 933F0 800A2BF0 0E000524 */  addiu      $a1, $zero, 0xE
/* 933F4 800A2BF4 2130A000 */  addu       $a2, $a1, $zero
/* 933F8 800A2BF8 64FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x534)($gp)
/* 933FC 800A2BFC 1800A727 */  addiu      $a3, $sp, 0x18
/* 93400 800A2C00 1800A0A7 */  sh         $zero, 0x18($sp)
/* 93404 800A2C04 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 93408 800A2C08 23102202 */  subu       $v0, $s1, $v0
/* 9340C 800A2C0C 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 93410 800A2C10 04000224 */  addiu      $v0, $zero, 0x4
/* 93414 800A2C14 1000A2AF */  sw         $v0, 0x10($sp)
/* 93418 800A2C18 03000224 */  addiu      $v0, $zero, 0x3
/* 9341C 800A2C1C 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 93420 800A2C20 1400A2AF */   sw        $v0, 0x14($sp)
/* 93424 800A2C24 1E8B0208 */  j          .L800A2C78
/* 93428 800A2C28 21104002 */   addu      $v0, $s2, $zero
.L800A2C2C:
/* 9342C 800A2C2C 0E000524 */  addiu      $a1, $zero, 0xE
/* 93430 800A2C30 64FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x534)($gp)
/* 93434 800A2C34 2130A000 */  addu       $a2, $a1, $zero
/* 93438 800A2C38 1800A0A7 */  sh         $zero, 0x18($sp)
/* 9343C 800A2C3C 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 93440 800A2C40 23102202 */  subu       $v0, $s1, $v0
/* 93444 800A2C44 E541020C */  jal        G2Anim_IsControllerActive
/* 93448 800A2C48 1C00A2A7 */   sh        $v0, 0x1C($sp)
/* 9344C 800A2C4C 05004014 */  bnez       $v0, .L800A2C64
/* 93450 800A2C50 21200002 */   addu      $a0, $s0, $zero
/* 93454 800A2C54 0E000524 */  addiu      $a1, $zero, 0xE
/* 93458 800A2C58 5641020C */  jal        G2Anim_EnableController
/* 9345C 800A2C5C 2130A000 */   addu      $a2, $a1, $zero
/* 93460 800A2C60 21200002 */  addu       $a0, $s0, $zero
.L800A2C64:
/* 93464 800A2C64 0E000524 */  addiu      $a1, $zero, 0xE
/* 93468 800A2C68 2130A000 */  addu       $a2, $a1, $zero
/* 9346C 800A2C6C 7D42020C */  jal        G2Anim_SetController_Vector
/* 93470 800A2C70 1800A727 */   addiu     $a3, $sp, 0x18
/* 93474 800A2C74 21104002 */  addu       $v0, $s2, $zero
.L800A2C78:
/* 93478 800A2C78 3000BF8F */  lw         $ra, 0x30($sp)
/* 9347C 800A2C7C 2C00B38F */  lw         $s3, 0x2C($sp)
/* 93480 800A2C80 2800B28F */  lw         $s2, 0x28($sp)
/* 93484 800A2C84 2400B18F */  lw         $s1, 0x24($sp)
/* 93488 800A2C88 2000B08F */  lw         $s0, 0x20($sp)
/* 9348C 800A2C8C 0800E003 */  jr         $ra
/* 93490 800A2C90 3800BD27 */   addiu     $sp, $sp, 0x38
.size SteerAutoFace, . - SteerAutoFace
