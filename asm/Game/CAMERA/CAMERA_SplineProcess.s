.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SplineProcess
/* BC30 8001B430 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* BC34 8001B434 3400B1AF */  sw         $s1, 0x34($sp)
/* BC38 8001B438 21888000 */  addu       $s1, $a0, $zero
/* BC3C 8001B43C 4400BFAF */  sw         $ra, 0x44($sp)
/* BC40 8001B440 4000B4AF */  sw         $s4, 0x40($sp)
/* BC44 8001B444 3C00B3AF */  sw         $s3, 0x3C($sp)
/* BC48 8001B448 3800B2AF */  sw         $s2, 0x38($sp)
/* BC4C 8001B44C 3000B0AF */  sw         $s0, 0x30($sp)
/* BC50 8001B450 2404338E */  lw         $s3, 0x424($s1)
/* BC54 8001B454 B2012296 */  lhu        $v0, 0x1B2($s1)
/* BC58 8001B458 AA013226 */  addiu      $s2, $s1, 0x1AA
/* BC5C 8001B45C 2A00A0A7 */  sh         $zero, 0x2A($sp)
/* BC60 8001B460 2800A2A7 */  sh         $v0, 0x28($sp)
/* BC64 8001B464 B6012296 */  lhu        $v0, 0x1B6($s1)
/* BC68 8001B468 21284002 */  addu       $a1, $s2, $zero
/* BC6C 8001B46C B95A000C */  jal        CAMERA_SetFocus
/* BC70 8001B470 2C00A2A7 */   sh        $v0, 0x2C($sp)
/* BC74 8001B474 A8013496 */  lhu        $s4, 0x1A8($s1)
/* BC78 8001B478 BA006012 */  beqz       $s3, .L8001B764
/* BC7C 8001B47C 98013026 */   addiu     $s0, $s1, 0x198
/* BC80 8001B480 21200002 */  addu       $a0, $s0, $zero
/* BC84 8001B484 21284002 */  addu       $a1, $s2, $zero
/* BC88 8001B488 2800A627 */  addiu      $a2, $sp, 0x28
/* BC8C 8001B48C 003C1400 */  sll        $a3, $s4, 16
/* BC90 8001B490 6F5A000C */  jal        CAMERA_CalcPosition
/* BC94 8001B494 033C0700 */   sra       $a3, $a3, 16
/* BC98 8001B498 F0002386 */  lh         $v1, 0xF0($s1)
/* BC9C 8001B49C 04000224 */  addiu      $v0, $zero, 0x4
/* BCA0 8001B4A0 0A006214 */  bne        $v1, $v0, .L8001B4CC
/* BCA4 8001B4A4 21280002 */   addu      $a1, $s0, $zero
/* BCA8 8001B4A8 21202002 */  addu       $a0, $s1, $zero
/* BCAC 8001B4AC 21300002 */  addu       $a2, $s0, $zero
/* BCB0 8001B4B0 1800A227 */  addiu      $v0, $sp, 0x18
/* BCB4 8001B4B4 1000A2AF */  sw         $v0, 0x10($sp)
/* BCB8 8001B4B8 0000658E */  lw         $a1, 0x0($s3)
/* BCBC 8001B4BC 506B000C */  jal        CAMERA_SplineGetNearestPoint2
/* BCC0 8001B4C0 38042726 */   addiu     $a3, $s1, 0x438
/* BCC4 8001B4C4 386D0008 */  j          .L8001B4E0
/* BCC8 8001B4C8 05000424 */   addiu     $a0, $zero, 0x5
.L8001B4CC:
/* BCCC 8001B4CC 0000648E */  lw         $a0, 0x0($s3)
/* BCD0 8001B4D0 38042626 */  addiu      $a2, $s1, 0x438
/* BCD4 8001B4D4 CA6B000C */  jal        CAMERA_SplineGetNearestPoint
/* BCD8 8001B4D8 1800A727 */   addiu     $a3, $sp, 0x18
/* BCDC 8001B4DC 05000424 */  addiu      $a0, $zero, 0x5
.L8001B4E0:
/* BCE0 8001B4E0 00012526 */  addiu      $a1, $s1, 0x100
/* BCE4 8001B4E4 AA012626 */  addiu      $a2, $s1, 0x1AA
/* BCE8 8001B4E8 00020224 */  addiu      $v0, $zero, 0x200
/* BCEC 8001B4EC 940122A6 */  sh         $v0, 0x194($s1)
/* BCF0 8001B4F0 60012226 */  addiu      $v0, $s1, 0x160
/* BCF4 8001B4F4 1000A2AF */  sw         $v0, 0x10($sp)
/* BCF8 8001B4F8 94012286 */  lh         $v0, 0x194($s1)
/* BCFC 8001B4FC 58012726 */  addiu      $a3, $s1, 0x158
/* BD00 8001B500 CD5C000C */  jal        CriticalDampPosition
/* BD04 8001B504 1400A2AF */   sw        $v0, 0x14($sp)
/* BD08 8001B508 08042286 */  lh         $v0, 0x408($s1)
/* BD0C 8001B50C 01001024 */  addiu      $s0, $zero, 0x1
/* BD10 8001B510 04005014 */  bne        $v0, $s0, .L8001B524
/* BD14 8001B514 00000000 */   nop
/* BD18 8001B518 648E90A7 */  sh         $s0, %gp_rel(D_800D03FC)($gp)
/* BD1C 8001B51C 536D0008 */  j          .L8001B54C
/* BD20 8001B520 00000000 */   nop
.L8001B524:
/* BD24 8001B524 E276000C */  jal        CAMERA_FocusInstanceMoved
/* BD28 8001B528 21202002 */   addu      $a0, $s1, $zero
/* BD2C 8001B52C 07004010 */  beqz       $v0, .L8001B54C
/* BD30 8001B530 00000000 */   nop
/* BD34 8001B534 648E8287 */  lh         $v0, %gp_rel(D_800D03FC)($gp)
/* BD38 8001B538 00000000 */  nop
/* BD3C 8001B53C 02004010 */  beqz       $v0, .L8001B548
/* BD40 8001B540 00000000 */   nop
/* BD44 8001B544 AE0430A6 */  sh         $s0, 0x4AE($s1)
.L8001B548:
/* BD48 8001B548 648E80A7 */  sh         $zero, %gp_rel(D_800D03FC)($gp)
.L8001B54C:
/* BD4C 8001B54C 08042386 */  lh         $v1, 0x408($s1)
/* BD50 8001B550 01000224 */  addiu      $v0, $zero, 0x1
/* BD54 8001B554 1F006210 */  beq        $v1, $v0, .L8001B5D4
/* BD58 8001B558 00000000 */   nop
/* BD5C 8001B55C 648E8287 */  lh         $v0, %gp_rel(D_800D03FC)($gp)
/* BD60 8001B560 00000000 */  nop
/* BD64 8001B564 1B004014 */  bnez       $v0, .L8001B5D4
/* BD68 8001B568 03000224 */   addiu     $v0, $zero, 0x3
/* BD6C 8001B56C F6002386 */  lh         $v1, 0xF6($s1)
/* BD70 8001B570 00000000 */  nop
/* BD74 8001B574 17006210 */  beq        $v1, $v0, .L8001B5D4
/* BD78 8001B578 2800A427 */   addiu     $a0, $sp, 0x28
/* BD7C 8001B57C 00013026 */  addiu      $s0, $s1, 0x100
/* BD80 8001B580 21280002 */  addu       $a1, $s0, $zero
/* BD84 8001B584 C45E000C */  jal        CAMERA_CalcRotation
/* BD88 8001B588 1800A627 */   addiu     $a2, $sp, 0x18
/* BD8C 8001B58C 2000A427 */  addiu      $a0, $sp, 0x20
/* BD90 8001B590 00012296 */  lhu        $v0, 0x100($s1)
/* BD94 8001B594 02000596 */  lhu        $a1, 0x2($s0)
/* BD98 8001B598 1800A397 */  lhu        $v1, 0x18($sp)
/* BD9C 8001B59C 04000696 */  lhu        $a2, 0x4($s0)
/* BDA0 8001B5A0 23104300 */  subu       $v0, $v0, $v1
/* BDA4 8001B5A4 2000A2A7 */  sh         $v0, 0x20($sp)
/* BDA8 8001B5A8 1800A227 */  addiu      $v0, $sp, 0x18
/* BDAC 8001B5AC 02004394 */  lhu        $v1, 0x2($v0)
/* BDB0 8001B5B0 04004294 */  lhu        $v0, 0x4($v0)
/* BDB4 8001B5B4 2328A300 */  subu       $a1, $a1, $v1
/* BDB8 8001B5B8 2330C200 */  subu       $a2, $a2, $v0
/* BDBC 8001B5BC 020085A4 */  sh         $a1, 0x2($a0)
/* BDC0 8001B5C0 9C58000C */  jal        CAMERA_LengthSVector
/* BDC4 8001B5C4 040086A4 */   sh        $a2, 0x4($a0)
/* BDC8 8001B5C8 2C00A397 */  lhu        $v1, 0x2C($sp)
/* BDCC 8001B5CC 21A04000 */  addu       $s4, $v0, $zero
/* BDD0 8001B5D0 B60123A6 */  sh         $v1, 0x1B6($s1)
.L8001B5D4:
/* BDD4 8001B5D4 AE042286 */  lh         $v0, 0x4AE($s1)
/* BDD8 8001B5D8 00000000 */  nop
/* BDDC 8001B5DC 03004010 */  beqz       $v0, .L8001B5EC
/* BDE0 8001B5E0 40001024 */   addiu     $s0, $zero, 0x40
/* BDE4 8001B5E4 7D6D0008 */  j          .L8001B5F4
/* BDE8 8001B5E8 80001224 */   addiu     $s2, $zero, 0x80
.L8001B5EC:
/* BDEC 8001B5EC 50001024 */  addiu      $s0, $zero, 0x50
/* BDF0 8001B5F0 40001224 */  addiu      $s2, $zero, 0x40
.L8001B5F4:
/* BDF4 8001B5F4 01000424 */  addiu      $a0, $zero, 0x1
/* BDF8 8001B5F8 3C012526 */  addiu      $a1, $s1, 0x13C
/* BDFC 8001B5FC 2A00A297 */  lhu        $v0, 0x2A($sp)
/* BE00 8001B600 3C012396 */  lhu        $v1, 0x13C($s1)
/* BE04 8001B604 6C012726 */  addiu      $a3, $s1, 0x16C
/* BE08 8001B608 3E0122A6 */  sh         $v0, 0x13E($s1)
/* BE0C 8001B60C B80423A6 */  sh         $v1, 0x4B8($s1)
/* BE10 8001B610 2800A687 */  lh         $a2, 0x28($sp)
/* BE14 8001B614 74012226 */  addiu      $v0, $s1, 0x174
/* BE18 8001B618 1000A2AF */  sw         $v0, 0x10($sp)
/* BE1C 8001B61C 40000224 */  addiu      $v0, $zero, 0x40
/* BE20 8001B620 7E5E000C */  jal        CriticalDampAngle
/* BE24 8001B624 1400A2AF */   sw        $v0, 0x14($sp)
/* BE28 8001B628 B8042486 */  lh         $a0, 0x4B8($s1)
/* BE2C 8001B62C 3C012586 */  lh         $a1, 0x13C($s1)
/* BE30 8001B630 DA59000C */  jal        CAMERA_SignedAngleDifference
/* BE34 8001B634 00000000 */   nop
/* BE38 8001B638 F6002386 */  lh         $v1, 0xF6($s1)
/* BE3C 8001B63C B80422A6 */  sh         $v0, 0x4B8($s1)
/* BE40 8001B640 03000224 */  addiu      $v0, $zero, 0x3
/* BE44 8001B644 04006214 */  bne        $v1, $v0, .L8001B658
/* BE48 8001B648 05000424 */   addiu     $a0, $zero, 0x5
/* BE4C 8001B64C B6012296 */  lhu        $v0, 0x1B6($s1)
/* BE50 8001B650 00000000 */  nop
/* BE54 8001B654 2C00A2A7 */  sh         $v0, 0x2C($sp)
.L8001B658:
/* BE58 8001B658 40012526 */  addiu      $a1, $s1, 0x140
/* BE5C 8001B65C 70012726 */  addiu      $a3, $s1, 0x170
/* BE60 8001B660 2C00A687 */  lh         $a2, 0x2C($sp)
/* BE64 8001B664 78012226 */  addiu      $v0, $s1, 0x178
/* BE68 8001B668 1000A2AF */  sw         $v0, 0x10($sp)
/* BE6C 8001B66C 7E5E000C */  jal        CriticalDampAngle
/* BE70 8001B670 1400B0AF */   sw        $s0, 0x14($sp)
/* BE74 8001B674 08042386 */  lh         $v1, 0x408($s1)
/* BE78 8001B678 01000224 */  addiu      $v0, $zero, 0x1
/* BE7C 8001B67C 09006210 */  beq        $v1, $v0, .L8001B6A4
/* BE80 8001B680 00000000 */   nop
/* BE84 8001B684 AE042286 */  lh         $v0, 0x4AE($s1)
/* BE88 8001B688 00000000 */  nop
/* BE8C 8001B68C 05004014 */  bnez       $v0, .L8001B6A4
/* BE90 8001B690 00000000 */   nop
/* BE94 8001B694 648E8287 */  lh         $v0, %gp_rel(D_800D03FC)($gp)
/* BE98 8001B698 00000000 */  nop
/* BE9C 8001B69C 0F004010 */  beqz       $v0, .L8001B6DC
/* BEA0 8001B6A0 05000424 */   addiu     $a0, $zero, 0x5
.L8001B6A4:
/* BEA4 8001B6A4 98013026 */  addiu      $s0, $s1, 0x198
/* BEA8 8001B6A8 21200002 */  addu       $a0, $s0, $zero
/* BEAC 8001B6AC 00012526 */  addiu      $a1, $s1, 0x100
/* BEB0 8001B6B0 A8012786 */  lh         $a3, 0x1A8($s1)
/* BEB4 8001B6B4 6F5A000C */  jal        CAMERA_CalcPosition
/* BEB8 8001B6B8 3C012626 */   addiu     $a2, $s1, 0x13C
/* BEBC 8001B6BC 21202002 */  addu       $a0, $s1, $zero
/* BEC0 8001B6C0 21280002 */  addu       $a1, $s0, $zero
/* BEC4 8001B6C4 6175000C */  jal        CAMERA_DoCameraCollision2
/* BEC8 8001B6C8 01000624 */   addiu     $a2, $zero, 0x1
/* BECC 8001B6CC 02004010 */  beqz       $v0, .L8001B6D8
/* BED0 8001B6D0 800422AE */   sw        $v0, 0x480($s1)
/* BED4 8001B6D4 B0013496 */  lhu        $s4, 0x1B0($s1)
.L8001B6D8:
/* BED8 8001B6D8 05000424 */  addiu      $a0, $zero, 0x5
.L8001B6DC:
/* BEDC 8001B6DC 06012526 */  addiu      $a1, $s1, 0x106
/* BEE0 8001B6E0 00341400 */  sll        $a2, $s4, 16
/* BEE4 8001B6E4 03340600 */  sra        $a2, $a2, 16
/* BEE8 8001B6E8 68012726 */  addiu      $a3, $s1, 0x168
/* BEEC 8001B6EC 6A012226 */  addiu      $v0, $s1, 0x16A
/* BEF0 8001B6F0 1000A2AF */  sw         $v0, 0x10($sp)
/* BEF4 8001B6F4 605C000C */  jal        CriticalDampValue
/* BEF8 8001B6F8 1400B2AF */   sw        $s2, 0x14($sp)
/* BEFC 8001B6FC 40012486 */  lh         $a0, 0x140($s1)
/* BF00 8001B700 2C00A587 */  lh         $a1, 0x2C($sp)
/* BF04 8001B704 BC59000C */  jal        CAMERA_AngleDifference
/* BF08 8001B708 00000000 */   nop
/* BF0C 8001B70C 00140200 */  sll        $v0, $v0, 16
/* BF10 8001B710 03140200 */  sra        $v0, $v0, 16
/* BF14 8001B714 20004228 */  slti       $v0, $v0, 0x20
/* BF18 8001B718 03004010 */  beqz       $v0, .L8001B728
/* BF1C 8001B71C 21202002 */   addu      $a0, $s1, $zero
/* BF20 8001B720 AE0420A6 */  sh         $zero, 0x4AE($s1)
/* BF24 8001B724 F60020A6 */  sh         $zero, 0xF6($s1)
.L8001B728:
/* BF28 8001B728 D273000C */  jal        CAMERA_CalcFollowPosition
/* BF2C 8001B72C 3C012526 */   addiu     $a1, $s1, 0x13C
/* BF30 8001B730 F0002386 */  lh         $v1, 0xF0($s1)
/* BF34 8001B734 04000224 */  addiu      $v0, $zero, 0x4
/* BF38 8001B738 08006214 */  bne        $v1, $v0, .L8001B75C
/* BF3C 8001B73C 0100033C */   lui       $v1, (0x10000 >> 16)
/* BF40 8001B740 E800228E */  lw         $v0, 0xE8($s1)
/* BF44 8001B744 00000000 */  nop
/* BF48 8001B748 24104300 */  and        $v0, $v0, $v1
/* BF4C 8001B74C 03004014 */  bnez       $v0, .L8001B75C
/* BF50 8001B750 00000000 */   nop
/* BF54 8001B754 B06C000C */  jal        CAMERA_SplineHelpMove
/* BF58 8001B758 21202002 */   addu      $a0, $s1, $zero
.L8001B75C:
/* BF5C 8001B75C 6873000C */  jal        CAMERA_CalculateLead
/* BF60 8001B760 21202002 */   addu      $a0, $s1, $zero
.L8001B764:
/* BF64 8001B764 4400BF8F */  lw         $ra, 0x44($sp)
/* BF68 8001B768 4000B48F */  lw         $s4, 0x40($sp)
/* BF6C 8001B76C 3C00B38F */  lw         $s3, 0x3C($sp)
/* BF70 8001B770 3800B28F */  lw         $s2, 0x38($sp)
/* BF74 8001B774 3400B18F */  lw         $s1, 0x34($sp)
/* BF78 8001B778 3000B08F */  lw         $s0, 0x30($sp)
/* BF7C 8001B77C 0800E003 */  jr         $ra
/* BF80 8001B780 4800BD27 */   addiu     $sp, $sp, 0x48
.size CAMERA_SplineProcess, . - CAMERA_SplineProcess
