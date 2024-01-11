.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_LookProcess
/* 91C4 800189C4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 91C8 800189C8 2000B2AF */  sw         $s2, 0x20($sp)
/* 91CC 800189CC 21908000 */  addu       $s2, $a0, $zero
/* 91D0 800189D0 2400BFAF */  sw         $ra, 0x24($sp)
/* 91D4 800189D4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 91D8 800189D8 1800B0AF */  sw         $s0, 0x18($sp)
/* 91DC 800189DC AA014296 */  lhu        $v0, 0x1AA($s2)
/* 91E0 800189E0 28014496 */  lhu        $a0, 0x128($s2)
/* 91E4 800189E4 AC014396 */  lhu        $v1, 0x1AC($s2)
/* 91E8 800189E8 2A014596 */  lhu        $a1, 0x12A($s2)
/* 91EC 800189EC 06014786 */  lh         $a3, 0x106($s2)
/* 91F0 800189F0 8EAC8687 */  lh         $a2, %gp_rel(Camera_lookDist)($gp)
/* 91F4 800189F4 21104400 */  addu       $v0, $v0, $a0
/* 91F8 800189F8 AA0142A6 */  sh         $v0, 0x1AA($s2)
/* 91FC 800189FC AE014296 */  lhu        $v0, 0x1AE($s2)
/* 9200 80018A00 21186500 */  addu       $v1, $v1, $a1
/* 9204 80018A04 AC0143A6 */  sh         $v1, 0x1AC($s2)
/* 9208 80018A08 2C014396 */  lhu        $v1, 0x12C($s2)
/* 920C 80018A0C 0801518E */  lw         $s1, 0x108($s2)
/* 9210 80018A10 21104300 */  addu       $v0, $v0, $v1
/* 9214 80018A14 AE0142A6 */  sh         $v0, 0x1AE($s2)
/* 9218 80018A18 2A10C700 */  slt        $v0, $a2, $a3
/* 921C 80018A1C 02004014 */  bnez       $v0, .L80018A28
/* 9220 80018A20 98015026 */   addiu     $s0, $s2, 0x198
/* 9224 80018A24 2138C000 */  addu       $a3, $a2, $zero
.L80018A28:
/* 9228 80018A28 21200002 */  addu       $a0, $s0, $zero
/* 922C 80018A2C 00014526 */  addiu      $a1, $s2, 0x100
/* 9230 80018A30 6F5A000C */  jal        CAMERA_CalcPosition
/* 9234 80018A34 3C014626 */   addiu     $a2, $s2, 0x13C
/* 9238 80018A38 21204002 */  addu       $a0, $s2, $zero
/* 923C 80018A3C 21280002 */  addu       $a1, $s0, $zero
/* 9240 80018A40 6175000C */  jal        CAMERA_DoCameraCollision2
/* 9244 80018A44 01000624 */   addiu     $a2, $zero, 0x1
/* 9248 80018A48 0A004010 */  beqz       $v0, .L80018A74
/* 924C 80018A4C 800442AE */   sw        $v0, 0x480($s2)
/* 9250 80018A50 00020824 */  addiu      $t0, $zero, 0x200
/* 9254 80018A54 B0014786 */  lh         $a3, 0x1B0($s2)
/* 9258 80018A58 8EAC8387 */  lh         $v1, %gp_rel(Camera_lookDist)($gp)
/* 925C 80018A5C 00000000 */  nop
/* 9260 80018A60 2A106700 */  slt        $v0, $v1, $a3
/* 9264 80018A64 06004010 */  beqz       $v0, .L80018A80
/* 9268 80018A68 05000424 */   addiu     $a0, $zero, 0x5
/* 926C 80018A6C A0620008 */  j          .L80018A80
/* 9270 80018A70 21386000 */   addu      $a3, $v1, $zero
.L80018A74:
/* 9274 80018A74 8EAC8787 */  lh         $a3, %gp_rel(Camera_lookDist)($gp)
/* 9278 80018A78 80000824 */  addiu      $t0, $zero, 0x80
/* 927C 80018A7C 01000424 */  addiu      $a0, $zero, 0x1
.L80018A80:
/* 9280 80018A80 9C04428E */  lw         $v0, 0x49C($s2)
/* 9284 80018A84 0200033C */  lui        $v1, (0x20000 >> 16)
/* 9288 80018A88 24104300 */  and        $v0, $v0, $v1
/* 928C 80018A8C 04004010 */  beqz       $v0, .L80018AA0
/* 9290 80018A90 2602E228 */   slti      $v0, $a3, 0x226
/* 9294 80018A94 02004010 */  beqz       $v0, .L80018AA0
/* 9298 80018A98 00000000 */   nop
/* 929C 80018A9C 26020724 */  addiu      $a3, $zero, 0x226
.L80018AA0:
/* 92A0 80018AA0 E800428E */  lw         $v0, 0xE8($s2)
/* 92A4 80018AA4 00000000 */  nop
/* 92A8 80018AA8 00084230 */  andi       $v0, $v0, 0x800
/* 92AC 80018AAC 0C004010 */  beqz       $v0, .L80018AE0
/* 92B0 80018AB0 06014526 */   addiu     $a1, $s2, 0x106
/* 92B4 80018AB4 A8014296 */  lhu        $v0, 0x1A8($s2)
/* 92B8 80018AB8 AA014396 */  lhu        $v1, 0x1AA($s2)
/* 92BC 80018ABC 060142A6 */  sh         $v0, 0x106($s2)
/* 92C0 80018AC0 AA014226 */  addiu      $v0, $s2, 0x1AA
/* 92C4 80018AC4 02004494 */  lhu        $a0, 0x2($v0)
/* 92C8 80018AC8 04004594 */  lhu        $a1, 0x4($v0)
/* 92CC 80018ACC 00014226 */  addiu      $v0, $s2, 0x100
/* 92D0 80018AD0 000143A6 */  sh         $v1, 0x100($s2)
/* 92D4 80018AD4 020044A4 */  sh         $a0, 0x2($v0)
/* 92D8 80018AD8 C7620008 */  j          .L80018B1C
/* 92DC 80018ADC 040045A4 */   sh        $a1, 0x4($v0)
.L80018AE0:
/* 92E0 80018AE0 2130E000 */  addu       $a2, $a3, $zero
/* 92E4 80018AE4 68014726 */  addiu      $a3, $s2, 0x168
/* 92E8 80018AE8 6A014226 */  addiu      $v0, $s2, 0x16A
/* 92EC 80018AEC 1000A2AF */  sw         $v0, 0x10($sp)
/* 92F0 80018AF0 605C000C */  jal        CriticalDampValue
/* 92F4 80018AF4 1400A8AF */   sw        $t0, 0x14($sp)
/* 92F8 80018AF8 21200000 */  addu       $a0, $zero, $zero
/* 92FC 80018AFC 00014526 */  addiu      $a1, $s2, 0x100
/* 9300 80018B00 AA014626 */  addiu      $a2, $s2, 0x1AA
/* 9304 80018B04 60014226 */  addiu      $v0, $s2, 0x160
/* 9308 80018B08 1000A2AF */  sw         $v0, 0x10($sp)
/* 930C 80018B0C 94014286 */  lh         $v0, 0x194($s2)
/* 9310 80018B10 58014726 */  addiu      $a3, $s2, 0x158
/* 9314 80018B14 CD5C000C */  jal        CriticalDampPosition
/* 9318 80018B18 1400A2AF */   sw        $v0, 0x14($sp)
.L80018B1C:
/* 931C 80018B1C 01000424 */  addiu      $a0, $zero, 0x1
/* 9320 80018B20 40014526 */  addiu      $a1, $s2, 0x140
/* 9324 80018B24 14044296 */  lhu        $v0, 0x414($s2)
/* 9328 80018B28 16044396 */  lhu        $v1, 0x416($s2)
/* 932C 80018B2C 18044696 */  lhu        $a2, 0x418($s2)
/* 9330 80018B30 70014726 */  addiu      $a3, $s2, 0x170
/* 9334 80018B34 B20142A6 */  sh         $v0, 0x1B2($s2)
/* 9338 80018B38 B40143A6 */  sh         $v1, 0x1B4($s2)
/* 933C 80018B3C 78002296 */  lhu        $v0, 0x78($s1)
/* 9340 80018B40 40001024 */  addiu      $s0, $zero, 0x40
/* 9344 80018B44 2130C200 */  addu       $a2, $a2, $v0
/* 9348 80018B48 0008C624 */  addiu      $a2, $a2, 0x800
/* 934C 80018B4C FF0FC630 */  andi       $a2, $a2, 0xFFF
/* 9350 80018B50 78014226 */  addiu      $v0, $s2, 0x178
/* 9354 80018B54 B60146A6 */  sh         $a2, 0x1B6($s2)
/* 9358 80018B58 1000A2AF */  sw         $v0, 0x10($sp)
/* 935C 80018B5C 7E5E000C */  jal        CriticalDampAngle
/* 9360 80018B60 1400B0AF */   sw        $s0, 0x14($sp)
/* 9364 80018B64 01000424 */  addiu      $a0, $zero, 0x1
/* 9368 80018B68 3C015126 */  addiu      $s1, $s2, 0x13C
/* 936C 80018B6C 21282002 */  addu       $a1, $s1, $zero
/* 9370 80018B70 6C014726 */  addiu      $a3, $s2, 0x16C
/* 9374 80018B74 B2014686 */  lh         $a2, 0x1B2($s2)
/* 9378 80018B78 74014226 */  addiu      $v0, $s2, 0x174
/* 937C 80018B7C 1000A2AF */  sw         $v0, 0x10($sp)
/* 9380 80018B80 7E5E000C */  jal        CriticalDampAngle
/* 9384 80018B84 1400B0AF */   sw        $s0, 0x14($sp)
/* 9388 80018B88 98015026 */  addiu      $s0, $s2, 0x198
/* 938C 80018B8C 21200002 */  addu       $a0, $s0, $zero
/* 9390 80018B90 00014526 */  addiu      $a1, $s2, 0x100
/* 9394 80018B94 06014786 */  lh         $a3, 0x106($s2)
/* 9398 80018B98 6F5A000C */  jal        CAMERA_CalcPosition
/* 939C 80018B9C 21302002 */   addu      $a2, $s1, $zero
/* 93A0 80018BA0 98014296 */  lhu        $v0, 0x198($s2)
/* 93A4 80018BA4 02000396 */  lhu        $v1, 0x2($s0)
/* 93A8 80018BA8 04000496 */  lhu        $a0, 0x4($s0)
/* 93AC 80018BAC 000042A6 */  sh         $v0, 0x0($s2)
/* 93B0 80018BB0 3C014296 */  lhu        $v0, 0x13C($s2)
/* 93B4 80018BB4 020043A6 */  sh         $v1, 0x2($s2)
/* 93B8 80018BB8 040044A6 */  sh         $a0, 0x4($s2)
/* 93BC 80018BBC 02002396 */  lhu        $v1, 0x2($s1)
/* 93C0 80018BC0 04002596 */  lhu        $a1, 0x4($s1)
/* 93C4 80018BC4 A00142A6 */  sh         $v0, 0x1A0($s2)
/* 93C8 80018BC8 A0014226 */  addiu      $v0, $s2, 0x1A0
/* 93CC 80018BCC 020043A4 */  sh         $v1, 0x2($v0)
/* 93D0 80018BD0 040045A4 */  sh         $a1, 0x4($v0)
/* 93D4 80018BD4 A0014396 */  lhu        $v1, 0x1A0($s2)
/* 93D8 80018BD8 02004494 */  lhu        $a0, 0x2($v0)
/* 93DC 80018BDC B0004226 */  addiu      $v0, $s2, 0xB0
/* 93E0 80018BE0 B00043A6 */  sh         $v1, 0xB0($s2)
/* 93E4 80018BE4 020044A4 */  sh         $a0, 0x2($v0)
/* 93E8 80018BE8 040045A4 */  sh         $a1, 0x4($v0)
/* 93EC 80018BEC B4004296 */  lhu        $v0, 0xB4($s2)
/* 93F0 80018BF0 21204002 */  addu       $a0, $s2, $zero
/* 93F4 80018BF4 FA0080A4 */  sh         $zero, 0xFA($a0)
/* 93F8 80018BF8 6873000C */  jal        CAMERA_CalculateLead
/* 93FC 80018BFC FC0082A4 */   sh        $v0, 0xFC($a0)
/* 9400 80018C00 2400BF8F */  lw         $ra, 0x24($sp)
/* 9404 80018C04 2000B28F */  lw         $s2, 0x20($sp)
/* 9408 80018C08 1C00B18F */  lw         $s1, 0x1C($sp)
/* 940C 80018C0C 1800B08F */  lw         $s0, 0x18($sp)
/* 9410 80018C10 0800E003 */  jr         $ra
/* 9414 80018C14 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_LookProcess, . - CAMERA_LookProcess
