.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AlgorithmicNeck
/* 925EC 800A1DEC 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 925F0 800A1DF0 6C00B1AF */  sw         $s1, 0x6C($sp)
/* 925F4 800A1DF4 21888000 */  addu       $s1, $a0, $zero
/* 925F8 800A1DF8 7000B2AF */  sw         $s2, 0x70($sp)
/* 925FC 800A1DFC CCF9838F */  lw         $v1, %gp_rel(Raziel + 0x39C)($gp)
/* 92600 800A1E00 F7FF0224 */  addiu      $v0, $zero, -0x9
/* 92604 800A1E04 7400BFAF */  sw         $ra, 0x74($sp)
/* 92608 800A1E08 6800B0AF */  sw         $s0, 0x68($sp)
/* 9260C 800A1E0C 24106200 */  and        $v0, $v1, $v0
/* 92610 800A1E10 10006330 */  andi       $v1, $v1, 0x10
/* 92614 800A1E14 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 92618 800A1E18 1B006010 */  beqz       $v1, .L800A1E88
/* 9261C 800A1E1C 2190A000 */   addu      $s2, $a1, $zero
/* 92620 800A1E20 3000B027 */  addiu      $s0, $sp, 0x30
/* 92624 800A1E24 4400248E */  lw         $a0, 0x44($s1)
/* 92628 800A1E28 88F4020C */  jal        TransposeMatrix
/* 9262C 800A1E2C 21280002 */   addu      $a1, $s0, $zero
/* 92630 800A1E30 21202002 */  addu       $a0, $s1, $zero
/* 92634 800A1E34 21280000 */  addu       $a1, $zero, $zero
/* 92638 800A1E38 10FA8627 */  addiu      $a2, $gp, %gp_rel(Raziel + 0x3E0)
/* 9263C 800A1E3C 5000A727 */  addiu      $a3, $sp, 0x50
/* 92640 800A1E40 03D5000C */  jal        INSTANCE_SetStatsData
/* 92644 800A1E44 1000B0AF */   sw        $s0, 0x10($sp)
/* 92648 800A1E48 0F004010 */  beqz       $v0, .L800A1E88
/* 9264C 800A1E4C 00000000 */   nop
/* 92650 800A1E50 5400A28F */  lw         $v0, 0x54($sp)
/* 92654 800A1E54 00000000 */  nop
/* 92658 800A1E58 800C422C */  sltiu      $v0, $v0, 0xC80
/* 9265C 800A1E5C 0A004010 */  beqz       $v0, .L800A1E88
/* 92660 800A1E60 5800A427 */   addiu     $a0, $sp, 0x58
/* 92664 800A1E64 C7030524 */  addiu      $a1, $zero, 0x3C7
/* 92668 800A1E68 90E9000C */  jal        MATH3D_ConeDetect
/* 9266C 800A1E6C 2130A000 */   addu      $a2, $a1, $zero
/* 92670 800A1E70 05004010 */  beqz       $v0, .L800A1E88
/* 92674 800A1E74 00000000 */   nop
/* 92678 800A1E78 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9267C 800A1E7C 00000000 */  nop
/* 92680 800A1E80 08004234 */  ori        $v0, $v0, 0x8
/* 92684 800A1E84 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
.L800A1E88:
/* 92688 800A1E88 13004016 */  bnez       $s2, .L800A1ED8
/* 9268C 800A1E8C C8013026 */   addiu     $s0, $s1, 0x1C8
/* 92690 800A1E90 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 92694 800A1E94 00000000 */  nop
/* 92698 800A1E98 08004230 */  andi       $v0, $v0, 0x8
/* 9269C 800A1E9C 0F004014 */  bnez       $v0, .L800A1EDC
/* 926A0 800A1EA0 21200002 */   addu      $a0, $s0, $zero
/* 926A4 800A1EA4 C8013026 */  addiu      $s0, $s1, 0x1C8
/* 926A8 800A1EA8 21200002 */  addu       $a0, $s0, $zero
/* 926AC 800A1EAC 11000524 */  addiu      $a1, $zero, 0x11
/* 926B0 800A1EB0 E541020C */  jal        G2Anim_IsControllerActive
/* 926B4 800A1EB4 08000624 */   addiu     $a2, $zero, 0x8
/* 926B8 800A1EB8 66004010 */  beqz       $v0, .L800A2054
/* 926BC 800A1EBC 21200002 */   addu      $a0, $s0, $zero
/* 926C0 800A1EC0 11000524 */  addiu      $a1, $zero, 0x11
/* 926C4 800A1EC4 08000624 */  addiu      $a2, $zero, 0x8
/* 926C8 800A1EC8 9D41020C */  jal        G2Anim_InterpDisableController
/* 926CC 800A1ECC 84030724 */   addiu     $a3, $zero, 0x384
/* 926D0 800A1ED0 15880208 */  j          .L800A2054
/* 926D4 800A1ED4 00000000 */   nop
.L800A1ED8:
/* 926D8 800A1ED8 21200002 */  addu       $a0, $s0, $zero
.L800A1EDC:
/* 926DC 800A1EDC 11000524 */  addiu      $a1, $zero, 0x11
/* 926E0 800A1EE0 E541020C */  jal        G2Anim_IsControllerActive
/* 926E4 800A1EE4 08000624 */   addiu     $a2, $zero, 0x8
/* 926E8 800A1EE8 04004014 */  bnez       $v0, .L800A1EFC
/* 926EC 800A1EEC 21200002 */   addu      $a0, $s0, $zero
/* 926F0 800A1EF0 11000524 */  addiu      $a1, $zero, 0x11
/* 926F4 800A1EF4 5641020C */  jal        G2Anim_EnableController
/* 926F8 800A1EF8 08000624 */   addiu     $a2, $zero, 0x8
.L800A1EFC:
/* 926FC 800A1EFC CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 92700 800A1F00 00000000 */  nop
/* 92704 800A1F04 08004230 */  andi       $v0, $v0, 0x8
/* 92708 800A1F08 08004010 */  beqz       $v0, .L800A1F2C
/* 9270C 800A1F0C 21204002 */   addu      $a0, $s2, $zero
/* 92710 800A1F10 10FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x3E0)($gp)
/* 92714 800A1F14 14FA8397 */  lhu        $v1, %gp_rel(Raziel + 0x3E4)($gp)
/* 92718 800A1F18 18FA8497 */  lhu        $a0, %gp_rel(Raziel + 0x3E8)($gp)
/* 9271C 800A1F1C 2000A2A7 */  sh         $v0, 0x20($sp)
/* 92720 800A1F20 2200A3A7 */  sh         $v1, 0x22($sp)
/* 92724 800A1F24 D9870208 */  j          .L800A1F64
/* 92728 800A1F28 2400A4A7 */   sh        $a0, 0x24($sp)
.L800A1F2C:
/* 9272C 800A1F2C 92D1000C */  jal        INSTANCE_Query
/* 92730 800A1F30 0C000524 */   addiu     $a1, $zero, 0xC
/* 92734 800A1F34 21184000 */  addu       $v1, $v0, $zero
/* 92738 800A1F38 46006010 */  beqz       $v1, .L800A2054
/* 9273C 800A1F3C 00000000 */   nop
/* 92740 800A1F40 14006294 */  lhu        $v0, 0x14($v1)
/* 92744 800A1F44 00000000 */  nop
/* 92748 800A1F48 2000A2A7 */  sh         $v0, 0x20($sp)
/* 9274C 800A1F4C 18006294 */  lhu        $v0, 0x18($v1)
/* 92750 800A1F50 00000000 */  nop
/* 92754 800A1F54 2200A2A7 */  sh         $v0, 0x22($sp)
/* 92758 800A1F58 1C006294 */  lhu        $v0, 0x1C($v1)
/* 9275C 800A1F5C 00000000 */  nop
/* 92760 800A1F60 2400A2A7 */  sh         $v0, 0x24($sp)
.L800A1F64:
/* 92764 800A1F64 4000228E */  lw         $v0, 0x40($s1)
/* 92768 800A1F68 00000000 */  nop
/* 9276C 800A1F6C 34024294 */  lhu        $v0, 0x234($v0)
/* 92770 800A1F70 00000000 */  nop
/* 92774 800A1F74 1800A2A7 */  sh         $v0, 0x18($sp)
/* 92778 800A1F78 4000228E */  lw         $v0, 0x40($s1)
/* 9277C 800A1F7C 1800A427 */  addiu      $a0, $sp, 0x18
/* 92780 800A1F80 38024294 */  lhu        $v0, 0x238($v0)
/* 92784 800A1F84 2000A527 */  addiu      $a1, $sp, 0x20
/* 92788 800A1F88 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 9278C 800A1F8C 4000228E */  lw         $v0, 0x40($s1)
/* 92790 800A1F90 2800B027 */  addiu      $s0, $sp, 0x28
/* 92794 800A1F94 3C024294 */  lhu        $v0, 0x23C($v0)
/* 92798 800A1F98 21300002 */  addu       $a2, $s0, $zero
/* 9279C 800A1F9C CDE8000C */  jal        MATH3D_RotationFromPosToPos
/* 927A0 800A1FA0 1C00A2A7 */   sh        $v0, 0x1C($sp)
/* 927A4 800A1FA4 78002486 */  lh         $a0, 0x78($s1)
/* 927A8 800A1FA8 2C00A587 */  lh         $a1, 0x2C($sp)
/* 927AC 800A1FAC 7EE8000C */  jal        AngleDiff
/* 927B0 800A1FB0 00000000 */   nop
/* 927B4 800A1FB4 00140200 */  sll        $v0, $v0, 16
/* 927B8 800A1FB8 031C0200 */  sra        $v1, $v0, 16
/* 927BC 800A1FBC 01026228 */  slti       $v0, $v1, 0x201
/* 927C0 800A1FC0 06004014 */  bnez       $v0, .L800A1FDC
/* 927C4 800A1FC4 00FE6228 */   slti      $v0, $v1, -0x200
/* 927C8 800A1FC8 78002296 */  lhu        $v0, 0x78($s1)
/* 927CC 800A1FCC 00000000 */  nop
/* 927D0 800A1FD0 00024224 */  addiu      $v0, $v0, 0x200
/* 927D4 800A1FD4 2C00A2A7 */  sh         $v0, 0x2C($sp)
/* 927D8 800A1FD8 00FE6228 */  slti       $v0, $v1, -0x200
.L800A1FDC:
/* 927DC 800A1FDC 05004010 */  beqz       $v0, .L800A1FF4
/* 927E0 800A1FE0 00000000 */   nop
/* 927E4 800A1FE4 78002296 */  lhu        $v0, 0x78($s1)
/* 927E8 800A1FE8 00000000 */  nop
/* 927EC 800A1FEC 00FE4224 */  addiu      $v0, $v0, -0x200
/* 927F0 800A1FF0 2C00A2A7 */  sh         $v0, 0x2C($sp)
.L800A1FF4:
/* 927F4 800A1FF4 2800A297 */  lhu        $v0, 0x28($sp)
/* 927F8 800A1FF8 00000000 */  nop
/* 927FC 800A1FFC FFFD4224 */  addiu      $v0, $v0, -0x201
/* 92800 800A2000 FF05422C */  sltiu      $v0, $v0, 0x5FF
/* 92804 800A2004 02004010 */  beqz       $v0, .L800A2010
/* 92808 800A2008 00020224 */   addiu     $v0, $zero, 0x200
/* 9280C 800A200C 2800A2A7 */  sh         $v0, 0x28($sp)
.L800A2010:
/* 92810 800A2010 2800A297 */  lhu        $v0, 0x28($sp)
/* 92814 800A2014 00000000 */  nop
/* 92818 800A2018 FFF74224 */  addiu      $v0, $v0, -0x801
/* 9281C 800A201C 6D05422C */  sltiu      $v0, $v0, 0x56D
/* 92820 800A2020 02004010 */  beqz       $v0, .L800A202C
/* 92824 800A2024 6E0D0224 */   addiu     $v0, $zero, 0xD6E
/* 92828 800A2028 2800A2A7 */  sh         $v0, 0x28($sp)
.L800A202C:
/* 9282C 800A202C 95E8000C */  jal        MATH3D_ZYXtoXYZ
/* 92830 800A2030 21200002 */   addu      $a0, $s0, $zero
/* 92834 800A2034 21202002 */  addu       $a0, $s1, $zero
/* 92838 800A2038 11000524 */  addiu      $a1, $zero, 0x11
/* 9283C 800A203C 08000624 */  addiu      $a2, $zero, 0x8
/* 92840 800A2040 21380002 */  addu       $a3, $s0, $zero
/* 92844 800A2044 03000224 */  addiu      $v0, $zero, 0x3
/* 92848 800A2048 1000A2AF */  sw         $v0, 0x10($sp)
/* 9284C 800A204C 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 92850 800A2050 1400A0AF */   sw        $zero, 0x14($sp)
.L800A2054:
/* 92854 800A2054 7400BF8F */  lw         $ra, 0x74($sp)
/* 92858 800A2058 7000B28F */  lw         $s2, 0x70($sp)
/* 9285C 800A205C 6C00B18F */  lw         $s1, 0x6C($sp)
/* 92860 800A2060 6800B08F */  lw         $s0, 0x68($sp)
/* 92864 800A2064 0800E003 */  jr         $ra
/* 92868 800A2068 7800BD27 */   addiu     $sp, $sp, 0x78
.size AlgorithmicNeck, . - AlgorithmicNeck
