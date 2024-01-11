.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel UpdateEngagementList
/* 93B5C 800A335C 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 93B60 800A3360 5400B3AF */  sw         $s3, 0x54($sp)
/* 93B64 800A3364 21988000 */  addu       $s3, $a0, $zero
/* 93B68 800A3368 5800B4AF */  sw         $s4, 0x58($sp)
/* 93B6C 800A336C 21A0A000 */  addu       $s4, $a1, $zero
/* 93B70 800A3370 6400BFAF */  sw         $ra, 0x64($sp)
/* 93B74 800A3374 6000B6AF */  sw         $s6, 0x60($sp)
/* 93B78 800A3378 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 93B7C 800A337C 5000B2AF */  sw         $s2, 0x50($sp)
/* 93B80 800A3380 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 93B84 800A3384 4800B0AF */  sw         $s0, 0x48($sp)
/* 93B88 800A3388 0000648E */  lw         $a0, 0x0($s3)
/* 93B8C 800A338C 92D1000C */  jal        INSTANCE_Query
/* 93B90 800A3390 01000524 */   addiu     $a1, $zero, 0x1
/* 93B94 800A3394 0000648E */  lw         $a0, 0x0($s3)
/* 93B98 800A3398 21A84000 */  addu       $s5, $v0, $zero
/* 93B9C 800A339C 1400838C */  lw         $v1, 0x14($a0)
/* 93BA0 800A33A0 2000A232 */  andi       $v0, $s5, 0x20
/* 93BA4 800A33A4 39024010 */  beqz       $v0, .L800A3C8C
/* 93BA8 800A33A8 00087630 */   andi      $s6, $v1, 0x800
/* 93BAC 800A33AC 92D1000C */  jal        INSTANCE_Query
/* 93BB0 800A33B0 02000524 */   addiu     $a1, $zero, 0x2
/* 93BB4 800A33B4 21884000 */  addu       $s1, $v0, $zero
/* 93BB8 800A33B8 00012232 */  andi       $v0, $s1, 0x100
/* 93BBC 800A33BC 45004010 */  beqz       $v0, .L800A34D4
/* 93BC0 800A33C0 01002232 */   andi      $v0, $s1, 0x1
/* 93BC4 800A33C4 0000648E */  lw         $a0, 0x0($s3)
/* 93BC8 800A33C8 00000000 */  nop
/* 93BCC 800A33CC 1400828C */  lw         $v0, 0x14($a0)
/* 93BD0 800A33D0 00000000 */  nop
/* 93BD4 800A33D4 00084230 */  andi       $v0, $v0, 0x800
/* 93BD8 800A33D8 3E004014 */  bnez       $v0, .L800A34D4
/* 93BDC 800A33DC 01002232 */   andi      $v0, $s1, 0x1
/* 93BE0 800A33E0 92D1000C */  jal        INSTANCE_Query
/* 93BE4 800A33E4 16000524 */   addiu     $a1, $zero, 0x16
/* 93BE8 800A33E8 21304000 */  addu       $a2, $v0, $zero
/* 93BEC 800A33EC 0200C394 */  lhu        $v1, 0x2($a2)
/* 93BF0 800A33F0 1000648E */  lw         $a0, 0x10($s3)
/* 93BF4 800A33F4 00000000 */  nop
/* 93BF8 800A33F8 2A108300 */  slt        $v0, $a0, $v1
/* 93BFC 800A33FC 35004010 */  beqz       $v0, .L800A34D4
/* 93C00 800A3400 01002232 */   andi      $v0, $s1, 0x1
/* 93C04 800A3404 1400658E */  lw         $a1, 0x14($s3)
/* 93C08 800A3408 00000000 */  nop
/* 93C0C 800A340C 3100A104 */  bgez       $a1, .L800A34D4
/* 93C10 800A3410 00000000 */   nop
/* 93C14 800A3414 0600C794 */  lhu        $a3, 0x6($a2)
/* 93C18 800A3418 00000000 */  nop
/* 93C1C 800A341C 23100700 */  negu       $v0, $a3
/* 93C20 800A3420 2A104500 */  slt        $v0, $v0, $a1
/* 93C24 800A3424 2A004010 */  beqz       $v0, .L800A34D0
/* 93C28 800A3428 00130400 */   sll       $v0, $a0, 12
/* 93C2C 800A342C 1A004300 */  div        $zero, $v0, $v1
/* 93C30 800A3430 12100000 */  mflo       $v0
/* 93C34 800A3434 00100A24 */  addiu      $t2, $zero, 0x1000
/* 93C38 800A3438 0000C884 */  lh         $t0, 0x0($a2)
/* 93C3C 800A343C 23104201 */  subu       $v0, $t2, $v0
/* 93C40 800A3440 18004800 */  mult       $v0, $t0
/* 93C44 800A3444 12100000 */  mflo       $v0
/* 93C48 800A3448 02004104 */  bgez       $v0, .L800A3454
/* 93C4C 800A344C 00000000 */   nop
/* 93C50 800A3450 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800A3454:
/* 93C54 800A3454 0400C994 */  lhu        $t1, 0x4($a2)
/* 93C58 800A3458 03130200 */  sra        $v0, $v0, 12
/* 93C5C 800A345C 18004900 */  mult       $v0, $t1
/* 93C60 800A3460 12200000 */  mflo       $a0
/* 93C64 800A3464 02008104 */  bgez       $a0, .L800A3470
/* 93C68 800A3468 23100500 */   negu      $v0, $a1
/* 93C6C 800A346C FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L800A3470:
/* 93C70 800A3470 00130200 */  sll        $v0, $v0, 12
/* 93C74 800A3474 1A004700 */  div        $zero, $v0, $a3
/* 93C78 800A3478 12100000 */  mflo       $v0
/* 93C7C 800A347C 00000000 */  nop
/* 93C80 800A3480 23104201 */  subu       $v0, $t2, $v0
/* 93C84 800A3484 18004800 */  mult       $v0, $t0
/* 93C88 800A3488 12100000 */  mflo       $v0
/* 93C8C 800A348C 02004104 */  bgez       $v0, .L800A3498
/* 93C90 800A3490 03230400 */   sra       $a0, $a0, 12
/* 93C94 800A3494 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800A3498:
/* 93C98 800A3498 031B0200 */  sra        $v1, $v0, 12
/* 93C9C 800A349C 23104901 */  subu       $v0, $t2, $t1
/* 93CA0 800A34A0 18006200 */  mult       $v1, $v0
/* 93CA4 800A34A4 12100000 */  mflo       $v0
/* 93CA8 800A34A8 02004104 */  bgez       $v0, .L800A34B4
/* 93CAC 800A34AC 00000000 */   nop
/* 93CB0 800A34B0 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L800A34B4:
/* 93CB4 800A34B4 0004053C */  lui        $a1, (0x4000007 >> 16)
/* 93CB8 800A34B8 03130200 */  sra        $v0, $v0, 12
/* 93CBC 800A34BC 21108200 */  addu       $v0, $a0, $v0
/* 93CC0 800A34C0 0000C2A4 */  sh         $v0, 0x0($a2)
/* 93CC4 800A34C4 0400848E */  lw         $a0, 0x4($s4)
/* 93CC8 800A34C8 A1D1000C */  jal        INSTANCE_Post
/* 93CCC 800A34CC 0700A534 */   ori       $a1, $a1, (0x4000007 & 0xFFFF)
.L800A34D0:
/* 93CD0 800A34D0 01002232 */  andi       $v0, $s1, 0x1
.L800A34D4:
/* 93CD4 800A34D4 2A004010 */  beqz       $v0, .L800A3580
/* 93CD8 800A34D8 0400023C */   lui       $v0, (0x40000 >> 16)
/* 93CDC 800A34DC 6003838E */  lw         $v1, 0x360($s4)
/* 93CE0 800A34E0 00000000 */  nop
/* 93CE4 800A34E4 0C006214 */  bne        $v1, $v0, .L800A3518
/* 93CE8 800A34E8 00000000 */   nop
/* 93CEC 800A34EC 1000628E */  lw         $v0, 0x10($s3)
/* 93CF0 800A34F0 00000000 */  nop
/* 93CF4 800A34F4 C21F0200 */  srl        $v1, $v0, 31
/* 93CF8 800A34F8 21104300 */  addu       $v0, $v0, $v1
/* 93CFC 800A34FC 1400638E */  lw         $v1, 0x14($s3)
/* 93D00 800A3500 43100200 */  sra        $v0, $v0, 1
/* 93D04 800A3504 100062AE */  sw         $v0, 0x10($s3)
/* 93D08 800A3508 C2170300 */  srl        $v0, $v1, 31
/* 93D0C 800A350C 21186200 */  addu       $v1, $v1, $v0
/* 93D10 800A3510 43180300 */  sra        $v1, $v1, 1
/* 93D14 800A3514 140063AE */  sw         $v1, 0x14($s3)
.L800A3518:
/* 93D18 800A3518 0000628E */  lw         $v0, 0x0($s3)
/* 93D1C 800A351C 00000000 */  nop
/* 93D20 800A3520 4801448C */  lw         $a0, 0x148($v0)
/* 93D24 800A3524 00000000 */  nop
/* 93D28 800A3528 07008010 */  beqz       $a0, .L800A3548
/* 93D2C 800A352C 00000000 */   nop
/* 93D30 800A3530 92D1000C */  jal        INSTANCE_Query
/* 93D34 800A3534 21280000 */   addu      $a1, $zero, $zero
/* 93D38 800A3538 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 93D3C 800A353C 24104300 */  and        $v0, $v0, $v1
/* 93D40 800A3540 10004010 */  beqz       $v0, .L800A3584
/* 93D44 800A3544 0E002232 */   andi      $v0, $s1, 0xE
.L800A3548:
/* 93D48 800A3548 1000628E */  lw         $v0, 0x10($s3)
/* 93D4C 800A354C 00000000 */  nop
/* 93D50 800A3550 00024228 */  slti       $v0, $v0, 0x200
/* 93D54 800A3554 0B004010 */  beqz       $v0, .L800A3584
/* 93D58 800A3558 0E002232 */   andi      $v0, $s1, 0xE
/* 93D5C 800A355C 1400628E */  lw         $v0, 0x14($s3)
/* 93D60 800A3560 00000000 */  nop
/* 93D64 800A3564 FF004224 */  addiu      $v0, $v0, 0xFF
/* 93D68 800A3568 7F03422C */  sltiu      $v0, $v0, 0x37F
/* 93D6C 800A356C 04004010 */  beqz       $v0, .L800A3580
/* 93D70 800A3570 21208002 */   addu      $a0, $s4, $zero
/* 93D74 800A3574 21286002 */  addu       $a1, $s3, $zero
/* 93D78 800A3578 B18C020C */  jal        SetEngagedInstance
/* 93D7C 800A357C 05000624 */   addiu     $a2, $zero, 0x5
.L800A3580:
/* 93D80 800A3580 0E002232 */  andi       $v0, $s1, 0xE
.L800A3584:
/* 93D84 800A3584 40004010 */  beqz       $v0, .L800A3688
/* 93D88 800A3588 40002232 */   andi      $v0, $s1, 0x40
/* 93D8C 800A358C 3E00C016 */  bnez       $s6, .L800A3688
/* 93D90 800A3590 08006426 */   addiu     $a0, $s3, 0x8
/* 93D94 800A3594 C7030524 */  addiu      $a1, $zero, 0x3C7
/* 93D98 800A3598 90E9000C */  jal        MATH3D_ConeDetect
/* 93D9C 800A359C 2130A000 */   addu      $a2, $a1, $zero
/* 93DA0 800A35A0 38004010 */  beqz       $v0, .L800A3684
/* 93DA4 800A35A4 21200000 */   addu      $a0, $zero, $zero
/* 93DA8 800A35A8 21288000 */  addu       $a1, $a0, $zero
/* 93DAC 800A35AC 21308000 */  addu       $a2, $a0, $zero
/* 93DB0 800A35B0 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 93DB4 800A35B4 2800A727 */   addiu     $a3, $sp, 0x28
/* 93DB8 800A35B8 21200000 */  addu       $a0, $zero, $zero
/* 93DBC 800A35BC C0FE0524 */  addiu      $a1, $zero, -0x140
/* 93DC0 800A35C0 21308000 */  addu       $a2, $a0, $zero
/* 93DC4 800A35C4 3000B027 */  addiu      $s0, $sp, 0x30
/* 93DC8 800A35C8 20E0010C */  jal        PHYSICS_GenericLineCheckSetup
/* 93DCC 800A35CC 21380002 */   addu      $a3, $s0, $zero
/* 93DD0 800A35D0 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 93DD4 800A35D4 2800A527 */  addiu      $a1, $sp, 0x28
/* 93DD8 800A35D8 21300002 */  addu       $a2, $s0, $zero
/* 93DDC 800A35DC 7FDF010C */  jal        PHYSICS_CheckForTerrainCollide
/* 93DE0 800A35E0 01000724 */   addiu     $a3, $zero, 0x1
/* 93DE4 800A35E4 28004014 */  bnez       $v0, .L800A3688
/* 93DE8 800A35E8 40002232 */   andi      $v0, $s1, 0x40
/* 93DEC 800A35EC 1000628E */  lw         $v0, 0x10($s3)
/* 93DF0 800A35F0 00000000 */  nop
/* 93DF4 800A35F4 80024228 */  slti       $v0, $v0, 0x280
/* 93DF8 800A35F8 12004010 */  beqz       $v0, .L800A3644
/* 93DFC 800A35FC 00000000 */   nop
/* 93E00 800A3600 1400628E */  lw         $v0, 0x14($s3)
/* 93E04 800A3604 00000000 */  nop
/* 93E08 800A3608 0F004224 */  addiu      $v0, $v0, 0xF
/* 93E0C 800A360C 1F00422C */  sltiu      $v0, $v0, 0x1F
/* 93E10 800A3610 0C004010 */  beqz       $v0, .L800A3644
/* 93E14 800A3614 04002232 */   andi      $v0, $s1, 0x4
/* 93E18 800A3618 04004010 */  beqz       $v0, .L800A362C
/* 93E1C 800A361C 21208002 */   addu      $a0, $s4, $zero
/* 93E20 800A3620 21286002 */  addu       $a1, $s3, $zero
/* 93E24 800A3624 B18C020C */  jal        SetEngagedInstance
/* 93E28 800A3628 01000624 */   addiu     $a2, $zero, 0x1
.L800A362C:
/* 93E2C 800A362C 02002232 */  andi       $v0, $s1, 0x2
/* 93E30 800A3630 04004010 */  beqz       $v0, .L800A3644
/* 93E34 800A3634 21208002 */   addu      $a0, $s4, $zero
/* 93E38 800A3638 21286002 */  addu       $a1, $s3, $zero
/* 93E3C 800A363C B18C020C */  jal        SetEngagedInstance
/* 93E40 800A3640 02000624 */   addiu     $a2, $zero, 0x2
.L800A3644:
/* 93E44 800A3644 1000628E */  lw         $v0, 0x10($s3)
/* 93E48 800A3648 00000000 */  nop
/* 93E4C 800A364C 0D024228 */  slti       $v0, $v0, 0x20D
/* 93E50 800A3650 0D004010 */  beqz       $v0, .L800A3688
/* 93E54 800A3654 40002232 */   andi      $v0, $s1, 0x40
/* 93E58 800A3658 1400628E */  lw         $v0, 0x14($s3)
/* 93E5C 800A365C 00000000 */  nop
/* 93E60 800A3660 FF004224 */  addiu      $v0, $v0, 0xFF
/* 93E64 800A3664 FF01422C */  sltiu      $v0, $v0, 0x1FF
/* 93E68 800A3668 06004010 */  beqz       $v0, .L800A3684
/* 93E6C 800A366C 08002232 */   andi      $v0, $s1, 0x8
/* 93E70 800A3670 04004010 */  beqz       $v0, .L800A3684
/* 93E74 800A3674 21208002 */   addu      $a0, $s4, $zero
/* 93E78 800A3678 21286002 */  addu       $a1, $s3, $zero
/* 93E7C 800A367C B18C020C */  jal        SetEngagedInstance
/* 93E80 800A3680 21300000 */   addu      $a2, $zero, $zero
.L800A3684:
/* 93E84 800A3684 40002232 */  andi       $v0, $s1, 0x40
.L800A3688:
/* 93E88 800A3688 33004010 */  beqz       $v0, .L800A3758
/* 93E8C 800A368C 80002232 */   andi      $v0, $s1, 0x80
/* 93E90 800A3690 0000648E */  lw         $a0, 0x0($s3)
/* 93E94 800A3694 92D1000C */  jal        INSTANCE_Query
/* 93E98 800A3698 17000524 */   addiu     $a1, $zero, 0x17
/* 93E9C 800A369C 21284000 */  addu       $a1, $v0, $zero
/* 93EA0 800A36A0 1A00A394 */  lhu        $v1, 0x1A($a1)
/* 93EA4 800A36A4 1000628E */  lw         $v0, 0x10($s3)
/* 93EA8 800A36A8 00000000 */  nop
/* 93EAC 800A36AC 2A104300 */  slt        $v0, $v0, $v1
/* 93EB0 800A36B0 29004010 */  beqz       $v0, .L800A3758
/* 93EB4 800A36B4 80002232 */   andi      $v0, $s1, 0x80
/* 93EB8 800A36B8 1C00A280 */  lb         $v0, 0x1C($a1)
/* 93EBC 800A36BC 1400638E */  lw         $v1, 0x14($s3)
/* 93EC0 800A36C0 00000000 */  nop
/* 93EC4 800A36C4 2A104300 */  slt        $v0, $v0, $v1
/* 93EC8 800A36C8 23004010 */  beqz       $v0, .L800A3758
/* 93ECC 800A36CC 80002232 */   andi      $v0, $s1, 0x80
/* 93ED0 800A36D0 1D00A280 */  lb         $v0, 0x1D($a1)
/* 93ED4 800A36D4 00000000 */  nop
/* 93ED8 800A36D8 2A106200 */  slt        $v0, $v1, $v0
/* 93EDC 800A36DC 1D004010 */  beqz       $v0, .L800A3754
/* 93EE0 800A36E0 0BB6043C */   lui       $a0, (0xB60B60B7 >> 16)
/* 93EE4 800A36E4 1E00A290 */  lbu        $v0, 0x1E($a1)
/* 93EE8 800A36E8 B7608434 */  ori        $a0, $a0, (0xB60B60B7 & 0xFFFF)
/* 93EEC 800A36EC 00130200 */  sll        $v0, $v0, 12
/* 93EF0 800A36F0 18004400 */  mult       $v0, $a0
/* 93EF4 800A36F4 1F00A390 */  lbu        $v1, 0x1F($a1)
/* 93EF8 800A36F8 10400000 */  mfhi       $t0
/* 93EFC 800A36FC 001B0300 */  sll        $v1, $v1, 12
/* 93F00 800A3700 00000000 */  nop
/* 93F04 800A3704 18006400 */  mult       $v1, $a0
/* 93F08 800A3708 08006426 */  addiu      $a0, $s3, 0x8
/* 93F0C 800A370C 21280201 */  addu       $a1, $t0, $v0
/* 93F10 800A3710 032A0500 */  sra        $a1, $a1, 8
/* 93F14 800A3714 C3170200 */  sra        $v0, $v0, 31
/* 93F18 800A3718 2328A200 */  subu       $a1, $a1, $v0
/* 93F1C 800A371C 10300000 */  mfhi       $a2
/* 93F20 800A3720 2130C300 */  addu       $a2, $a2, $v1
/* 93F24 800A3724 03320600 */  sra        $a2, $a2, 8
/* 93F28 800A3728 C31F0300 */  sra        $v1, $v1, 31
/* 93F2C 800A372C 90E9000C */  jal        MATH3D_ConeDetect
/* 93F30 800A3730 2330C300 */   subu      $a2, $a2, $v1
/* 93F34 800A3734 04004010 */  beqz       $v0, .L800A3748
/* 93F38 800A3738 21208002 */   addu      $a0, $s4, $zero
/* 93F3C 800A373C 21286002 */  addu       $a1, $s3, $zero
/* 93F40 800A3740 B18C020C */  jal        SetEngagedInstance
/* 93F44 800A3744 03000624 */   addiu     $a2, $zero, 0x3
.L800A3748:
/* 93F48 800A3748 0000648E */  lw         $a0, 0x0($s3)
/* 93F4C 800A374C 92D1000C */  jal        INSTANCE_Query
/* 93F50 800A3750 05000524 */   addiu     $a1, $zero, 0x5
.L800A3754:
/* 93F54 800A3754 80002232 */  andi       $v0, $s1, 0x80
.L800A3758:
/* 93F58 800A3758 79004010 */  beqz       $v0, .L800A3940
/* 93F5C 800A375C 00000000 */   nop
/* 93F60 800A3760 0000648E */  lw         $a0, 0x0($s3)
/* 93F64 800A3764 92D1000C */  jal        INSTANCE_Query
/* 93F68 800A3768 15000524 */   addiu     $a1, $zero, 0x15
/* 93F6C 800A376C 21884000 */  addu       $s1, $v0, $zero
/* 93F70 800A3770 08002296 */  lhu        $v0, 0x8($s1)
/* 93F74 800A3774 00000000 */  nop
/* 93F78 800A3778 01004230 */  andi       $v0, $v0, 0x1
/* 93F7C 800A377C 06004014 */  bnez       $v0, .L800A3798
/* 93F80 800A3780 21900000 */   addu      $s2, $zero, $zero
/* 93F84 800A3784 0A002296 */  lhu        $v0, 0xA($s1)
/* 93F88 800A3788 00000000 */  nop
/* 93F8C 800A378C 01004230 */  andi       $v0, $v0, 0x1
/* 93F90 800A3790 03004010 */  beqz       $v0, .L800A37A0
/* 93F94 800A3794 00000000 */   nop
.L800A3798:
/* 93F98 800A3798 0F8E0208 */  j          .L800A383C
/* 93F9C 800A379C FFFF1234 */   ori       $s2, $zero, 0xFFFF
.L800A37A0:
/* 93FA0 800A37A0 2197020C */  jal        razGetHeldItem
/* 93FA4 800A37A4 00000000 */   nop
/* 93FA8 800A37A8 21804000 */  addu       $s0, $v0, $zero
/* 93FAC 800A37AC 17000016 */  bnez       $s0, .L800A380C
/* 93FB0 800A37B0 21200002 */   addu      $a0, $s0, $zero
/* 93FB4 800A37B4 0492020C */  jal        GetMaxHealth
/* 93FB8 800A37B8 00081224 */   addiu     $s2, $zero, 0x800
/* 93FBC 800A37BC 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 93FC0 800A37C0 00000000 */  nop
/* 93FC4 800A37C4 1D006214 */  bne        $v1, $v0, .L800A383C
/* 93FC8 800A37C8 00000000 */   nop
/* 93FCC 800A37CC 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 93FD0 800A37D0 00000000 */  nop
/* 93FD4 800A37D4 07004010 */  beqz       $v0, .L800A37F4
/* 93FD8 800A37D8 00000000 */   nop
/* 93FDC 800A37DC 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 93FE0 800A37E0 08002396 */  lhu        $v1, 0x8($s1)
/* 93FE4 800A37E4 42120200 */  srl        $v0, $v0, 9
/* 93FE8 800A37E8 FE014230 */  andi       $v0, $v0, 0x1FE
/* 93FEC 800A37EC 24104300 */  and        $v0, $v0, $v1
/* 93FF0 800A37F0 25905200 */  or         $s2, $v0, $s2
.L800A37F4:
/* 93FF4 800A37F4 64FA838F */  lw         $v1, %gp_rel(Raziel + 0x434)($gp)
/* 93FF8 800A37F8 06000224 */  addiu      $v0, $zero, 0x6
/* 93FFC 800A37FC 0F006214 */  bne        $v1, $v0, .L800A383C
/* 94000 800A3800 00000000 */   nop
/* 94004 800A3804 0F8E0208 */  j          .L800A383C
/* 94008 800A3808 00025236 */   ori       $s2, $s2, 0x200
.L800A380C:
/* 9400C 800A380C 92D1000C */  jal        INSTANCE_Query
/* 94010 800A3810 02000524 */   addiu     $a1, $zero, 0x2
/* 94014 800A3814 20004230 */  andi       $v0, $v0, 0x20
/* 94018 800A3818 08004010 */  beqz       $v0, .L800A383C
/* 9401C 800A381C 21200002 */   addu      $a0, $s0, $zero
/* 94020 800A3820 92D1000C */  jal        INSTANCE_Query
/* 94024 800A3824 03000524 */   addiu     $a1, $zero, 0x3
/* 94028 800A3828 0100033C */  lui        $v1, (0x10000 >> 16)
/* 9402C 800A382C 24104300 */  and        $v0, $v0, $v1
/* 94030 800A3830 02004010 */  beqz       $v0, .L800A383C
/* 94034 800A3834 00041224 */   addiu     $s2, $zero, 0x400
/* 94038 800A3838 00021224 */  addiu      $s2, $zero, 0x200
.L800A383C:
/* 9403C 800A383C 08002296 */  lhu        $v0, 0x8($s1)
/* 94040 800A3840 00000000 */  nop
/* 94044 800A3844 24104202 */  and        $v0, $s2, $v0
/* 94048 800A3848 06004014 */  bnez       $v0, .L800A3864
/* 9404C 800A384C 00000000 */   nop
/* 94050 800A3850 0A002296 */  lhu        $v0, 0xA($s1)
/* 94054 800A3854 00000000 */  nop
/* 94058 800A3858 24104202 */  and        $v0, $s2, $v0
/* 9405C 800A385C 38004010 */  beqz       $v0, .L800A3940
/* 94060 800A3860 00000000 */   nop
.L800A3864:
/* 94064 800A3864 1C002396 */  lhu        $v1, 0x1C($s1)
/* 94068 800A3868 02000224 */  addiu      $v0, $zero, 0x2
/* 9406C 800A386C 34006210 */  beq        $v1, $v0, .L800A3940
/* 94070 800A3870 00000000 */   nop
/* 94074 800A3874 1E002396 */  lhu        $v1, 0x1E($s1)
/* 94078 800A3878 1000628E */  lw         $v0, 0x10($s3)
/* 9407C 800A387C 00000000 */  nop
/* 94080 800A3880 2A104300 */  slt        $v0, $v0, $v1
/* 94084 800A3884 2E004010 */  beqz       $v0, .L800A3940
/* 94088 800A3888 00000000 */   nop
/* 9408C 800A388C 20002286 */  lh         $v0, 0x20($s1)
/* 94090 800A3890 1400638E */  lw         $v1, 0x14($s3)
/* 94094 800A3894 00000000 */  nop
/* 94098 800A3898 2A104300 */  slt        $v0, $v0, $v1
/* 9409C 800A389C 28004010 */  beqz       $v0, .L800A3940
/* 940A0 800A38A0 00000000 */   nop
/* 940A4 800A38A4 22002286 */  lh         $v0, 0x22($s1)
/* 940A8 800A38A8 00000000 */  nop
/* 940AC 800A38AC 2A106200 */  slt        $v0, $v1, $v0
/* 940B0 800A38B0 23004010 */  beqz       $v0, .L800A3940
/* 940B4 800A38B4 0BB6043C */   lui       $a0, (0xB60B60B7 >> 16)
/* 940B8 800A38B8 24002292 */  lbu        $v0, 0x24($s1)
/* 940BC 800A38BC B7608434 */  ori        $a0, $a0, (0xB60B60B7 & 0xFFFF)
/* 940C0 800A38C0 00130200 */  sll        $v0, $v0, 12
/* 940C4 800A38C4 18004400 */  mult       $v0, $a0
/* 940C8 800A38C8 25002392 */  lbu        $v1, 0x25($s1)
/* 940CC 800A38CC 10400000 */  mfhi       $t0
/* 940D0 800A38D0 001B0300 */  sll        $v1, $v1, 12
/* 940D4 800A38D4 00000000 */  nop
/* 940D8 800A38D8 18006400 */  mult       $v1, $a0
/* 940DC 800A38DC 08006426 */  addiu      $a0, $s3, 0x8
/* 940E0 800A38E0 21280201 */  addu       $a1, $t0, $v0
/* 940E4 800A38E4 032A0500 */  sra        $a1, $a1, 8
/* 940E8 800A38E8 C3170200 */  sra        $v0, $v0, 31
/* 940EC 800A38EC 2328A200 */  subu       $a1, $a1, $v0
/* 940F0 800A38F0 10300000 */  mfhi       $a2
/* 940F4 800A38F4 2130C300 */  addu       $a2, $a2, $v1
/* 940F8 800A38F8 03320600 */  sra        $a2, $a2, 8
/* 940FC 800A38FC C31F0300 */  sra        $v1, $v1, 31
/* 94100 800A3900 90E9000C */  jal        MATH3D_ConeDetect
/* 94104 800A3904 2330C300 */   subu      $a2, $a2, $v1
/* 94108 800A3908 0D004010 */  beqz       $v0, .L800A3940
/* 9410C 800A390C 00000000 */   nop
/* 94110 800A3910 08002296 */  lhu        $v0, 0x8($s1)
/* 94114 800A3914 00000000 */  nop
/* 94118 800A3918 24104202 */  and        $v0, $s2, $v0
/* 9411C 800A391C 04004010 */  beqz       $v0, .L800A3930
/* 94120 800A3920 21208002 */   addu      $a0, $s4, $zero
/* 94124 800A3924 21286002 */  addu       $a1, $s3, $zero
/* 94128 800A3928 4E8E0208 */  j          .L800A3938
/* 9412C 800A392C 04000624 */   addiu     $a2, $zero, 0x4
.L800A3930:
/* 94130 800A3930 21286002 */  addu       $a1, $s3, $zero
/* 94134 800A3934 0D000624 */  addiu      $a2, $zero, 0xD
.L800A3938:
/* 94138 800A3938 B18C020C */  jal        SetEngagedInstance
/* 9413C 800A393C 00000000 */   nop
.L800A3940:
/* 94140 800A3940 0000648E */  lw         $a0, 0x0($s3)
/* 94144 800A3944 92D1000C */  jal        INSTANCE_Query
/* 94148 800A3948 1D000524 */   addiu     $a1, $zero, 0x1D
/* 9414C 800A394C 21884000 */  addu       $s1, $v0, $zero
/* 94150 800A3950 B6002012 */  beqz       $s1, .L800A3C2C
/* 94154 800A3954 00000000 */   nop
/* 94158 800A3958 B400C016 */  bnez       $s6, .L800A3C2C
/* 9415C 800A395C 00000000 */   nop
/* 94160 800A3960 0000648E */  lw         $a0, 0x0($s3)
/* 94164 800A3964 92D1000C */  jal        INSTANCE_Query
/* 94168 800A3968 0E000524 */   addiu     $a1, $zero, 0xE
/* 9416C 800A396C 21184000 */  addu       $v1, $v0, $zero
/* 94170 800A3970 0A006010 */  beqz       $v1, .L800A399C
/* 94174 800A3974 00000000 */   nop
/* 94178 800A3978 14006294 */  lhu        $v0, 0x14($v1)
/* 9417C 800A397C 00000000 */  nop
/* 94180 800A3980 3000A2A7 */  sh         $v0, 0x30($sp)
/* 94184 800A3984 18006294 */  lhu        $v0, 0x18($v1)
/* 94188 800A3988 00000000 */  nop
/* 9418C 800A398C 3200A2A7 */  sh         $v0, 0x32($sp)
/* 94190 800A3990 1C006294 */  lhu        $v0, 0x1C($v1)
/* 94194 800A3994 00000000 */  nop
/* 94198 800A3998 3400A2A7 */  sh         $v0, 0x34($sp)
.L800A399C:
/* 9419C 800A399C F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 941A0 800A39A0 00000000 */  nop
/* 941A4 800A39A4 4000628C */  lw         $v0, 0x40($v1)
/* 941A8 800A39A8 00000000 */  nop
/* 941AC 800A39AC 54024294 */  lhu        $v0, 0x254($v0)
/* 941B0 800A39B0 00000000 */  nop
/* 941B4 800A39B4 2800A2A7 */  sh         $v0, 0x28($sp)
/* 941B8 800A39B8 4000628C */  lw         $v0, 0x40($v1)
/* 941BC 800A39BC 00000000 */  nop
/* 941C0 800A39C0 58024294 */  lhu        $v0, 0x258($v0)
/* 941C4 800A39C4 2800A427 */  addiu      $a0, $sp, 0x28
/* 941C8 800A39C8 2A00A2A7 */  sh         $v0, 0x2A($sp)
/* 941CC 800A39CC 4000628C */  lw         $v0, 0x40($v1)
/* 941D0 800A39D0 3000B027 */  addiu      $s0, $sp, 0x30
/* 941D4 800A39D4 5C024294 */  lhu        $v0, 0x25C($v0)
/* 941D8 800A39D8 21280002 */  addu       $a1, $s0, $zero
/* 941DC 800A39DC CAE7000C */  jal        MATH3D_DistanceBetweenPositions
/* 941E0 800A39E0 2C00A2A7 */   sh        $v0, 0x2C($sp)
/* 941E4 800A39E4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 941E8 800A39E8 00000000 */  nop
/* 941EC 800A39EC 4000838C */  lw         $v1, 0x40($a0)
/* 941F0 800A39F0 00000000 */  nop
/* 941F4 800A39F4 34006394 */  lhu        $v1, 0x34($v1)
/* 941F8 800A39F8 00000000 */  nop
/* 941FC 800A39FC 2800A3A7 */  sh         $v1, 0x28($sp)
/* 94200 800A3A00 4000838C */  lw         $v1, 0x40($a0)
/* 94204 800A3A04 00000000 */  nop
/* 94208 800A3A08 38006394 */  lhu        $v1, 0x38($v1)
/* 9420C 800A3A0C 21280002 */  addu       $a1, $s0, $zero
/* 94210 800A3A10 2A00A3A7 */  sh         $v1, 0x2A($sp)
/* 94214 800A3A14 4000838C */  lw         $v1, 0x40($a0)
/* 94218 800A3A18 21804000 */  addu       $s0, $v0, $zero
/* 9421C 800A3A1C 3C006394 */  lhu        $v1, 0x3C($v1)
/* 94220 800A3A20 2800A427 */  addiu      $a0, $sp, 0x28
/* 94224 800A3A24 CAE7000C */  jal        MATH3D_DistanceBetweenPositions
/* 94228 800A3A28 2C00A3A7 */   sh        $v1, 0x2C($sp)
/* 9422C 800A3A2C 0400638E */  lw         $v1, 0x4($s3)
/* 94230 800A3A30 0C00248E */  lw         $a0, 0xC($s1)
/* 94234 800A3A34 00000000 */  nop
/* 94238 800A3A38 2B186400 */  sltu       $v1, $v1, $a0
/* 9423C 800A3A3C 06006014 */  bnez       $v1, .L800A3A58
/* 94240 800A3A40 21284000 */   addu      $a1, $v0, $zero
/* 94244 800A3A44 2B100402 */  sltu       $v0, $s0, $a0
/* 94248 800A3A48 03004014 */  bnez       $v0, .L800A3A58
/* 9424C 800A3A4C 2B10A400 */   sltu      $v0, $a1, $a0
/* 94250 800A3A50 76004010 */  beqz       $v0, .L800A3C2C
/* 94254 800A3A54 00000000 */   nop
.L800A3A58:
/* 94258 800A3A58 08002296 */  lhu        $v0, 0x8($s1)
/* 9425C 800A3A5C 00000000 */  nop
/* 94260 800A3A60 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 94264 800A3A64 00140200 */  sll        $v0, $v0, 16
/* 94268 800A3A68 031C0200 */  sra        $v1, $v0, 16
/* 9426C 800A3A6C 0700622C */  sltiu      $v0, $v1, 0x7
/* 94270 800A3A70 6E004010 */  beqz       $v0, .L800A3C2C
/* 94274 800A3A74 0180023C */   lui       $v0, %hi(jtbl_800122DC)
/* 94278 800A3A78 DC224224 */  addiu      $v0, $v0, %lo(jtbl_800122DC)
/* 9427C 800A3A7C 80180300 */  sll        $v1, $v1, 2
/* 94280 800A3A80 21186200 */  addu       $v1, $v1, $v0
/* 94284 800A3A84 0000628C */  lw         $v0, 0x0($v1)
/* 94288 800A3A88 00000000 */  nop
/* 9428C 800A3A8C 08004000 */  jr         $v0
/* 94290 800A3A90 00000000 */   nop
jlabel .L800A3A94
/* 94294 800A3A94 6666053C */  lui        $a1, (0x66666667 >> 16)
/* 94298 800A3A98 2AFA8397 */  lhu        $v1, %gp_rel(Raziel + 0x3FA)($gp)
/* 9429C 800A3A9C 6766A534 */  ori        $a1, $a1, (0x66666667 & 0xFFFF)
/* 942A0 800A3AA0 01006324 */  addiu      $v1, $v1, 0x1
/* 942A4 800A3AA4 00240300 */  sll        $a0, $v1, 16
/* 942A8 800A3AA8 03140400 */  sra        $v0, $a0, 16
/* 942AC 800A3AAC 18004500 */  mult       $v0, $a1
/* 942B0 800A3AB0 C3270400 */  sra        $a0, $a0, 31
/* 942B4 800A3AB4 2AFA83A7 */  sh         $v1, %gp_rel(Raziel + 0x3FA)($gp)
/* 942B8 800A3AB8 28FA8387 */  lh         $v1, %gp_rel(Raziel + 0x3F8)($gp)
/* 942BC 800A3ABC 10580000 */  mfhi       $t3
/* 942C0 800A3AC0 43100B00 */  sra        $v0, $t3, 1
/* 942C4 800A3AC4 23104400 */  subu       $v0, $v0, $a0
/* 942C8 800A3AC8 00140200 */  sll        $v0, $v0, 16
/* 942CC 800A3ACC 03140200 */  sra        $v0, $v0, 16
/* 942D0 800A3AD0 01004224 */  addiu      $v0, $v0, 0x1
/* 942D4 800A3AD4 2A186200 */  slt        $v1, $v1, $v0
/* 942D8 800A3AD8 03006010 */  beqz       $v1, .L800A3AE8
/* 942DC 800A3ADC 00000000 */   nop
/* 942E0 800A3AE0 F991020C */  jal        BumpUpHealth
/* 942E4 800A3AE4 00000000 */   nop
.L800A3AE8:
/* 942E8 800A3AE8 0000648E */  lw         $a0, 0x0($s3)
/* 942EC 800A3AEC 2AFA8687 */  lh         $a2, %gp_rel(Raziel + 0x3FA)($gp)
/* 942F0 800A3AF0 D08E0208 */  j          .L800A3B40
/* 942F4 800A3AF4 8000053C */   lui       $a1, (0x800026 >> 16)
jlabel .L800A3AF8
/* 942F8 800A3AF8 42FA8597 */  lhu        $a1, %gp_rel(Raziel + 0x412)($gp)
/* 942FC 800A3AFC 40FA8397 */  lhu        $v1, %gp_rel(Raziel + 0x410)($gp)
/* 94300 800A3B00 FFFFA430 */  andi       $a0, $a1, 0xFFFF
/* 94304 800A3B04 2B106400 */  sltu       $v0, $v1, $a0
/* 94308 800A3B08 48004010 */  beqz       $v0, .L800A3C2C
/* 9430C 800A3B0C 00000000 */   nop
/* 94310 800A3B10 0A002296 */  lhu        $v0, 0xA($s1)
/* 94314 800A3B14 00000000 */  nop
/* 94318 800A3B18 21106200 */  addu       $v0, $v1, $v0
/* 9431C 800A3B1C 40FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x410)($gp)
/* 94320 800A3B20 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 94324 800A3B24 2B108200 */  sltu       $v0, $a0, $v0
/* 94328 800A3B28 02004010 */  beqz       $v0, .L800A3B34
/* 9432C 800A3B2C 00000000 */   nop
/* 94330 800A3B30 40FA85A7 */  sh         $a1, %gp_rel(Raziel + 0x410)($gp)
.L800A3B34:
/* 94334 800A3B34 8000053C */  lui        $a1, (0x800026 >> 16)
/* 94338 800A3B38 0000648E */  lw         $a0, 0x0($s3)
/* 9433C 800A3B3C 40FA8697 */  lhu        $a2, %gp_rel(Raziel + 0x410)($gp)
.L800A3B40:
/* 94340 800A3B40 A1D1000C */  jal        INSTANCE_Post
/* 94344 800A3B44 2600A534 */   ori       $a1, $a1, (0x800026 & 0xFFFF)
/* 94348 800A3B48 0B8F0208 */  j          .L800A3C2C
/* 9434C 800A3B4C 00000000 */   nop
jlabel .L800A3B50
/* 94350 800A3B50 8000053C */  lui        $a1, (0x800026 >> 16)
/* 94354 800A3B54 2600A534 */  ori        $a1, $a1, (0x800026 & 0xFFFF)
/* 94358 800A3B58 0000648E */  lw         $a0, 0x0($s3)
/* 9435C 800A3B5C A1D1000C */  jal        INSTANCE_Post
/* 94360 800A3B60 21300000 */   addu      $a2, $zero, $zero
/* 94364 800A3B64 0A002292 */  lbu        $v0, 0xA($s1)
/* 94368 800A3B68 38FA848F */  lw         $a0, %gp_rel(Raziel + 0x408)($gp)
/* 9436C 800A3B6C 401C0200 */  sll        $v1, $v0, 17
/* 94370 800A3B70 24108300 */  and        $v0, $a0, $v1
/* 94374 800A3B74 2D004014 */  bnez       $v0, .L800A3C2C
/* 94378 800A3B78 25108300 */   or        $v0, $a0, $v1
/* 9437C 800A3B7C 38FA82AF */  sw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 94380 800A3B80 0A002386 */  lh         $v1, 0xA($s1)
/* 94384 800A3B84 58AB82AF */  sw         $v0, %gp_rel(debugRazielFlags1)($gp)
/* 94388 800A3B88 42FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x412)($gp)
/* 9438C 800A3B8C 00FF6330 */  andi       $v1, $v1, 0xFF00
/* 94390 800A3B90 031A0300 */  sra        $v1, $v1, 8
/* 94394 800A3B94 21104300 */  addu       $v0, $v0, $v1
/* 94398 800A3B98 42FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x412)($gp)
/* 9439C 800A3B9C 40FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x410)($gp)
/* 943A0 800A3BA0 0B8F0208 */  j          .L800A3C2C
/* 943A4 800A3BA4 00000000 */   nop
jlabel .L800A3BA8
/* 943A8 800A3BA8 8000053C */  lui        $a1, (0x800026 >> 16)
/* 943AC 800A3BAC 42FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x412)($gp)
/* 943B0 800A3BB0 0A002396 */  lhu        $v1, 0xA($s1)
/* 943B4 800A3BB4 00000000 */  nop
/* 943B8 800A3BB8 21104300 */  addu       $v0, $v0, $v1
/* 943BC 800A3BBC 42FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x412)($gp)
/* 943C0 800A3BC0 40FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x410)($gp)
/* 943C4 800A3BC4 0000648E */  lw         $a0, 0x0($s3)
/* 943C8 800A3BC8 F78E0208 */  j          .L800A3BDC
/* 943CC 800A3BCC 2600A534 */   ori       $a1, $a1, (0x800026 & 0xFFFF)
jlabel .L800A3BD0
/* 943D0 800A3BD0 0000648E */  lw         $a0, 0x0($s3)
/* 943D4 800A3BD4 8000053C */  lui        $a1, (0x800026 >> 16)
/* 943D8 800A3BD8 2600A534 */  ori        $a1, $a1, (0x800026 & 0xFFFF)
.L800A3BDC:
/* 943DC 800A3BDC A1D1000C */  jal        INSTANCE_Post
/* 943E0 800A3BE0 21300000 */   addu      $a2, $zero, $zero
/* 943E4 800A3BE4 0B8F0208 */  j          .L800A3C2C
/* 943E8 800A3BE8 00000000 */   nop
jlabel .L800A3BEC
/* 943EC 800A3BEC 8000053C */  lui        $a1, (0x800026 >> 16)
/* 943F0 800A3BF0 0000648E */  lw         $a0, 0x0($s3)
/* 943F4 800A3BF4 40FA8697 */  lhu        $a2, %gp_rel(Raziel + 0x410)($gp)
/* 943F8 800A3BF8 A1D1000C */  jal        INSTANCE_Post
/* 943FC 800A3BFC 2600A534 */   ori       $a1, $a1, (0x800026 & 0xFFFF)
/* 94400 800A3C00 B493020C */  jal        RAZIEL_DebugHealthFillUp
/* 94404 800A3C04 00000000 */   nop
/* 94408 800A3C08 0B8F0208 */  j          .L800A3C2C
/* 9440C 800A3C0C 00000000 */   nop
jlabel .L800A3C10
/* 94410 800A3C10 8000053C */  lui        $a1, (0x800026 >> 16)
/* 94414 800A3C14 0000648E */  lw         $a0, 0x0($s3)
/* 94418 800A3C18 40FA8697 */  lhu        $a2, %gp_rel(Raziel + 0x410)($gp)
/* 9441C 800A3C1C A1D1000C */  jal        INSTANCE_Post
/* 94420 800A3C20 2600A534 */   ori       $a1, $a1, (0x800026 & 0xFFFF)
/* 94424 800A3C24 6F93020C */  jal        SetMana
/* 94428 800A3C28 01000424 */   addiu     $a0, $zero, 0x1
.L800A3C2C:
/* 9442C 800A3C2C 0000628E */  lw         $v0, 0x0($s3)
/* 94430 800A3C30 00000000 */  nop
/* 94434 800A3C34 1C00428C */  lw         $v0, 0x1C($v0)
/* 94438 800A3C38 00000000 */  nop
/* 9443C 800A3C3C 2C00428C */  lw         $v0, 0x2C($v0)
/* 94440 800A3C40 4000033C */  lui        $v1, (0x400000 >> 16)
/* 94444 800A3C44 24104300 */  and        $v0, $v0, $v1
/* 94448 800A3C48 E6004010 */  beqz       $v0, .L800A3FE4
/* 9444C 800A3C4C 00000000 */   nop
/* 94450 800A3C50 0400628E */  lw         $v0, 0x4($s3)
/* 94454 800A3C54 00000000 */  nop
/* 94458 800A3C58 800C422C */  sltiu      $v0, $v0, 0xC80
/* 9445C 800A3C5C E1004010 */  beqz       $v0, .L800A3FE4
/* 94460 800A3C60 08006426 */   addiu     $a0, $s3, 0x8
/* 94464 800A3C64 C7030524 */  addiu      $a1, $zero, 0x3C7
/* 94468 800A3C68 90E9000C */  jal        MATH3D_ConeDetect
/* 9446C 800A3C6C 2130A000 */   addu      $a2, $a1, $zero
/* 94470 800A3C70 DC004010 */  beqz       $v0, .L800A3FE4
/* 94474 800A3C74 21208002 */   addu      $a0, $s4, $zero
/* 94478 800A3C78 21286002 */  addu       $a1, $s3, $zero
/* 9447C 800A3C7C B18C020C */  jal        SetEngagedInstance
/* 94480 800A3C80 0A000624 */   addiu     $a2, $zero, 0xA
/* 94484 800A3C84 F98F0208 */  j          .L800A3FE4
/* 94488 800A3C88 00000000 */   nop
.L800A3C8C:
/* 9448C 800A3C8C 0A00A232 */  andi       $v0, $s5, 0xA
/* 94490 800A3C90 06004014 */  bnez       $v0, .L800A3CAC
/* 94494 800A3C94 00000000 */   nop
/* 94498 800A3C98 1800828C */  lw         $v0, 0x18($a0)
/* 9449C 800A3C9C 00000000 */  nop
/* 944A0 800A3CA0 20004230 */  andi       $v0, $v0, 0x20
/* 944A4 800A3CA4 AA004010 */  beqz       $v0, .L800A3F50
/* 944A8 800A3CA8 0200023C */   lui       $v0, (0x20000 >> 16)
.L800A3CAC:
/* 944AC 800A3CAC 1800828C */  lw         $v0, 0x18($a0)
/* 944B0 800A3CB0 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 944B4 800A3CB4 24104300 */  and        $v0, $v0, $v1
/* 944B8 800A3CB8 A5004014 */  bnez       $v0, .L800A3F50
/* 944BC 800A3CBC 0200023C */   lui       $v0, (0x20000 >> 16)
/* 944C0 800A3CC0 92D1000C */  jal        INSTANCE_Query
/* 944C4 800A3CC4 21280000 */   addu      $a1, $zero, $zero
/* 944C8 800A3CC8 0044033C */  lui        $v1, (0x44000000 >> 16)
/* 944CC 800A3CCC 24104300 */  and        $v0, $v0, $v1
/* 944D0 800A3CD0 C4004014 */  bnez       $v0, .L800A3FE4
/* 944D4 800A3CD4 00000000 */   nop
/* 944D8 800A3CD8 0000638E */  lw         $v1, 0x0($s3)
/* 944DC 800A3CDC 00000000 */  nop
/* 944E0 800A3CE0 1800628C */  lw         $v0, 0x18($v1)
/* 944E4 800A3CE4 00000000 */  nop
/* 944E8 800A3CE8 20004230 */  andi       $v0, $v0, 0x20
/* 944EC 800A3CEC 47004010 */  beqz       $v0, .L800A3E0C
/* 944F0 800A3CF0 0A00A232 */   andi      $v0, $s5, 0xA
/* 944F4 800A3CF4 1000628E */  lw         $v0, 0x10($s3)
/* 944F8 800A3CF8 00000000 */  nop
/* 944FC 800A3CFC 80074228 */  slti       $v0, $v0, 0x780
/* 94500 800A3D00 2B004010 */  beqz       $v0, .L800A3DB0
/* 94504 800A3D04 00000000 */   nop
/* 94508 800A3D08 1400628E */  lw         $v0, 0x14($s3)
/* 9450C 800A3D0C 00000000 */  nop
/* 94510 800A3D10 FF014224 */  addiu      $v0, $v0, 0x1FF
/* 94514 800A3D14 FF03422C */  sltiu      $v0, $v0, 0x3FF
/* 94518 800A3D18 25004010 */  beqz       $v0, .L800A3DB0
/* 9451C 800A3D1C 00000000 */   nop
/* 94520 800A3D20 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 94524 800A3D24 00000000 */  nop
/* 94528 800A3D28 04004230 */  andi       $v0, $v0, 0x4
/* 9452C 800A3D2C 0E004010 */  beqz       $v0, .L800A3D68
/* 94530 800A3D30 00000000 */   nop
/* 94534 800A3D34 FCF9828F */  lw         $v0, %gp_rel(Raziel + 0x3CC)($gp)
/* 94538 800A3D38 00000000 */  nop
/* 9453C 800A3D3C 12004010 */  beqz       $v0, .L800A3D88
/* 94540 800A3D40 21208002 */   addu      $a0, $s4, $zero
/* 94544 800A3D44 1A006214 */  bne        $v1, $v0, .L800A3DB0
/* 94548 800A3D48 21286002 */   addu      $a1, $s3, $zero
/* 9454C 800A3D4C B18C020C */  jal        SetEngagedInstance
/* 94550 800A3D50 06000624 */   addiu     $a2, $zero, 0x6
/* 94554 800A3D54 11004014 */  bnez       $v0, .L800A3D9C
/* 94558 800A3D58 00000000 */   nop
/* 9455C 800A3D5C FCF980AF */  sw         $zero, %gp_rel(Raziel + 0x3CC)($gp)
/* 94560 800A3D60 6C8F0208 */  j          .L800A3DB0
/* 94564 800A3D64 00000000 */   nop
.L800A3D68:
/* 94568 800A3D68 00FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D0)($gp)
/* 9456C 800A3D6C 00000000 */  nop
/* 94570 800A3D70 05006214 */  bne        $v1, $v0, .L800A3D88
/* 94574 800A3D74 21208002 */   addu      $a0, $s4, $zero
/* 94578 800A3D78 FCF9828F */  lw         $v0, %gp_rel(Raziel + 0x3CC)($gp)
/* 9457C 800A3D7C 00000000 */  nop
/* 94580 800A3D80 0B004014 */  bnez       $v0, .L800A3DB0
/* 94584 800A3D84 00000000 */   nop
.L800A3D88:
/* 94588 800A3D88 21286002 */  addu       $a1, $s3, $zero
/* 9458C 800A3D8C B18C020C */  jal        SetEngagedInstance
/* 94590 800A3D90 06000624 */   addiu     $a2, $zero, 0x6
/* 94594 800A3D94 06004010 */  beqz       $v0, .L800A3DB0
/* 94598 800A3D98 00000000 */   nop
.L800A3D9C:
/* 9459C 800A3D9C 0400848E */  lw         $a0, 0x4($s4)
/* 945A0 800A3DA0 0000658E */  lw         $a1, 0x0($s3)
/* 945A4 800A3DA4 1891020C */  jal        UpdateAutoFaceAngle
/* 945A8 800A3DA8 00000000 */   nop
/* 945AC 800A3DAC C4FD82AF */  sw         $v0, %gp_rel(AutoFaceAngle)($gp)
.L800A3DB0:
/* 945B0 800A3DB0 0000628E */  lw         $v0, 0x0($s3)
/* 945B4 800A3DB4 00000000 */  nop
/* 945B8 800A3DB8 1C00428C */  lw         $v0, 0x1C($v0)
/* 945BC 800A3DBC 00000000 */  nop
/* 945C0 800A3DC0 2C00428C */  lw         $v0, 0x2C($v0)
/* 945C4 800A3DC4 00000000 */  nop
/* 945C8 800A3DC8 10004004 */  bltz       $v0, .L800A3E0C
/* 945CC 800A3DCC 0A00A232 */   andi      $v0, $s5, 0xA
/* 945D0 800A3DD0 0400628E */  lw         $v0, 0x4($s3)
/* 945D4 800A3DD4 00000000 */  nop
/* 945D8 800A3DD8 8102422C */  sltiu      $v0, $v0, 0x281
/* 945DC 800A3DDC 0B004014 */  bnez       $v0, .L800A3E0C
/* 945E0 800A3DE0 0A00A232 */   andi      $v0, $s5, 0xA
/* 945E4 800A3DE4 08006426 */  addiu      $a0, $s3, 0x8
/* 945E8 800A3DE8 AA020524 */  addiu      $a1, $zero, 0x2AA
/* 945EC 800A3DEC 90E9000C */  jal        MATH3D_ConeDetect
/* 945F0 800A3DF0 2130A000 */   addu      $a2, $a1, $zero
/* 945F4 800A3DF4 04004010 */  beqz       $v0, .L800A3E08
/* 945F8 800A3DF8 21208002 */   addu      $a0, $s4, $zero
/* 945FC 800A3DFC 21286002 */  addu       $a1, $s3, $zero
/* 94600 800A3E00 B18C020C */  jal        SetEngagedInstance
/* 94604 800A3E04 07000624 */   addiu     $a2, $zero, 0x7
.L800A3E08:
/* 94608 800A3E08 0A00A232 */  andi       $v0, $s5, 0xA
.L800A3E0C:
/* 9460C 800A3E0C 2A004010 */  beqz       $v0, .L800A3EB8
/* 94610 800A3E10 00000000 */   nop
/* 94614 800A3E14 1000628E */  lw         $v0, 0x10($s3)
/* 94618 800A3E18 00000000 */  nop
/* 9461C 800A3E1C 80024228 */  slti       $v0, $v0, 0x280
/* 94620 800A3E20 10004010 */  beqz       $v0, .L800A3E64
/* 94624 800A3E24 0A00A232 */   andi      $v0, $s5, 0xA
/* 94628 800A3E28 1400628E */  lw         $v0, 0x14($s3)
/* 9462C 800A3E2C 00000000 */  nop
/* 94630 800A3E30 FF004224 */  addiu      $v0, $v0, 0xFF
/* 94634 800A3E34 FF01422C */  sltiu      $v0, $v0, 0x1FF
/* 94638 800A3E38 09004010 */  beqz       $v0, .L800A3E60
/* 9463C 800A3E3C 08006426 */   addiu     $a0, $s3, 0x8
/* 94640 800A3E40 55050524 */  addiu      $a1, $zero, 0x555
/* 94644 800A3E44 90E9000C */  jal        MATH3D_ConeDetect
/* 94648 800A3E48 8E030624 */   addiu     $a2, $zero, 0x38E
/* 9464C 800A3E4C 04004010 */  beqz       $v0, .L800A3E60
/* 94650 800A3E50 21208002 */   addu      $a0, $s4, $zero
/* 94654 800A3E54 21286002 */  addu       $a1, $s3, $zero
/* 94658 800A3E58 B18C020C */  jal        SetEngagedInstance
/* 9465C 800A3E5C 08000624 */   addiu     $a2, $zero, 0x8
.L800A3E60:
/* 94660 800A3E60 0A00A232 */  andi       $v0, $s5, 0xA
.L800A3E64:
/* 94664 800A3E64 14004010 */  beqz       $v0, .L800A3EB8
/* 94668 800A3E68 00000000 */   nop
/* 9466C 800A3E6C 1000628E */  lw         $v0, 0x10($s3)
/* 94670 800A3E70 00000000 */  nop
/* 94674 800A3E74 C0034228 */  slti       $v0, $v0, 0x3C0
/* 94678 800A3E78 0F004010 */  beqz       $v0, .L800A3EB8
/* 9467C 800A3E7C 00000000 */   nop
/* 94680 800A3E80 1400628E */  lw         $v0, 0x14($s3)
/* 94684 800A3E84 00000000 */  nop
/* 94688 800A3E88 FF004224 */  addiu      $v0, $v0, 0xFF
/* 9468C 800A3E8C FF01422C */  sltiu      $v0, $v0, 0x1FF
/* 94690 800A3E90 09004010 */  beqz       $v0, .L800A3EB8
/* 94694 800A3E94 08006426 */   addiu     $a0, $s3, 0x8
/* 94698 800A3E98 55050524 */  addiu      $a1, $zero, 0x555
/* 9469C 800A3E9C 90E9000C */  jal        MATH3D_ConeDetect
/* 946A0 800A3EA0 8E030624 */   addiu     $a2, $zero, 0x38E
/* 946A4 800A3EA4 04004010 */  beqz       $v0, .L800A3EB8
/* 946A8 800A3EA8 21208002 */   addu      $a0, $s4, $zero
/* 946AC 800A3EAC 21286002 */  addu       $a1, $s3, $zero
/* 946B0 800A3EB0 B18C020C */  jal        SetEngagedInstance
/* 946B4 800A3EB4 09000624 */   addiu     $a2, $zero, 0x9
.L800A3EB8:
/* 946B8 800A3EB8 0000628E */  lw         $v0, 0x0($s3)
/* 946BC 800A3EBC 00000000 */  nop
/* 946C0 800A3EC0 1C00428C */  lw         $v0, 0x1C($v0)
/* 946C4 800A3EC4 00000000 */  nop
/* 946C8 800A3EC8 2C00428C */  lw         $v0, 0x2C($v0)
/* 946CC 800A3ECC 4000033C */  lui        $v1, (0x400000 >> 16)
/* 946D0 800A3ED0 24104300 */  and        $v0, $v0, $v1
/* 946D4 800A3ED4 0E004010 */  beqz       $v0, .L800A3F10
/* 946D8 800A3ED8 00000000 */   nop
/* 946DC 800A3EDC 0400628E */  lw         $v0, 0x4($s3)
/* 946E0 800A3EE0 00000000 */  nop
/* 946E4 800A3EE4 800C422C */  sltiu      $v0, $v0, 0xC80
/* 946E8 800A3EE8 09004010 */  beqz       $v0, .L800A3F10
/* 946EC 800A3EEC 08006426 */   addiu     $a0, $s3, 0x8
/* 946F0 800A3EF0 C7030524 */  addiu      $a1, $zero, 0x3C7
/* 946F4 800A3EF4 90E9000C */  jal        MATH3D_ConeDetect
/* 946F8 800A3EF8 2130A000 */   addu      $a2, $a1, $zero
/* 946FC 800A3EFC 04004010 */  beqz       $v0, .L800A3F10
/* 94700 800A3F00 21208002 */   addu      $a0, $s4, $zero
/* 94704 800A3F04 21286002 */  addu       $a1, $s3, $zero
/* 94708 800A3F08 B18C020C */  jal        SetEngagedInstance
/* 9470C 800A3F0C 0A000624 */   addiu     $a2, $zero, 0xA
.L800A3F10:
/* 94710 800A3F10 0400628E */  lw         $v0, 0x4($s3)
/* 94714 800A3F14 00000000 */  nop
/* 94718 800A3F18 001E422C */  sltiu      $v0, $v0, 0x1E00
/* 9471C 800A3F1C 31004010 */  beqz       $v0, .L800A3FE4
/* 94720 800A3F20 00000000 */   nop
/* 94724 800A3F24 0000648E */  lw         $a0, 0x0($s3)
/* 94728 800A3F28 92D1000C */  jal        INSTANCE_Query
/* 9472C 800A3F2C 25000524 */   addiu     $a1, $zero, 0x25
/* 94730 800A3F30 2C004010 */  beqz       $v0, .L800A3FE4
/* 94734 800A3F34 00000000 */   nop
/* 94738 800A3F38 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9473C 800A3F3C 00000000 */  nop
/* 94740 800A3F40 20004234 */  ori        $v0, $v0, 0x20
/* 94744 800A3F44 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 94748 800A3F48 F98F0208 */  j          .L800A3FE4
/* 9474C 800A3F4C 00000000 */   nop
.L800A3F50:
/* 94750 800A3F50 2410A202 */  and        $v0, $s5, $v0
/* 94754 800A3F54 23004010 */  beqz       $v0, .L800A3FE4
/* 94758 800A3F58 00000000 */   nop
/* 9475C 800A3F5C 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 94760 800A3F60 00000000 */  nop
/* 94764 800A3F64 1F004014 */  bnez       $v0, .L800A3FE4
/* 94768 800A3F68 00000000 */   nop
/* 9476C 800A3F6C 0000628E */  lw         $v0, 0x0($s3)
/* 94770 800A3F70 00000000 */  nop
/* 94774 800A3F74 4801438C */  lw         $v1, 0x148($v0)
/* 94778 800A3F78 0400828E */  lw         $v0, 0x4($s4)
/* 9477C 800A3F7C 00000000 */  nop
/* 94780 800A3F80 0F006210 */  beq        $v1, $v0, .L800A3FC0
/* 94784 800A3F84 00000000 */   nop
/* 94788 800A3F88 1000628E */  lw         $v0, 0x10($s3)
/* 9478C 800A3F8C 00000000 */  nop
/* 94790 800A3F90 00024228 */  slti       $v0, $v0, 0x200
/* 94794 800A3F94 0A004010 */  beqz       $v0, .L800A3FC0
/* 94798 800A3F98 00000000 */   nop
/* 9479C 800A3F9C 1400628E */  lw         $v0, 0x14($s3)
/* 947A0 800A3FA0 00000000 */  nop
/* 947A4 800A3FA4 63004224 */  addiu      $v0, $v0, 0x63
/* 947A8 800A3FA8 E302422C */  sltiu      $v0, $v0, 0x2E3
/* 947AC 800A3FAC 04004010 */  beqz       $v0, .L800A3FC0
/* 947B0 800A3FB0 21208002 */   addu      $a0, $s4, $zero
/* 947B4 800A3FB4 21286002 */  addu       $a1, $s3, $zero
/* 947B8 800A3FB8 B18C020C */  jal        SetEngagedInstance
/* 947BC 800A3FBC 0B000624 */   addiu     $a2, $zero, 0xB
.L800A3FC0:
/* 947C0 800A3FC0 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 947C4 800A3FC4 00000000 */  nop
/* 947C8 800A3FC8 08004230 */  andi       $v0, $v0, 0x8
/* 947CC 800A3FCC 05004010 */  beqz       $v0, .L800A3FE4
/* 947D0 800A3FD0 00000000 */   nop
/* 947D4 800A3FD4 0400848E */  lw         $a0, 0x4($s4)
/* 947D8 800A3FD8 0000658E */  lw         $a1, 0x0($s3)
/* 947DC 800A3FDC BE97020C */  jal        razReaverPickup
/* 947E0 800A3FE0 00000000 */   nop
.L800A3FE4:
/* 947E4 800A3FE4 0000648E */  lw         $a0, 0x0($s3)
/* 947E8 800A3FE8 92D1000C */  jal        INSTANCE_Query
/* 947EC 800A3FEC 21280000 */   addu      $a1, $zero, $zero
/* 947F0 800A3FF0 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 947F4 800A3FF4 24104300 */  and        $v0, $v0, $v1
/* 947F8 800A3FF8 15004010 */  beqz       $v0, .L800A4050
/* 947FC 800A3FFC 0400A232 */   andi      $v0, $s5, 0x4
/* 94800 800A4000 1000628E */  lw         $v0, 0x10($s3)
/* 94804 800A4004 00000000 */  nop
/* 94808 800A4008 00024228 */  slti       $v0, $v0, 0x200
/* 9480C 800A400C 10004010 */  beqz       $v0, .L800A4050
/* 94810 800A4010 0400A232 */   andi      $v0, $s5, 0x4
/* 94814 800A4014 1400628E */  lw         $v0, 0x14($s3)
/* 94818 800A4018 00000000 */  nop
/* 9481C 800A401C 63004224 */  addiu      $v0, $v0, 0x63
/* 94820 800A4020 E302422C */  sltiu      $v0, $v0, 0x2E3
/* 94824 800A4024 09004010 */  beqz       $v0, .L800A404C
/* 94828 800A4028 08006426 */   addiu     $a0, $s3, 0x8
/* 9482C 800A402C AA020524 */  addiu      $a1, $zero, 0x2AA
/* 94830 800A4030 90E9000C */  jal        MATH3D_ConeDetect
/* 94834 800A4034 2130A000 */   addu      $a2, $a1, $zero
/* 94838 800A4038 04004010 */  beqz       $v0, .L800A404C
/* 9483C 800A403C 21208002 */   addu      $a0, $s4, $zero
/* 94840 800A4040 21286002 */  addu       $a1, $s3, $zero
/* 94844 800A4044 B18C020C */  jal        SetEngagedInstance
/* 94848 800A4048 0C000624 */   addiu     $a2, $zero, 0xC
.L800A404C:
/* 9484C 800A404C 0400A232 */  andi       $v0, $s5, 0x4
.L800A4050:
/* 94850 800A4050 16004010 */  beqz       $v0, .L800A40AC
/* 94854 800A4054 00000000 */   nop
/* 94858 800A4058 DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 9485C 800A405C C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 94860 800A4060 00104234 */  ori        $v0, $v0, 0x1000
/* 94864 800A4064 40006330 */  andi       $v1, $v1, 0x40
/* 94868 800A4068 DCFB82AF */  sw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* 9486C 800A406C 0F006010 */  beqz       $v1, .L800A40AC
/* 94870 800A4070 00000000 */   nop
/* 94874 800A4074 0400848E */  lw         $a0, 0x4($s4)
/* 94878 800A4078 00000000 */  nop
/* 9487C 800A407C 4000828C */  lw         $v0, 0x40($a0)
/* 94880 800A4080 00000000 */  nop
/* 94884 800A4084 F401458C */  lw         $a1, 0x1F4($v0)
/* 94888 800A4088 F801468C */  lw         $a2, 0x1F8($v0)
/* 9488C 800A408C FC01478C */  lw         $a3, 0x1FC($v0)
/* 94890 800A4090 E4C3010C */  jal        SetMonsterSoulSuckData
/* 94894 800A4094 00000000 */   nop
/* 94898 800A4098 0001053C */  lui        $a1, (0x1000009 >> 16)
/* 9489C 800A409C 0900A534 */  ori        $a1, $a1, (0x1000009 & 0xFFFF)
/* 948A0 800A40A0 0000648E */  lw         $a0, 0x0($s3)
/* 948A4 800A40A4 A1D1000C */  jal        INSTANCE_Post
/* 948A8 800A40A8 21304000 */   addu      $a2, $v0, $zero
.L800A40AC:
/* 948AC 800A40AC 0000648E */  lw         $a0, 0x0($s3)
/* 948B0 800A40B0 00000000 */  nop
/* 948B4 800A40B4 1C00828C */  lw         $v0, 0x1C($a0)
/* 948B8 800A40B8 00000000 */  nop
/* 948BC 800A40BC 2C00428C */  lw         $v0, 0x2C($v0)
/* 948C0 800A40C0 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 948C4 800A40C4 24104300 */  and        $v0, $v0, $v1
/* 948C8 800A40C8 8D004010 */  beqz       $v0, .L800A4300
/* 948CC 800A40CC 00000000 */   nop
/* 948D0 800A40D0 54FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x424)($gp)
/* 948D4 800A40D4 00000000 */  nop
/* 948D8 800A40D8 20004230 */  andi       $v0, $v0, 0x20
/* 948DC 800A40DC 80004010 */  beqz       $v0, .L800A42E0
/* 948E0 800A40E0 00000000 */   nop
/* 948E4 800A40E4 5C008284 */  lh         $v0, 0x5C($a0)
/* 948E8 800A40E8 4CFA8387 */  lh         $v1, %gp_rel(Raziel + 0x41C)($gp)
/* 948EC 800A40EC 00000000 */  nop
/* 948F0 800A40F0 23104300 */  subu       $v0, $v0, $v1
/* 948F4 800A40F4 2800A2AF */  sw         $v0, 0x28($sp)
/* 948F8 800A40F8 0000628E */  lw         $v0, 0x0($s3)
/* 948FC 800A40FC 4EFA8387 */  lh         $v1, %gp_rel(Raziel + 0x41E)($gp)
/* 94900 800A4100 5E004284 */  lh         $v0, 0x5E($v0)
/* 94904 800A4104 3000A0AF */  sw         $zero, 0x30($sp)
/* 94908 800A4108 23104300 */  subu       $v0, $v0, $v1
/* 9490C 800A410C 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 94910 800A4110 2800A227 */  addiu      $v0, $sp, 0x28
/* 94914 800A4114 000049C8 */  lwc2       $9, 0x0($v0)
/* 94918 800A4118 04004AC8 */  lwc2       $10, 0x4($v0)
/* 9491C 800A411C 08004BC8 */  lwc2       $11, 0x8($v0)
/* 94920 800A4120 00000000 */  nop
/* 94924 800A4124 00000000 */  nop
/* 94928 800A4128 2804A04A */  SQR        0
/* 9492C 800A412C 3800A227 */  addiu      $v0, $sp, 0x38
/* 94930 800A4130 000059E8 */  swc2       $25, 0x0($v0)
/* 94934 800A4134 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 94938 800A4138 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 9493C 800A413C 0600033C */  lui        $v1, (0x63FFF >> 16)
/* 94940 800A4140 3800A28F */  lw         $v0, 0x38($sp)
/* 94944 800A4144 3C00A48F */  lw         $a0, 0x3C($sp)
/* 94948 800A4148 FF3F6334 */  ori        $v1, $v1, (0x63FFF & 0xFFFF)
/* 9494C 800A414C 21104400 */  addu       $v0, $v0, $a0
/* 94950 800A4150 2A186200 */  slt        $v1, $v1, $v0
/* 94954 800A4154 62006014 */  bnez       $v1, .L800A42E0
/* 94958 800A4158 00000000 */   nop
/* 9495C 800A415C 0000648E */  lw         $a0, 0x0($s3)
/* 94960 800A4160 C694020C */  jal        razConstrictAngle
/* 94964 800A4164 00000000 */   nop
/* 94968 800A4168 54FA8397 */  lhu        $v1, %gp_rel(Raziel + 0x424)($gp)
/* 9496C 800A416C 00000000 */  nop
/* 94970 800A4170 10006330 */  andi       $v1, $v1, 0x10
/* 94974 800A4174 56006010 */  beqz       $v1, .L800A42D0
/* 94978 800A4178 21200000 */   addu      $a0, $zero, $zero
/* 9497C 800A417C 54004010 */  beqz       $v0, .L800A42D0
/* 94980 800A4180 00000000 */   nop
/* 94984 800A4184 0D004018 */  blez       $v0, .L800A41BC
/* 94988 800A4188 00000000 */   nop
/* 9498C 800A418C 0000638E */  lw         $v1, 0x0($s3)
/* 94990 800A4190 00000000 */  nop
/* 94994 800A4194 70016284 */  lh         $v0, 0x170($v1)
/* 94998 800A4198 00000000 */  nop
/* 9499C 800A419C 03004104 */  bgez       $v0, .L800A41AC
/* 949A0 800A41A0 00000000 */   nop
/* 949A4 800A41A4 700160A4 */  sh         $zero, 0x170($v1)
/* 949A8 800A41A8 0000638E */  lw         $v1, 0x0($s3)
.L800A41AC:
/* 949AC 800A41AC 00000000 */  nop
/* 949B0 800A41B0 70016294 */  lhu        $v0, 0x170($v1)
/* 949B4 800A41B4 7B900208 */  j          .L800A41EC
/* 949B8 800A41B8 01004224 */   addiu     $v0, $v0, 0x1
.L800A41BC:
/* 949BC 800A41BC 0000638E */  lw         $v1, 0x0($s3)
/* 949C0 800A41C0 00000000 */  nop
/* 949C4 800A41C4 70016284 */  lh         $v0, 0x170($v1)
/* 949C8 800A41C8 00000000 */  nop
/* 949CC 800A41CC 03004018 */  blez       $v0, .L800A41DC
/* 949D0 800A41D0 00000000 */   nop
/* 949D4 800A41D4 700160A4 */  sh         $zero, 0x170($v1)
/* 949D8 800A41D8 0000638E */  lw         $v1, 0x0($s3)
.L800A41DC:
/* 949DC 800A41DC 00000000 */  nop
/* 949E0 800A41E0 70016294 */  lhu        $v0, 0x170($v1)
/* 949E4 800A41E4 00000000 */  nop
/* 949E8 800A41E8 FFFF4224 */  addiu      $v0, $v0, -0x1
.L800A41EC:
/* 949EC 800A41EC 700162A4 */  sh         $v0, 0x170($v1)
/* 949F0 800A41F0 0000628E */  lw         $v0, 0x0($s3)
/* 949F4 800A41F4 01001024 */  addiu      $s0, $zero, 0x1
/* 949F8 800A41F8 70014484 */  lh         $a0, 0x170($v0)
/* 949FC 800A41FC 70014394 */  lhu        $v1, 0x170($v0)
/* 94A00 800A4200 03009010 */  beq        $a0, $s0, .L800A4210
/* 94A04 800A4204 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 94A08 800A4208 0D008214 */  bne        $a0, $v0, .L800A4240
/* 94A0C 800A420C 01006224 */   addiu     $v0, $v1, 0x1
.L800A4210:
/* 94A10 800A4210 4CFA8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x41C)
/* 94A14 800A4214 01000624 */  addiu      $a2, $zero, 0x1
/* 94A18 800A4218 34F6848F */  lw         $a0, %gp_rel(Raziel + 0x4)($gp)
/* 94A1C 800A421C 021F010C */  jal        FX_StartConstrict
/* 94A20 800A4220 12000724 */   addiu     $a3, $zero, 0x12
/* 94A24 800A4224 0400053C */  lui        $a1, (0x40009 >> 16)
/* 94A28 800A4228 0900A534 */  ori        $a1, $a1, (0x40009 & 0xFFFF)
/* 94A2C 800A422C 0000648E */  lw         $a0, 0x0($s3)
/* 94A30 800A4230 A1D1000C */  jal        INSTANCE_Post
/* 94A34 800A4234 21300000 */   addu      $a2, $zero, $zero
/* 94A38 800A4238 B8900208 */  j          .L800A42E0
/* 94A3C 800A423C 00000000 */   nop
.L800A4240:
/* 94A40 800A4240 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 94A44 800A4244 0300422C */  sltiu      $v0, $v0, 0x3
/* 94A48 800A4248 25004014 */  bnez       $v0, .L800A42E0
/* 94A4C 800A424C 00000000 */   nop
/* 94A50 800A4250 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 94A54 800A4254 00000000 */  nop
/* 94A58 800A4258 04004234 */  ori        $v0, $v0, 0x4
/* 94A5C 800A425C 0CBF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* 94A60 800A4260 0000658E */  lw         $a1, 0x0($s3)
/* 94A64 800A4264 261F010C */  jal        FX_EndConstrict
/* 94A68 800A4268 01000424 */   addiu     $a0, $zero, 0x1
/* 94A6C 800A426C 00300624 */  addiu      $a2, $zero, 0x3000
/* 94A70 800A4270 54FA90A7 */  sh         $s0, %gp_rel(Raziel + 0x424)($gp)
/* 94A74 800A4274 1000A0AF */  sw         $zero, 0x10($sp)
/* 94A78 800A4278 0400848E */  lw         $a0, 0x4($s4)
/* 94A7C 800A427C 0000658E */  lw         $a1, 0x0($s3)
/* 94A80 800A4280 95C3010C */  jal        SetMonsterHitData
/* 94A84 800A4284 21380000 */   addu      $a3, $zero, $zero
/* 94A88 800A4288 0001053C */  lui        $a1, (0x1000000 >> 16)
/* 94A8C 800A428C 0000648E */  lw         $a0, 0x0($s3)
/* 94A90 800A4290 A1D1000C */  jal        INSTANCE_Post
/* 94A94 800A4294 21304000 */   addu      $a2, $v0, $zero
/* 94A98 800A4298 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* 94A9C 800A429C 30000624 */  addiu      $a2, $zero, 0x30
/* 94AA0 800A42A0 64000724 */  addiu      $a3, $zero, 0x64
/* 94AA4 800A42A4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 94AA8 800A42A8 2110E000 */  addu       $v0, $a3, $zero
/* 94AAC 800A42AC 1000A2AF */  sw         $v0, 0x10($sp)
/* 94AB0 800A42B0 1400A2AF */  sw         $v0, 0x14($sp)
/* 94AB4 800A42B4 1800A2AF */  sw         $v0, 0x18($sp)
/* 94AB8 800A42B8 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* 94ABC 800A42BC 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 94AC0 800A42C0 509F020C */  jal        razSetupSoundRamp
/* 94AC4 800A42C4 2000A2AF */   sw        $v0, 0x20($sp)
/* 94AC8 800A42C8 B8900208 */  j          .L800A42E0
/* 94ACC 800A42CC 00000000 */   nop
.L800A42D0:
/* 94AD0 800A42D0 0000628E */  lw         $v0, 0x0($s3)
/* 94AD4 800A42D4 21288000 */  addu       $a1, $a0, $zero
/* 94AD8 800A42D8 261F010C */  jal        FX_EndConstrict
/* 94ADC 800A42DC 700140A4 */   sh        $zero, 0x170($v0)
.L800A42E0:
/* 94AE0 800A42E0 56FA8287 */  lh         $v0, %gp_rel(Raziel + 0x426)($gp)
/* 94AE4 800A42E4 00000000 */  nop
/* 94AE8 800A42E8 04004014 */  bnez       $v0, .L800A42FC
/* 94AEC 800A42EC 00000000 */   nop
/* 94AF0 800A42F0 0000628E */  lw         $v0, 0x0($s3)
/* 94AF4 800A42F4 00000000 */  nop
/* 94AF8 800A42F8 700140A4 */  sh         $zero, 0x170($v0)
.L800A42FC:
/* 94AFC 800A42FC 0000648E */  lw         $a0, 0x0($s3)
.L800A4300:
/* 94B00 800A4300 00000000 */  nop
/* 94B04 800A4304 1C00828C */  lw         $v0, 0x1C($a0)
/* 94B08 800A4308 00000000 */  nop
/* 94B0C 800A430C 2C00428C */  lw         $v0, 0x2C($v0)
/* 94B10 800A4310 0001033C */  lui        $v1, (0x1000000 >> 16)
/* 94B14 800A4314 24104300 */  and        $v0, $v0, $v1
/* 94B18 800A4318 20004010 */  beqz       $v0, .L800A439C
/* 94B1C 800A431C 00000000 */   nop
/* 94B20 800A4320 1400828C */  lw         $v0, 0x14($a0)
/* 94B24 800A4324 00000000 */  nop
/* 94B28 800A4328 00084230 */  andi       $v0, $v0, 0x800
/* 94B2C 800A432C 1B004014 */  bnez       $v0, .L800A439C
/* 94B30 800A4330 00000000 */   nop
/* 94B34 800A4334 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 94B38 800A4338 00000000 */  nop
/* 94B3C 800A433C 17004010 */  beqz       $v0, .L800A439C
/* 94B40 800A4340 02000224 */   addiu     $v0, $zero, 0x2
/* 94B44 800A4344 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* 94B48 800A4348 00000000 */  nop
/* 94B4C 800A434C 13006214 */  bne        $v1, $v0, .L800A439C
/* 94B50 800A4350 00000000 */   nop
/* 94B54 800A4354 1000628E */  lw         $v0, 0x10($s3)
/* 94B58 800A4358 00000000 */  nop
/* 94B5C 800A435C C2014228 */  slti       $v0, $v0, 0x1C2
/* 94B60 800A4360 0E004010 */  beqz       $v0, .L800A439C
/* 94B64 800A4364 00000000 */   nop
/* 94B68 800A4368 1400628E */  lw         $v0, 0x14($s3)
/* 94B6C 800A436C 00000000 */  nop
/* 94B70 800A4370 3F004224 */  addiu      $v0, $v0, 0x3F
/* 94B74 800A4374 7F00422C */  sltiu      $v0, $v0, 0x7F
/* 94B78 800A4378 08004010 */  beqz       $v0, .L800A439C
/* 94B7C 800A437C 00000000 */   nop
/* 94B80 800A4380 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 94B84 800A4384 00000000 */  nop
/* 94B88 800A4388 40004234 */  ori        $v0, $v0, 0x40
/* 94B8C 800A438C CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 94B90 800A4390 0000628E */  lw         $v0, 0x0($s3)
/* 94B94 800A4394 00000000 */  nop
/* 94B98 800A4398 04FA82AF */  sw         $v0, %gp_rel(Raziel + 0x3D4)($gp)
.L800A439C:
/* 94B9C 800A439C 0000628E */  lw         $v0, 0x0($s3)
/* 94BA0 800A43A0 00000000 */  nop
/* 94BA4 800A43A4 1C00428C */  lw         $v0, 0x1C($v0)
/* 94BA8 800A43A8 00000000 */  nop
/* 94BAC 800A43AC 0000428C */  lw         $v0, 0x0($v0)
/* 94BB0 800A43B0 1000033C */  lui        $v1, (0x100000 >> 16)
/* 94BB4 800A43B4 24104300 */  and        $v0, $v0, $v1
/* 94BB8 800A43B8 0E004010 */  beqz       $v0, .L800A43F4
/* 94BBC 800A43BC 00000000 */   nop
/* 94BC0 800A43C0 0400628E */  lw         $v0, 0x4($s3)
/* 94BC4 800A43C4 00000000 */  nop
/* 94BC8 800A43C8 8102422C */  sltiu      $v0, $v0, 0x281
/* 94BCC 800A43CC 09004014 */  bnez       $v0, .L800A43F4
/* 94BD0 800A43D0 08006426 */   addiu     $a0, $s3, 0x8
/* 94BD4 800A43D4 AA020524 */  addiu      $a1, $zero, 0x2AA
/* 94BD8 800A43D8 90E9000C */  jal        MATH3D_ConeDetect
/* 94BDC 800A43DC 2130A000 */   addu      $a2, $a1, $zero
/* 94BE0 800A43E0 04004010 */  beqz       $v0, .L800A43F4
/* 94BE4 800A43E4 21208002 */   addu      $a0, $s4, $zero
/* 94BE8 800A43E8 21286002 */  addu       $a1, $s3, $zero
/* 94BEC 800A43EC B18C020C */  jal        SetEngagedInstance
/* 94BF0 800A43F0 07000624 */   addiu     $a2, $zero, 0x7
.L800A43F4:
/* 94BF4 800A43F4 0000628E */  lw         $v0, 0x0($s3)
/* 94BF8 800A43F8 00000000 */  nop
/* 94BFC 800A43FC 1C00428C */  lw         $v0, 0x1C($v0)
/* 94C00 800A4400 00000000 */  nop
/* 94C04 800A4404 2C00428C */  lw         $v0, 0x2C($v0)
/* 94C08 800A4408 00000000 */  nop
/* 94C0C 800A440C 20004230 */  andi       $v0, $v0, 0x20
/* 94C10 800A4410 09004010 */  beqz       $v0, .L800A4438
/* 94C14 800A4414 00000000 */   nop
/* 94C18 800A4418 0400628E */  lw         $v0, 0x4($s3)
/* 94C1C 800A441C 00000000 */  nop
/* 94C20 800A4420 0001422C */  sltiu      $v0, $v0, 0x100
/* 94C24 800A4424 04004010 */  beqz       $v0, .L800A4438
/* 94C28 800A4428 21208002 */   addu      $a0, $s4, $zero
/* 94C2C 800A442C 21286002 */  addu       $a1, $s3, $zero
/* 94C30 800A4430 B18C020C */  jal        SetEngagedInstance
/* 94C34 800A4434 0E000624 */   addiu     $a2, $zero, 0xE
.L800A4438:
/* 94C38 800A4438 6400BF8F */  lw         $ra, 0x64($sp)
/* 94C3C 800A443C 6000B68F */  lw         $s6, 0x60($sp)
/* 94C40 800A4440 5C00B58F */  lw         $s5, 0x5C($sp)
/* 94C44 800A4444 5800B48F */  lw         $s4, 0x58($sp)
/* 94C48 800A4448 5400B38F */  lw         $s3, 0x54($sp)
/* 94C4C 800A444C 5000B28F */  lw         $s2, 0x50($sp)
/* 94C50 800A4450 4C00B18F */  lw         $s1, 0x4C($sp)
/* 94C54 800A4454 4800B08F */  lw         $s0, 0x48($sp)
/* 94C58 800A4458 0800E003 */  jr         $ra
/* 94C5C 800A445C 6800BD27 */   addiu     $sp, $sp, 0x68
.size UpdateEngagementList, . - UpdateEngagementList
